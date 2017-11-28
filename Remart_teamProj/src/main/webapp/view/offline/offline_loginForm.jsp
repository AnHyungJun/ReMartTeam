<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>REMART</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<div style="margin-top: 170px"></div>
	<center>
		<div class="w3-container w3-margin-top" style="width: 500px;">
			<img src="<%=request.getContextPath() %>/images/icon/offline.png" style="width: 150px;">
			<br><br><br>
			<form class="w3-container w3-card-4" method="post" action="<%=request.getContextPath() %>/offline/offline_loginPro">
				<br>
				<div class="w3-container" align="left">
					
					<p>
						<br> <a style="font-size: 13px;">ID</a> <input name="id"
							class="w3-input" type="text">

					</p>
					<p>
						<a style="font-size: 13px;">PASSWORD</a> <input class="w3-input" name="passwd"
							type="password">

					</p>
				</div>
				<br>
					<input style="font-size: 13px; width: 100%;"
					class="w3-button w3-hover-light-grey w3-light-grey w3-center w3-padding-16"
					type="submit" value="LOGIN">
				<br> <br>

			</form>
		</div>
	</center>
</body>
</html>