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
	table-layout: fixed; /* 셀안의 데이터가 길어서 지정한 너비 이상으로 셀을 밀어버리는 것을 방지 */
	word-break: break-all; /* 테이블 고정 줄바꿈 일어남 */
	width: 100%;
	position: relative;
}

.list_body_table th {
	padding: 14px 0 12px 0;
	font-size: 13px;
	border-top: 1px solid #24221f;
	border-bottom: 1px solid #bbb;
	line-height: 1.2;
}

.list_body_table td {
	border-left: 0;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	border-bottom: 1px solid #bbb;
}

.tiny {
	font-size: 2px;
}
</style>
</head>
<body>
	<div style="margin-top: 120px;"></div>

	<center>
		<div class="w3-row w3-container" style="width: 850px">
			<div class="w3-left w3-third" style="width: 15%;">
				<input type="button"
					class="w3-button w3-black w3-hover-red w3-center"
					style="font-size: 12px; width: 90px;" value="상품 등록"
					onClick="openOfflineSearch(this.form)">
			</div>
			<div class="w3-twothird w3-right" style="margin-top: 8px;">
				<div class="w3-right">

					<div class="w3-half w3-right"
						style="vertical-align: middle; width: 10px;">
						<button class="w3-button w3-white w3-hover-white w3-padding-small"
							style="font-size: 12px;" type="submit">검색</button>
					</div>
					<div class="w3-half w3-right"
						style="vertical-align: middle; width: 190px;">
						<form method="post" action="foodsearchPro">
							<input type="text" name="foods" value="" style="height: 26px;">
						</form>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 10px;"></div>



		<div class="w3-container w3-center" style="width: 900px;">
			<div class="list_body">
				<table class="list_body_table w3-table w3-center" width="100%"
					style="font-size: 13px;">
					<tr
						style="border-top: 1px solid #666; background-color: #f7f7f7; font-size: 13px;">
						<th width="30%" class="w3-center">PRODUCT NAME</th>
						<th width="30%" class="w3-center">PRODUCT PRICE</th>
						<th width="30%" class="w3-center">PRODUCT QTY</th>
						<th width="10%" class="w3-center">EDIT</th>
					</tr>
					<c:if test="${foodlist == null }">
						<c:forEach var="allfood" items="${allfoodlist}">
							<form name="food">
								<tr>
									<td width="30%" class="w3-center"
										style="vertical-align: middle;">${allfood.name}</td>
									<td width="30%" class="w3-center"
										style="vertical-align: middle;"><input
										value="${allfood.price}" name="price"></td>
									<td width="30%" class="w3-center"
										style="vertical-align: middle;"><input
										value="${allfood.qty}" name="qty"></td>
									<td width="10%" class="w3-center"
										style="vertical-align: middle;">
										<button
											class="w3-button w3-black w3-hover-black w3-padding-small"
											style="font-size: 11px"
											onClick="foodupdate(${food.food_id},this.form)">수정</button>
									</td>
								</tr>
							</form>
						</c:forEach>
					</c:if>
					<c:if test="${foodlist != null }">
						<c:forEach var="food" items="${foodlist}">
							<form name="food" method="post" action="foodUpdatePro">
								<tr>
									<td width="30%" class="w3-center"
										style="vertical-align: middle;">${food.name}</td>
									<td width="30%" class="w3-center"
										style="vertical-align: middle;"><input
										value="${food.price}" name="price"></td>
									<td width="30%" class="w3-center"
										style="vertical-align: middle;"><input
										value="${food.qty}" name="qty"></td>
									<td width="30%" class="w3-center"
										style="vertical-align: middle;">
										<button
											class="w3-button w3-black w3-hover-black w3-padding-small"
											style="font-size: 11px" type="submit">수정</button>
									</td>

								</tr>
								<input type="hidden" value="${food.food_id }" name="food_id">
							</form>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</center>

	<script>
	function openOfflineSearch(userinput) {
		url = "productWrite";

		open(url, "productWrite",
				"toolbar = no,location=no, status= no, menubar = no,"
						+ "resizable=no, width = 1000, height = 670");
	}
	</script>
</body>
</html>
