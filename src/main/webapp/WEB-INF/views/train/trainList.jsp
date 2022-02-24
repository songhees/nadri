<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
    <title>나드리::기차</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<script src="https://kit.fontawesome.com/2dd5a5b03c.js" crossorigin="anonymous"></script>
	<!-- 달력 ui -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<style>
	.listTable {
	  border-collapse: collapse;
	}
	.listTable td, #modal-price td, #modal-price th {
	  border: 1px solid #E0E0E0;
	}
	
	/* 호차 스킨 */
	#hocha span.can {
		cursor: pointer;
		width: 100px;
		height: 100px;
		background-image: url('../../resources/images/train/icon/canhocha.png');
		background-size: 50px 50px;
		background-repeat: no-repeat;
		padding: 15px 5px;
	}
	#hocha span.not {
		width: 100px;
		height: 100px;
		background-image: url('../../resources/images/train/icon/nohocha.png');
		background-size: 50px 50px;
		background-repeat: no-repeat;
		padding: 15px 5px;
	}
	#hocha span.chosen {
		width: 100px;
		height: 100px;
		background-image: url('../../resources/images/train/icon/chosenhocha.png');
		background-size: 50px 50px;
		background-repeat: no-repeat;
		padding: 15px 5px;
	}
	
	#hocha li {
		float: left;
		margin: 3px;
	}
	.btn-no {
		width: 90px;
		height: 25px;
		padding: initial;
		color: white;
		border-radius: 0;
		font-size: .875rem;
		font-weight: bold;
		background-color: #606060;
	}

	/* 좌석 스킨 */
	#seatList ul li {
		float: left;
		width: 6%;
	}

	#seatList ul span {
		cursor: pointer;
		display: inline-block;
		width: 35px;
		height: 42px;
		background-image: url('../../resources/images/train/icon/canchair.png');
		background-size: 35px 42px;
		background-repeat: no-repeat;
		text-align: center;
		padding-top: 9px;
		padding-left: 5px;
		font-size: 15px;
		font-weight: bold;
		color: #606060;
	}
	#seatList ul span.no {
		background-image: url('../../resources/images/train/icon/nochair.png');
		color: white;
		cursor: default;
	}
	
	#seatList ul span.chosen {
		background-image: url('../../resources/images/train/icon/chosenchair.png');
	}
	
	/*  */
	.dpTime div, .arTime div {
		font-weight: bold;
	}
	#seatList ul {
		margin-bottom: 10px;
	}
	
	#seatList ul, #hocha ul {
		list-style: none;
		display: flex;
		place-content: center;
		padding-right: 50px;
		padding-left: 50px;
	}
	
	#seatList strong {
		color: #C67278;
		font-size: 20px;
	}
	
	.listTable button.normal, .listTable button.special, .btn-look-price{
		width: 90px;
		height: 25px;
		padding: initial;
		color: white;
		border-radius: 0;
		font-size: .875rem;
		font-weight: bold;
		background-color: #7E5C5E;
	}
	
	.listTable [disabled=disabled] {
		width: 90px;
		height: 25px;
		padding: initial;
		color: white;
		border-radius: 0;
		font-size: .875rem;
		font-weight: bold;
		background-color: gray;
	
	}
	
	#btn1 button, #btn2 button {
		width: 90px;
		height: 35px;
		border-radius: 0;
		text-align-last: center;
		background-color: #003366;
		color: white;
	}
	
	/* sidebar 스킨 */
	.btn-s {
		background: #D8E5F6;
		position: absolute;
		top: 10px;
		left: 223px;
		width: 30px;
		padding: 0;
		height: 52px;
		border: 1px solid #BECDE4;
		color: black;
		font-weight: bold;
	}
	.btn-s + div {
		position: absolute;
		height: 265px;
		width: 200px;	
		background-color: #D8E5F6; 
		border-radius: 3px; 
		border: 1px solid #BACBE2;
	}
	
	.fas {
		color: #C67278;
	}
	
	.btn-look-price {
		background-color: white;
		color: gray;
		font-weight: normal;
		border: 1px solid #C0C0C0;
	}
	
	#modal-price th, #modal-price td {
		padding: 4px 10px;
		font-size: 15px;
		font-weight: normal;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>

