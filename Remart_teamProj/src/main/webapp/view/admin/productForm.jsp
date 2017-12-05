<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART ADMIN</title>
<style>
.order {
	display: table;
	width: 100%;
	list-style: none;
	padding: 0px;
	margin: 0px;
}

.order li.active {
	background: #24221f;
	color: #fff;
}

.order li {
	display: table-cell;
	position: relative;
	padding: 14px 25px;
	background: #fff;
	font-size: 22px;
	color: #999;
	border-left: 1px solid #bbb;
	vertical-align: middle;
}

.process .order li em {
	font-family: 'Gotham Book';
	font-size: 26px;
	font-weight: 400;
	vertical-align: -2px;
}

.list_head {
	position: relative;
	min-height: 60px;
	border-top: 1px solid #24221f;
	background: #f7f7f7;
	font-size: 16px;
}

.list_head_title p {
	display: inline-block;
	font-weight: 700;
	font-size: 18px;
	text-align: center;
	margin-left: 20px;
}

.item_count {
	display: inline-block;
	padding: 1px 7px 0 7px;
	background: #ed1b24;
	border-radius: 3px;
	color: #fff;
	font-size: 14px;
	font-weight: 700;
	vertical-align: 2px;
	margin-left: 7px;
	vertical-align: middle;
}

.list_body {
	table-layout: fixed; /* 셀안의 데이터가 길어서 지정한 너비 이상으로 셀을 밀어버리는 것을 방지 */
	word-break: break-all; /* 테이블 고정 줄바꿈 일어남 */
	width: 100%;
	position: relative;
}

.list_body_table th {
	padding: 14px 0 12px 0;
	background: 0 0;
	font-size: 13px;
	border-top: 1px solid #24221f;
	border-bottom: 1px solid #bbb;
	font-weight: 700;
	line-height: 1.2;
}

.list_body_table td {
	border-left: 0;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}

.pro_info {
	text-align: left;
	float: left;
	max-width: 278px;
	color: #666;
}

.pro_img {
	position: relative;
	float: left;
	width: 80px;
	height: 80px;
}

.pro_name {
	float: left;
	max-width: 278px;
	margin-left: 20px;
	color: #666;
	font-size: 13px;
	margin-left: 30px;
}

.pro_name a {
	overflow: hidden;
	max-height: 37px;
	margin: -2px 0 0 0;
	color: #111;
	font-size: 14px;
	font-weight: 700;
	line-height: 7;
	letter-spacing: 0; /*글자 사이 간격 */
	text-decoration: none;
}

.tiny {
	font-size: 2px;
}
</style>
</head>
<body>
	<div style="margin-top: 120px;"></div>

	<center>
		<div class="w3-container" style="width: 900px">
			<div class="w3-left" style="width: 15%">
				<input type="button"
					class="w3-button w3-black w3-hover-red w3-center"
					style="font-size: 12px; width: 90px;" value="상품 등록">
			</div>
		</div>
		<div style="margin-top: 10px;"></div>
		<div class="w3-container w3-center" style="width: 900px;">
			<div class="list_body">
					<table class="list_body_table" width="100%">
						<tr
							style="border-top: 1px solid #666; background-color: #f7f7f7; font-size: 13px;">
							<th width="15%" class="w3-center">DATE</th>
							<th width="70%" class="w3-center">PRODUCT INFO</th>
							<th width="15%" class="w3-center">EDIT</th>
						</tr>
						<form method="post" action="">
						<c:forEach var="product_list" items="">
						
						</c:forEach>
					</table>
				</form>
			</div>
		</div>

		<div class="w3-container" style="width: 900px">
			<c:if test="${count > 0 }">
				<c:if test="${startPage > bottomLine }">
					<a href="list?pageNum=${startPage - bottomLine }"
						style="font-size: 12px; text-decoration: none;"
						onMouseover="this.style.textDecoration='none';"
						onMouseout="this.style.textDecoration='none';"><font
						color='black'></font></a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="list?pageNum=${i} "
						style="font-size: 12px; text-decoration: none;"
						onMouseover="this.style.textDecoration='none';"
						onMouseout="this.style.textDecoration='none';"> <c:if
							test="${i != currentPage }">
							<font color='black'>${i }</font>
						</c:if> <c:if test="${i == currentPage }">
							<font color='red'>${i }</font>
						</c:if></a>
				</c:forEach>
				<c:if test="${endPage < pageCount }">
					<a href="list?pageNum=${startPage + bottomLine }"
						style="font-size: 12px; text-decoration: none;"
						onMouseover="this.style.textDecoration='none';"
						onMouseout="this.style.textDecoration='none';"><font
						color='black'>다음</font></a>

				</c:if>
			</c:if>
		</div>
	</center>
</body>
</html>
