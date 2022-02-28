package com.nadri.train.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 기차 객실
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainRoom {
	private int no;
	private String name;
	private String type;
	private int seatNum;
	private int trainNo;
	private int bookedSeatNum;
}
