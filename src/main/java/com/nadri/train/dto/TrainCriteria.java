package com.nadri.train.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 열차 스케줄 검색
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainCriteria {
	private String departureStation;
	private String arrivalStation;
	private int rowNo;
	private Date departureDate;
	
	private static SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH");
	
	public void setDepartureDate(String dpDate, String dpTime) {
		if (dpDate == null | dpTime == null) {
			departureDate = null;
		}
		String fullDate = dpDate + " " + dpTime;
		Date result;
		try {
			result = sf.parse(fullDate);
			departureDate = result;
		} catch (ParseException e) {
			departureDate = null;
		}
	}
	
}
