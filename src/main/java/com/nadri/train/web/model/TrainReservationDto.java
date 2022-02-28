package com.nadri.train.web.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 좌석 예약 정보를 가져오는 객체
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainReservationDto {
	private String way;
	private int count1;
	private int adNo1;
	private int cdNo1;
	private int schduleNo1;
	private int trainNo1;
	private List<Integer> seatNo1;
	private int roomNo1;
	private int priceIdschedule1;
	private long priceschedule1;
	
	private int count2;
	private int adNo2;
	private int cdNo2;
	private int schduleNo2;
	private int trainNo2;
	private List<Integer> seatNo2;
	private int roomNo2;
	private int priceIdschedule2;
	private long priceschedule2;
}