<!-- ★ -->
<div class="container" id="trainBooking">
	<div class="row my-5">
		<div class="col">
			<h2>기차표</h2>
		</div>
	</div>
	<c:set var="menu1" value="search"/>
	<c:set var="menu2" value="lookup"/>
	<c:set var="active" value="menu2"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<%@ include file="common/searchBar.jsp" %>
	<div class="row">
		<div class="col">
			<div class="border my-4 p-3">
				<ul style="margin: 0;">
					<li>
						예메 버튼을 눌러 좌석을 선택해 주세요.
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div>
		<form action="/train/confirmReservation.nadri" method="post" id="seatBooking">
			<!-- 예약 좌석 현황 sidebar -->
			<div class="row" style="position: fixed; left: 0; top: 140px; width: 13%;
			height: 300px; border: 1px solid #BACBE2; background-color: white; border-radius: 3px; width: 225px;">
				<button type="button" class="btn-s"><i class="bi bi-caret-left-fill"></i></button>
				<div class="col m-3">
					<h5 class="pt-3" style="font-weight: bolder;">가는 열차</h5>
					<div class=" mt-3" style="border: 2px solid #BACBE2; background-color: white; height: 175px;">
						<div class="text-center row p-2 mt-3">
							<div class="col">
								<input type="hidden" name="schduleNo1">
								<input type="hidden" name="trainNo1">
								<input type="hidden" name="schduleNo2">
								<input type="hidden" name="trainNo2">
								<span><!-- 출발시간 --></span>
								<span style="font-size: 14px;"><!-- 출발역 --></span>
							</div>
							<div class="col" style="padding: 0; display: none;" id="arrow">
								<i class="fas fa-long-arrow-alt-right fa-2x"></i>
							</div>
							<div class="col">
								<span ><!-- 도착시간 --></span>
								<span style="font-size: 14px;"><!-- 도착역 --></span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col text-center">
								<span>예약 정보가 없습니다.</span><!-- 기차종류, 번호 -->
							</div>
						</div>
						<div class="row justify-content-center" style="margin: 26px;">
							<button type="button" class="btn" onClick="window.location.reload();" id="cancel"
							style="padding-top: 3px; width: 70px; background-color: #BF787C; color:white; font-weight:bold;
							height: 25px; font-size: 13px; border-radius: 0;">초기화</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 가는 열차 -->
			<div style="border: 1px solid #D8E5F6; background-color: #094A6B; text-align-last: justify">
				<h6 class="px-3 py-2 m-0 fw-bold" style="color: white; display: inline-block;">가는 열차</h6> 
				<span class="px-3 fs-5" style="color: white;">${searchForm.dpDate1 }</span>
			</div>
			<c:choose>
				<c:when test="${empty schedules1 }">
					<div class="border p-5 text-center">
						기차역 정보가 존재하지 않습니다.
					</div>
				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col">
							<table class="table text-center listTable">
								<thead style="border-bottom: inset;">
									<tr style="background-color: #E1EDFC; border-bottom: none;">
										<th style="width: 7%;">구분</th>
										<th style="width: 10%;">열차종류</th>
										<th style="width: 10%;">열차번호</th>
										<th style="width: 15%;">출발</th>
										<th style="width: 15%;">도착</th>
										<th style="width: 11%;">특실</th>
										<th style="width: 11%;">일반실</th>
										<th style="width: 10%;">소요기간</th>
										<th style="width: *;">운임</th>
									</tr>
								</thead>
								<tbody id="schedule1" style="vertical-align: middle;">
									<c:forEach var="schedule" items="${schedules1 }">
										<tr>
											<td>직통</td>
											<td class="infoTrain" data-schedule-no="${schedule.scheduleNo }" >${schedule.trainName }
											</td>
											<td>${schedule.trainNo }</td>
											<td class="dpTime">${searchForm.departureStation } <div><fmt:formatDate value="${schedule.departureTime }" pattern="HH:mm"/></div></td>
											<td class="arTime">${searchForm.arrivalStation }<div><fmt:formatDate value="${schedule.arrivalTime }" pattern="HH:mm"/></div></td>
											<td data-price-no="${schedule.specialPriceId }" data-price="${schedule.specialPrice }">
												<c:choose>
													<c:when test="${schedule.specialSeat eq 0 }">
													</c:when>
													<c:when test="${schedule.specialBooking eq schedule.specialSeat }">
														<button class="btn btn-no btn-sm" disabled="disabled">매진</button>
													</c:when>
													<c:otherwise>
														<button class="btn special" type="button">예매</button>
													</c:otherwise>
												</c:choose>
											</td>
											<td data-price-no="${schedule.normalPriceId }" data-price="${schedule.normalPrice }">
												<c:choose>
													<c:when test="${schedule.normalSeat eq 0 }">
													</c:when>
													<c:when test="${schedule.normalBooking eq schedule.normalSeat }">
														<button class="btn btn-no btn-sm" disabled="disabled">매진</button>
													</c:when>
													<c:otherwise>
														<button class="btn normal" type="button">예매</button>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="runTime">${schedule.diffTime }</td>
											<td><button class="btn-look-price" type="button">보기</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div style="text-align-last: justify" id="btn1">
						<button class="btn" type="button" id="prev1">이전</button>
						<button class="btn" type="button" id="next1">다음</button>
					</div>
				</c:otherwise>
			</c:choose>
			<c:if test="${way eq '왕복'}">
				<div style="border: 1px solid #D8E5F6; background-color: #094A6B; text-align-last: justify; margin-top: 100px;">
					<h6 class="px-3 py-2 m-0 fw-bold" style="color: white; display: inline-block;">오는 열차</h6> 
					<span class="px-3 fs-5" style="color: white;">${searchForm.dpDate2 }</span>
				</div>
			</c:if>
			<c:choose>
				<c:when test="${not empty schedules2 }">
					<div class="row">
						<div class="col">
							<table class="table text-center listTable">
								<thead style="border-bottom: inset;">
									<tr style="background-color: #E1EDFC;">
										<th style="width: 7%;">구분</th>
										<th style="width: 10%;">열차종류</th>
										<th style="width: 10%;">열차번호</th>
										<th style="width: 15%;">출발</th>
										<th style="width: 15%;">도착</th>
										<th style="width: 11%;">특실</th>
										<th style="width: 11%;">일반실</th>
										<th style="width: 10%;">소요기간</th>
										<th style="width: *;">운임</th>
									</tr>
								</thead>
								<tbody id="schedule2" style="vertical-align: middle;">
								<c:forEach var="schedule" items="${schedules2 }">
									<tr>
										<td>직통</td>
										<td class="infoTrain" data-schedule-no="${schedule.scheduleNo }">${schedule.trainName }
										</td>
										<td>${schedule.trainNo }</td>
										<td class="dpTime">${searchForm.arrivalStation } <div><fmt:formatDate value="${schedule.departureTime }" pattern="HH:mm"/></div></td>
										<td class="arTime">${searchForm.departureStation }<div><fmt:formatDate value="${schedule.arrivalTime }" pattern="HH:mm"/></div></td>
										<td data-price-no="${schedule.specialPriceId }" data-price="${schedule.specialPrice }">
											<c:choose>
												<c:when test="${schedule.specialSeat eq 0 }">
												</c:when>
												<c:when test="${schedule.specialBooking eq schedule.specialSeat }">
													<button class="btn btn-secondary btn-sm" disabled="disabled">매진</button>
												</c:when>
												<c:otherwise>
													<button class="btn special" type="button">예매</button>
												</c:otherwise>
											</c:choose>
										</td>
										<td data-price-no="${schedule.normalPriceId }" data-price="${schedule.normalPrice }">
											<c:choose>
												<c:when test="${schedule.normalSeat eq 0 }">
												</c:when>
												
												<c:when test="${schedule.normalBooking eq schedule.normalSeat }">
													<button class="btn btn-secondary btn-sm" disabled="disabled">매진</button>
												</c:when>
												<c:otherwise>
													<button class="btn normal" type="button">예매</button>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="runTime">${schedule.diffTime }</td>
										<td><button class="btn-look-price" type="button">보기</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div style="text-align-last: justify; margin-bottom: 100px;" id="btn2">
					<button class="btn" type="button" id="prev2">이전</button>
					<button class="btn" type="button" id="next2">다음</button>
				</div>
			</c:when>
			<c:when test="${way eq '왕복' && empty schedules2 }">
				<div class="border p-5 text-center">
					기차역 정보가 존재하지 않습니다.
				</div>
			</c:when>
		</c:choose>
		</form>
	</div>
	<!-- 좌석 선택 모달창 -->
	<div class="modal" tabindex="-1" id="modal-seat" style="border: 1px solid #D8E5F6;" data-root-type="">
 		<div class="modal-dialog modal-xl">
	   		<div class="modal-content" style="background-color: #7C97B9;">
	    		<div class="modal-body">
		    		<div style="display: flex; justify-content: space-between;">
		       			<h6 class="modal-title mb-2 fw-bold" style="color: white;">좌석 조회</h6>
	    	   			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
		    		</div>
	    			<div class="border" style="background-color: white;">
	    				<div class="m-5" id="hocha">
	    					<ul>
	    						
	    					</ul>
	    				</div>
	    				<div>
	    					<h5 class="ms-5" id="rootInfo">
	    						
	    					</h5>
	    				</div>
	    				<div class="text-end">
	    					<ul style="list-style: none; display: inline-flex;">
	    						<li class="mx-1">
			    					<em class="color me-2" style="border: 1px solid black; background-color: #69C4D7; padding: 0.2px 10px">
			    					</em>
			    					<span>선택 좌석</span>
	    						</li>
	    						<li class="mx-1">
			    					<em class="color me-2" style="border: 1px solid black; background-color: grey; padding: 0.2px 10px">
			    					</em>
			    					<span>선택 불가</span>
	    						</li>
	    						<li class="me-5 ms-1">
			    					<em class="color me-2" style="border: 1px solid black; padding: 0.2px 10px">
			    					</em>
			    					<span>선택 가능</span>
	    						</li>
	    					</ul>
	    				</div>
	    				<hr class="mx-5">
	    				<div id="seatList">
							
	    				</div>
	    				<hr class="mx-5">
	    				<div class="text-end m-5" style="text-align-last: justify;">
	    					<div class="chosenSeatList" style="display: inline-block;">선택 좌석 : </div>
	    					<button class="btn btn-secondary" type="button" id="btn-booking" style="border-radius: 0;">선택좌석예약</button>
	    				</div>
	    			</div>
     			</div>
   			</div>
 		</div>
	</div>
	<!-- 가격 모달창 -->
	<div class="modal" tabindex="-1" id="modal-price" style="border: 1px solid #D8E5F6;">
 		<div class="modal-dialog modal-lg">
	   		<div class="modal-content" style="background-color: #7C97B9;">
	    		<div class="modal-body pt-2">
	    			<div style="display: flex; justify-content: space-between;">
		       			<h6 class="modal-title mb-2 fw-bold" style="color: white;">운임 요금</h6>
	    	   			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
		    		</div>
    				<div style="background-color: white;">
    					<div class="mx-4 pt-3" id="price-trainInfo">
    						열차 정보 : <span></span>
    					</div>
	    				<div class="mx-4" >
	    					<table style="margin: 0; width: 100%; text-align: center;">
	    						<thead>
	    							<tr>
	    								<th scope="col" colspan="2">특실</th>
	    								<th scope="col" colspan="2">일반실</th>
	    							</tr>
	    							<tr style="background-color: #ECF5FF">
	    								<th>어른</th>
	    								<th>어린이</th>
	    								<th>어른</th>
	    								<th>어린이</th>
	    							</tr>
	    						</thead>
	    						<tbody>
	    							<tr>
	    								<td></td>
	    								<td></td>
	    								<td></td>
	    								<td></td>
	    							</tr>
	    						</tbody>
	    					</table>
	    				</div>
		    			<div class="px-4 py-3" style="font-size: 15px; text-align: end;">
							<div class="py-2" style="background-color: #ECF5FF">예상요금 : 특실 이용시 <strong></strong>원, 일반실 이용시 <strong></strong>원</div>
							<div class="mt-2">어른 <span>2</span> 명, 어린이 <span>1</span> 명</div>
		    			</div>
	    			</div>
				</div>
   			</div>
 		</div>
	</div>
