<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>follow form</title>
</head>
<body>
	<div style="margin-top: 140px"></div>
	<div class="w3-container w3-border-bottom">
		<div class="w3-left-align"
			style="float: left; margin-bottom: 20px; margin-top: 20px;">
			<h3>${member.id}님의프로필</h3>
		</div>
		<div class="w3-right-align"
			style="float: right; margin-bottom: 20px; margin-top: 20px;">

			<a
				href="<%=request.getContextPath() %>/mypage/likeForm?id=${member.id}"><img
				class="w3-right-align"
				src="<%=request.getContextPath()%>/images/icon/like_before.png"
				style="width: 50px; height: 50px; margin: 3px"></a> <a
				href="<%=request.getContextPath() %>/mypage/bookmarkForm?id=${member.id}"><img
				class="w3-right-align"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="width: 50px; height: 50px; margin: 3px"></a>
			<!-- 이부분은 팔로우  -->
			<a
				href="<%=request.getContextPath() %>/mypage/bookmarkForm?id=${member.id}"><img
				class="w3-right-align"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="width: 50px; height: 50px; margin: 3px"></a>
		</div>
	</div>
	<div class="w3-display-container w3-border" style="height: 350px;">
		<div class="w3-display-topleft"></div>
		<div class="w3-display-topright"></div>
		<div class="w3-display-bottomleft w3-center" style="margin-left: 5%;">
			<h4>${member.name }</h4>
		</div>
		<div class="w3-display-bottomright"></div>
		<div class="w3-display-left">
			<div style="float: left; margin: 30px; margin-left: 30%;">
				<img
					src="<%=request.getContextPath()%>/fileSave/${member.profileImg}"
					class="w3-circle" alt="Norway" style="width: 200px; height: 200px">
			</div>
		</div>
		<!-- 자기 아이디면 정보 수정 아니면 팔로우 -->
		<c:if test="${checkpage==0}">
			<div class="w3-display-right " style="margin-right: 10%;">
				<button class="w3-button w3-white w3-border" style="width: 200px;">
					<h4>회원 정보 수정</h4>
				</button>
			</div>
		</c:if>
		<c:if test="${checkpage==1}">
			<div class="w3-display-right " style="margin-right: 10%;">
				<button class="w3-button w3-white w3-border" style="width: 200px;">
					<h4>팔로우 하기</h4>
				</button>
			</div>
		</c:if>
		<div class="w3-display-middle">

			<div style="float: left; margin: 30px;">
				<h3>${member.writenum}</h3>
				<br>
				<h3>게시물</h3>
			</div>
			<div style="float: left; margin: 30px;">
				<h3>${member.follownum}</h3>
				<br>
				<h3>팔로우</h3>
			</div>
			<div style="float: left; margin: 30px;">
				<h3>${member.point}</h3>
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
			<h4>마이페이지</h4>
			<br> <br>
		</div>
		<c:if test="${fn:length(feedlist) != 0}">

			<c:forEach var="list" items="${feedlist}" varStatus="status">
				<%-- <c:if test="${status.count % 3 == 1}">
					<div class="w3-container" style="margin-bottom: 10px;border: solid 4px;"/>
				</c:if> --%>
				<div class="w3-container"
					style="float: left; width: 33%; height: 300px">

					<div class="w3-center">
						<img src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
							style="width: 300px; height: 300px">
					</div>

				</div>
			</c:forEach>
		</c:if>
		<c:if test="${fn:length(feedlist) == 0}">
			<br>
			<br>
			<h1>아직 쓴 글이 없습니다.</h1>
			<br>
		</c:if>

	</div>





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