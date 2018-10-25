package org.zerock.web;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.LoginDTO;
import org.zerock.domain.PlusUserVO;
import org.zerock.domain.UserVO;
import org.zerock.service.GameService;
import org.zerock.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Inject 
	private UserService userService;
	
	@Inject 
	private GameService gameService;

	//회원가입 페이지
	@RequestMapping(value="/signUp.do", method=RequestMethod.GET)
	public void signUp() throws Exception {}
	
	//회원가입
	@RequestMapping(value="/signUp.do", method=RequestMethod.POST)
	public String signUp(UserVO userVO) throws Exception {
		
		userService.insertUser(userVO);
		
		return "redirect:/user/plusSignUp.do?user="+userVO.getIdx();
	}
	
	//회원가입 페이지2
	@RequestMapping(value="/plusSignUp.do", method=RequestMethod.GET)
	public void plusSignUp(Model model, @ModelAttribute("user") int userIdx) throws Exception {
			
		model.addAttribute("category2VOs", gameService.selectAllCategory2());
		model.addAttribute("genreVOs", gameService.selectGenre());
	}
	
	//회원가입 추가정보 
	@RequestMapping(value="/plusSignUp.do", method=RequestMethod.POST)
	public String plusSignUp(PlusUserVO plusUserVO) throws Exception {
		
		userService.insertPlusUser(plusUserVO);
		
		return "redirect:/user/login.do";
	}
	
	//로그인 페이지
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public void login() throws Exception {}
	
	//로그인
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public void loginCheck(LoginDTO loginDTO, HttpSession session, Model model) throws Exception {
		
		//로그인 세션정보가 있을 경우
		if(session.getAttribute("login") != null) {
			
			//세션정보 삭제
			session.removeAttribute("login");
		}
		
		//로그인
		UserVO userVO = userService.login(loginDTO);
		
		//로그인 실패
		if(userVO == null) {
			return;
		}

		model.addAttribute("userVO", userVO);
		
		// 자동 로그인 체크 확인
		if(loginDTO.isUseCookie()) {
		
			int amount = 60 * 60 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			
			userService.keepLogin(userVO.getEmail(), session.getId(), sessionLimit);
			
		}
	}
	
	// 로그아웃(자동로그인 기록 삭제)
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Object obj = session.getAttribute("login");
		
		//로그인 세션정보가 있을경우
		if(obj != null) {
			UserVO userVO = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie logincookie = WebUtils.getCookie(request, "loginCookie");
			
			//쿠키가 있을경우
			if(logincookie != null) {
				logincookie.setPath("/");
				logincookie.setMaxAge(0);
				response.addCookie(logincookie);
				userService.keepLogin(userVO.getEmail(), session.getId(), new Date());
			}
		}
		return "/user/logout";
	}
}
