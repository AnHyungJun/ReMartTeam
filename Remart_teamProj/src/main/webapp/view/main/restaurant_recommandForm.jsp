<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>REMART</title>
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div style="height: 200px"></div>
	<center>
	<div class="w3-bar w3-center-align w3-large" style="width: 700px;">
			<c:if test="${memberInfo.grade eq 'editor' }">
				<p class="w3-right w3-padding-right-large" style="font-size: 12px; margin-right:50px; margin-bottom:20px;">
					<a href="coding"><b>글쓰기</b></a>
				</p>
			</c:if>

			<div class="w3-container" style="width: 700px; font-size:13px;">
				<c:forEach var="editor" items="${editorList }">
				<div class="w3-cell"
						style="display: inline; width: 200px; height: 200px; float: left; border: 0px solid #ddd; margin-left: 20px; margin-bottom: 20px;">
					<form action="list" method="post">
						<a href="list?editorid=${editor.id }" ><img
							style="height: 150px; width: 150px" alt="프사"
							src="<%=request.getContextPath()%>/fileSave/${editor.profileImg}"></a>
						<div style="margin-top:20px;"></div>
						 <img alt="장소아이콘" src="<%=request.getContextPath()%>/images/icon/location.png">
						<b>${editor.address1 }</b>
					</form>
					</div>
				</c:forEach>
				</div>
				<div style="height: 100px"></div>
				</div>
				</center>
</body>
</html>