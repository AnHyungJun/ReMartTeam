<%@page import="model.R_memberDataBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="/soloP/ajax/httpRequest.js"></script>
<style>
a, button, .w3-bar {
	font-family: ‘Noto Sans KR’, sans-serif;
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: 'Nanum Gothic', sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}
</style>
<div class="w3-top w3-white">
	<div class="w3-bar w3-border-bottom w3-center-align w3-large"
		style="height: 135px;">
		<div class="w3-row">
			<div class="w3-col" style="width: 20%">
				<p>&nbsp;</p>
			</div>

			<div class="w3-col" style="width: 60%">
				<div class="w3-bar-block" style="height: 135px">
					<div class="w3-bar-item w3-right-align" style="height: 10px">
						<c:if test="${empty memberInfo }">
							<a href="<%=request.getContextPath()%>/login/loginForm"
								style="font-size: 12px; text-decoration: none;" class="con_link"
								onmouseover="this.style.textDecoration='none';"
								onmouseout="this.style.textDecoration='none';">로그인</a>
						</c:if>
						<c:if test="${!empty memberInfo }">
							<a href="<%=request.getContextPath()%>/login/loginOut"
								style="font-size: 12px; text-decoration: none;" class="con_link"
								onmouseover="this.style.textDecoration='none';"
								onmouseout="this.style.textDecoration='none';">로그아웃</a>
						</c:if>
						| <a href="<%=request.getContextPath()%>/login/joinForm"
							style="font-size: 12px; text-decoration: none;" class="con_link"
							onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';">회원가입</a> | <a
							href="<%=request.getContextPath()%>/mypage/myPageForm"
							style="font-size: 12px; text-decoration: none;" class="con_link"
							onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';">마이페이지</a> | <a
							href="<%=request.getContextPath()%>/shopping/shoppingMain"
							style="font-size: 12px; text-decoration: none;" class="con_link"
							onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';">쇼핑몰</a> | <a
							href="<%=request.getContextPath()%>/shopping/basket"
							style="font-size: 12px; text-decoration: none;" class="con_link"
							onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';">장바구니</a>
					</div>

					<div class="w3-bar-item" style="height: 135px">
						<div class="w3-row">
							<div class="w3-col" style="width: 20%">
								<a href="<%=request.getContextPath()%>/main/main"><img
									alt="로고"
									src="<%=request.getContextPath()%>/images/icon/logo.png"
									width="100px"></a>
							</div>
							<div class="w3-col" style="width: 60%">
								<div class="w3-bar-block w3-center">
									<div class="w3-bar-item w3-margin-top" style="height: 40px;">
										<input type="text" style="width: 300px;">
									</div>
									<div class="w3-bar-item" style="height: 100px;">
										<a href="#" style="font-size: 12px; text-decoration: none;"
											class="con_link w3-button w3-hover-white"
											onmouseover="this.style.textDecoration='none';"
											onmouseout="this.style.textDecoration='none';">EDITOR
											RECOMMAND</a> <a href="<%=request.getContextPath()%>/tvrecipe/tv"
											style="font-size: 12px; text-decoration: none;"
											class="con_link w3-button w3-hover-white"
											onmouseover="this.style.textDecoration='none';"
											onmouseout="this.style.textDecoration='none';">TV RECIPE</a>
										<a href="<%=request.getContextPath()%>/writepage/writeForm"
											style="font-size: 12px; text-decoration: none;"
											class="con_link w3-button w3-hover-white"
											onmouseover="this.style.textDecoration='none';"
											onmouseout="this.style.textDecoration='none';">WRITE</a>
									</div>
								</div>
							</div>
							<div class="w3-col" style="width: 20%">
								<p>&nbsp;</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="w3-col" style="width: 20%">
				<p>&nbsp;</p>
			</div>
		</div>
	</div>
</div>

<script>
	// Used to toggle the menu on small screens when clicking on the menu button
	function myFunction() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}
</script>
