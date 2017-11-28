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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script	type = "text/javascript" src = "<%=request.getContextPath() %>/ajax/httpRequest.js">
</script>
<script type="text/javascript">

	function startSuggest(){
		var keyword = document.getElementById('userName').value;
		
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
			alert(keyword);
			var params = "keyword=" + encodeURIComponent(keyword);
			sendRequest("<%=request.getContextPath()%>/common/suggestFileCodeSearch.jsp", params, displayResult2, 'POST');
		}
	}
	
	function displayResult2(){
		if(httpRequest.readyState == 4) {
	         if(httpRequest.status == 200) {
	            var resText = httpRequest.responseText;
	            alert(resText);
	            /* var res =  resText.split(',');
	            document.getElementById('userName').value = res[0];
	            document.getElementById('userPoint').value = res[1]; */
	         } else {
	            alert("에러: " + httpRequest.status);
	         }
	      }
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
					<div style=" float: left">
						
						<img  style="text-align:left"alt="로고" src="<%=request.getContextPath()%>/images/icon/logo.png" width="100px">
					</div>
					<div style=" float: right">
						<a href="<%=request.getContextPath()%>/offline/loginOut" style=" float: left" class="w3-bar-item w3-button w3-white "><i class="fa fa-sign-out"></i> 로그아웃</a>
						
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
					<br><br>
					<input type="text" id="productCode" placeholder="상품 코드 입력">
					<input type="button" onclick="startSuggest2()" value="찾기">
					<div style="height: 400px;">
						<table style=" float: left">
							<tr>
								<th  style="width: 50px">No.</th>
								<th  style="width: 150px">바코드</th>
								<th  style="width: 150px">상품명</th>
								<th  style="width: 50px">수량</th>
								<th  style="width: 150px">단가</th>
								<th  style="width: 150px">금액</th>
								<th  style="width: 50px">재고</th>
								<th style="width: 50px">삭제</th>
							<tr>
						</table>
						
						<div style=" float: right">
							<button style="height: 70px;width:70px">전체취소</button><br><br>
							<button style="height: 70px;width:70px">할인</button><br><br>
							<button style="height: 70px;width:70px">로그아웃</button><br><br>
							<button style="height: 70px;width:70px">결제진행</button><br><br>
						</div>
					</div>
					고객명:
					<input type="text" id="userName" placeholder="고객 전화번호 입력">
					<input type="button" onclick="startSuggest()" value="조회"><br>
					Point: 
					<input type="text" id="userPoint">
					<button>사용</button>
					<input type="text" value="담당자명: ${staffInfo.name }">
					<input type="text" value="금액: " style=" float: right">
					<br><br>
				</div>
				<div class="w3-col" style="width: 20%">
					<p>&nbsp;</p>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>