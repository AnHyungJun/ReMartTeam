<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="/soloP/ajax/httpRequest.js"></script>
<style>
a, button, .w3-bar {
	font-family: ‘Noto Sans KR’, sans-serif;
	font-weight: 600
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: 'Nanum Gothic', sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}
</style>
<%-- <%
	request.setCharacterEncoding("euc-kr");
	String board = "";
	if (request.getParameter("boardtype") != null)
		session.setAttribute("boardtype",
				request.getParameter("boardtype"));
	String boardtype = (String) session.getAttribute("boardtype");
	if (boardtype == null)
		boardtype = "1";
	if (boardtype.equals("1"))
		board = "자유게시판";
	else {
		board = "QnA";
	}
%> --%>

<!-- <script>
	window.onload = function() {
		var atag = document.getElementsByTagName("a");
		var url = document.location.href.split("/");
		if (url[url.length - 1] == "plantInfo") {
			atag[2].className += " w3-Gray";
		} else if (url[url.length - 1] == "freeboard") {
			atag[3].className += " w3-Gray";
		} else if (url[url.length - 1] == "introduce") {
			atag[4].className += " w3-Gray";
		}
	}
</script> -->



<div class="w3-top w3-white" >
	<div class="w3-bar w3-card-2 w3-center-align w3-large" >
		<table style="width: 100%">
			<tr>
				<td rowspan="3">
					<a href="<%=request.getContextPath() %>/view/main.jsp"><img alt="로고" src="<%=request.getContextPath() %>/images/icon/remartlogo.JPG" width="150px"></a>
				</td>
				<td align="right">
					<a href="#">로그인</a>|<a href="#">회원가입</a>|<a href="<%=request.getContextPath() %>/view/myPage/myPageForm.jsp">마이페이지</a>|<a href="#">장바구니</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text">
				</td>
			</tr>
			<tr>
				<td>
					<a href="#">에디터 추천</a>/ <a href="<%=request.getContextPath() %>/view/tvRecipe/tv.jsp">TV레시피</a>/ <a href="#">글쓰기</a>
				</td>
			</tr>
		</table>
		<%-- <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-Gray w3-large" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a href="/soloP/main/main" class="w3-bar-item w3-button w3-padding-large w3-hover-Gray">Home</a> <a href="/soloP/plantInfo/plantInfo" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-Gray ">작물정보</a> <a href="/soloP/freeboard/freeboard" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-Gray">게시판</a> <a href="/soloP/homepage/introduce/introduce.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-Gray">소개</a>
		<c:if test="${memId==null }">
			<a class="w3-bar-item w3-button w3-padding-large w3-right w3-hover-Gray" onclick="document.getElementById('id01').style.display='block'"> 로그인</a>
		</c:if>
		<c:if test="${memId!=null }">
			<a class="w3-bar-item w3-button w3-padding-large w3-right w3-hover-Gray" href="/soloP/member/logout">로그아웃</a>
		</c:if> --%>
	</div>

	<!-- Navbar on small screens -->
<!-- 	<div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">

		<a href="/soloP/plantInfo/plantInfo" class="w3-bar-item w3-button w3-padding-large">작물정보</a> 
		<a href="/soloP/freeboard/freeboard" class="w3-bar-item w3-button w3-padding-large">게시판</a> 
		<a href="/soloP/homepage/introduce/introduce.jsp" class="w3-bar-item w3-button w3-padding-large">소개</a>

	</div> -->
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

<!-- <div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 600px">

		<div class="w3-center">
			<br> <span
				onclick="document.getElementById('id01').style.display='none'"
				class="w3-button w3-xlarge w3-transparent w3-display-topright"
				title="Close Modal">×</span>
		</div>

		<form name="login" class="w3-container" action="" method="post">
			<div class="w3-section">
				<label><b>아이디</b></label> <input
					class="w3-input w3-border w3-margin-bottom" type="text"
					placeholder="이곳에 아이디를 입력하세요." name="id" required> <label><b>비밀번호</b></label>
				<input class="w3-input w3-border" type="password"
					placeholder="이곳에 비밀번호를 입력하세요." name="pw" required>
				<div id="login" style="text-align: center;">
					<input type="hidden" name="logtry" value="1">
				</div>
				<button class="w3-button w3-block w3-green w3-section w3-padding"
					type="button" onclick="loginProcess()">로그인</button>
			</div>
		</form>

		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
			<button
				onclick="javascript:window.location='../member/membershipForm'"
				type="button" class="w3-button w3-dark-grey">회원가입</button>
			<button
				onclick="document.getElementById('id01').style.display='none'"
				type="button" class="w3-button w3-red">취소</button>
		</div>

	</div>
</div>
 -->