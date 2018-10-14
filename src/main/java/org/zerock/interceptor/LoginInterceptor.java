package org.zerock.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception {
		
		HttpSession session = request.getSession();
		ModelMap modelMap = mav.getModelMap();
		Object userVO = modelMap.get("userVO");
		
		if(userVO != null) {
			session.setAttribute(LOGIN, userVO);
			if(request.getParameter("useCookie") != null) {
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}
			
			Object dest = session.getAttribute("dest");
			
			//이전 페이지를 저장하고 있지 않다면 main으로 이동
			response.sendRedirect(dest != null ? (String)dest : "/main.do");
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			response.sendRedirect(request.getContextPath() + "/main.do");
			return false;
		}
		return true;
	}
}
