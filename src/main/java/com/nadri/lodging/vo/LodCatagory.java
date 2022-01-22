package com.nadri.lodging.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString	
public class LodCatagory {

	private int no ;						// 숙소 카테고리 번호
	private String name;					// 숙소 카테고리 이름
}
