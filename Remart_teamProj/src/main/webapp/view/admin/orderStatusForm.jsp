<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
	<table>
		<tr>
			<td width="300">location</td>
			<td width="300">re_date</td>
			<td width="300">or_date</td>
			<td width="300">status</td>
			<td width="300">상태변경</td>
		</tr>
		<c:forEach var="order" items="${orderList }">
			<tr>
				<td>${order.location}</td>
				<td>${order.re_date }</td>
				<td>${order.or_date }</td>
				<td><c:if test="${order.status=='order'}">발주완료</c:if>
				<c:if test="${order.status=='ready'}">배송준비중</c:if>
				<c:if test="${order.status=='ing'}">배송중</c:if>
				<c:if test="${order.status=='end'}">배송완료</c:if></td>
				<td>
					<button
						onclick="stchange('${order.mart_order_id }','${order.status}','order')">확인</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<table>
		<tr>
			<td width="300">id</td>
			<td width="300">order_date</td>
			<td width="300">pro_name</td>
			<td width="300">order_date</td>
			<td width="300">상태변경</td>
		</tr>
		<c:forEach var="pay" items="${payList }">
			<tr>
				<td>${pay.id }</td>
				<td>${pay.order_date }</td>
				<td>${pay.pro_name}</td>
				<td><c:if test="${pay.order_state} ==order}">주문완료</c:if>
				<c:if test="${pay.order_state=='pay'}">결제완료</c:if>
				<c:if test="${pay.order_state=='ready'}">배송준비중</c:if>
				<c:if test="${pay.order_state=='ing'}">배송중</c:if>
				<c:if test="${pay.order_state=='end'}">배송완료</c:if></td>
				<td>
					<button
						onclick="stchange('${pay.payment_id }','${pay.order_state}','pay')">확인</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>