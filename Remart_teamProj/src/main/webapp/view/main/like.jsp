<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${like==like }">
	<img id="like" onclick="like()"
		src="<%=request.getContextPath()%>/images/icon/like_after.png"
		style="height: 20px; cursor: pointer;">
</c:if>
<c:if test="${like==null }">
	<img id="like" onclick="like()"
		src="<%=request.getContextPath()%>/images/icon/like_before.png"
		style="height: 20px; cursor: pointer;">
</c:if>

