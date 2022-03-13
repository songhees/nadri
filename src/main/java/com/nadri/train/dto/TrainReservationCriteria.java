package com.nadri.train.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 예약 정보 검색
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainReservationCriteria {
	private int userNo;
	private Date startDate;
	private Date endDate;
	private int pageNo;
	private int begin;
	private int end;
}
