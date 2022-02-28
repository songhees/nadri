package com.nadri.train.web.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 환불 정보
 * @author song
 *
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class TrainRefundForm {
	private long refundRate;
	private long refundPrice;
	private List<Integer> ticketList;
}
