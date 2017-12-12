<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 200px"></div>
	<div class="w3-bar w3-border-bottom w3-center-align w3-large">
		<div class="w3-row">
			<div class="w3-col" style="width: 20%">
				<p>&nbsp;</p>
			</div>


			<c:if test="${memberInfo.grade eq 'editor' }">
				<p class="w3-right w3-padding-right-large" style="font-size: 12px">
					<a href="coding">글쓰기</a>
				</p>
			</c:if>

			<div class="w3-col w3-container" style="width: 60%">
				<c:forEach var="editor" items="${editorList }">
					<form action="list" method="post">
						<a href="list?editorid=${editor.id }" ><img
							style="height: 100px; width: 100px" alt="프사"
							src="<%=request.getContextPath()%>/fileSave/${editor.profileImg}"></a>
						<br>
						<br> <img style="height: 30px; width: 30px" alt="장소아이콘"
							src="<%=request.getContextPath()%>/images/icon/location.png">
						${editor.address1 } <br>
						<br>

					</form>
				</c:forEach>

				<div class="w3-col" style="width: 20%">
					<p>&nbsp;</p>
				</div>
			</div>
		</div>
</body>
</html>