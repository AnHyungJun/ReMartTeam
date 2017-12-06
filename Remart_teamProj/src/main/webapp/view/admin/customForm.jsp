<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>

<div style="margin-top: 50px"></div>

 <div id="search" style="text-align: center;">
  <form id="searchForm" action="customForm" method="post" name="searchForm">
   <p>
    <select name="searchOption">
    	<option value="id">ID</option>
    	<option value="name">이름</option>
    	<option value="">프로필보기</option>
    	<option value="">grade</option>
    </select>
    <input type="text" name="searchWord" size="30" maxlength="50" />
    <input type="submit" value="검색" />
   </p> 
  </form>
 </div>


<table class="w3-center">
	<tr>
		<th>ID</th>
		<th>이름</th>
	</tr>
	
	<c:if test="${articleFindMember == null }">
	<c:forEach var="member" items="${articleMember}">
	<c:if test="${member.id != 'admin' }">
	<tr>
	<form name="memInfo" action="customPro" method="post">
		<input type="hidden" id="id" name="id" value="${member.id }">
		<input type="hidden" id="grade" name="grade" value="${member.grade }">
		<td>${member.id }</td>
		<td>${member.name }</td>
		<td><input type="button" value="상세보기" onclick="memberInfo(this.form)"></td>
		<c:if test="${member.grade == 'nomal' }">
		<td>일반</td>
		</c:if>
		<c:if test="${member.grade == 'editor' }">
		<td>에디터</td>
		</c:if>
		<td><input type="submit" value="change"></td>
	</form> 
	</tr>
	</c:if>
	</c:forEach>
	</c:if>
	
	<c:if test="${articleFindMember != null }">
	<c:forEach var="findmember" items="${articleFindMember}">
	<tr>
	<form name="memInfo" action="customPro" method="post">
		<input type="hidden" id="id" name="id" value="${findmember.id }">
		<input type="hidden" id="grade" name="grade" value="${findmember.grade }">
		<td>${findmember.id }</td>
		<td>${findmember.name }</td>
		<td>상세보기</td>
		<c:if test="${findmember.grade == 'nomal' }">
		<td>일반</td>
		</c:if>
		<c:if test="${findmember.grade == 'editor' }">
		<td>에디터</td>
		</c:if>
		<td><input type="submit" value="change"></td>
	</form> 
	</tr>
	</c:forEach>
	</c:if>
	
</table>

<script>
function memberInfo(thisform) {
	var id = thisform.id.value;
	url = "customInfo?id=" + id;

	open(url, "customInfo",
			"toolbar = no,location=no, status= no, menubar = no,"
					+ "resizable=no, width = 600, height = 600");
}
</script>
</body>
</html>