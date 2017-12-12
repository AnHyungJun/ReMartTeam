<%@page import="model.R_memberDataBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>REMART</title>
<script src="http://code.jquery.com/jquery-1.7.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
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

<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajax/httpRequest.js"></script>
</head>
<style>
.ui-autocomplete {
	overflow-y: scroll;
	overflow-x: hidden;
}

a, button, .w3-bar {
	font-family: ‘Noto Sans KR’, sans-serif;
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: 'Nanum Gothic', sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}

.btn_search {
	border: 0px;
	background: #ffffff;
}

.search {
	border: 0px;
}

.search_mold {
	border: 1px solid #000000;
	width: 350px;
	margin-left: 100px;
}
</STYLE>
<script>
	function myFunction() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}

	$(function() {
		var a = "${userHashList}";
		var b = a.replace("[", "");
		b = b.replace("]", "");
		var c = b.split(",");

		$("#autocomplete").autocomplete(
				{
					source : c,
					minLength : 2,
					select : function(event, ui) {
						document.getElementById('please').value = document
								.getElementById('autocomplete').value;
					}
				});
	})

	function aa() {
		document.getElementById('please').value = document
				.getElementById('autocomplete').value;
		document.getElementById('please2').value = null;
	}
	$(function() {
		var a = "${foodSearchList}";
		var b = a.replace("[", "");
		b = b.replace("]", "");
		var c = b.split(",");

		$("#autocomplete2").autocomplete(
				{
					source : c,
					minLength : 2,
					select : function(event, ui) {
						document.getElementById('please2').value = document
								.getElementById('autocomplete2').value;
					}
				});
	})

	function bb() {
		document.getElementById('please2').value = document
				.getElementById('autocomplete2').value;
	}
</script>
<body>
	<form action="<%=request.getContextPath()%>/main/searchForm"
		method="POST" name="header">

		<div class="w3-top w3-white">
			<div class="w3-bar w3-border-bottom w3-center-align w3-large"
				style="height: 135px;">
				<div class="w3-row">
					<div class="w3-col" style="width: 20%">
						<p>&nbsp;</p>
					</div>
					<input type="hidden" id="please" name="please"> <input
						type="hidden" id="please2" name="please2">
					<div class="w3-col" style="width: 60%">
						<div class="w3-bar-block" style="height: 135px">
							<div class="w3-bar-item w3-right-align" style="height: 10px">
								<c:if test="${empty memberInfo }">
									<a href="<%=request.getContextPath()%>/login/loginForm"
										style="font-size: 12px; text-decoration: none;"
										class="con_link"
										onmouseover="this.style.textDecoration='none';"
										onmouseout="this.style.textDecoration='none';">로그인</a>
								| <a href="<%=request.getContextPath()%>/login/joinForm"
										style="font-size: 12px; text-decoration: none;"
										class="con_link"
										onmouseover="this.style.textDecoration='none';"
										onmouseout="this.style.textDecoration='none';">회원가입</a>
								</c:if>
								<c:if test="${!empty memberInfo }">
									<a href="<%=request.getContextPath()%>/login/loginOut"
										style="font-size: 12px; text-decoration: none;"
										class="con_link"
										onmouseover="this.style.textDecoration='none';"
										onmouseout="this.style.textDecoration='none';">로그아웃</a>
								| <a
										href="<%=request.getContextPath()%>/mypage/myPageForm?id=${memberInfo.id}"
										style="font-size: 12px; text-decoration: none;"
										class="con_link"
										onmouseover="this.style.textDecoration='none';"
										onmouseout="this.style.textDecoration='none';">마이페이지</a>
								</c:if>
								| <a href="<%=request.getContextPath()%>/shopping/basket"
									style="font-size: 12px; text-decoration: none;"
									class="con_link"
									onmouseover="this.style.textDecoration='none';"
									onmouseout="this.style.textDecoration='none';">장바구니</a>
								| <a href="<%=request.getContextPath()%>/chatting/chat"
								style="font-size: 12px; text-decoration: none;"
								class="con_link"
								onmouseover="this.style.textDecoration='none';"
								onmouseout="this.style.textDecoration='none';">채팅</a>
								| <a href="<%=request.getContextPath()%>/main/coding"
								style="font-size: 12px; text-decoration: none;"
								class="con_link"
								onmouseover="this.style.textDecoration='none';"
								onmouseout="this.style.textDecoration='none';">맛집추천</a>
							</div>

							<div class="w3-bar-item" style="height: 135px">
								<div class="w3-row">
									<div class="w3-col w3-left" style="width: 20%">
										<a href="<%=request.getContextPath()%>/main/main"><img
											alt="로고"
											src="<%=request.getContextPath()%>/images/icon/logo.png"
											width="100px"></a>
									</div>
									<div class="w3-col" style="width: 50%">
										<div class="w3-center" style="margin-top:30px;">


											<c:if test="${curPage != 'shopping' }">
												<input onkeyup="aa()" id="autocomplete" type="text"
													style="width: 300px; font-size: 14px; height: 30px;"
													name="autocomplete" />
											</c:if>

											<c:if test="${curPage == 'shopping' }">
												<input onkeyup="bb()" id="autocomplete2" type="text"
													style="width: 300px; font-size: 14px; height: 30px;"
													name="autocomplete2" />
											</c:if>

											<div class="w3-center w3-bar-item" style="height: 100px;">
												<a
													href="<%=request.getContextPath()%>/main/editorRecommandForm"
													style="font-size: 12px; text-decoration: none;"
													class="con_link w3-button w3-hover-white"
													onmouseover="this.style.textDecoration='none';"
													onmouseout="this.style.textDecoration='none';">EDITOR
													RECOMMAND</a> <a
													href="<%=request.getContextPath()%>/tvrecipe/tvRecipe1"
													style="font-size: 12px; text-decoration: none;"
													class="con_link w3-button w3-hover-white"
													onmouseover="this.style.textDecoration='none';"
													onmouseout="this.style.textDecoration='none';">TV
													RECIPE</a> <a
													href="<%=request.getContextPath()%>/writepage/writeForm"
													style="font-size: 12px; text-decoration: none;"
													class="con_link w3-button w3-hover-white"
													onmouseover="this.style.textDecoration='none';"
													onmouseout="this.style.textDecoration='none';">WRITE</a> <a
													href="<%=request.getContextPath()%>/view/local/hashtag.jsp"
													style="font-size: 12px; text-decoration: none;"
													class="con_link w3-button w3-hover-white"
													onmouseover="this.style.textDecoration='none';"
													onmouseout="this.style.textDecoration='none';">#</a>
											</div>
										</div>
									</div>
									<div class="w3-col" style="width: 30%;">
										<div class="w3-bar-block">
											<div class="w3-bar-item" style="height: 30px;">&nbsp;</div>
											<div class="w3-bar-item" style="height: 50px;">
												<a
													href="<%=request.getContextPath()%>/shopping/shoppingMain"><img
													alt="로고"
													src="<%=request.getContextPath()%>/images/icon/foodmall.png"
													width="130px" align="right"></a>
											</div>
											<div class="w3-bar-item" style="height: 20px;">&nbsp;</div>
										</div>
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
	</form>

</body>
</html>