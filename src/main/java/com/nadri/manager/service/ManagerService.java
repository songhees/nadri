package com.nadri.manager.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nadri.manager.dto.AgePaymentDto;
import com.nadri.manager.dto.CategoryStatus;
import com.nadri.manager.dto.DayRateDto;
import com.nadri.manager.dto.FavoriteCategoryDto;
import com.nadri.manager.dto.GenderPaymentDto;
import com.nadri.manager.dto.UserAgeRate;
import com.nadri.manager.dto.UserCountDate;
import com.nadri.manager.dto.UserCriteria;
import com.nadri.manager.exception.LoginErrorException;
import com.nadri.manager.mapper.ManagerMapper;
import com.nadri.manager.util.CountRate;
import com.nadri.manager.util.Pagination;
import com.nadri.manager.vo.Manager;
import com.nadri.user.vo.User;

@Service
public class ManagerService {
	@Autowired
	ManagerMapper mapper;
	
	public Manager login(String id, String password) {
		Manager manager = mapper.getManager(id);
		if (manager == null) {
			throw new LoginErrorException("존재하지 않는 정보입니다");
		} else if (!password.equals(manager.getPassword())) {
			throw new LoginErrorException("존재하지 않는 정보입니다");
		}
		return manager;
	}
	
	/**
	 * 모든 유저 정보 반환
	 * @return
	 */
	public List<User> getAllUser() {
		return mapper.getAllUser();
	}
	
	/**
	 * 검색어에 해당하는 유저 정보 반환
	 * @param option
	 * @param keyword
	 * @return
	 */
	public Map<String, Object> getUserByCriteria(UserCriteria criteria) {
		Map<String, Object> map = new HashMap<String, Object>();
		Pagination pagination = new Pagination(criteria.getPageNo(), mapper.getCountUserByCriteria(criteria), 6, 3);
		
		criteria.setBegin(pagination.getBegin());
		criteria.setEnd(pagination.getEnd());
		List<User> userList = mapper.getUserByCriteria(criteria);
		map.put("userList", userList);
		map.put("pagination", pagination);
		return map;
	}
	
	public List<Double> getGenderRateOfUser(int total) {
		return CountRate.rate(total, mapper.getGenderRateOfUser());
	}
	
	public List<UserAgeRate> getAgeRateOfUser(int total) {
		List<UserAgeRate> rates = mapper.getAgeRateOfUser();
		for (UserAgeRate rate: rates) {
			rate.setRate(CountRate.rate(total, rate.getCount()));
		}
		return rates;
	}
	
	public int getCountUserByCriteria(UserCriteria criteria) {
		return mapper.getCountUserByCriteria(criteria);
	}
	
	/**
	 * 인기 열차 노선 best4 반환
	 * @return
	 */
	public List<FavoriteCategoryDto> getFavoriteTrain() {
		return mapper.getFavoriteTrain();
	}
	
	/**
	 * 인기 음식점 best4 반환
	 * @return
	 */
	public List<FavoriteCategoryDto> getFavoirteRestuarnt() {
		return mapper.getFavoirteRestuarnt();
	}
	
	/**
	 * 인기 여행지 best4 반환
	 * @return
	 */
	public List<FavoriteCategoryDto> getFavoirteAttraction() {
		return mapper.getFavoirteAttraction();
	}
	
	public List<UserCountDate> getUserCountByMonth() {
		LocalDate now = LocalDate.now();
		return mapper.getUserCountByMonth(now.getMonthValue(),  (now.getMonthValue()-1));
	}
	
	/**
	 * 나이별/카테고리별 누적 금액
	 * @return
	 */
	public List<AgePaymentDto> getAgePayment() {
		return mapper.getAgePayment();
	}
	
	/**
	 * 성별/카테고리별 누적 금액
	 * @return
	 */
	public List<GenderPaymentDto> getGenderPayment() {
		return mapper.getGenderPayment();
	}
	
	/**
	 * 금일 회원/카테고리 별 데이터
	 * @return
	 */
	public DayRateDto getDayRate() {
		return mapper.getDayRate();
	}
	
	public CategoryStatus getTrainStatus() {
		return mapper.getTrainStatus();
	}
	public CategoryStatus getRestaurantStatus() {
		return mapper.getRestaurantStatus();
	}
	public CategoryStatus getAttractionStatus() {
		return mapper.getAttractionStatus();
	}
}
