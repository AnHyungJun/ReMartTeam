<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>REMART</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<div style="margin-top: 160px"></div>
	<center>
		<a href="<%=request.getContextPath()%>/main/main"><img
			src="<%=request.getContextPath()%>/images/icon/find.png"
			style="width: 100px"></a>
		<div style="margin-top: 20px;"></div>
		<h4>
			<b style="font-size: 22px;"> Find your ID/PASSWORD </b>
		</h4>
		<p class="w3-text-grey" style="font-size: 13px;">입력하신 정보로 가입한 아이디와 비밀번호 변경이 가능합니다. </p>
		<div style="margin-top:20px;"></div>
		<div class="w3-container w3-margin-top" style="width: 500px;">
			<form class="w3-container">
				<div class="w3-container" align="left">
					<p>
						<br> <a style="font-size: 13px;">ID</a>
					<div class="w3-input">${member.id}</div>

					</p>
					<p>
						<a style="font-size: 13px;">NEW PASSWORD</a>
					<input class="w3-input" type="text">
					</p>
					<p>
						<a style="font-size: 13px;">PASSWORD CHECK</a>
					<input class="w3-input" type="text">
					</p>

					<div style="margin-top: 50px;"></div>
					<p class="w3-center w3-text-red" style="font-size: 11px;">고객님 즐거운 쇼핑 하세요!</p>

					<div style="margin-top: 40px;"></div>
					<div class="w3-right">
						<input type="submit"
							class="w3-button w3-white w3-border w3-hover-black"
							style="font-size: 11px; width: 80px;" value="로그인">
					</div>
			</form>
		</div>
	</center>

</body>
</html>