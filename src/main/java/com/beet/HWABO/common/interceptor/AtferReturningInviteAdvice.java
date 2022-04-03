package com.beet.HWABO.common.interceptor;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import com.beet.HWABO.member.model.service.MemberService;
import com.beet.HWABO.member.model.vo.Member;

@Repository
@Aspect 
public class AtferReturningInviteAdvice {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	//초대 완료시 프로젝트 멤버에 가입시키는 메소드 추가
	@Autowired
	private MemberService mservice;
	
	@Pointcut("execution(* com.beet.HWABO.member.model.dao.MemberDao.selectLogin(..)) || execution(* com.beet.HWABO.member.model.dao.MemberDao.insertUser(..))" )
	public void loginPointcut() {}
	
	@AfterReturning(pointcut="loginPointcut()", returning = "returnObj") //매개변수에 선언한 오브젝트 이름
	public void loginLogging(JoinPoint jp, Object returnObj) {
		
		if(returnObj instanceof Member) {
			Member member = (Member)returnObj; 
			
			logger.info(member.getUname() + "aop 초대장확인중...."); 
			
			member = mservice.selectInvted(member.getUemail());
			if(member != null) {
				System.out.println("초대키있음");
			}else {
				System.out.println("초대키없음");
			}

		}
		HttpSession session = (HttpSession) RequestContextHolder
                .currentRequestAttributes()
                .resolveReference(RequestAttributes.REFERENCE_SESSION);
	}
	
}
