package com.nadri.train.exception;

/**
 * train 페이지에서 발생하는 모든 예외의 부모 객체
 * @author song
 *
 */
public class TrainException extends RuntimeException {

	private static final long serialVersionUID = -3385402242843420122L;

	public TrainException(String message) {
		super(message);
	}
}
