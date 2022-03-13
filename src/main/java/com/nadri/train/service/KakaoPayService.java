package com.nadri.train.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.nadri.train.kakaoPay.ApproveResponse;
import com.nadri.train.kakaoPay.ReadyResponse;
import com.nadri.train.web.model.TrainPaymentDto;


@Service("train")
public class KakaoPayService {
	
	/**
	 * 카카오 결제 페이지 요청
	 * @param userId
	 * @param itemName
	 * @param dto
	 * @return
	 */
	public ReadyResponse readyPayment(String userId, String itemName, TrainPaymentDto dto) {
		MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", dto.getReservationNo());
		parameters.add("partner_user_id", userId);
		parameters.add("item_name", itemName);
		parameters.add("quantity", dto.getTotalCount());
		parameters.add("total_amount", dto.getTotalPrice());
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost/train/kakaoPayment.nadri");
		parameters.add("cancel_url", "http://localhost/train/kakaoPayment.nadri");
		parameters.add("fail_url", "http://localhost/train/failPayment.nadri");
		
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "KakaoAK 5fa0f0222e9a68676ec86330e233e3e7");
		header.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<>(parameters, getHeader());
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		
		ReadyResponse response = template.postForObject(url, request, ReadyResponse.class);
		
		return response;
	}
	
	/**
	 * 카카오 결제 승인
	 * @param tid
	 * @param pgToken
	 * @param userId
	 * @param orderId
	 * @return
	 */
	public ApproveResponse payApprove(String tid, String pgToken, String userId, String orderId) {
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", orderId);
		parameters.add("partner_user_id", userId);
		parameters.add("pg_token", pgToken);
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(parameters, getHeader());
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
		ApproveResponse response = template.postForObject(url, request, ApproveResponse.class);
		
		return response;
	}
	
	private HttpHeaders getHeader() {
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "KakaoAK 5fa0f0222e9a68676ec86330e233e3e7");
		header.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		return header;
	}
}
