package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 지난달/이번달 사용자 가입 수
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserCountDate {
	private int dates;
	private int now;
	private int before;
}
