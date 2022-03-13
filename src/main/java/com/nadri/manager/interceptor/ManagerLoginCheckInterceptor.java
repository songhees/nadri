package com.nadri.manager.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.nadri.manager.annotation.LoginedManager;
import com.nadri.manager.util.SessionUtils;
import com.nadri.manager.vo.Manager;

import lombok.extern.slf4j.Slf4j;

/**
 * 관리자 페이지 들어갈 때 로그인 되어있는 사용자 인지 아닌지 판단하는 intercetor
 * @author song
 *
 */
@Slf4j
@Component
public class ManagerLoginCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean hasLoginManager = false;
		HandlerMethod method = (HandlerMethod)handler;
		MethodParameter[] parameters = method.getMethodParameters();
		for (MethodParameter parameter : parameters) {
			if (parameter.hasParameterAnnotation(LoginedManager.class)) {
				hasLoginManager = true;
				break;
			}
		}
		// 요청핸들러 메소드의 매개변수에 LoginedManager가 부착되어 있는가? true/false
		log.info("매니저어노테이션유무 :"+ hasLoginManager);
		
		// false면 true로 요청핸들러 메소드 실행
		if (!hasLoginManager) {
			return true;
		}
		
		// true면 로그인 되어 있는지 판단
		Manager manager = (Manager)SessionUtils.getAttribute("LOGIN_MANAGER");
		// 로그인 안되어 있으면 exception발생
		if (manager == null) {
			response.sendRedirect("/admin?error=deny");
			return false;
		}
		log.info("로그인되어 있는가? :"+ hasLoginManager);
		// 로그인 되어 있으면 요청핸들러 메소드 실행
		return true;
	}
}
