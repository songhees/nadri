package com.nadri.train.util;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.nadri.train.service.TrainService;
import com.nadri.train.vo.TrainReservation;

/**
 * 에약 시간이 지난 목록을 삭제하는 클래스
 * @author song
 *
 */
@Component
public class TrainSchedule {
	@Autowired
	TrainService service;
	
	@Scheduled(cron = "0 0/1 * * * ?")
	public void calcelReservation() {
		List<TrainReservation> reservations = service.getReservationIsReserved();
//		StringJoiner sb = new StringJoiner(",");
		List<Integer> list = new ArrayList<Integer>();
		LocalDateTime now = LocalDateTime.now();
		// 메소드 체이닝이 가능하다.
		int nowMinute = now.getMinute();
		for (TrainReservation reservation : reservations) {
			now = reservation.getReservationDate().toInstant()
					.atZone(ZoneId.systemDefault())
					.toLocalDateTime().plusMinutes(10);
			
			if (nowMinute == now.getMinute()) {
				list.add(reservation.getNo());
//				sb.add(Integer.toString(reservation.getNo()));
			}
		}
		service.deleteTicket(list);
	}
}
