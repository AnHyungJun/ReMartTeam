<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajax/httpRequest.js">
</script>
<script type="text/javascript">
	function startSuggest(){
		var keyword = document.getElementById('userName').value;
		document.getElementById('userPhone').value = keyword;
		if(keyword == ''){
			alert("고객님의 핸드폰 번호를 입력해주세요");
		}else{
			var params = "keyword=" + encodeURIComponent(keyword);
			sendRequest("<%=request.getContextPath()%>/common/suggestFileUserSearch.jsp", params, displayResult, 'POST');
		}
	}
	
	function displayResult(){
		if(httpRequest.readyState == 4) {
	         if(httpRequest.status == 200) {
	            var resText = httpRequest.responseText;
	            var res =  resText.split(',');
	            
	            document.getElementById('userName').value = res[0];
	            document.getElementById('userPoint').value = res[1];
	         } else {
	            alert("에러: " + httpRequest.status);
	         }
	      }
	}
	
	function startSuggest2(){
		var keyword = document.getElementById('productCode').value;
		
		if(keyword == ''){
			alert("상품코드를 입력해주세요");
		}else{
			var params = "keyword=" + encodeURIComponent(keyword);
			sendRequest("<%=request.getContextPath()%>/common/suggestFileCodeSearch.jsp",
					params, displayResult2, 'POST');
		}
	}

	function displayResult2() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var resText = httpRequest.responseText;
				var res = resText.split(',');

				var table = document.getElementById('posTable');
				var rowlen = table.rows.length;
				var row = table.insertRow(rowlen);

				if (parseInt(res[3]) > 0) {
					row.insertCell(0).innerHTML = "<input class='w3-input' type='text' name = 'product_id' value = '"+res[0]+"'>";
					row.insertCell(1).innerHTML = "<input class='w3-input' type='text' name = 'name' value = '"+res[1]+"'>";
					row.insertCell(2).innerHTML = "<input type='text' size='2' name = 'qty' value = '1' id='"
							+ res[0].replace(/(^\s*)|(\s*$)/g, "")
							+ "q'>"
							+ "<button onclick=\"up("
							+ res[0]
							+ ")\" class=\"w3-button w3-white \" type=\"button\">▲</button>"
							+ "<button onclick=\"down("
							+ res[0]
							+ ")\" class=\"w3-button w3-white \" type=\"button\">▼</button>";
					row.insertCell(3).innerHTML = "<input class='w3-input' type='text' name = 'priceFit' value = '"+res[2]+"' >";
					row.insertCell(4).innerHTML = "<input class='w3-input' type='text' name = 'price' value = '"
							+ res[2]
							+ "'  id='"
							+ res[0].replace(/(^\s*)|(\s*$)/g, "") + "p'>";
					row.insertCell(5).innerHTML = "<input class='w3-input' type='text' name = 'rest' value = '"
							+ res[3]
							+ "' id='"
							+ res[0].replace(/(^\s*)|(\s*$)/g, "") + "r'>";
					row.insertCell(6).innerHTML = "<button onclick=\"remove_this()\" class=\"w3-button w3-border w3-round-xlarge\" type=\"button\">삭제</button>";

					sumsum();
				} else {
					alert("재고가 없거나 없는 상품입니다.");

				}
				document.getElementById('productCode').value = "";
			} else {
				alert("에러: " + httpRequest.status);
			}
		}
	}
	function remove_this() {

		if (!confirm("삭제하시겠습니까?"))
			return;

		var lo_this = window.event.srcElement;
		var lo_table = lo_this.parentNode.parentNode.parentNode
		var li_row_index = lo_this.parentNode.parentNode.rowIndex;
		lo_table.deleteRow(li_row_index);

		sumsum();
	}

	function up(rowlen) {
		var id_q = rowlen + "q";
		var id_p = rowlen + "p";
		var id_r = rowlen + "r";

		if (parseInt(document.getElementById(id_q).value) < parseInt(document
				.getElementById(id_r).value)) {
			document.getElementById(id_p).value = parseInt(document
					.getElementById(id_p).value)
					/ document.getElementById(id_q).value;
			document.getElementById(id_q).value = parseInt(document
					.getElementById(id_q).value) + 1;
			document.getElementById(id_p).value = parseInt(document
					.getElementById(id_p).value)
					* parseInt(document.getElementById(id_q).value);
		}
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

		$('input:text[name="price"]').each(function() {
			ps = parseInt(ps) + parseInt(this.value);

		});

		document.getElementById('priceSum').value = ps;

	}
	function usePoint() {
		document.getElementById('pointUse').value = "Y";
		document.getElementById('priceSum').value = parseInt(document
				.getElementById('priceSum').value)
				- parseInt(document.getElementById('userPoint').value);
		document.getElementById('userPoint').value = "0";
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
						<br> <a href="<%=request.getContextPath()%>/offline/loginOut"
							style="font-size: 12px;"
							class="w3-bar-item w3-right w3-button w3-white w3-hover-light-grey"><i
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

				<div class="w3-col" style="width: 60%">
					<br> <br> <input type="text" id="productCode"
						placeholder="상품 코드 입력"
						style="font-size: 13px; vertical-align: middle;"> <input
						type="button" class="w3-button w3-white w3-hover-white w3-padding-small"
						style="font-size: 13px; vertical-align: middle;"
						onclick="startSuggest2()" value="찾기">
					<div style="margin-bottom: 50px;"></div>
					<form action="salePro" method="post">
						<div style="height: 400px;">
							<table style="float: left; font-size: 13px;" id="posTable">
								<tr>
									<th style="width: 50px">바코드</th>
									<th style="width: 150px">상품명</th>
									<th style="width: 150px">수량</th>
									<th style="width: 150px">단가</th>
									<th style="width: 150px">금액</th>
									<th style="width: 50px">재고</th>
									<th style="width: 50px">삭제</th>
								<tr>
							</table>

							<div style="float: right">
								<button class="w3-button w3-black w3-hover-red"
									style="width: 90px; font-size: 13px;">결제진행</button>
								<br> <br>
							</div>
						</div>
						<div style="font-size: 13px;">
							고객명 : <input type="text" id="userName" placeholder="고객 전화번호 입력"
								style="font-size: 13px;"><input type="button"
								onclick="startSuggest()" value="조회"
								class="w3-button w3-white w3-hover-white w3-padding-small"
								style="font-size: 13px; vertical-align: middle;"> Point : <input type="text"
								id="userPoint" style="font-size: 13px;"><input
								type="button" value="사용" onclick="usePoint()"
								class="w3-button w3-white w3-hover-white w3-padding-small"
								style="font-size: 13px; vertical-align: middle;">
						<input type="hidden" value="N" id="pointUse" name="pointUse">
						<input type="hidden" value="N" id="userPhone" name="userPhone">
						<div style="float:right">
						<input type="text" value="담당자명 : ${staffInfo.name }"
							style="font-size: 13px;"> 금액 : <input type="text"
							value="0" id="priceSum" style="font-size: 13px;"></div> </div>
							<div style="margin-top:30px;"></div>
					</form>
				</div>
				<div class="w3-col" style="width: 20%">
					<p>&nbsp;</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>