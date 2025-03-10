package com.nadri.coupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadri.coupon.dao.UserCouponDao;
import com.nadri.coupon.vo.UserCoupon;

@Service
@Transactional
public class UserCouponService {

	@Autowired
	UserCouponDao userCouponDao;
	
	/* 유저No로 쿠폰 추가 */
	public void insertCouponByUserNo(int couponNo, int userNo) {
		userCouponDao.getCoupon(couponNo, userNo);
	}
	/* 발급받은 쿠폰 갯수 감수 */
	public void reduceCouponQuantity(int couponNo) {
		userCouponDao.reduceQuantity(couponNo);
	}
	
	/* 유저 보유 쿠폰 목록 */
	public List<UserCoupon> getCouponList(int userNo){
		return userCouponDao.couponList(userNo);
	}
	
	/* 유저 보유 쿠폰 목록-즐길거리 */
	public List<UserCoupon> getAttrCouponList(int userNo){
		return userCouponDao.attrCouponList(userNo);
	}
	
	/* 유저 보유 쿠폰 갯수 */
	public int getCouponCount(int userNo) {
		return userCouponDao.couponCount(userNo);
	}
	
	/* 유저 보유 쿠폰 목록-음식점 */
	public List<UserCoupon> getRestaurantCouponList(int userNo){
		return userCouponDao.getRestCouponList(userNo);
	}
	/* 발급가능한 모든 쿠폰 */
	public List<UserCoupon> getAllValidCoupons(){
		return userCouponDao.allValidCoupons();
	}
	/* 쿠폰 발급여부 조회 */
	public void couponCheckByUserNo(int couponNo, int userNo) {
		int couponCheck = userCouponDao.couponCheck(couponNo, userNo);
		if(couponCheck==1) {
			throw new RuntimeException("fail");
		}
	}
}
