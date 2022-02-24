package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 성별 사용 금액
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GenderPaymentDto {
	private String gender;
	private long restaurantPayment;
	private long trainPayment;
	private long attractionPayment;
}
