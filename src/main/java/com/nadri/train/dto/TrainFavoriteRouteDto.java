package com.nadri.train.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 인기 노선
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainFavoriteRouteDto {
	private String departureStation;
	private String arrivalStation;
	private int rowNo;
	private int routeNo;
	private String image;
	private long minPrice;
}
