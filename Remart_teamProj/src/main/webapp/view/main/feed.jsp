<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="i" begin="1" end="12" step="1">
		<div style="float: left; width: 300px">
			<div class="w3-card-4">
				<div class="w3-display-container" style="height: 230">
					<img src="<%=request.getContextPath()%>/images/icon/noProfile.png"
						style="width: 25px; height: 25px"><b>이재연</b> <img
						src="<%=request.getContextPath()%>/images/temp/감자볶음4.JPG"
						style="width: 300px; height: 200px">
				</div>
				<div style="width: 300px">
					<div class="w3-container w3-white">
						<c:if test="${likely_bookmark!=null }">

						</c:if>
						<label id="like"> <img onclick="like()"
							src="<%=request.getContextPath()%>/images/icon/like_before.png"
							style="height: 20px; cursor: pointer;"></label> <img
							src="<%=request.getContextPath()%>/images/icon/comment.png"
							style="height: 20px; cursor: pointer;"> <img
							onclick="bookmark()"
							src="<%=request.getContextPath()%>/images/icon/bookmark.png"
							style="height: 20px; cursor: pointer; position: relative; left: 80%">
					</div>

					<div class="w3-container w3-light-grey"
						style="height: 200px; cursor: pointer"
						onclick="document.getElementById('userplant').style.display='block'">
						<p>좋아요 100개</p>
						<p>#자취생#감자</p>
						<p>맛있는 감자볶음</p>
						<p>
							유저1:댓글<br> 유저2:댓글
						</p>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>