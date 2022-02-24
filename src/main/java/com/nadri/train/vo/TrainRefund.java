package com.nadri.train.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 환불 내역
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainRefund {
	private int ticketNo;
	private Date refundDate;
	private long refundPrice;
	private long refundFees;
}
