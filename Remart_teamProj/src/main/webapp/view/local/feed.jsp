<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="list" items="${Feeds}" varStatus="status">
						<div class="w3-container"
							style="float: left; width: 300px; height: 350px; margin-top: 10px;">
							<div class="w3-card-4" style="position: relative; height: 350px;">
								<div id="userInfo" style="text-align: left;">
									<c:if test="${list.profileImg==null}">
										<img
											src="<%=request.getContextPath()%>/images/icon/noProfile.png"
											class="w3-circle" alt="" style="width: 20px; height: 20px">
									</c:if>
									<c:if test="${list.profileImg!=null}">
										<img
											src="<%=request.getContextPath()%>/fileSave/${list.profileImg}"
											class="w3-circle" alt="" style="width: 20px; height: 20px">
									</c:if>${list.id }
								</div>
								<div class="w3-center">
									<!-- 함수 실행해서 이미지 이름 ,사이즈 등등 넘겨주는 부ㅜ분 -->
									<c:if test="${list.feed_grade eq 'editor'}">
									에디터<br>
										<img id="${list.feed_id}" class="showMask"
											src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
											style="width: 100%; height: 200px"
											onclick="editorfeed('${fn:length(list.img_name)}','${list}','${list.feed_id}','${list.img_name}','${list.makecontent}','${list.replelist}','${fn:length(list.replelist)}','${list.food_id}','${list.hashtaglist}');">
										<br>
									${list.recipe_name }
									</c:if>
									<c:if test="${list.feed_grade eq 'nomal'}">
										<img id="${list.feed_id}" class="showMask"
											src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
											style="width: 100%; height: 200px"
											onclick="nomalfeed('${fn:length(list.img_name)}','${list}','${list.feed_id}','${list.img_name}','${list.makecontent}','${list.replelist}','${fn:length(list.replelist)}','${list.hashtaglist}');">
										<br>
									${list.recipe_name }
									</c:if>
								</div>
								<div id="like_bookmark" style="margin-top: 10px;">
									<!-- 로그인 안했을 때 -->
									<c:if test="${empty memberInfo }">
										<img onclick="needlogin()"
											src="<%=request.getContextPath()%>/images/icon/like_before.png"
											style="height: 20px; cursor: pointer;">
										<img
											src="<%=request.getContextPath()%>/images/icon/comment.png"
											style="height: 20px;">
										<img onclick="needlogin()"
											src="<%=request.getContextPath()%>/images/icon/bookmark.png"
											style="height: 20px; cursor: pointer;">
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
										<img
											src="<%=request.getContextPath()%>/images/icon/comment.png"
											style="height: 20px;">
										<c:if test="${list.bookmarkstate==0 }">
											<img onclick="like(${list.feed_id},'bookmark')"
												src="<%=request.getContextPath()%>/images/icon/bookmark.png"
												style="height: 20px; cursor: pointer;">
										</c:if>
										<c:if test="${list.bookmarkstate>=1 }">
											<img
												src="<%=request.getContextPath()%>/images/icon/bookmark.png"
												style="height: 20px; cursor: pointer;">
										</c:if>
									</c:if>
									<br>${list.recipe_name }
								</div>

								<div id="hashtag"
									style="text-align: left; position: absolute; width: 100%; height: 75px">

									<c:set var="doneLoop" value="false" />
									<c:forEach var="hash" items="${list.hashtaglist}"
										varStatus="status">
										<c:if test="${not doneLoop}">
											<a href="#" onclick="search000('${hash}')">#${hash}</a>
											<c:if test="${status.count == 15}">
												<c:set var="doneLoop" value="true" />
														...
													</c:if>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:forEach>
</body>
</html>