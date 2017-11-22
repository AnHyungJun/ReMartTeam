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
			<img src="<%=request.getContextPath() %>/images/icon/logo_offline.JPG" style="width: 50%">
			<br><br><br>
			<form class="w3-container w3-card-4" method="post" action="<%=request.getContextPath() %>/offline/offline_loginPro">
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

			</form>
		</div>
	</center>
</body>
</html>