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
.list_body {
	table-layout: fixed; /* ������ �����Ͱ� �� ������ �ʺ� �̻����� ���� �о������ ���� ���� */
	word-break: break-all; /* ���̺� ���� �ٹٲ� �Ͼ */
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
					style="font-size: 12px; width: 90px;" value="��ǰ ���" onClick="openOfflineSearch(this.form)">
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
						color='black'>����</font></a>

				</c:if>
			</c:if>
		</div>
	</center>
	
	<script>
	function openOfflineSearch(userinput) {
		url = "productWrite";

		open(url, "productWrite",
				"toolbar = no,location=no, status= no, menubar = no,"
						+ "resizable=no, width = 1000, height = 1000");
	}
	</script>
</body>
</html>
