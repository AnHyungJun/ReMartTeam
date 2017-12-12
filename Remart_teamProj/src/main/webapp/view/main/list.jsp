<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
a {
	text-decoration: none;
}
</style>
<div class="w3-container">
	<br><br><br><br><br><br>
	<span class="w3-center  w3-large">
	</span>
	<p class="w3-right w3-padding-right-large">
		<a href="coding">글쓰기</a>
	</p>
	<c:if test="${count == 0}">
	
	<table class="table-bordered" width="700">
		<tr class="w3-grey">
			<td align="center">저장된 글이 없습니다.</td>
	</table></c:if>
	<c:if test="${count != 0}">
	<table class="w3-table-all" width="700">
		<tr class="w3-grey">
			<td align="center" width="50">번호</td>
			<td align="center" width="250">제 목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="150">작성일</td>
		</tr>
	<c:forEach  var="article"  items="${articleList}">  
		<tr>
			<td>${article.restaurant_recommand_id }</td>
			<td> <a
				href="content?num=${article.restaurant_recommand_id}&pageNum=${currentPage}">
					${article.subject}</a></td>
			<td>${article.id }</td>
			<td>${article.reg_date }</td>
		</tr>
	</c:forEach>	
		
	</table>
	</c:if>
	
	<div class="w3-center">
	
	<c:if test="${count > 0 }">
	
	<c:if test="${startPage > bottomLine }">
<a href="list?pageNum=${startPage - bottomLine}">[이전]</a>
	</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<a href="list?pageNum=${i}"> 
	<c:if test="${i != currentPage}">[${i}]</c:if>
 	<c:if test="${i == currentPage}"> 
 	<font color='red'>[${i}]</font>	</c:if></a>
 	</c:forEach>
 <c:if test="${endPage < pageCount}">	
<a href="list?pageNum=${startPage+bottomLine}">[다음]</a>
		</c:if>	
	
	</c:if>	
		
		</div>
		
		
				
		</div>
		
		
		
		</body></html>
		
		
		
