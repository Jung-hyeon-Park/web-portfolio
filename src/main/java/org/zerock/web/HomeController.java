package org.zerock.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.service.BoardService;
import org.zerock.service.GameService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private GameService gameService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	//메인 페이지
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public void main(Model model) throws Exception {
		
		model.addAttribute("topReviewVOs", boardService.selectTopReview());
		model.addAttribute("newsVOs", boardService.selectNews());
	}
	
	//헤더 페이지
	@RequestMapping(value="/header.do", method=RequestMethod.GET)
	public void header() throws Exception{}
	
	//메뉴바 페이지
	@RequestMapping(value="/nav.do", method=RequestMethod.GET)
	public void nav(Model model) throws Exception{
		
		model.addAttribute("postCategoryVOs", boardService.selectPost());
	}
	
	//푸터 페이지
	@RequestMapping(value="/footer.do", method=RequestMethod.GET)
	public void footer() throws Exception{}
	
	//사이드 바
	@RequestMapping(value="/sideBar.do", method=RequestMethod.GET) 
	public void sideBar(Model model) throws Exception{
			
		model.addAttribute("post2VOs", boardService.selectPost2());
		model.addAttribute("post3VOs", boardService.selectPost3());
		model.addAttribute("category2VOs", gameService.selectRankingPost());
	}
	
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	public void test() throws Exception {}
	
}
