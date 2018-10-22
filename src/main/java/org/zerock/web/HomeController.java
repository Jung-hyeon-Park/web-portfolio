package org.zerock.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Inject
	private BoardService boardService;
	
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
	@RequestMapping(value="/main.do", method=RequestMethod.GET, produces="application/json; charset=utf8")
	public void main(Model model, HttpSession session) throws Exception {
		
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
	}
	
}
