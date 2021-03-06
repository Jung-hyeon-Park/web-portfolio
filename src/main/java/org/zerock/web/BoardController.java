package org.zerock.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.GameVO;
import org.zerock.domain.NominationVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReviewVO;
import org.zerock.domain.SearchVO;
import org.zerock.domain.UserVO;
import org.zerock.service.BoardService;
import org.zerock.service.GameService;

@RequestMapping("/board")
@Controller
public class BoardController {

	@Inject
	private BoardService boardService;
	
	@Inject
	private GameService gameService;

	// 게시글 추천
	@RequestMapping(value = "/nomination", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int nomination(HttpServletRequest request) throws Exception {

		int check = Integer.parseInt(request.getParameter("check"));
		int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		int userIdx = ((UserVO) request.getSession().getAttribute("login")).getIdx();

		NominationVO nominationVO = new NominationVO();
		nominationVO.setBoardIdx(boardIdx);
		nominationVO.setUserIdx(userIdx);

		if (check >= 1) {
			boardService.deleteNomination(nominationVO);
			check = 0;
		} else {
			boardService.insertNomination(nominationVO);
			check = 1;
		}

		return check;
	}

	// 게시글 생성
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public void insertBoard(Model model, @ModelAttribute("post") int post) throws Exception {

		// 게시판 목록 생성
		if (post < 6) {
			model.addAttribute("postVOs", boardService.selectPost());
		} else if (post > 5 && post < 9) {
			model.addAttribute("postVOs", boardService.selectPost2());
		} else if (post > 8 && post < 11) {
			model.addAttribute("postVOs", boardService.selectPost3());
		}

	}

	//게시글 작성
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(ReviewVO reviewVO, GameVO gameVO, BoardVO boardVO, Model model, HttpSession session)
			throws Exception {

		// 로그인 세션 정보
		UserVO userVO = (UserVO) session.getAttribute("login");

		boardVO.setUserIdx(userVO.getIdx());
		boardVO.setEmail(userVO.getEmail());

		if (boardVO.getPostCategoryIdx() == 5) {

			gameService.insertGame(gameVO, boardVO);
			
			return "redirect:/game/gameAll.do?console=0&console2=0";

		} else if (boardVO.getPostCategoryIdx() > 5 && boardVO.getPostCategoryIdx() < 9) {

			boardService.insertReview(reviewVO, boardVO);
		} else {
			boardService.insertBoard(boardVO);
		}

		return "redirect:/board/listAll.do?post=" + boardVO.getPostCategoryIdx();
	}

	// 게시글 리스트
	@RequestMapping(value = "/listAll.do", method = RequestMethod.GET)
	public void listAll(HttpSession session, @ModelAttribute("cri")SearchVO cri, Model model, @RequestParam("post") int postCategoryIdx) throws Exception {

		cri.setPostCategoryIdx(postCategoryIdx);
		
		int count  = boardService.countBoard(postCategoryIdx);
		
		PageMaker pm = new PageMaker();
		// 검색 키워드가 없을경우
		if (StringUtils.isEmpty(cri.getKeyword())) {
			model.addAttribute("post", postCategoryIdx);
			
			model.addAttribute("boardVOs", boardService.listCriteria(cri));
			pm.setCri(cri);
			pm.setTotalCount(boardService.listCountCriteria(cri));
			// 검색 키워드가 있을경우
		} else {
			if(postCategoryIdx >= 6 || postCategoryIdx <= 8) {
				session.setAttribute("search", cri.getKeyword());
			}
			model.addAttribute("post", postCategoryIdx);
			model.addAttribute("boardVOs", boardService.listSearch(cri));
			pm.setCri(cri);
			pm.setTotalCount(boardService.listSearchCount(cri));
		}
		
		model.addAttribute("count", count);
		model.addAttribute("pm", pm);
	}

	// 상세 게시글
	@RequestMapping(value = "/readBoard.do", method = RequestMethod.GET)
	public void readBoard(HttpServletRequest request, @RequestParam("boardIdx") int boardIdx, Model model,
			@RequestParam("post") int post, @ModelAttribute("cri") SearchVO cri) throws Exception {

		// 게시글 읽기
		model.addAttribute("post", post);
		model.addAttribute("boardVO", boardService.readBoard(boardIdx));
		
		
		// 게임 게시글
		if (post == 5) {
			model.addAttribute("gameDTO", gameService.selectGame(boardIdx));
			
			/*//상품 조회 데이터 넣기
			gameService.insertViewData(boardIdx);*/
		//리뷰 게시글
		} else if (post > 5 && post < 9) {
			model.addAttribute("reviewDTO", boardService.selectReview(boardIdx));
		}
		// 게시글 좋아요
		if (request.getSession().getAttribute("login") != null) {
			int userIdx = ((UserVO) request.getSession().getAttribute("login")).getIdx();

			NominationVO nominationVO = new NominationVO();
			nominationVO.setBoardIdx(boardIdx);
			nominationVO.setUserIdx(userIdx);

			model.addAttribute("count", boardService.selectNomination(nominationVO));
		}
	}

	// 게시글 삭제
	@RequestMapping(value = "/deleteBoard.do", method = RequestMethod.POST)
	public String deleteBoard(@RequestParam("boardIdx") int idx, RedirectAttributes rttr,
			@RequestParam("post") int post, @ModelAttribute("cri") Criteria cri) throws Exception {

		if (post <= 4) {
			boardService.deleteBoard(idx);
		} else if (post == 5) {
			gameService.deleteGame(idx);
		} else if (post >= 6 && post <= 8) {
			boardService.deleteReview(idx);
		}

		// 게시글 삭제 후 "SUCCESS메세지 보내기
		rttr.addFlashAttribute("msg", "SUCCESS");
		if(post == 5) {
			return "redirect:/game/gameAll.do?console=0&console2=0";
		}

		return "redirect:/board/listAll.do?post=" + post;
	}

	// 게시글 수정
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.GET)
	public void updateBoard(@RequestParam("boardIdx") int idx, Model model, @ModelAttribute("post") int post,
			@ModelAttribute("cri") Criteria cri) throws Exception {

		if (post < 6) {
			model.addAttribute("boardVO", boardService.readBoard(idx));
			model.addAttribute("postVOs", boardService.selectPost());
			if (post == 5) {
				model.addAttribute("gameVO", gameService.selectGame(idx));
			}
		} else if (post > 5 && post < 9) {
			model.addAttribute("boardVO", boardService.readBoard(idx));
			model.addAttribute("postVOs", boardService.selectPost2());
			model.addAttribute("reviewVO", boardService.selectReview(idx));
		}

	}

	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.POST)
	public String updateBoard(ReviewVO reviewVO, GameVO gameVO, BoardVO boardVO, RedirectAttributes rttr,
			@RequestParam("post") int postCategoryIdx, @RequestParam("boardIdx") int boardIdx) throws Exception {

		boardVO.setIdx(boardIdx);

		if (boardVO.getPostCategoryIdx() == 5) {

			gameService.updateGame(gameVO, boardVO);

		} else if (boardVO.getPostCategoryIdx() > 5 && boardVO.getPostCategoryIdx() < 9) {

			boardService.updateReview(reviewVO, boardVO);

		} else {
			boardService.updateBoard(boardVO);
		}

		rttr.addFlashAttribute("msg", "SUCCESS");
		
		if(postCategoryIdx == 5) {
			return "redirect:/game/gameAll.do?console=0&console2=0";
		}

		return "redirect:/board/listAll.do?post=" + postCategoryIdx;
	}
}