</div>
<!--  -->
<%@ include file="../common/footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">

	$(function() {
		var priceModal = new bootstrap.Modal(document.getElementById('modal-price'), {
			keyboard: false
		});
		
		// 요금 출력
		$(".listTable").on('click', '.btn-look-price', function() {
			let dpStation = $(this).parent().prevAll().eq(4).contents()[0].textContent
			let arStation = $(this).parent().prevAll().eq(3).contents()[0].textContent
			let trainNo = $(this).parent().prevAll().eq(5).text()
			let type = $(this).parent().prevAll().eq(6).text()
			let special = $(this).parent().prevAll().eq(2).attr("data-price")
			let normal = $(this).parent().prevAll().eq(1).attr("data-price")
			
			let $target = $("#price-trainInfo")
			// 열차 정보
			$target.children().text(dpStation + " → " + arStation + "  " + type + "-" + trainNo)
			let adCount;
			let chCount;
			if ($(this).closest('tbody').attr('id') == 'schedule1') {
				adCount = parseInt($("[name=adNo1]").val())
				chCount = parseInt($("[name=cdNo1]").val())
			} else {
				adCount = parseInt($("[name=adNo2]").val())
				chCount = parseInt($("[name=cdNo2]").val())
			}
			// 요금 정보
			if (special == 0) {
				$target.next().find('td').eq(0).text("-")
				$target.next().find('td').eq(1).text("-")
				$target.nextAll().eq(1).find('strong').eq(0).text("-")
			} else {
				$target.next().find('td').eq(0).text(addCommas(special))
				$target.next().find('td').eq(1).text(addCommas(Math.floor(special/2)))
				$target.nextAll().eq(1).find('strong').eq(0).text(addCommas(adCount*special + chCount*Math.floor(special/2)))
			}
			$target.next().find('td').eq(2).text(addCommas(normal))
			$target.next().find('td').eq(3).text(addCommas(Math.floor(normal/2)))
			$target.nextAll().eq(1).find('strong').eq(1).text(addCommas(adCount*normal + chCount*Math.floor(normal/2)))
			
			// 인원 정보
			$target.nextAll().eq(1).find('span').eq(0).text(adCount)
			$target.nextAll().eq(1).find('span').eq(1).text(chCount)
			priceModal.show();
		})
		
		// sidebar 토글
		$('.btn-s').click(function(){
			let $side = $(this).parent().toggleClass('open');

			if($side.hasClass('open')) {
				$side.stop(true).animate({left:'0px'}, 200);
				$(this).children().attr('class', 'bi bi-caret-left-fill');
			}else{
				$side.stop(true).animate({left:'-204px'}, 200);
				$(this).children().attr('class', 'bi bi-caret-right-fill');
			};
		});
		
		// 좌석 4, 3 분할
		function seatDivide(no, stan) {
			let four = Math.floor(no/stan);
			let array = [];
			let s;
			for (var i=1; i<=stan; i++) {
				if ((four*i + (four+1)*(stan-i)) == no) {
					s = i; 
				}
			}
			for (var i=1; i<=s; i++ ) {
				array.push(four); 
			}
			
			for (var i=1; i<=(stan-s); i++) {
				array.push(four+1);
			}
			return array;
		}
		
		// 숫자 콤마 붙이기
		function addCommas(nStr) {
		    nStr += '';
		    x = nStr.split('.');
		    x1 = x[0];
		    x2 = x.length > 1 ? '.' + x[1] : '';
		    var rgx = /(\d+)(\d{3})/;
		    while (rgx.test(x1)) {
		        x1 = x1.replace(rgx, '$1' + ',' + '$2');
		    }
		    return x1 + x2;
		}
		
		// 기차의 스케줄, 번호에 해당하는 모든 좌석정보 불러오기
		function hochaInfo(type, trainNo, scheduleNo, stan, dp, ar) {
			let $hocha = $("#hocha").children('ul').empty()
			let $seat = $("#seatList").empty()
			
			$.ajax({type : 'GET', url : '/api/train/trainInfo',
				data : {roomType: type, trainNo: trainNo, schduleNo: scheduleNo},
				success : function(response) {
					let sort = 0;
					$.each(response.rooms, function(index, room) {
						let ho;
						// 호차 나열
						if (room.bookedSeatNum == room.seatNum) {
							ho = "<li><span class='not'>" + room.name + "</span></li>"
						} else {
							if (++sort == 1) {
								ho = "<li><span class='chosen' data-room-no='"+ room.no +"'>" + room.name + "</span></li>"
							} else {
								ho = "<li><span class='can' data-room-no='"+ room.no +"'>" + room.name + "</span></li>"
							}
						}
						let no = room.seatNum;
						let seatdiv = seatDivide(no, stan);
						let seatNo = 0;

						let seat;
						if (sort == 1) {
							seat = "<div data-seat-no='"+ room.no +"'>"
						} else {
							seat = "<div data-seat-no='"+ room.no +"' style='display:none'>"
						}
						// 좌석 분할  [10, 10, 10, 10]
						seatdiv.forEach(function(num, index) {
							seat += "<ul>"
							// 좌석 배치 (낱개)
							for (var i=1; i<= num; i++) {
								seat += "<li><span>" + ++seatNo +"</span></li>"										
							}
							seat += "</ul>"
							if (index == 1) {
								seat += "<ul class='m-4 justify-content-between align-items-center'><strong>" + dp 
								+ "</strong><i class='fas fa-long-arrow-alt-right fa-2x'></i><i class='fas fa-long-arrow-alt-right fa-2x'></i><i class='fas fa-long-arrow-alt-right fa-2x'></i><strong>" + 
								ar +"</strong></ul>"
							}
						})
						seat += "</div>"
							$seat.append(seat)	
						// 변화를 따로 빼서 준다.
						response.seatList.forEach(function(item) {
							let hoNo =item.roomNo;
							let seatNo = item.seatNo - 1
							$("div[data-seat-no="+hoNo+"] li span:eq("+seatNo+")").addClass('no')
						})
						$hocha.append(ho)
					})
				},
				error : function() {
					alert("로그인 후 이용하실 수 있습니다.")
					location.replace("http://localhost/user/login.nadri")
					return;
				}
			})
			seatModal.show()
		}
		
		// 모달창 생성
		var seatModal = new bootstrap.Modal(document.getElementById('modal-seat'), {
			keyboard: false
		});
		
		// 모달창이 꺼질때 실행되는 이벤트 // 선택한 좌석 정보 삭제 
		let handler = function () {
			 // 선택좌석 정보 삭제
			$(".chosenSeatList").find("span").remove()
			// input 태그 삭제
			let target = $('#modal-seat').attr('data-root-type')
			console.log("타겟 " + target)
			$("[data-schedule-no="+ target + "]").closest('tbody').find('input').remove()
		}
		
		let bookIngBtn;
		// 좌석 예매 버튼 클릭
		$(".listTable").on('click', '.btn', function(event) {
			event.preventDefault();
			
			bookIngBtn = $(this)
			let searchInfo = $(this).parent('td').siblings().filter(".infoTrain")
			let trainNo = searchInfo.next().text().trim()
			let scheduleNo = searchInfo.attr('data-schedule-no')
			$("#modal-seat").attr('data-root-type', scheduleNo)
			let $tbody = $(this).closest('tbody').attr('id')
			
			let now = new Date();
			let nowTarget = now.getFullYear() + "/" + (("00"+(now.getMonth()+1)).slice(-2)) + "/" + (("00"+now.getDate()).slice(-2))
			if ($tbody == 'schedule1' && $("[name=dpDate1]").val() == nowTarget) {
				let time = moment($(this).parent().prevAll().filter('.dpTime').contents()[1].textContent, 'hh:mm')
				if (moment('02:00', 'hh:mm').diff(time) >= 0) {
					time.add(1, 'days')
				}
				
				if (moment().diff(time, 'minutes') >= -20) {
					alert("열차출발 20분전에는 예약할 수 없습니다.")
					return;
				}
			}
			
			let arTime;
			let dpTime;
			if ($("[name=dpDate1]").val() == $("[name=dpDate2]").val()) {
				if ($("[name=schduleNo1]").val() != '' && $tbody == 'schedule2') {
					arTime = moment($("#arrow").next().children().eq(0).text(), 'hh:mm')
					if (moment('02:00', 'hh:mm').diff(arTime) >= 0) {
						arTime.add(1, 'days')
					}	
					dpTime = moment($(this).parent().prevAll().filter('.dpTime').contents()[1].textContent, 'hh:mm')
					if (dpTime.diff(arTime) <= 0) {
						$('#modal-seat').off('hidden.bs.modal', handler)
						alert("열차가 도착하기 전에 출발하실 수 없습니다.")
						return;
					} 
				} else if ($("[name=schduleNo2]").val() != '' && $(this).closest('tbody').attr('id') == 'schedule1') {
					arTime = moment($(this).parent().prevAll().filter('.arTime').contents()[1].textContent, 'hh:mm')
					dpTime = moment($("#arrow").prev().children().eq(4).text(), 'hh:mm')
					if (moment('02:00', 'hh:mm').diff(arTime) >= 0) {
						arTime.add(1, 'days')
					}	
					if (dpTime.diff(arTime) <= 0) {
						$('#modal-seat').off('hidden.bs.modal', handler)
						alert("열차가 도착하기 전에 출발하실 수 없습니다.")
						return;
					} 
				}
			}
			// 선택한 기차의 가격id
			if ($(this).hasClass('normal') || $(this).hasClass('special')) {
				let priceId = bookIngBtn.parent().attr('data-price-no')
				let price = bookIngBtn.parent().attr('data-price')
				$(this).closest('tbody').append("<input type='hidden' name='priceId" + $(this).closest('tbody').attr('id') + "' value='" + priceId + "'/>")
				$(this).closest('tbody').append("<input type='hidden' name='price" + $(this).closest('tbody').attr('id') + "' value='" + price + "'/>")
			}
			let dp = $(this).parent('td').prevAll().filter('.dpTime').contents()[0].textContent
			let ar = $(this).parent('td').prevAll().filter('.arTime').contents()[0].textContent

			let trainName = searchInfo.text().trim()
			
			$("#rootInfo").text(trainName + ' ' + trainNo + ' ').append("<strong class='mx-2 text-primary'>" + dp + ">" + ar + "</strong>행 일반실 좌석 정보")
			
			if ($(this).attr('class') == 'btn normal') {
				let type = '일반실'
				hochaInfo(type, trainNo, scheduleNo, 4, dp, ar) 
				
			} else if ($(this).attr('class') == 'btn special') {
				let type = '특실'
				hochaInfo(type, trainNo, scheduleNo, 3, dp, ar) 
			} else {
				alert("이미 열차를 선택하셨습니다.")
			}

		})

		// 선택 예약 버튼 클릭시
		$("#btn-booking").click(function() {
			// 모달창이 꺼질때 실행되는 이벤트처리 삭제 // 좌석 정보는 input에 이미 넣었으니 스케줄 번호 기차 번호 등등만 넣으면 된다.
			let scheduleNo = $(this).closest(".modal").attr('data-root-type')
			let sway = $("[data-schedule-no="+ scheduleNo + "]").closest('tbody').attr('id')
			let trainNo = $("#rootInfo").contents()[0].textContent.split(" ")
			let way = $("[name=way]:checked").val()
			let $sheduleInfo = $("[data-schedule-no="+ scheduleNo + "]").nextAll()
			
			let count = Math.floor($("td[data-schedule-no="+ scheduleNo + "]").closest('tbody').find('input').filter(index => index > 1).length/2)
			console.log(count)
			if (count <  $("input[name=count1]").val() &&  sway == 'schedule1') {
				alert("요청하신 승객수와 선택하신 좌석수가 일치하지 않습니다.")
				return;
			} else if (count <  $("input[name=count2]").val() &&  sway == 'schedule2') {
				alert("요청하신 승객수와 선택하신 좌석수가 일치하지 않습니다.")
				return;
			}

			$(".chosenSeatList").find("span").remove()
			
			if (way == '편도') {
				$("[name=schduleNo1]").val(scheduleNo)
				$("[name=trainNo1]").val(trainNo[1])
				console.log($('form').serialize())
				$("[name=schduleNo2]").prop('disabled', true)
				$("[name=trainNo2]").prop('disabled', true)
				// ajax로 보낸 뒤에 db에 저장후 예약 번호를 전달받아서 
				// controller로 예약번호와 함께 get방식으로 load하기
 				$.getJSON('/api/train/reservation', $('form').serialize(),
						function(response) {
							if (response.status == 'OK') {
								console.log(response.items)
								location.replace("http://localhost/train/confirmReservation.nadri?reservedNo1=" + response.items[0])
							} else {
								alert(response.error)
								location.reload();
							}
				})
			}
			let $span = $(".btn-s + div").find('span')
			// 왕복
			if ($span.eq(0).text() == '') {
				$span.eq(0).text($sheduleInfo.filter(".dpTime").contents()[1].textContent)
				$span.eq(1).text($sheduleInfo.filter(".dpTime").contents()[0].textContent)
				$("#arrow").show()
				$span.eq(2).text($sheduleInfo.filter(".arTime").contents()[1].textContent)
				$span.eq(3).text($sheduleInfo.filter(".arTime").contents()[0].textContent)
				$span.eq(4).text($("#rootInfo").contents()[0].textContent)
				
				bookIngBtn.text('접수').closest('tbody').find('.btn').each(function(index, element) {
					$(this).attr('class', 'btn btn-sm btn-no')
				})
				if (sway == 'schedule1') {
					$("#btn1").children().prop('disabled', true);
					$("[name=schduleNo1]").val(scheduleNo)
					$("[name=trainNo1]").val(trainNo[1])
					
				} else {
					$("#btn2").children().prop('disabled', true);
					$("[name=schduleNo2]").val(scheduleNo)
					$("[name=trainNo2]").val(trainNo[1])
				}
				
			} else {
				if (sway == 'schedule1') {
					$("[name=schduleNo1]").val(scheduleNo)
					$("[name=trainNo1]").val(trainNo[1])
				} else {
					$("[name=schduleNo2]").val(scheduleNo)
					$("[name=trainNo2]").val(trainNo[1])
				}
				$.getJSON('/api/train/reservation', $('form').serialize(),
						function(response) {
							if (response.status == 'OK') {
								location.replace("http://localhost/train/confirmReservation.nadri?reservedNo1=" + response.items[0] + "&reservedNo2=" + response.items[1])
							} else {
								alert(response.error)
								location.reload();
							}
				})
			}
 			$('#modal-seat').off('hidden.bs.modal', handler)
			seatModal.hide()
			$('#modal-seat').on('hidden.bs.modal', handler)
			
		})
		
		// 모달창이 꺼질때 실행되는 이벤트
		$('#modal-seat').on('hidden.bs.modal', handler)
		
		// 선택 횟수만 조율하면 된다. 각각의 tbody의 id의 input의 개수의 /2 개가 count1,2 수 보다 크면 안된다.
		// 좌석을 클릭했을 때 
		$("#seatList").on('click', 'span', function(event) {
			event.preventDefault();
			// 가는 열차 or 오는 열차 좌석이냐 구분해주기
			let putNo = $(this).closest('.modal').attr('data-root-type')
			let target = $("td[data-schedule-no="+ putNo + "]").closest('tbody').attr('id')
			let inputNo;
			let inputRoomNo;
			let maxCount;
			if (target == 'schedule1') {
				inputNo = "<input type='hidden' name='seatNo1'"
				inputRoomNo = "<input type='hidden' name='roomNo1'"
				maxCount = $("[name=count1]").val()
			} else {
				inputNo = "<input type='hidden' name='seatNo2'"
				inputRoomNo = "<input type='hidden' name='roomNo2'"
				maxCount = $("[name=count2]").val()
			}
			
			let count = Math.floor($("td[data-schedule-no="+ putNo + "]").closest('tbody').find('input').filter(index => index > 1).length/2)
			// 예약되지 않은 좌석 클릭시
			if (!$(this).hasClass("no") && !$(this).hasClass("chosen")) {
				// 클릭횟수 제어
				if (count == maxCount) {
					alert(maxCount + "명 이상 선택할 수 없습니다.")
					return;
				}
				$(this).attr("class", "chosen")
				inputNo += " value=" + $(this).text() + " />"
				inputRoomNo += " value=" + $(this).closest('div').attr('data-seat-no') + " />"
				$("#"+ target).append(inputNo).append(inputRoomNo)
				
				//모달창 선택 좌석 표시
				$(".chosenSeatList").append("<span class='seatlist px-1'>" + $(this).text() +"번</span>")
			} else if ($(this).hasClass("chosen")) {
				
				
				$(this).removeClass("chosen")
				$("[value=" + $(this).text() + "]").next().remove()
				$("[value=" + $(this).text() + "]").remove()
				$(".chosenSeatList").find("span:contains('" + $(this).text() + "')").remove()
			}
		});
		
		// 좌석 모달창에서 호차를 클릭할 때 // 호차에 해당하는 좌석이 뜬다. 다른 좌석 정보는 숨겨짐
		$("#hocha").on('click', 'span.can', function(event) {
			event.preventDefault();
			$("#hocha span.chosen").removeClass("chosen").addClass("can")
			$(this).removeClass("can").addClass("chosen")
			$("#seatList").find('.chosen').removeClass("chosen").addClass("can")
			
			let no = $(this).attr('data-room-no')
			$("#seatList div").hide().filter("[data-seat-no="+ no +"]").show()
			// 다른 호차 선택시 클릭 한거 초기화
			$(".chosenSeatList").find("span").remove()
			let target = $(this).closest('.modal').attr('data-root-type')
			$("[data-schedule-no="+ target + "]").closest('tbody').find('input').filter(index => index > 1).remove()
		})
		
		// 가는열차 다음, 이전 버튼 페이지네이션
		$("#btn1").children().click(function() {
			console.log($(this))
			let $btn = $(this) 
			let dpStation = $("input[name=departureStation]").val();
			let arStation = $("input[name=arrivalStation]").val();
			let rowNo;
			if ($btn.attr('id') == 'next1') {
				rowNo = parseInt($("input[name=rowNo1]").val()) + 1;
			} else {
				 rowNo = parseInt($("input[name=rowNo1]").val()) - 1;
			}
			
			let dpDate = $("input[name=dpDate1]").val()
			let dpTime = $("select[name=dpTime1]").val()
			$.getJSON("/api/train/schedule", 
					{departureStation:dpStation, arrivalStation:arStation, rowNo1:rowNo, dpDate1:dpDate, dpTime1:dpTime}, 
					function(response) {
						if (response.status == 'OK') {
							$("#schedule1").children().remove()
							$btn.siblings().prop('disabled', false)
							$.each(response.items, function(index, schedule) {
								let sh = "<tr>"
									sh += "<td>직통</td>"
									sh += "<td class='infoTrain' data-schedule-no='"+ schedule.scheduleNo +"'>" + schedule.trainName
									sh += "</td>"
									sh += "<td>" + schedule.trainNo + "</td>"
									sh += "<td class='dpTime'>${searchForm.departureStation}<div>" + schedule.departureTime + "</div></td>"
									sh += "<td class='arTime'>${searchForm.arrivalStation}<div>" + schedule.arrivalTime + "</div></td>"
									sh += "<td data-price-no='"+ schedule.specialPriceId +"' data-price='" + schedule.specialPrice + "'>"
								if (schedule.specialSeat == 0) {
								} else if (schedule.specialBooking == schedule.specialSeat) {
									sh += "<button class='btn btn-secondary btn-sm' type='button' disabled='disabled'>매진</button>"
								} else (
									sh += "<button class='btn special' type='button' >예매</button>"
								)
									sh += "</td>"
									sh += "<td data-price-no='"+ schedule.normalPriceId +"' data-price='" + schedule.normalPrice + "' >"
								if (schedule.normalSeat == 0) {
								} else if (schedule.normalBooking == schedule.normalSeat) {
									sh += "<button class='btn btn-secondary btn-sm' type='button' disabled='disabled'>매진</button>"
								} else (
									sh += "<button class='btn normal' type='button' >예매</button>"
								)
									sh += "</td>"
									sh += "<td class='runTime'>" + schedule.diffTime + "</td>"
									sh += "<td><button class='btn-look-price' type='button'>보기</button></td>"
									sh += "</tr>"
								$("#schedule1").append(sh)
							})
							$("input[name=rowNo1]").val(rowNo)
						} else  {
							$btn.prop('disabled', true)
						}
			})
		});
		
		// 오는 열차 다음, 이전 버튼 페이지네이션
		$("#btn2").on('click', 'button', function() {
			let $btn = $(this) 
			let dpStation = $("input[name=arrivalStation]").val();
			let arStation = $("input[name=departureStation]").val();
			let rowNo;
			if ($btn.attr('id') == 'next2') {
				rowNo = parseInt($("input[name=rowNo2]").val()) + 1;
			} else {
				 rowNo = parseInt($("input[name=rowNo2]").val()) - 1;
			}
			
			let dpDate = $("input[name=dpDate2]").val()
			let dpTime = $("select[name=dpTime2]").val()
			$.getJSON('/api/train/schedule', 
					{departureStation:dpStation, arrivalStation:arStation, rowNo1:rowNo, dpDate1:dpDate, dpTime1:dpTime}, 
					function(response) {
						if (response.status == 'OK') {
							$("#schedule2").children().remove()
							$btn.siblings().prop('disabled', false)
							$.each(response.items, function(index, schedule) {
								let sh = "<tr>"
									sh += "<td>직통</td>"
									sh += "<td class='infoTrain' data-schedule-no='"+ schedule.scheduleNo +"'>" + schedule.trainName
									sh += "</td>"
									sh += "<td>" + schedule.trainNo + "</td>"
									sh += "<td class='dpTime'>${searchForm.arrivalStation}<div>" + schedule.departureTime + "</div></td>"
									sh += "<td class='arTime'>${searchForm.departureStation}<div>" + schedule.arrivalTime + "</div></td>"
									sh += "<td data-price-no='"+ schedule.specialPriceId +"' data-price='" + schedule.specialPrice + "'>"
								if (schedule.specialSeat == 0) {
								} else if (schedule.specialBooking == schedule.specialSeat) {
									sh += "<button class='btn btn-secondary btn-sm' type='button' disabled='disabled'>매진</button>"
								} else (
									sh += "<button class='btn special' type='button'>예매</button>"
								)
									sh += "</td>"
									sh += "<td data-price-no='"+ schedule.normalPriceId +"' data-price='" + schedule.normalPrice + "'>"
								if (schedule.normalSeat == 0) {
								} else 	if (schedule.normalBooking == schedule.normalSeat) {
									sh += "<button class='btn btn-secondary btn-sm' type='button' disabled='disabled'>매진</button>"
								} else (
									sh += "<button class='btn normal' type='button'>예매</button>"
								)
									sh += "</td>"
									sh += "<td class='runTime'>" + schedule.diffTime + "</td>"
									sh += "<td><button class='btn-look-price' type='button'>보기</button></td>"
									sh += "</tr>"
								$("#schedule2").append(sh)
							})
							$("input[name=rowNo2]").val(rowNo)
						} else  {
							$btn.prop('disabled', true)
						}
			})
		});
		
		$("#search").click(function() {
			let valid = true;
			if ($("[name=departureStation]").val().trim() == '') {
				alert("출발역을 입력해주세요.")
				valid = false;
				return;
			} else if ($("[name=arrivalStation]").val().trim() == '') {
				alert("도착역을 입력해주세요.")
				valid = false;
				return;
			} 
			
			if ($("[name=count1]").val() == 0) {
				$("[name=count1]").val(1)
				$("[name=adNo1]").val(1)
			}
			if ($("[name=count2]").val() == 0) {
				$("[name=count2]").val(1)
				$("[name=adNo2]").val(1)
			}
			
			let goDate = new Date($("[name=dpDate1]").val())
			let comeDate = new Date($("[name=dpDate2]").val())
			
			if ($("[name=way]:checked").val() == '왕복') {
				if (goDate > comeDate) {
					alert("복편을 왕편보다이전 일자로 선택하셨습니다. 일정을 다시 한번 선택하여 주십시오.")
					valid = false;
				}
			}
			if (valid) {
				$("#trainSearch").submit()
			}
		})
		
	});
	
</script>
</body>
</html>