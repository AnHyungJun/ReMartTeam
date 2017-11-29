<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>REMART OFFLINE</title>

</head>

<script>
$(function() {
	  $( "#testDatepicker" ).datepicker({
	        showOn: "both", 
	        buttonImage: "<%=request.getContextPath()%>/images/icon/calendar.png",
							buttonImageOnly : true,
							showButtonPanel : true,
							closeText : '닫기',
							dateFormat : "yy-mm-dd",
							maxDate : -1
						});
	});
$(function() {
	  $( "#testDatepicker2" ).datepicker({
	        showOn: "both", 
	        buttonImage: "<%=request.getContextPath()%>/images/icon/calendar.png",
							buttonImageOnly : true,
							showButtonPanel : true,
							closeText : '닫기',
							dateFormat : "yy-mm-dd",
							maxDate : 0
						}
	  );
	  
	}
	);
	
function dataCheck(userinput){
	
	var todayAtMidn = new Date(document.getElementById('testDatepicker').value);

	// Set specificDate to a specified date at midnight.
	var specificDate = new Date(userinput);

	// Compare the two dates by comparing the millisecond
	// representations.
	if (todayAtMidn.getTime() > specificDate.getTime())
	{
	    alert("날짜를 잘못 선택하셨습니다.");
	    document.getElementById('testDatepicker2').value = "";
	}


}

function detail(userinput) {
	url = "detail?mart_order_id="+userinput;

	open(url, "detail",
			"toolbar = no,location=no, status= no, menubar = no,"
					+ "resizable=no, width = 600, height = 500");
}
	
</script>

<body>
	<div class="w3-top w3-white">
		<div class="w3-bar w3-border-bottom w3-center-align w3-large"
			style="height: 135px;">
			<div class="w3-row">
				<div class="w3-col" style="width: 20%">
					<p>&nbsp;</p>
				</div>

				<div class="w3-col w3-container" style="width: 60%">
					<br>
					<div class="w3-col" style="width: 20%">

						<img style="text-align: left" alt="로고"
							src="<%=request.getContextPath()%>/images/icon/logo.png"
							width="100px">
					</div>

				</div>
				<div class="w3-col" style="width: 20%">
					<p>&nbsp;</p>
				</div>
			</div>
		</div>

		<div class="w3-bar w3-border-bottom w3-center-align w3-large">
			<div class="w3-row">
				<div class="w3-col" style="width: 20%">
					<p>&nbsp;</p>
				</div>

				<form method="post" name="order_statusForm"
					action="<%=request.getContextPath()%>/offline/order_status">

					<input type="hidden" name="offline_mart_id"
						value="${offlineInfo.offline_mart_id }">

					<div class="w3-col" style="width: 60%; font-size: 13px;">
						<br>
						<h6><b>발주현황</b></h6>
						<br>날짜 검색 <br>
						<input type="text" id="testDatepicker" name="date1"> 
						-
						<input type="text" id="testDatepicker2" name="date2" onchange="dataCheck(this.value)"> 
						<input type="submit"
							class="w3-button w3-white w3-hover-white" style="font-size: 13px; vertical-align: middle;"
							name="search" value="검색">
						
						<br> <br>
						<table class="w3-table w3-bordered w3-centered"
							id="offlineSearchTable">
							<tr>
								<th style="width: 100px;">주문 번호</th>
								<th style="width: 100px;">주문 날짜</th>
								<th style="width: 150px;">입고 예상 날짜</th>
								<th style="width: 100px;">상태</th>
								<th style="width: 100px;">상세보기</th>
							</tr>
							<c:forEach  var="mart_order"  items="${mart_orderList}">  
							<tr>
								<td>${mart_order.mart_order_id}</td>
								<td>${mart_order.re_date }</td>
								<td>${mart_order.or_date }</td>
								<c:choose>
									<c:when test="${mart_order.status == 'order'}">
										<td>발주 완료</td>
      								 </c:when>
      								 <c:when test="${mart_order.status == 'ready'}">
										<td>배송 준비 중</td>
      								 </c:when>
      								 <c:when test="${mart_order.status == 'ing'}">
										<td>배송 중</td>
      								 </c:when>
      								 <c:when test="${mart_order.status == 'end'}">
										<td>
										배송 완료
										<a href="confirm?mart_order_id=${mart_order.mart_order_id }">확인</a>
										</td>
      								 </c:when>
      								 <c:when test="${mart_order.status == 'finish'}">
										<td>확인 완료</td>
      								 </c:when>
								</c:choose>
								
								<td>
								<input type="button"
							class="w3-bar-item w3-button w3-white w3-hover-light-grey" style="font-size: 12px;"
							name="order_status" value="상세보기" OnClick="detail(${mart_order.mart_order_id})">
								</td>
							</tr>
							</c:forEach>
						</table>
						<div style="margin-top: 100px"></div>
					</div>
				</form>

				<div class="w3-col" style="width: 20%">
					<p>&nbsp;</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>