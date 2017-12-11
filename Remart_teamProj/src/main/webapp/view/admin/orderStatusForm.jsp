<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajax/httpRequest.js"></script>
<script type="text/javascript">
	function stchange(id, status, type) {
		var params = "id=" + encodeURIComponent(id) + "&status="
				+ encodeURIComponent(status) + "&type="
				+ encodeURIComponent(type);
		sendRequest("/Remart_teamProj/admin/stchange", params, return_stchange,
				"GET");
	}
	function return_stchange() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				window.location.reload();
				//document.getElementById("status"+mart_order_id).innerHTML = httpRequest.responseText;

			}
		}
	}
</script>
<body>
	<div style="margin-top: 120px"></div>
	<center>
		<div class="w3-container w3-center"
			style="width: 900px; font-size: 12px;">
			<div class="list_body">
				<table class="list_body_table w3-table w3-center">
					<tr
						style="border-top: 1px solid #666; background-color: #f7f7f7; font-size: 12px;">
						<td class="w3-center" width="300"><b>지점</b></td>
						<td class="w3-center" width="300"><b>주문 날짜</b></td>
						<td class="w3-center" width="300"><b>입고예정 날짜</b></td>
						<td class="w3-center" width="300"><b>상태</b></td>
						<td class="w3-center" width="300"><b>상태변경</b></td>
					</tr>
				</table>
				<div
					style="overflow-x: hidden; overflow: auto; width: 100%; max-height: 200px;">
					<table style="width: 880px; font-size: 12px;">
						<c:forEach var="order" items="${orderList }">
							<tr>
								<td class="w3-center" width="300">${order.location}</td>
								<td class="w3-center" width="300"><fmt:formatDate value="${order.re_date }" pattern="yyyy-MM-dd HH:mm"/></td>
								<td class="w3-center" width="300"><fmt:formatDate value="${order.or_date }" pattern="yyyy-MM-dd HH:mm"/></td>
								<td class="w3-center" width="300"><c:if
										test="${order.status=='order'}">발주완료</c:if> <c:if
										test="${order.status=='ready'}">배송준비중</c:if> <c:if
										test="${order.status=='ing'}">배송중</c:if> <c:if
										test="${order.status=='end'}">배송완료</c:if></td>
								<td class="w3-center" width="300">
									<button
										class="w3-button w3-black w3-hover-black w3-padding-small"
										style="font-size: 11px"
										onclick="stchange('${order.mart_order_id }','${order.status}','order')">change</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>

		<div style="margin-top: 50px; margin-bottom: 50px;"></div>

		<div class="w3-container w3-center"
			style="width: 900px; font-size: 12px;">
			<div class="list_body">
				<table class="list_body_table w3-table w3-center">
					<tr
						style="border-top: 1px solid #666; background-color: #f7f7f7; font-size: 12px;">
						<td class="w3-center" width="300"><b>아이디</b></td>
						<td class="w3-center" width="300"><b>주문한 날짜</b></td>
						<td class="w3-center" width="300"><b>상품명</b></td>
						<td class="w3-center" width="300"><b>상태</b></td>
						<td class="w3-center" width="300"><b>상태변경</b></td>
					</tr>
				</table>
			</div>
		</div>
		<div
			style="overflow-x: hidden; overflow: auto; width: 100%; max-height: 300px;">
			<table style="width: 910px; font-size: 12px;">

				<c:forEach var="pay" items="${payList }">
					<tr>
						<td class="w3-center" width="300">${pay.id }</td> 
						<td class="w3-center" width="300"><fmt:formatDate value="${pay.order_date }" pattern="yyyy-MM-dd HH:mm"/></td>
						<td class="w3-center" width="300">${pay.pro_name}</td>
						<td class="w3-center" width="300"><c:if
								test="${pay.order_state} ==order}">주문완료</c:if> <c:if
								test="${pay.order_state=='pay'}">결제완료</c:if> <c:if
								test="${pay.order_state=='ready'}">배송준비중</c:if> <c:if
								test="${pay.order_state=='ing'}">배송중</c:if> <c:if
								test="${pay.order_state=='end'}">배송완료</c:if></td>
						<td class="w3-center" width="300">
							<button
								class="w3-button w3-black w3-hover-black w3-padding-small"
								style="font-size: 11px"
								onclick="stchange('${pay.payment_id }','${pay.order_state}','pay')">change</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</center>
</body>
</html>