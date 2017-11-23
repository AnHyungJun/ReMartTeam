<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART</title>
</head>
<body>
	<div style="margin-top: 100px"></div>
	<div class="w3-container w3-border-bottom">
		<div class="w3-left-align"
			style="float: left; margin-bottom: 20px; margin-top: 20px;">
			<h3>syeonni님</h3>
		</div>
		<div class="w3-right-align"
			style="float: right; margin-bottom: 20px; margin-top: 20px;">

			<a href="<%=request.getContextPath() %>/mypage/likeForm"><img
				class="w3-right-align"
				src="<%=request.getContextPath()%>/images/icon/like_before.png"
				style="width: 50px; height: 50px; margin: 3px"></a> 
			<a
				href="<%=request.getContextPath() %>/mypage/bookmarkForm"><img
				class="w3-right-align"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="width: 50px; height: 50px; margin: 3px"></a>
		</div>
	</div>
	<div class="w3-display-container w3-border" style="height: 350px;">
		<div class="w3-display-topleft"></div>
		<div class="w3-display-topright"></div>
		<div class="w3-display-bottomleft w3-center" style="margin-left: 5%;">
			<h4>서연서연해</h4>
		</div>
		<div class="w3-display-bottomright"></div>
		<div class="w3-display-left">
			<div style="float: left; margin: 30px; margin-left: 30%;">
				<img
					src="<%=request.getContextPath()%>/images/temp/temp_profile.jpg"
					class="w3-circle" alt="Norway" style="width: 200px; height: 200px">
			</div>
		</div>
		<div class="w3-display-right " style="margin-right: 10%;">
			<button class="w3-button w3-white w3-border" style="width: 200px;">
				<h4>회원 정보 수정</h4>
			</button>
		</div>
		<div class="w3-display-middle">

			<div style="float: left; margin: 30px;">
				<h3>118</h3>
				<br>
				<h3>게시물</h3>
			</div>
			<div style="float: left; margin: 30px;">
				<h3>307</h3>
				<br>
				<h3>팔로우</h3>
			</div>
			<div style="float: left; margin: 30px;">
				<h3>5500원</h3>
				<br>
				<h3>적립금</h3>
			</div>
		</div>
		<div class="w3-display-topmiddle"></div>
		<div class="w3-display-bottommiddle "></div>
	</div>

	<div class="w3-container">
		<div>
			<br>
			<h4>> 북마크</h4>
			<br> <br>
		</div>

		<c:forEach var="k" begin="1" end="7">
			<c:if test="${k % 3 == 1}">
				<div class="w3-container" style="margin-bottom: 10px">
			</c:if>

			<div class="w3-container"
				style="float: left; width: 33%; height: 550px">
				<div class="w3-container" style="margin-bottom: 10px; margin-left: 20px">
					<img 
					src="<%=request.getContextPath()%>/images/temp/temp_profile2.jpg"
					class="w3-circle w3-left" alt="Norway" style="float: left; width: 50px; height: 50px;">
					<h4 style="float: left; padding-left: 10px">jejuu</h4>
				</div>
				<div class="w3-container" style="margin-bottom: 10px; margin-left: 20px">
					<img src="<%=request.getContextPath()%>/images/temp/temp2.JPG"
						style="width: 350px; height: 350px">
				</div>
				
				<div class="w3-container" style="margin: 20px;">
					<img 
					src="<%=request.getContextPath()%>/images/icon/like_before.png"
					class="w3-left" style="float: left; width: 30px; height: 30px; margin: 5px">
					<img 
					src="<%=request.getContextPath()%>/images/icon/comment.png"
					class="w3-left" style="float: left; width: 30px; height: 30px; margin: 5px">
					<img 
					src="<%=request.getContextPath()%>/images/icon/bookmark.png"
					class="w3-left" style="float: left; width: 30px; height: 30px; margin: 5px">
					
				</div>
				
				<div class="w3-container" style="margin-bottom: 10px; margin-left: 20px">
					좋아요 230개
				</div>
				
				<div class="w3-container" style="margin-bottom: 10px; margin-left: 20px">
					syeonni 돼지새끼 ~~
					
				</div>

			</div>

			<c:if test="${k % 3 == 0}">
	</div>
	</c:if>
	</c:forEach>



	<%-- <div class="w3-container" style="float: left; width: 33%;height: 300px">
			<div class="w3-center" >
			<img 
					src="<%=request.getContextPath()%>/images/temp/temp1.JPG"
					style="width: 300px; height: 300px">
			</div>
			
		</div>
		<div class=" w3-container" style="float: left; width: 33%;height: 300px">
			<div class="w3-center" >
			<img 
					src="<%=request.getContextPath()%>/images/temp/temp2.JPG"
					style="width: 300px; height: 300px">
			</div>
			
		</div>
		<div class="w3-container" style="float: left; width: 33%;height: 300px">
			<div class="w3-center" >
			<img 
					src="<%=request.getContextPath()%>/images/temp/temp3.JPG"
					style="width: 300px; height: 300px">
			</div>
			
		</div> --%>
	</div>

</body>
</html>