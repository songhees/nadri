package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 금일 카테고리/유저 현황
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DayRateDto {
	private long restaurantPayment;
	private long trainPayment;
	private long attractionPayment;
	private int deletedUser;
	private int createdUser;
	
	public long getTotal() {
		return restaurantPayment + trainPayment + attractionPayment;
	}
}
