package org.zerock.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.GameCategory2VO;
import org.zerock.domain.GameListVO;
import org.zerock.service.GameService;


@RequestMapping("/game")
@Controller
public class GameController {
	
	@Inject
	private GameService gameService;
	
	//최신 게임 상품
	@RequestMapping(value="/gameAll.do", method=RequestMethod.GET)
	public void gameAll(Model model, @RequestParam("console") int categoryIdx) throws Exception {
		;
		GameListVO gameListVO = new GameListVO();
		gameListVO.setCategoryIdx(categoryIdx);
		model.addAttribute("consoleVOs", gameService.selectConsoleCategory1(gameListVO));
		model.addAttribute("gameVOs", gameService.selectGameList(gameListVO));
		
	}
	
	//최종 필터링 게임 리스트(브랜드)
	@RequestMapping(value="/gameList.do", method=RequestMethod.GET)
	public void gameList(Model model, @RequestParam("console") int categoryIdx) throws Exception {
	
		GameListVO gameListVO = new GameListVO();
		gameListVO.setCategoryIdx(categoryIdx);
		
		model.addAttribute("console2VOs", gameService.selectCertainConsoleCategory(gameListVO));
		model.addAttribute("gameVOs", gameService.selectGameList(gameListVO));
	}
	
}
