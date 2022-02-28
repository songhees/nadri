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
</head>
<style>
	#table-refund td, #table-refund th{
		border: 1px solid #C0C0C0;
		height: 50px;
	}
	#table-refund th {
		border: 1px solid #C0C0C0;
		height: 35px;
		background-color: #F2F2F2;
	}
	
	#table-refund {
		text-align: center;
		width: 100%;
	}
	
	.btn {
		width: 100px;
		border-radius: 0;
		text-align-last: center;
		font-size: .875rem;
		padding: initial;
		font-weight: bold;
		height: 35px;
	}
	
	#refundInfo th, #refundInfo td{
		border-bottom: 1px solid #C0C0C0;
		border-top: 1px solid #C0C0C0;
	}
	#refundInfo th {
		width: 45%;
		background-color: #F2F2F2;
		border-right: 1px solid #C0C0C0;
	}
	
	#refundInfo {
		text-align: center;
		width: 50%;
		height: 90px;
	}
	
		#modal-refund ul{
		padding: 13px 50px;
		margin: 11px 24px;
		border: 1px solid lightgray;
		color: #404040;
	}
	
	#modal-refund tr {
		border: 1px solid lightgray;
		border-left: 0;
		border-right: 0;
		height: 39px;
	}
	#modal-refund th {
		border-right: 1px solid lightgray;
		width: 150px;
		background-color: aliceblue;
	}
	#modal-refund td {
		text-align: start;
		padding-left: 30px;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col">
			<h2>반환수수료</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="menu8" value="payment"/>
	<c:set var="active" value="menu8"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul id="explanation">
			<li>
				'${sessionScope.LOGIN_USER.name }' 고객님의 반환 수수료 내역입니다.
			</li>
			<li class="mt-2">
				수수료 내역을 확인하신 후 반환버튼을 눌러주세요.
			</li>
		</ul>
	</div>
	<div class="row">
		<div class="col">
			<table class="" id="table-refund">
				<thead>
					<tr>
						<th>탑승날짜</th>
						<th>열차정보</th>
						<th>출발역</th>
						<th>도착역</th>
						<th>출발시간</th>
						<th>도착시간</th>
						<th>승객 유형</th>
						<th>운임비</th>
					</tr>
				</thead>
				<tbody data-reservationNo="${reservation.no }">
					<c:forEach var="ticket" items="${ticketList }">
					<tr>
						<td data-ticketNo="${ticket.no }"><fmt:formatDate value="${reservation.departureTime }" pattern="yyyy-MM-dd"/></td>
						<td>${reservation.trainName } - ${reservation.trainNo }</td>
						<td>${reservation.departureStation }</td>
						<td>${reservation.arrivalStation }</td>
						<td><fmt:formatDate value="${reservation.departureTime }" pattern="HH:mm"/></td>
						<td><fmt:formatDate value="${reservation.arrivalTime }" pattern="HH:mm"/></td>
						<td>${ticket.type }</td>
						<td><fmt:formatNumber value="${ticket.price }" pattern="##,###"/>원</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row" style="margin-top: 60px; margin-bottom: 120px;">
		<div class="col">
			<table id="refundInfo">
				<tbody>
					<tr>
						<th>반환 수수료</th>
						<td data-refundRate="${refundRate }"><fmt:formatNumber value="${refundRate }" pattern="##,###"/></td>
					</tr>
					<tr>
						<th>반환 금액</th>
						<td data-refundPrice="${refundPrice }"><fmt:formatNumber value="${refundPrice }" pattern="##,###"/></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col text-end">
			<button class="btn btn-dark" id="btn-refund" type="button">반환요청</button>
		</div>
	</div>
	<div class="modal" tabindex="-1" data-bs-backdrop="static" id="modal-refund" style="border: 1px solid #D8E5F6;">
 		<div class="modal-dialog modal-dialog-centered modal-lg" style="justify-content: center; width: 580px;">
	   		<div class="modal-content" style="background-color: #7C97B9; height: 364px;">
	    		<div class="modal-body pt-2">
	    			<div style="display: flex; justify-content: space-between;">
		       			<h6 class="modal-title mb-2 fw-bold" style="color: white;">반환 확인</h6>
	    	   			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
		    		</div>
    				<div style="background-color: white; height: 303px;">
    					<div class="mx-4 pt-3" id="refund-info">
    						<strong>승차권 정보 : <span></span></strong>
    					</div>
    					<div>
    						<ul>
    							<li>
									승차권 반환을 성공했습니다.    							
    							</li>
    							<li class="mt-2">
		    						'${sessionScope.LOGIN_USER.name }'님의 반환 내역입니다.
    							</li> 
    						</ul>
    					</div>
	    				<div class="" style="margin: 25px;">
	    					<table style="margin: 0; width: 100%; text-align: center; ">
	    						<tbody>
	    							<tr>
	    								<th>영수금액</th>
	    								<td></td>
	    							</tr>
	    							<tr>
	    								<th>반환수수료</th>
	    								<td></td>
	    							</tr>
	    							<tr>
	    								<th>취소일자</th>
	    								<td></td>
	    							</tr>
	    						</tbody>
	    					</table>
	    				</div>
	    			</div>
				</div>
   			</div>
 		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">
	var time = setTimeout(function () { location.reload(); }, 60 * 1000);
	
	$(function() {
		
		
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
		
		var refundModal = new bootstrap.Modal(document.getElementById('modal-refund'), {
			keyboard: false
		});
		
		$("#btn-refund").click(function() {
			
			let refund = confirm("반환하시겠습니까??")
			let refundRate = $("[data-refundRate]").attr("data-refundRate")
			let refundPrice = $("[data-refundPrice]").attr("data-refundPrice")
			let reservationNo = $("[data-reservationNo]").attr("data-reservationNo")
			/*  
				{refundRate:refundRate, refundPrice:refundPrice, ticketList:[]}
			*/
			let ticketList = new Array();
			$("[data-ticketNo]").each(function(index, element) {
				console.log($(this).attr("data-ticketNo"))
				ticketList.push($(this).attr("data-ticketNo"))
			})
			let result = {refundRate, refundPrice, ticketList}
			let jsonData = JSON.stringify(result)
			if (refund) {
				clearTimeout(time);
	 			$.ajax({
	 				type:'PUT',
	 				contentType:"application/json",
	 				url:'/api/train/refundKakao/' + reservationNo,
	 				data:jsonData,
	 				dataType:"json",
					success:function(response) {
						console.log(response)
						$("#refund-info").find('span').text(response.item_name)
						$("#modal-refund").find('td').eq(0).text(addCommas(refundPrice))
						$("#modal-refund").find('td').eq(1).text(addCommas(refundRate))
						var now = moment(response.canceled_at);
						$("#modal-refund").find('td').eq(2).text(now.format("YYYY-MM-DD HH:mm"))
						refundModal.show()
					},
					error:function(response) {
						alert(response.error)
					}
	 			}) 
			}
		})
		
		$("[aria-label=Close]").click(function() {
			location.replace("http://localhost/train/reservationList.nadri")
		})		
		
	})
		
</script>
</html>