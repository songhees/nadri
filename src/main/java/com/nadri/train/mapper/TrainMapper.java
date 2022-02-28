package com.nadri.train.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nadri.train.dto.TrainSearchDto;
import com.nadri.train.dto.TrainTicketCriteria;
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
import com.nadri.train.dto.TrainReservaionTicket;
import com.nadri.train.dto.TrainReservationCriteria;

@Mapper
public interface TrainMapper {
	
	/**
	 * 한글자 유니코드를 입력하여 기차역 목록 반환
	 * @param word
	 * @return
	 */
	List<TrainStation> getStationByWord(int word);
	
	/**
	 * 스케줄 더미데이터를 넣기 위한 class
	 * @return
	 */
	List<TrainSchedule> getAllTrainSchedules();
	void insertNewSchedule(List<TrainSchedule> schedules);
	
	/**
	 * 검색 정보를 입력하여 기차 스케줄 목록 반환
	 * @param criteria
	 * @return
	 */
	List<TrainSearchDto> getSchedulesByCriteria(TrainCriteria criteria);
	
	/**
	 * 열차번호와 타입에 해당하는 열차의 모든 호차정보를 반환
	 * @param roomInfo
	 * @return
	 */
	List<TrainRoom> getTrainRoom(TrainRoomInfo roomInfo);
	
	/**
	 * 스케줄 번호와 호차 기차번호에 해당하는 예약된자석 목록 반환
	 * @param scheduleNo 스케줄 번호
	 * @param trainNo scheduleNo
	 * @return
	 */
	List<TrainSeat> getTrainSeatNo(@Param("scheduleNo") int scheduleNo, @Param("trainNo") int trainNo);
	
	/**
	 * 예약 정보 등록
	 * @param reservation
	 */
	void insertReservation(TrainReservation reservation);
	
	/**
	 * 티켓 정보 등록
	 * @param ticketList
	 */
	void insertTicket(List<TrainTicket> ticketList);
	
	/**
	 * 예약번호에 해당하는 예약 정보 조회
	 * @param reservedNo1
	 * @param reservedNo2
	 * @return
	 */
	List<TrainReservation> getReservationByNo(Map<String, Object> useing);
	
	/**
	 * 검색정보에 해당하는 예약 정보 조회
	 * @param criteria
	 * @return
	 */
	List<TrainReservaionTicket> getAllReservatioin(TrainReservationCriteria criteria);
	
	int getReservationCount(TrainReservationCriteria criteria);
	
	/**
	 * 예약번호에 해당하는 티켓 정보 조회
	 * @param reservedNo1
	 * @param reservedNo2
	 * @return
	 */
	List<TrainTicket> getTicketByReservedNo(@Param("reservedNo1") int reservedNo1, @Param("reservedNo2") int reservedNo2);
	
	
	/**
	 * 검색정보에 해당하는 승차권(티켓) 반환
	 * @param criteria 검색 정보
	 * @return
	 */
	List<TrainTicket> getTicketByCriteria(TrainTicketCriteria criteria);
	
	/**
	 * 검색정보에 해당하는 모든 승차권 개수
	 * @param criteria
	 * @return
	 */
	int getTicketCount(TrainTicketCriteria criteria);
	
	/**
	 * 인기 노선 조회
	 * @return 인기 노선 9개
	 */
	List<TrainFavoriteRouteDto> getFavoriteRoute();
	
	/**
	 * 예약 조회
	 * @return
	 */
	List<TrainReservation> getReservationIsReserved();
	
	/**
	 * 일정시간이 지난 예약 삭제
	 * @param deleteList
	 */
	void deleteReservation(@Param("items") List<Integer> deleteList);
	
	/**
	 * 일정시간이 지난 예약티켓 삭제
	 * @param deleteList
	 */
	void deleteTicket(@Param("items") List<Integer> deleteList);
	
	/**
	 * 티켓 번호에 해당하는 티켓 삭제
	 * @param ticketNo
	 */
	void deleteTicketByNo(@Param("items") List<Integer> ticketNo);
	
	/**
	 * 예약 번호에 해당하는 예약 삭제
	 * @param userNo
	 * @param no
	 */
	void deleteReservationByNo(@Param("userNo") int userNo, @Param("no") int no);
	
	/**
	 * 티켓번호에 해당하는 티켓 조회
	 * @param no
	 * @return
	 */
	TrainTicket getTicketByNo(int no);
	
	/**
	 * 티켓번호목록에 해당하는 티켓목록 조회
	 * @param no
	 * @return
	 */
	List<TrainTicket> getTicketByNoList(List<Integer> no);
	
	/**
	 * 예약 정보 수정
	 * @param reservation
	 */
	void updateReservation(TrainReservation reservation);
	
	/**
	 * 티켓 정보 수정
	 * @param ticket
	 */
	void updateTicket(TrainTicket ticket);
	
	void insertRefund(List<TrainRefund> refundList);
	
	void deleteRefund(@Param("no") List<Integer> refundList);


	List<Integer> getSeatList(TrainTicket ticket);
}
