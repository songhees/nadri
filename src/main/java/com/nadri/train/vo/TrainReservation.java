package com.nadri.train.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 기차 예약
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainReservation {
	
	private int no;
	private int totalCount;
	private long totalPrice;
	private String tickectStatus;
	private Date canceledDate;
	private Date soldDate;
	private Date reservationDate;
	private String trainName; 
	private int trainNo;
	private String departureStation; 
	private String arrivalStation;
	private Date departureTime;
	private Date arrivalTime;
	private int userNo;
	private String tid;
	private String isPrinted;
	
	public String getDiffTime() {
		long diff = arrivalTime.getTime() - departureTime.getTime();
		long hours = (diff / 1000) / 60 / 60 % 24;
		long minutes = (diff / 1000) / 60 % 60;
		long seconds = (diff / 1000) % 60;
		
		return String.format("%02d:%02d:%02d", hours, minutes, seconds);
	}
}
