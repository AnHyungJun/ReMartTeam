<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART ADMIN</title>
<style>
</style>
</head>
<body>
	<div style="margin-top: 20px;"></div>
	<center>
		<div class="w3-container" style="width: 900px;">
			<div class="w3-row">
				<div class="w3-col w3-left" style="width: 15%;">
					<img alt="로고"
						src="<%=request.getContextPath()%>/images/icon/logo.png"
						width="100px">
				</div>
				<div class="w3-col" style="width: 85%;">
					<div
						class="w3-bar w3-border-bottom w3-border-white w3-black w3-right w3-margin-right"
						style="font-size: 12px; width: 375px; margin-top: 48px;">
						<a href="<%=request.getContextPath() %>/admin/customForm"
							class="w3-bar-item w3-button w3-border-right w3-hover-red">고객
							관리</a> <a href="<%=request.getContextPath() %>/admin/productForm"
							class="w3-bar-item w3-button w3-border-right w3-hover-red">상품
							관리</a> <a href="<%=request.getContextPath() %>/admin/orderStatusForm"
							class="w3-bar-item w3-button w3-border-right w3-border-white w3-hover-red">주문현황
							관리</a>
							<a href="<%=request.getContextPath() %>/admin/salesStatusForm"
							class="w3-bar-item w3-button w3-border-right w3-border-white w3-hover-red">매출현황
							</a>
					</div>
				</div>
			</div>
		</div>
	</center>
</body>
</html>