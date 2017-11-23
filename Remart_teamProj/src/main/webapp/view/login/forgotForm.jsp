<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>REMART</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<div style="margin-top: 190px"></div>
	<center>
		<a href="<%=request.getContextPath() %>/main/main"><img src="/ReMart/images/icon/forgot.png" style="width: 100px"></a>
		<br><br>
		<h4>
			<b style="font-size:22px;"> Forgot your ID/PASSWORD? </b>
		</h4>
		<p class="w3-text-grey" style="font-size: 13px;">가입하신 이메일로 아이디와 비밀번호 찾기가 가능합니다.</p>
		<br>
		<div class="w3-container w3-margin-top" style="width: 500px;">
			<form class="w3-container">
				<div class="w3-container" align="left">
					<p>
						<br> <a style="font-size:13px;">NAME</a> <input
							class="w3-input" type="text">

					</p>
					<p>
						<a style="font-size:13px;">EMAIL</a> <input class="w3-input"
							type="text">
					</p>

					<br>
					<div class="w3-right">
						<input type="submit" class="w3-button w3-white w3-border w3-hover-black"
							style="font-size: 13px;" value="확인">
					</div>
				</div>
			</form>
		</div>
	</center>

</body>
</html>