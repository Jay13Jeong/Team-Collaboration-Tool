/*
 * package com.beet.HWABO.common.interceptor;
 * 
 * import org.aspectj.lang.ProceedingJoinPoint; import
 * org.aspectj.lang.annotation.Around; import
 * org.aspectj.lang.annotation.Aspect; import
 * org.aspectj.lang.annotation.Pointcut; import
 * org.springframework.stereotype.Service;
 * 
 * import com.beet.HWABO.invite.model.vo.Invite;
 * 
 * 
 * @Service
 * 
 * @Aspect public class AroundInviteAOP {
 * 
 * @Pointcut("execution(* com.beet.HWABO.member.model.dao.MemberDao.selectInvtChk(..))"
 * ) public void invitePointcut() {}
 * 
 * @Around("invitePointcut()") public void invtChk(ProceedingJoinPoint pp)
 * throws Throwable{ String methodName = pp.getSignature().getName();
 * 
 * System.out.println("초대장 확인중"); Invite invite = (Invite)pp.proceed();
 * //logger.info(methodName+"() 메소드 수행시간에 걸린 시간 : "+ sw.getTotalTimeMillis()
 * +"(ms)초" );
 * 
 * System.out.println("aop 실행완료"); System.out.println(invite.getInvtkey());
 * 
 * } }
 */