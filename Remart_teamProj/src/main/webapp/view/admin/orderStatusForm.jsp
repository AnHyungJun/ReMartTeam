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

	function stchange(mart_order_id, status) {
		var params = "mart_order_id=" + encodeURIComponent(mart_order_id)+ "&status=" + encodeURIComponent(status);
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

	주문현황
	<table>
		<tr>
			<td width="300">re_date</td>
			<td width="300">or_date</td>
			<td width="300">offline_mart_id</td>
			<td width="300">status</td>
			<td width="300">상태변경</td>
		</tr>
		<c:forEach var="order" items="${orderList }">
			<tr>
				<td>${order.re_date }</td>
				<td>${order.or_date }</td>
				<td>${order.offline_mart_id}</td>
				<td><label id="status${order.mart_order_id }">${order.status}</label></td>
				<td>
				<button
						onclick="stchange('${order.mart_order_id }','${order.status}')">확인</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>