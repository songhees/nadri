package com.nadri.train.exception;

/**
 * 이미 예약되어 있는 티켓인 경우 발생하는 예외
 * @author song
 *
 */
public class ReservationException extends TrainException {
	
	private static final long serialVersionUID = -4361139061880839641L;

	public ReservationException(String message) {
		super(message);
	}
}
