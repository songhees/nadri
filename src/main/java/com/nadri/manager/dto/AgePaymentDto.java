package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 연령별 사용 금액
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AgePaymentDto {
	private int age;
	private long restaurantPayment;
	private long trainPayment;
	private long attractionPayment;
}
