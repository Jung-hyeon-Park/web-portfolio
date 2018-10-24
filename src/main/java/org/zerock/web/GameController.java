package org.zerock.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.service.GameService;


@RequestMapping("/game")
@Controller
public class GameController {
	
	@Inject
	private GameService gameService;
	
	//최신 게임 상품
	@RequestMapping(value="/gameAll.do", method=RequestMethod.GET)
	public void gameAll(Model model) throws Exception {
		
		model.addAttribute("consoleVOs", gameService.selectConsoleCategory1());
		model.addAttribute("gameVOs", gameService.selectGameList());
		
	}
	
}
