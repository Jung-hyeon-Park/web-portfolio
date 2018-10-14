package org.zerock.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.GameCategory2VO;
import org.zerock.service.GameService;


@RequestMapping("/game")
@Controller
public class GameController {
	
	@Inject
	private GameService gameService;
	
	//게임 카테고리
	@RequestMapping(value="/gameType.do", method=RequestMethod.GET)
	public void gameType(Model model) throws Exception {
		
		model.addAttribute("gameTypes", gameService.selectGameType());
	}
	
	//최신 게임 상품
	@RequestMapping(value="/allGame.do", method=RequestMethod.GET)
	public void allGame(Model model) throws Exception {
		
		model.addAttribute("gameVOs", gameService.selectAllGame());
	}
	
	//게임 리스트
	@RequestMapping(value="/gameList.do", method=RequestMethod.GET)
	public void gameList(Model model, @RequestParam("category1") int idx, @RequestParam("category2") int idx2) throws Exception {
		
		if(idx2 == 0) {
			model.addAttribute("gameVOs", gameService.selectGame(idx));
			List<GameCategory2VO> gameCategory2VO = gameService.selectGameCategory2(idx);
			model.addAttribute("category2VOs", gameCategory2VO);
			model.addAttribute("idx", idx);
		}else {
			model.addAttribute("gameVOs", gameService.selectGame2(idx2));
			List<GameCategory2VO> gameCategory2VO = gameService.selectGameCategory2(idx);
			model.addAttribute("category2VOs", gameCategory2VO);
			model.addAttribute("idx", idx);
		}

	}
	
}
