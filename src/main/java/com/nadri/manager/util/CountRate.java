package com.nadri.manager.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.nadri.manager.web.restController.ManagerRestController;

import lombok.Data;

/**
 * 비율 계산
 * @author song
 *
 */
@Data
public class CountRate {
	static final Logger log = LogManager.getLogger(ManagerRestController.class);
	public static List<Double> rate(int total, List<Integer> datas) {
		
		List<Double> rates = new ArrayList<Double>();
		for (Integer data : datas) {
			double result = Math.round(((data*100.0)/total)*10)/10.0;
			rates.add(result);
		}
		return rates;
	}
	
	public static double rate(int total, int data) {
		return Math.round(((data*100.0)/total)*10)/10.0;
	}
}
