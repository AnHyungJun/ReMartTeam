<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<div style="margin-top: 150px"></div>
	<center>
		<div class="w3-container w3-margin-top" style="width: 25%;">
			<a href="<%=request.getContextPath() %>/main/main"><img src="/ReMart/images/icon/logo.png" style="width: 30%"></a>
			<br><br><br>
			<form class="w3-container w3-card-4" method="post" action="<%=request.getContextPath() %>/login/loginPro">
				<br>
				<div class="w3-container" align="left">
					
					<p>
						<br> <a style="font-size: 18px;">ID</a> <input name="id"
							class="w3-input" type="text">

					</p>
					<p>
						<a style="font-size: 18px;">PASSWORD</a> <input class="w3-input" name="passwd"
							type="password">

					</p>
				</div>
				<br>
				<div class="w3-panel w3-light-grey w3-center">

					<input style="border:1px; solid: maroon;background:transparent;" class="w3-light-grey w3-center"
						 type="submit" value="LOGIN">
				</div>
				<br>
				<div class="w3-row">
					<div class="w3-col w3-text-grey"
						style="width: 8%; font-size: 13px;">
						<a style="font-size: 13px; text-decoration: none;"
							class="con_link" onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';"
							href="joinForm">JOIN</a>
					</div>
					<div class="w3-col" style="width: 54%; font-size: 13px;">
						<p>&nbsp;</p>
					</div>
					<div class="w3-col w3-text-grey"
						" style="width: 38%; font-size: 13px;">
						<a style="font-size: 13px; text-decoration: none;"
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