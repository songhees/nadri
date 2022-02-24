package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 카테고리별 상품 취소/결제/예약 개수
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryStatus {
	private int finish;
	private int reservaion;
	private int cancel;
	
	public int getTotal() {
		return finish+reservaion;
	}
}
