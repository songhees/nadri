package com.nadri.train.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.dto.TrainTicketCriteria;
import com.nadri.train.exception.LoginException;
import com.nadri.train.exception.ReservationException;
import com.nadri.train.mapper.TrainMapper;
import com.nadri.train.util.Pagination;
import com.nadri.train.vo.TrainRefund;
import com.nadri.train.vo.TrainReservation;
import com.nadri.train.vo.TrainRoom;
import com.nadri.train.vo.TrainSchedule;
import com.nadri.train.vo.TrainSeat;
import com.nadri.train.vo.TrainStation;
import com.nadri.train.vo.TrainTicket;
import com.nadri.train.web.model.TrainRoomInfo;
import com.nadri.train.dto.TrainCriteria;
import com.nadri.train.dto.TrainFavoriteRouteDto;
import com.nadri.train.dto.TrainReservationCriteria;

@Service
@Transactional
public class TrainService {
	static final Logger log = LogManager.getLogger(TrainService.class);
	
	@Autowired
	TrainMapper mapper;
	
	/**
	 * 첫번째 한글 단어 유니코드로 기차역 목록 조회
	 * @param word 한글 첫 글자 유니코드
	 * @return
	 */
	public List<TrainStation> getStationByWord(int word) {
		return mapper.getStationByWord(word);
	}
	
	/**
	 * 스케줄 더미데이터를 넣기 위한 class
	 * @return
	 */
	public List<TrainSchedule> getAllSchedules() {
		return mapper.getAllTrainSchedules();
	}
	public void addNewSchedule(List<TrainSchedule> schedules) {
		mapper.insertNewSchedule(schedules);
	}
	
	/**
	 * 검색 정보로 기차 스케줄 정보 반환
	 * @param criteria
	 * @return
	 * @throws  
	 */
	public List<TrainSearchDto> getSchedulesByCriteria(TrainCriteria criteria) {
		return mapper.getSchedulesByCriteria(criteria);
	}
	
	/**
	 * 열차번호와 타입에 해당하는 기차 호차 정보 반환
	 * @param roomInfo
	 * @return
	 */
	public List<TrainRoom> getTrainRoom(TrainRoomInfo roomInfo) {
		return mapper.getTrainRoom(roomInfo);
	}
	
	/**
	 * 스케줄 번호와 기차번호에 해당하는 예약된 좌석목록 조회
	 * @param scheduleNo
	 * @param trainNo
	 * @return
	 */
	public List<TrainSeat> getTrainSeatNo(int scheduleNo, int trainNo) {
		return mapper.getTrainSeatNo(scheduleNo, trainNo);
	}
	
	/**
	 * 예약된 정보와 예약 번호에 해당하는 티켓 정보를 추가
	 * @param reservation
	 * @param ticketList
	 */
	public int addNewReservation(TrainReservation reservation, List<TrainTicket> ticketList) {
		List<Integer> seatList = mapper.getSeatList(ticketList.get(0));
		for (TrainTicket ticket : ticketList) {
			for (int seat :seatList) {
				if (ticket.getSeatNo() == seat) {
					throw new ReservationException("이미 예약된 좌석입니다.");
				}
			}
		
		}
		 
		mapper.insertReservation(reservation);
		for (TrainTicket ticket : ticketList) {
			ticket.setReservationNo(reservation.getNo());
		}
		mapper.insertTicket(ticketList);
		return reservation.getNo();
	}
	
	/**
	 * 여러개의 예약 번호에 해당하는 예약 정보 반환
	 * @param reservedNo1 가는 기차 예약번호
	 * @param reservedNo2 오는 기차 예약번호
	 * @return
	 */
	public List<TrainReservation> getReservationByNo(int userNo, int reservedNo1, int reservedNo2) {
		Map<String, Object> useing = new HashMap<String, Object>();
		useing.put("reservedNo1", reservedNo1);
		useing.put("reservedNo2", reservedNo2);
		useing.put("userNo", userNo);
		List<TrainReservation> reservationList = mapper.getReservationByNo(useing);
//		if (reservationList == null) {
//			throw new ReservationException("예약 정보가 존재하지 않습니다.");
//		}
		
		for (TrainReservation reservation : reservationList) {
			if (reservation.getUserNo() != userNo) {
				throw new LoginException("로그인후 사용하실 수 있습니다.");
			}
		}
		return reservationList;
	}
	
	/**
	 * 예약 번호에 해당하는 예약 정보 반환
	 * @param userNo
	 * @param reservationNo
	 * @return 
	 */
	public TrainReservation getReservationOne(int userNo, int reservationNo) {
		Map<String, Object> useing = new HashMap<String, Object>();
		useing.put("reservedNo1", reservationNo);
		useing.put("userNo", userNo);
		log.info("오류확인:" + mapper.getReservationByNo(useing).size());
		TrainReservation reservation = mapper.getReservationByNo(useing).get(0);
		
		if (reservation.getUserNo() != userNo) {
			throw new LoginException("로그인한 후 사용하실 수 있습니다.");
		}

		return reservation;
	}
	
