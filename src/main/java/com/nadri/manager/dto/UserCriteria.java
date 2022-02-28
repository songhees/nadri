package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 사용자 검색
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserCriteria {
	private String keyword;
	private String option;
	private String deleted;
	private String email;
	private String sms;
	private int pageNo;
	private int begin;
	private int end;
}
