<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="img">
	<c:forEach var="img" items="${feed.img_name }">
		<img src="<%=request.getContextPath()%>/fileSave/${img}" alt=""
			style="width: 200px; height: 200px">
	</c:forEach>
</div>
<div id="like">
	<c:if test="${id=='' }">
		<label id="like"> <img onclick="needlogin()"
			src="<%=request.getContextPath()%>/images/icon/like_before.png"
			style="height: 20px; cursor: pointer;"></label>
		<img src="<%=request.getContextPath()%>/images/icon/comment.png"
			style="height: 20px; cursor: pointer;">
		<img onclick="needlogin()"
			src="<%=request.getContextPath()%>/images/icon/bookmark.png"
			style="height: 20px; cursor: pointer;">
	</c:if>
	<c:if test="${id!='' }">
		<c:if test="${feed.likestate==0 }">
			<label id="like" style="visibility: visible"> <img
				onclick="like(${feed.feed_id},'like');"
				src="<%=request.getContextPath()%>/images/icon/like_before.png"
				style="height: 20px; cursor: pointer;">
			</label>
		</c:if>
		<c:if test="${feed.likestate==1 }">
			<label id="like"> <img
				src="<%=request.getContextPath()%>/images/icon/like_after.png"
				style="height: 20px; cursor: pointer;"></label>
		</c:if>

		<img src="<%=request.getContextPath()%>/images/icon/comment.png"
			style="height: 20px; cursor: pointer;">:${feed.repleNum}
	<c:if test="${feed.bookmarkstate==0 }">
			<img onclick="like(${feed.feed_id},'bookmark')"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="height: 20px; cursor: pointer;">
		</c:if>
		<c:if test="${feed.bookmarkstate==1 }">
			<img src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="height: 20px; cursor: pointer;">
		</c:if>
	</c:if>
</div>
<div id="name">
	음식이름:${feed.recipe_name }<br> 내용:
	<c:forEach var="content" items="${feed.content }">
${content },
</c:forEach>

</div>
<div id="hashtag">
	<c:forEach var="hash" items="${feed.hashtaglist }">
#${hash },
</c:forEach>
</div>
