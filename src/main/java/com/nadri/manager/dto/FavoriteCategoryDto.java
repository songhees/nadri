package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 카테고리별 인기 상품
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FavoriteCategoryDto {
	private int rowNo;
	private String destination;
	private int count;
	private String image;
}
