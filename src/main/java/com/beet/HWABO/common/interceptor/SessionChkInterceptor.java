package com.beet.HWABO.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionChkInterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(SessionChkInterceptor.class);
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String ucode = (String)request.getSession().getAttribute("ucode"); 
		if(ucode != null) {
			logger.debug("로그인유저 "+ ucode + "의 요청 : " + request.getRequestURI());
			
		}else {
			logger.debug("비로그인으로 요청 : " + request.getRequestURI());
			String origin = request.getRequestURL().toString();
			String location = request.getHeader("Referer").replace(origin.replace(origin,"") + request.getContextPath(), "");
			request.setAttribute("loc", location);
			request.setAttribute("message", "로그인 후 이용가능합니다");
			request.getRequestDispatcher("/WEB-INF/views/suugit/login.jsp").forward(request, response);
		}
		return true;
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}

}
