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
		<a href="<%=request.getContextPath()%>/main/main"><img
			src="<%=request.getContextPath()%>/images/icon/forgot.png"
			style="width: 100px"></a>
		<div style="margin-top: 20px;"></div>
		<h4>
			<b style="font-size: 22px;"> Forgot your ID/PASSWORD? </b>
		</h4>
		<p class="w3-text-grey" style="font-size: 13px;">가입하신 이메일로 아이디 찾기와
			비밀번호 변경이 가능합니다.</p>
		<div style="margin-top: 20px;"></div>
		<div class="w3-container w3-margin-top" style="width: 500px;">
			<form class="w3-container" action="forgotPro">
				<div class="w3-container" align="left">
					<p>
						<br> <a style="font-size: 13px;">NAME</a> <input
							name="name" class="w3-input" type="text">
					</p>
					<p>
						<a style="font-size: 13px;">EMAIL</a> <input name="email" class="w3-input"
							type="text">
					</p>
					<div style="margin-top: 50px;"></div>
					<div class="w3-right">
						<input type="submit"
							class="w3-button w3-white w3-border w3-hover-black"
							style="font-size: 11px; width: 80px;" value="확인">
					</div>
				</div>
			</form>
		</div>
	</center>

</body>
</html>