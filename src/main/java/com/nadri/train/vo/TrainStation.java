package com.nadri.train.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 기차역 정보
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainStation {
	
	private String id;
	private String name;
	private int cityCode;
	private String isUsed;
}
