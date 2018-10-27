package org.zerock.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.GameCategory1VO;
import org.zerock.domain.GameClassificationVO;
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
		gameListVO.setCategory3Idx(2);
	
		model.addAttribute("ct2Idx", category2Idx);
		model.addAttribute("gameVOs", gameService.selectGameList(gameListVO));
	
	}
	
	//ajax 상품 리스트
	@RequestMapping(value="/ajaxGameList.do", method=RequestMethod.GET, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity gameList(HttpServletRequest request) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		int category2Idx = Integer.parseInt(request.getParameter("category2Idx"));
		int category3Idx = Integer.parseInt(request.getParameter("category3Idx"));
		
		GameCategory1VO gameCategory1VO = new GameCategory1VO();
		gameCategory1VO.setCategory2Idx(category2Idx);
		gameCategory1VO.setCategory3Idx(category3Idx);
		
		List<GameListVO> gameVOs = gameService.ajaxGameList(gameCategory1VO);
		
		if(gameVOs.size() > 0) {
        	for(int i=0; i<gameVOs.size(); i++) {
        		HashMap hm = new HashMap();
        		hm.put("boardIdx", gameVOs.get(i).getBoardIdx());
        		hm.put("email", gameVOs.get(i).getEmail());
        		hm.put("fullName", gameVOs.get(i).getFullName());
        		hm.put("price", gameVOs.get(i).getPrice());
        		hm.put("state", gameVOs.get(i).getState());
        		hm.put("status", gameVOs.get(i).getStatus());
        		hm.put("likeCount", gameVOs.get(i).getLikeCount());
        		hm.put("title", gameVOs.get(i).getTitle());
        		
        		hmlist.add(hm);
        	}
        }
        JSONArray json = new JSONArray(hmlist);
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	//상품 실시간 검색
	@RequestMapping(value="/ajaxInsertGame.do", method=RequestMethod.POST, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity ajaxInsertGame(HttpServletRequest request) throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		
		List<GameClassificationVO> titleVOs = gameService.selectGameTitle();
		for(GameClassificationVO a : titleVOs) {
			System.out.println("game = " + a.getTitle());
		}
		if(titleVOs.size() > 0) {
        	for(int i=0; i<titleVOs.size(); i++) {
        		HashMap hm = new HashMap();
        		hm.put("title", titleVOs.get(i).getTitle());
        		hm.put("gameClassficationIdx", titleVOs.get(i).getIdx());
        		hmlist.add(hm);
        	}
        }
        JSONArray json = new JSONArray(hmlist);
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
}
