<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<div style="margin-top: 170px"></div>
	<center>
		<div class="w3-container w3-margin-top" style="width: 500px;">
			<a href="<%=request.getContextPath()%>/main/main"><img
				src="/ReMart/images/icon/login.png" style="width: 90px;"></a> <br>
			<br> <br>
			<form class="w3-container w3-card-4" method="post"
				action="<%=request.getContextPath()%>/login/loginPro">
				<br>
				<div class="w3-container" align="left">

					<p>
						<br> <a style="font-size: 13px;">ID</a> <input name="id"
							class="w3-input" type="text">

					</p>
					<p>
						<a style="font-size: 13px;">PASSWORD</a> <input class="w3-input"
							name="passwd" type="password">

					</p>
				</div>
				<br> <input style="font-size: 13px; width: 100%;"
					class="w3-button w3-hover-light-grey w3-light-grey w3-center w3-padding-16"
					type="submit" value="LOGIN"> <br> <br>
				<div class="w3-row">
					<div class="w3-col w3-text-grey"
						style="width: 8%; font-size: 13px;">
						<a style="font-size: 12px; text-decoration: none;"
							class="con_link" onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';" href="joinForm">JOIN</a>
					</div>
					<div class="w3-col" style="width: 60%; font-size: 13px;">
						<p>&nbsp;</p>
					</div>
					<div class="w3-col w3-text-grey"
						" style="width: 32%; font-size: 13px;">
						<a style="font-size: 12px; text-decoration: none;"
							class="con_link" onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';" href="forgotForm">forgot
							ID/PASSWORD?</a>
					</div>
				</div>
			</form>
		</div>
	</center>
</body>
</html>