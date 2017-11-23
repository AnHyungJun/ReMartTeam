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
<title>Insert title here</title>

</head>

<script>
$(function() {
	  $( "#testDatepicker" ).datepicker({
	        showOn: "both", 
	        buttonImage: "<%=request.getContextPath()%>/images/icon/calendar.png",
							buttonImageOnly : true,
							showButtonPanel : true,
							closeText : '닫기',
							dateFormat : "yymmdd",
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


	document.getElementById(id_p).value = parseInt(document.getElementById(id_p).value) / document.getElementById(id_q).value;
	document.getElementById(id_q).value = parseInt(document.getElementById(id_q).value) + 1;
	document.getElementById(id_p).value = parseInt(document.getElementById(id_p).value) * parseInt(document.getElementById(id_q).value);
	sumsum();
}

function down(rowlen) {
	var id_q = rowlen + "q";
	var id_p = rowlen + "p";
	
	if(parseInt(document.getElementById(id_q).value)!= 1){
		document.getElementById(id_p).value = parseInt(document.getElementById(id_p).value) / document.getElementById(id_q).value;
		document.getElementById(id_q).value = parseInt(document.getElementById(id_q).value) - 1;
		document.getElementById(id_p).value = parseInt(document.getElementById(id_p).value) * parseInt(document.getElementById(id_q).value);
		sumsum();
	}
}

function sumsum(){
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
					<div style="float: left">

						<img style="text-align: left" alt="로고"
							src="<%=request.getContextPath()%>/images/icon/logo.png"
							width="100px">
					</div>
					<div style="float: right">
						<p style="float: left">${offlineInfo.offline_mart_id }님
							&nbsp;&nbsp;</p>
						<a href="<%=request.getContextPath()%>/offline/loginOut"
							style="float: left" class="w3-bar-item w3-button w3-white "><i
							class="fa fa-sign-out"></i> 로그아웃</a>

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
					action="<%=request.getContextPath() %>/offline/product_orderPro">



					<div class="w3-col" style="width: 60%">
						<br> 발주계획입력> <br> <br> <br> 입고 일자 <input
							type="text" id="testDatepicker"> <br> <br> 입고 될
						곳 <input type="text" id="location"
							value="${offlineInfo.location }"> <br> <br>

						<button onclick="openOfflineSearch(this.form)" name="search"
							class="w3-button" type="button">찾기</button>

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
						<br>
						<br>
						<div style="float: right">
							수량 합: <input type="text" id="qtySum" value="0" name="qtySum">
							가격 합: <input type="text" id="priceSum" value="0" name="priceSum">
						</div>
						<br> <br>
						<button style="float: right;" class="w3-button">주문하기</button>
						<br> <br>
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