	/**
	 * 유저 번호에 해당한는 모든 예약 정보 반환
	 * @param userNo
	 * @return
	 */
	public List<TrainReservation> getReservationByUserNo(int userNo) {
		Map<String, Object> useing = new HashMap<String, Object>();
		useing.put("userNo", userNo);
		List<TrainReservation> reservationList = mapper.getReservationByNo(useing);
		
		Calendar cal = Calendar.getInstance();
		for (TrainReservation reservation : reservationList) {
			if ("예약".equals(reservation.getTickectStatus())) {
				cal.setTime(reservation.getReservationDate());
				cal.add(Calendar.MINUTE, 10);
				reservation.setReservationDate(cal.getTime());
			}
		}
		return reservationList;
	}
	
	/**
	 * 검색 정보에 해당하는 모든 예약 정보 반환
	 * @param criteria
	 * @return
	 */
	public Map<String, Object> getAllReservatioin(TrainReservationCriteria criteria) {
		Map<String, Object> map = new HashMap<String, Object>();

		Pagination pagination = new Pagination(criteria.getPageNo(), mapper.getReservationCount(criteria), 7, 5);
		criteria.setBegin(pagination.getBegin());
		criteria.setEnd(pagination.getEnd());
		
		map.put("pagination", pagination);
		map.put("infoList", mapper.getAllReservatioin(criteria));
		return map;
	}
	
	/**
	 * 예약 번호에 해당하는 티켓 정보 반환
	 * @param reservedNo1 가는 기차 예약번호
	 * @param reservedNo2 오는 기차 예약번호
	 * @return
	 */
	public List<TrainTicket> getTicketByReservedNo(int reservedNo1, int reservedNo2) {
		return mapper.getTicketByReservedNo(reservedNo1, reservedNo2); 
	}
	
	/**
	 * 프린트할 티켓 목록 반환
	 * @param criteria
	 * @return
	 */
	public Map<String, Object> getTicketByCriteria(int pageNo, TrainTicketCriteria criteria) {
		int totalRecords = mapper.getTicketCount(criteria);
		Pagination pagination = new Pagination(pageNo, totalRecords, 5, 3);
		criteria.setBegin(pagination.getBegin());
		criteria.setEnd(pagination.getEnd());
		Map<String, Object> map = new HashMap<>();
		map.put("ticketList", mapper.getTicketByCriteria(criteria));
		map.put("pagination", pagination);
		
		return map;
	}
	
	/**
	 * 인기 노선 반환
	 * @return
	 */
	public List<TrainFavoriteRouteDto> getFavoriteRoute() {
		return mapper.getFavoriteRoute();
	}
	
	/**
	 * 예약 목록 반환
	 * @return
	 */
	public List<TrainReservation> getReservationIsReserved() {
		return mapper.getReservationIsReserved();
	}
	
	/**
	 * 티켓 번호에 해당하는 티켓 정보들을 삭제
	 * @param deleteList
	 */
	public void deleteTicket(List<Integer> deleteList) {
		if (deleteList.size() !=0) {
			log.info("삭제 리스트 길이 : " + deleteList.size());
			mapper.deleteTicket(deleteList);
			mapper.deleteReservation(deleteList);
		}
	}
	
	/**
	 * 티켓번호로 티켓 삭제
	 * @param ticketNo
	 */
	public void deleteTicketByNo(List<Integer> ticketNo) {
		mapper.deleteTicketByNo(ticketNo);
	}
	
	/**
	 * 예약번호로 해당 예약정보 삭제
	 * @param no
	 */
	public void deleteReservationByNo(int userNo, int no) {
		// restContoller에서 reservation정보 가져올때 이미 사용자동일 여부 판단해서 할 필요 없다.
		List<Integer> reservationNo = List.of(no);
		mapper.deleteTicket(reservationNo);
		mapper.deleteReservationByNo(userNo, no);
	}
	
	/**
	 * 티켓 번호에 해당하는 티켓 정보 반환
	 * @param no 티켓 번호
	 * @return 티켓 정보
	 */
	public TrainTicket getTicketByNo(int no) {
		return mapper.getTicketByNo(no);
	}
	
	/**
	 * 티켓 번호목록에 해당하는 티켓목록 정보 반환
	 * @param no 티켓 번호 목록
	 * @return 티켓정보 목록
	 */
	public List<TrainTicket> getTicketByNo(List<Integer> no) {
		return mapper.getTicketByNoList(no);
	}
	
	/**
	 * 예약 정보를 입력받아 수정
	 * @param reservation
	 */
	public void updateReservation(TrainReservation reservation) {
		mapper.updateReservation(reservation);
	}
	
	/**
	 * 티켓정보를 입력받아 수정
	 * @param ticket
	 */
	public void updateTicket(TrainTicket ticket) {
		mapper.updateTicket(ticket);
	}
	
	public void deleteRefund(List<Integer> ticketNo) {
		mapper.deleteRefund(ticketNo);
	}
	
	public void addRefund(List<TrainRefund> refundList) {
		mapper.insertRefund(refundList);
	}
	
}
