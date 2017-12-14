<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<c:if test="${empty dataEmpty }">
	<c:forEach var="list" items="${Feeds}" varStatus="mainstatus"
		begin="${start }" end="${end }">
		<div class="w3-container"
			style="float: left; width: 300px; height: 350px; margin-top: 30px;">
			<div class="w3-border" style="position: relative; height: 350px;">
				<div id="userInfo" style="text-align: left;">
					<div style="margin-top: 3px"></div>
					<c:if test="${list.profileImg==null}">
						<img src="<%=request.getContextPath()%>/images/icon/noProfile.png"
							class="w3-circle" alt=""
							style="width: 20px; height: 20px; margin-left: 5px;">
					</c:if>
					<c:if test="${list.profileImg!=null}">
						<img
							src="<%=request.getContextPath()%>/fileSave/${list.profileImg}"
							class="w3-circle" alt=""
							style="width: 20px; height: 20px; margin-left: 5px;">
					</c:if>${list.id }
					<div style="margin-top: 5px"></div>
					<div class="w3-border-bottom"></div>
				</div>
				<div class="w3-center">
					<!-- 함수 실행해서 이미지 이름 ,사이즈 등등 넘겨주는 부ㅜ분 -->
					<c:if test="${list.feed_grade eq 'editor'}">
						<img src="<%=request.getContextPath()%>/images/icon/editor.png"
							style="margin-top: 5px; margin-bottom: 0px;">
						<img id="${list.feed_id}" class="showMask"
							src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
							style="width: 100%; height: 200px"
							onclick="document.getElementById('popup').style.display='block';popup2('${list.feed_id}','${id_popup}');">
					</c:if>
					<c:if test="${list.feed_grade eq 'nomal'}">
						<img src="<%=request.getContextPath()%>/images/icon/normal.png"
							style="margin-top: 5px; margin-bottom: 0px;">
						<img id="${list.feed_id}" class="showMask"
							src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
							style="width: 100%; height: 200px"
							onclick="document.getElementById('popup').style.display='block';popup2('${list.feed_id}','${id_popup}');">
					</c:if>
				</div>
				<div id="like_bookmark"
					style="text-align: left; margin-top: 15px; margin-left: 5px;">
					<!-- 로그인 안했을 때 -->
					<c:if test="${empty memberInfo }">
						<img onclick="needlogin()"
							src="<%=request.getContextPath()%>/images/icon/like_before.png"
							style="height: 20px; cursor: pointer;">
						<img onclick="needlogin()"
							src="<%=request.getContextPath()%>/images/icon/bookmark.png"
							style="height: 20px; cursor: pointer;">
						<div style="margin-top: 8px"></div>
					</c:if>
					<!-- 로그인 했을 때 -->
					<c:if test="${!empty memberInfo }">
						<c:if test="${list.likestate==0 }">
							<label id="like${list.feed_id }"> <img
								onclick="like(${list.feed_id},'like');"
								src="<%=request.getContextPath()%>/images/icon/like_before.png"
								style="height: 20px; cursor: pointer;">
							</label>
						</c:if>
						<c:if test="${list.likestate>=1 }">
							<label id="like${list.feed_id }"> <img
								src="<%=request.getContextPath()%>/images/icon/like_after.png"
								style="height: 20px;"></label>
						</c:if>
						<c:if test="${list.bookmarkstate==0 }">
							<img onclick="like(${list.feed_id},'bookmark')"
								src="<%=request.getContextPath()%>/images/icon/bookmark.png"
								style="height: 20px; cursor: pointer;">
						</c:if>
						<c:if test="${list.bookmarkstate>=1 }">
							<img src="<%=request.getContextPath()%>/images/icon/bookmark.png"
								style="height: 20px;">
						</c:if>
						<div style="margin-top: 8px"></div>
					</c:if>
					<div style="margin-top: 10px;"></div>
					${list.recipe_name }
				</div>

				<div id="hashtag"
					style="text-align: left; position: absolute; width: 100%; height: 75px; margin-left: 5px;">

					<c:set var="doneLoop" value="false" />
					<c:forEach var="hash" items="${list.hashtaglist}"
						varStatus="status">
						<c:if test="${not doneLoop}">
							<a href="#" onclick="search000('${hash}')">#${hash}</a>
							<c:if test="${status.count == 3}">
								<c:set var="doneLoop" value="true" />
														&nbsp;
													</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>