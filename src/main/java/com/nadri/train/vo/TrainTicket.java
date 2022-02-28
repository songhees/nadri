package com.nadri.train.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 승차권 정보
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainTicket {
	private int no;
	private String customerName;
	private String type;
	private String isCanceled;
	private int reservationNo;
	private int scheduleNo;
	private int roomNo;
	private String roomName; 
	private String roomType;
	private int trainNo;
	private int priceId;
	private long price;
	private int seatNo;
	private String name;
	
	public long getPrice() {
		if ("어린이".equals(type)) {
			return price/2;
		} else {
			return price;
		}
	}
}
