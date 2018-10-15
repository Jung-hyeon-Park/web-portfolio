package org.zerock.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Inject
	private UserService userService;
	
	private String saveDest(HttpServletRequest req) {
		
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			req.getSession().setAttribute("dest", uri + query);
		}
		return uri + query;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		//로그인 없이 페이지 이동시
		if(session.getAttribute("login") == null) {
			
			String url = saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			//자동 로그인 쿠키 유무 확인
			if(loginCookie != null) {
				UserVO userVO = userService.checkLoginBefore(loginCookie.getValue());
				
				//유저 정보 유무 확인
				if(userVO != null) {
					session.setAttribute("login", userVO);
					
					// 접속한 페이지 확인
					if(url.equals("/main.do")) {
						return true;
					}else {
						return false;
					}
				}
			}
			if(url.equals("/main.do")) {
				return true;
			}else {
				response.sendRedirect("/user/login.do");
				return false;
			}
		}
		return true;
	}

}
