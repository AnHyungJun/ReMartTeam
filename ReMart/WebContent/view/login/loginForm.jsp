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
			<form class="w3-container w3-card-4">
				<br>
				<div class="w3-container" align="left">
					
					<p>
						<br> <a style="font-size: 20px;">ID</a> <input
							class="w3-input" type="text">

					</p>
					<p>
						<a style="font-size: 20px;">PASSWORD</a> <input class="w3-input"
							type="password">

					</p>
				</div>
				<br>
				<div class="w3-panel w3-light-grey w3-center">
					<a style="text-decoration: none;" class="con_link"
						onmouseover="this.style.textDecoration='none';"
						onmouseout="this.style.textDecoration='none';"> <a
						href="<%=request.getContextPath()%>/view/main"
						"
						style="font-size: 15px; text-decoration: none;"
						class="con_link" onmouseover="this.style.textDecoration='none';"
						onmouseout="this.style.textDecoration='none';">
							<p>LOGIN</p>
					</a>
					</a>
				</div>
				<br>
				<div class="w3-row">
					<div class="w3-col w3-text-grey"
						style="width: 8%; font-size: 15px;">
						<a style="font-size: 15px; text-decoration: none;"
							class="con_link" onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';"
							href="joinForm">JOIN</a>
					</div>
					<div class="w3-col" style="width: 58%; font-size: 15px;">
						<p>&nbsp;</p>
					</div>
					<div class="w3-col w3-text-grey"
						" style="width: 34%; font-size: 15px;">
						<a style="font-size: 15px; text-decoration: none;"
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