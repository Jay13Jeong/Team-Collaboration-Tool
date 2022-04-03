package com.beet.HWABO.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//인터셉터는 디스패처서블릿과 컨트롤러 사이에서 구동되는 클래스 
//log4j.xml에서 debug 레벨로 로그를 남기도록 되어있음 
//LoggingEvent 로 발생되는 시간을 절약할 수 있음 
//debug 레벨일때 로그처리하도록 함 
public class LoggerInterceptor extends HandlerInterceptorAdapter {
	//org.slf4j.Logger 타입의 logger 생성함
	//이름 대소문자 주의~
	//LoggerFactory.getLogger 메소드를 매개변수로 현재 클래스 객체를 전달함
	private Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
	
	//이벤트 발생 직전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//DispatcherServlet에서 COntroller 가기전에 구동되는 메소드
		//debug 레벨일 때 로그 처리하도록 함
		if(logger.isDebugEnabled()) {
			logger.debug("====================start=================================");
			logger.debug(request.getRequestURI());
			logger.debug("-----------------------------------------");
		}
		return super.preHandle(request, response, handler);
	}
	
	//이벤트 발생
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler, ModelAndView mv) throws Exception {
		//Controller 에서 리턴되어 뷰 리졸버로 가기 전에 구동되는 메소드
		super.preHandle(request, response, handler); 
		if(logger.isDebugEnabled()) {
			logger.debug("-------------------------- view ----------------------------------");
		}
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {
		//뷰 리졸버가 뷰를 실행해서 내보내고 나면 구동되는 메소드
		if(logger.isDebugEnabled()) {
			logger.debug("================================end ===================================");
		}
		
		super.afterCompletion(request, response, handler, ex);
	}
}
