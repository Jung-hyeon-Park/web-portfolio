package org.zerock.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameListVO;
import org.zerock.service.GameService;


@RequestMapping("/game")
@Controller
public class GameController {
	
	@Inject
	private GameService gameService;
	
	//최신 게임 상품
	@RequestMapping(value="/gameAll.do", method=RequestMethod.GET)
	public void gameAll(Model model, @RequestParam("console") int categoryIdx, @RequestParam("console2") int category2Idx) throws Exception {
		
		GameCategory1VO gameCategory1VO = new GameCategory1VO();
		gameCategory1VO.setCategoryIdx(categoryIdx);
		gameCategory1VO.setCategory2Idx(category2Idx);
			
		model.addAttribute("consoleVOs", gameService.selectConsoleCategory1(gameCategory1VO));
		
		
		GameListVO gameListVO = new GameListVO();
		gameListVO.setCategoryIdx(categoryIdx);
		gameListVO.setCategory2Idx(category2Idx);
		
		
		model.addAttribute("gameVOs", gameService.selectGameList(gameListVO));
		
	}
	
	
	
	
	//최종 필터링 게임 리스트(브랜드)
	@RequestMapping(value="/gameList.do", method=RequestMethod.GET)
	public void gameList(Model model, @RequestParam("console") int categoryIdx, @RequestParam("console2") int category2Idx) throws Exception {
	
		model.addAttribute("console2VOs", gameService.selectAllCategory2());
		model.addAttribute("console3VOs", gameService.selectAllCategory3());
	
		GameListVO gameListVO = new GameListVO();
		gameListVO.setCategoryIdx(categoryIdx);
		gameListVO.setCategory2Idx(category2Idx);
	
		model.addAttribute("ct2Idx", category2Idx);
		model.addAttribute("gameVOs", gameService.selectGameList(gameListVO));
	
	}
	
}
