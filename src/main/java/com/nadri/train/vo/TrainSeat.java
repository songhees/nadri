package com.nadri.train.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 기차 좌석
 * @author song
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainSeat {
	private int roomNo;
	private int seatNo;
}
