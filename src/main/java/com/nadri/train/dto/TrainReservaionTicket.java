package com.nadri.train.dto;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 예약, 티켓 정보
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainReservaionTicket {
	private int ticketNo;
	private String departureStation; 
	private Date arrivalDate;
	private String trainName; 
	private int trainNo;
	private String arrivalStation;
	private Date departureDate;
	private String roomType;
	private String roomName; 
	private int seatNo;
	private String customerName;
	private String isCanceled;
	private long price;
	private String type;
	private int priceId;
	private Date reservedDate;
	private String isPrinted;
	
	public long getPrice() {
		if ("어린이".equals(type)) {
			return price/2;
		} else {
			return price;
		}
	}
}
