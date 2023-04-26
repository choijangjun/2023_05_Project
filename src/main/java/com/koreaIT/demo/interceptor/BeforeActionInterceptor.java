package com.koreaIT.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.koreaIT.demo.vo.Rq;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Rq rq = new Rq(request, response);
		request.setAttribute("rq", rq);
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}