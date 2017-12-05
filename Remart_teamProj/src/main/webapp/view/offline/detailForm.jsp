<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>REMART OFFLINE</title>

</head>

<body>
<center>
	<div class="w3-top w3-white">
		<br><br>
		<div class="w3-bar w3-border-bottom w3-center-align w3-large w3-center">
			<div class="w3-row w3-center">
				<table style="font-size:13px;">
					<tr>
						<th style="width: 100px;">NO</th>
						<th style="width: 200px;">상품명</th>
						<th style="width: 100px;">상품수량</th>
					</tr>
					<c:forEach var="food_num"  items="${food_numList}" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${food_num.food_name }</td>
							<td>${food_num.qty}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</center>
</body>
</html>