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
<title>REMART</title>
</head>
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
							<p style="font-size: 13px;">${offlineInfo.offline_mart_id } 님
								&nbsp;&nbsp;&nbsp;</p>
							<a href="<%=request.getContextPath()%>/offline/loginOut"
								style="font-size: 12px;"
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

				<div class="w3-col" style="width: 60%; font-size: 13px; ">
				<br> <h6> <b> 포스기 </b> </h6>
				</div>
				<div style="margin-top: 100px"></div>
				<div class="w3-col" style="width: 20%">
					<p>&nbsp;</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>