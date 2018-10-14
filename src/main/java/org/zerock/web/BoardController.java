package org.zerock.web;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchVO;
import org.zerock.domain.UserVO;
import org.zerock.service.BoardService;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	//게시글 생성
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.GET)
	public void board(Model model) throws Exception {
		
		//게시판 목록 생성
		model.addAttribute("posts", boardService.selectPost());
	}
	
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.POST)
	public String insertBoard(MultipartHttpServletRequest request, Model model, BoardVO boardVO, HttpSession session) throws Exception {
		
		//로그인 세션 정보
		UserVO userVO = (UserVO)session.getAttribute("login");
		
		boardVO.setUserIdx(userVO.getIdx());
		
		//이미지 파일 등록
		MultipartFile mf = request.getFile("image_file");
		String path = request.getRealPath("/resources/uploadFile/image");
		String fileName = mf.getOriginalFilename();
		File uploadFile = new File(path+"//"+fileName);
		
		try {
			mf.transferTo(uploadFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		boardVO.setImage(fileName);
		
		boardService.insertBoard(boardVO);
		
		return "redirect:/board/listAll.do";
	}
	
	//게시글 리스트
	@RequestMapping(value="/listAll.do", method=RequestMethod.GET)
	public void listAll(SearchVO cri, Model model, @RequestParam("post") int postIdx) throws Exception {
		
		cri.setPostIdx(postIdx);
		
		PageMaker pm = new PageMaker();
		//검색 키워드가 없을경우
		if(StringUtils.isEmpty(cri.getKeyword())) {
			model.addAttribute("postIdx", postIdx);
			model.addAttribute("boardVOs", boardService.listCriteria(cri));
			pm.setCri(cri);
			pm.setTotalCount(boardService.listCountCriteria(cri));
		//검색 키워드가 있을경우
		}else {
			model.addAttribute("postIdx", postIdx);
			model.addAttribute("boardVOs", boardService.listSearch(cri));
			pm.setCri(cri);
			pm.setTotalCount(boardService.listSearchCount(cri));
		}
		model.addAttribute("pm", pm);
	}
	
	//상세 게시글
	@RequestMapping(value="/readBoard.do", method=RequestMethod.GET)
	public void readBoard(@RequestParam("boardIdx") int idx, Model model) throws Exception {
		
		//게시글 읽기
		model.addAttribute("boardVO", boardService.readBoard(idx));
	}
	
	//게시글 삭제
	@RequestMapping(value="/deleteBoard.do", method=RequestMethod.POST)
	public String deleteBoard(@RequestParam("boardIdx") int idx, RedirectAttributes rttr) throws Exception {
		
		//게시글 삭제 후 "SUCCESS메세지 보내기
		boardService.deleteBoard(idx);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listAll.do";
	}
	
	//게시글 수정
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
	public void updateBoard(@RequestParam("boardIdx") int idx, Model model) throws Exception {
		
		model.addAttribute(boardService.readBoard(idx));
	}
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.POST)
	public String updateBoard(BoardVO boardVO, RedirectAttributes rttr) throws Exception {
		
		boardService.updateBoard(boardVO);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listAll.do";
	}
}
