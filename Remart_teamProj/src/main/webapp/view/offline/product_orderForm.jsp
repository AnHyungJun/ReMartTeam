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
<title>REMART</title>

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
							minDate : +3
						});
	});

	function openOfflineSearch(userinput) {
		url = "offlineSearch";

		open(url, "offlineSearch",
				"toolbar = no,location=no, status= no, menubar = no,"
						+ "resizable=no, width = 400, height = 600");
	}
	function remove_this() {

		if (!confirm("삭제하시겠습니까?"))
			return;

		var lo_this = window.event.srcElement; // 이벤트가 발생한 객체가져 옴 여기선 버튼 이겠지?
		var lo_table = lo_this.parentNode.parentNode.parentNode //버튼으로 부터 위로 4번째 객체는 테이블이지 
		var li_row_index = lo_this.parentNode.parentNode.rowIndex; // 버튼으로 부터 위로 2번째니깐 TR 이겠지 그 TR 의 INDEX 값
		lo_table.deleteRow(li_row_index); // 위에서 찾은 인덱스에 해당하는 TR 을 삭제하라...

		sumsum();
	}

	function up(rowlen) {
		var id_q = rowlen + "q";
		var id_p = rowlen + "p";

		document.getElementById(id_p).value = parseInt(document
				.getElementById(id_p).value)
				/ document.getElementById(id_q).value;
		document.getElementById(id_q).value = parseInt(document
				.getElementById(id_q).value) + 1;
		document.getElementById(id_p).value = parseInt(document
				.getElementById(id_p).value)
				* parseInt(document.getElementById(id_q).value);
		sumsum();
	}

	function down(rowlen) {
		var id_q = rowlen + "q";
		var id_p = rowlen + "p";

		if (parseInt(document.getElementById(id_q).value) != 1) {
			document.getElementById(id_p).value = parseInt(document
					.getElementById(id_p).value)
					/ document.getElementById(id_q).value;
			document.getElementById(id_q).value = parseInt(document
					.getElementById(id_q).value) - 1;
			document.getElementById(id_p).value = parseInt(document
					.getElementById(id_p).value)
					* parseInt(document.getElementById(id_q).value);
			sumsum();
		}
	}

	function sumsum() {
		var ps = 0;
		var qs = 0;

		$('input:text[name="price"]').each(function() {
			ps = parseInt(ps) + parseInt(this.value);

		});
		$('input:text[name="qty"]').each(function() {
			qs = parseInt(qs) + parseInt(this.value);

		});

		document.getElementById('priceSum').value = ps;
		document.getElementById('qtySum').value = qs;

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

					<div class="w3-col w3-right" style="width: 40%;">
						<div class="w3-bar w3-right-align">
							<p style="font-size: 13px;">${offlineInfo.offline_mart_id }님
								&nbsp;&nbsp;&nbsp;</p>
							<a href="<%=request.getContextPath()%>/offline/loginOut"
								style="font-size: 13px;"
								class="w3-bar-item w3-right w3-button w3-white w3-hover-light-grey"><i
								class="fa fa-sign-out"></i> 로그아웃</a>
						</div>
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

				<form method="post" name="product_orderForm"
					action="<%=request.getContextPath()%>/offline/product_orderPro">

					<input type="hidden" name="offline_mart_id"
						value="${offlineInfo.offline_mart_id }">

					<div class="w3-col" style="width: 60%; font-size: 13px;">
						<br>
						<h6><b>발주계획 입력</b></h6>
						<br>입고 일자 <input type="text"
							id="testDatepicker" name="or_date_before"> <br> <br>
						입고 장소 <input type="text" id="location"
							value="${offlineInfo.location }"> <br> <br>
							<input type="button"
							class="w3-button w3-white w3-hover-white" style="font-size: 13px; vertical-align: middle;"
							name="search" value="찾기" onclick="openOfflineSearch(this.form)">
						<br> <br>
						<table class="w3-table w3-bordered w3-centered"
							id="offlineSearchTable">
							<tr>
								<th style="width: 50px;">NO</th>
								<th style="width: 100px;">상품코드</th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
								<th style="width: 100px;">삭제</th>
							</tr>
						</table>
						<br> <br> <br> <br> <br>
						<div style="float: right">
							수량 <input type="text" id="qtySum" value="0" name="qtySum"> <br> <br>
							가격 <input type="text" id="priceSum" value="0" name="priceSum">
						</div>
						<br> <br> <br> <br> <br> <br> <br>
						<button style="float: right; font-size: 13px;"
							class="w3-button w3-black w3-hover-red">주문하기</button>
						<br> <br> <br> <br>
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