package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 연령별 사용자 비율
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAgeRate {
	private int age;
	private int count;
	private double rate;
}
