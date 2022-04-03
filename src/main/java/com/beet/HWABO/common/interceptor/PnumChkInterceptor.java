package com.beet.HWABO.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PnumChkInterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(PnumChkInterceptor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String pnum = (String)request.getSession().getAttribute("pnum"); 
		if(pnum != null) {
			logger.debug(request.getSession().getAttribute("ucode")+  "가 프로젝트 " + pnum + "에 접속했습니다");
			
		}else {
			logger.debug("프로젝트가 없는 사용자의 요청 " + request.getRequestURI());
			String origin = request.getRequestURL().toString();
			String location = request.getHeader("Referer").replace(origin.replace(origin,"") + request.getContextPath(), "");
			request.setAttribute("loc", location);
			request.setAttribute("message", "참여중인 프로젝트가 없습니다!");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
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
