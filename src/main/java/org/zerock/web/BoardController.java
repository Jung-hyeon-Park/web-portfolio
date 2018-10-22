 package org.zerock.web;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.zerock.domain.GameVO;
import org.zerock.domain.NominationVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReviewVO;
import org.zerock.domain.SearchVO;
import org.zerock.domain.UserVO;
import org.zerock.service.BoardService;
import org.zerock.service.UserService;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private UserService userService;
	
	//게시글 추천
	@RequestMapping(value="/nomination", method=RequestMethod.POST, produces="application/json")
	@ResponseBody
	public int nomination(HttpServletRequest request, Model model) throws Exception {
		
		int check = Integer.parseInt(request.getParameter("check"));
		int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		int userIdx = ((UserVO) request.getSession().getAttribute("login")).getIdx();
		
		NominationVO nominationVO = new NominationVO();
		nominationVO.setBoardIdx(boardIdx);
		nominationVO.setUserIdx(userIdx);
		
		if(check >= 1) {
			boardService.deleteNomination(nominationVO);
			check = 0;
		}else {
			boardService.insertNomination(nominationVO);
			check = 1;
		}

		return check;
	}
	
	
	//게시글 생성
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.GET)
	public void insertBoard(Model model, @ModelAttribute("post") int post) throws Exception {
		
		//게시판 목록 생성
		if(post < 6) {
			model.addAttribute("postVOs", boardService.selectPost());
		}else if(post > 5 && post < 9) {
			model.addAttribute("postVOs", boardService.selectPost2());
		}
		
	}
	
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.POST)
	public String insertBoard(ReviewVO reviewVO, GameVO gameVO, BoardVO boardVO, Model model, HttpSession session) throws Exception {
		
		//로그인 세션 정보
		UserVO userVO = (UserVO)session.getAttribute("login");
	
		boardVO.setUserIdx(userVO.getIdx());
		boardVO.setUserId(userVO.getEmail());
		
		if(boardVO.getPostCategoryIdx() == 5) {
			
			boardService.insertGame(gameVO, boardVO);
			
		}else if(boardVO.getPostCategoryIdx() > 5 && boardVO.getPostCategoryIdx() < 9) {
			
			reviewVO.setCategory2Idx(gameVO.getCategory2Idx());
			
			boardService.insertReview(reviewVO, boardVO);
		}else {
			boardService.insertBoard(boardVO);
		}
	
		return "redirect:/board/listAll.do?post=" + boardVO.getPostCategoryIdx();
	}
	
	//게시글 리스트
	@RequestMapping(value="/listAll.do", method=RequestMethod.GET)
	public void listAll(HttpSession session, SearchVO cri, Model model, @RequestParam("post") int postCategoryIdx) throws Exception {
		
		cri.setPostCategoryIdx(postCategoryIdx);
		
		PageMaker pm = new PageMaker();
		//검색 키워드가 없을경우
		if(StringUtils.isEmpty(cri.getKeyword())) {
			model.addAttribute("post", postCategoryIdx);
			model.addAttribute("boardVOs", boardService.listCriteria(cri));
			pm.setCri(cri);
			pm.setTotalCount(boardService.listCountCriteria(cri));
		//검색 키워드가 있을경우
		}else {
			session.setAttribute("search", cri.getKeyword());
			model.addAttribute("post", postCategoryIdx);
			model.addAttribute("boardVOs", boardService.listSearch(cri));
			pm.setCri(cri);
			pm.setTotalCount(boardService.listSearchCount(cri));
		}
		System.out.println("keyword =  " + session.getAttribute("search"));
		
		model.addAttribute("pm", pm);
	}


	//상세 게시글
	@RequestMapping(value="/readBoard.do", method=RequestMethod.GET)
	public void readBoard(HttpServletRequest request, @RequestParam("boardIdx") int boardIdx, Model model, @RequestParam("post") int post) throws Exception {
		
		//게시글 읽기
		model.addAttribute("post", post);
		model.addAttribute("boardVO", boardService.readBoard(boardIdx));
		
		if(post == 5) {
			model.addAttribute("gameDTO", boardService.selectGame(boardIdx));
		}else if(post > 5 && post < 9) {
			model.addAttribute("reviewDTO", boardService.selectReview(boardIdx));
		}
		
		int userIdx = ((UserVO)request.getSession().getAttribute("login")).getIdx();
		
		
		NominationVO nominationVO = new NominationVO();
		nominationVO.setBoardIdx(boardIdx);
		nominationVO.setUserIdx(userIdx);
		
		
		int count = boardService.selectNomination(nominationVO);
		
		model.addAttribute("count", count);
	}
	
	//게시글 삭제
	@RequestMapping(value="/deleteBoard.do", method=RequestMethod.POST)
	public String deleteBoard(@RequestParam("boardIdx") int idx, RedirectAttributes rttr, @RequestParam("post") int postCategoryIdx) throws Exception {
		
		//게시글 삭제 후 "SUCCESS메세지 보내기
		boardService.deleteBoard(idx);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listAll.do?post="+postCategoryIdx;
	}
	
	//게시글 수정
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
	public void updateBoard(@RequestParam("boardIdx") int idx, Model model,  @ModelAttribute("post") int post) throws Exception {
		
		model.addAttribute("boardVO", boardService.readBoard(idx));
		
		if(post < 6) {
			model.addAttribute("postVOs", boardService.selectPost());
		}else if(post > 5 && post < 9) {
			model.addAttribute("postVOs", boardService.selectPost2());
		}
		
	}
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.POST)
	public String updateBoard(ReviewVO reviewVO, GameVO gameVO, BoardVO boardVO, RedirectAttributes rttr, @RequestParam("post") int postCategoryIdx, @RequestParam("boardIdx") int boardIdx) throws Exception {
		
		boardVO.setIdx(boardIdx);
		
		if(boardVO.getPostCategoryIdx() == 5) {
			
			boardService.updateGame(gameVO, boardVO);
			
		}else if(boardVO.getPostCategoryIdx() > 5 && boardVO.getPostCategoryIdx() < 9) {
			
			boardService.updateReview(reviewVO, boardVO);
			
		}else {
			boardService.updateBoard(boardVO);
		}
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listAll.do?post="+postCategoryIdx;
	}
}
