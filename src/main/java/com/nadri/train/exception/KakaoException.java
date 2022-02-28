package com.nadri.train.exception;

/**
 * 카카오 결제 오류시 발생하는 예외
 * @author song
 *
 */
public class KakaoException extends TrainException  {
	private static final long serialVersionUID = -8288957499820311604L;

	public KakaoException(String message) {
		super(message);
	}
}
