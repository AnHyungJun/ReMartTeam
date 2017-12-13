<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
a {
	text-decoration: none;
}
</style>
<div class="w3-container">
	<div style="margin-top: 200px;"></div>
	<center>
	<div style="width: 900px;">
		
		<c:if test="${count == 0}">

			<table class="w3-table w3-bordered" width="900" style="font-size:12px">
				<tr class="w3-white">
					<td class="w3-center" align="center">저장된 글이 없습니다.</td>
			</table>
		</c:if>
		<c:if test="${count != 0}">
			<table class="w3-table w3-bordered" width="900"  style="font-size:12px">
				<tr class="w3-white">
					<td class="w3-center" align="center" width="50">번호</td>
					<td class="w3-center" align="center" width="250">제 목</td>
					<td class="w3-center" align="center" width="250">별 점</td>
					<td class="w3-center" align="center" width="100">작성자</td>
					<td class="w3-center" align="center" width="150">작성일</td>
				</tr>
				<c:forEach var="article" items="${articleList}">
					<tr>
						<td class="w3-center">${article.restaurant_recommand_id }</td>
						<td class="w3-center"><a
							href="content?num=${article.restaurant_recommand_id}&pageNum=${currentPage}">
								${article.subject}</a></td>
						<td class="w3-center">${article.avgstar }</td>
						<td class="w3-center">${article.id }</td>
						<td class="w3-center"><fmt:formatDate value="${article.reg_date }" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
				</c:forEach>

			</table>
		</c:if>

		<div class="w3-center">

			<c:if test="${count > 0 }">

				<c:if test="${startPage > bottomLine }">
					<a href="list?pageNum=${startPage - bottomLine}" style="font-size:12px;">이전</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="list?pageNum=${i}" style="font-size:12px;"> <c:if test="${i != currentPage}"><font color='black'>${i}</c:if>
						<c:if test="${i == currentPage}">
							<font color='red'>${i}</font>
						</c:if></a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="list?pageNum=${startPage+bottomLine}" style="font-size:12px;">다음</a>
				</c:if>

			</c:if>

		</div>
	</div>
	</center>

</div>

</body>
</html>



