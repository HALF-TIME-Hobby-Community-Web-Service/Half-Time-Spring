package com.zerock.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Component
@Log4j	
public class LogAdvice {
	@Before("execution(* com.zerock.service.SampleService*.*(..))")
	public void logBefore() {
		log.info("시작하기전에 수행됩니다");
	}
	
	@Before("execution(* com.zerock.service.SampleService*.doAdd(String, String)) && args(str1, str2)")
	public void logBeforeWithPagingParam(String str1, String str2) {
		log.info("첫째 인자:" + str1);
		log.info("둘째 인자:" + str2);
	}
	
	@AfterThrowing(pointcut= "execution(* com.zerock.service.SampleService*.*(..))", 
			throwing="ex")
	public void logException(Exception ex) {
		log.info("오류 처리 Advice");
		log.info("Exception:" + ex);
	}
	
	@Around("execution(* com.zerock.service.SampleService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		
		log.info("Around 이전 실행 코드");
		long start = System.currentTimeMillis();
		
		Object result = null;
		try {
			result = pjp.proceed();
		} 
		catch (Throwable e) {			
			e.printStackTrace();
		}		
		long end = System.currentTimeMillis();
		log.info("Around 이후 실행 코드");
		log.info("수행 시간 [ " + (end-start) + " ]");
		return result;	
	}
	
}
	