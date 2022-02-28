package com.nadri.train.exceptionHandler;

import java.io.IOException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadri.train.exception.LoginException;
import com.nadri.train.exception.ReservationException;
import com.nadri.train.web.model.ResponseDto;

/**
 * 예외처리 controller
 * @author song
 *
 */
@ControllerAdvice
public class ExceptionHandlerControllerAdvice {
	
	@ExceptionHandler(LoginException.class)
	public String handleLoginException(LoginException e) {
		return "/user/login.nadri";
	}
	
	@ExceptionHandler(IOException.class)
	public String handlerIOException(IOException e) {
		return "/train/error/failPayment";
	}
	
}
