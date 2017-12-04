<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REMART</title>
</head>
<body>
<div style="margin-top: 200px"></div>

<div class="w3-row">
<div class="w3-col" style="width: 380px;">
	<p>&nbsp;</p>
</div>

<div class="w3-col w3-center" style="width: 1142px;">
	<!-- delivery_list -->
	<div class="delivery_list">
		<div class="list_head">
			<div class="list_head_title">
				<p style=" vertical-align: middle; font-size:14px;">결제 내역</p>
			</div>
		</div>
		
		<div style="margin-top: 50px"></div>

		<div class="list_body">
			<table class="list_body_table w3-table w3-bordered" width="100%">
				<tr style="border-top: 1px solid #666; font-size: 13px;">
					<th width="auto"></th>
					<th width="19%" class="w3-center">주문일자</th>
					<th width="43%" class="w3-center">상품정보</th>
					<th width="19%" class="w3-center">총 결제 금액</th>
					<th width="19%" class="w3-center">진행현황</th>
				</tr>
				<form action="" method="POST">
				<c:forEach var="articlepayment" items="${articlePaymentInfoList}">
				<tr>
					<td></td>
					<td class="w3-center"
						style="font-size: 14px; vertical-align: middle;">${articlepayment.order_date }</td>
					
					<%-- <td class="w3-center"
						style="font-size: 14px; vertical-align: middle;">${articlepayment.pro_name }</td> --%>
					<td class="w3-center" style="font-size: 14px; vertical-align: middle;">
					<table class="list_body_table w3-table w3-bordered" width="100%">
						<c:forEach var="articlefoodNum" items="${articleFoodNumList }">
						<c:if test="${articlepayment.payment_id == articlefoodNum.order_id }">
							<tr>
								<td class="">${articlefoodNum.food_name }/${articlefoodNum.qty }개</td>
							</tr>	
						</c:if>
						</c:forEach>
					</table>
					</td>
					
					<td class="w3-center"
						style="font-size: 14px; vertical-align: middle;">${articlepayment.all_price }원</td>
						
					<c:choose>
						<c:when test="${articlepayment.order_state.equals('order') }">
							<td class="w3-center"
						style="font-size: 14px; vertical-align: middle;">주문완료</td>
						</c:when>
						<c:when test="${articlepayment.order_state.equals('pay') }">
							<td class="w3-center"
						style="font-size: 14px; vertical-align: middle;">결제완료</td>
						</c:when>
						<c:when test="${articlepayment.order_state.equals('ready') }">
							<td class="w3-center"
						style="font-size: 14px; vertical-align: middle;">배송준비중</td>
						</c:when>
						<c:when test="${articlepayment.order_state.equals('ing') }">
							<td class="w3-center"
						style="font-size: 14px; vertical-align: middle;">배송중</td>
						</c:when>
						<c:when test="${articlepayment.order_state.equals('end') }">
							<td class="w3-center"
						style="font-size: 14px; vertical-align: middle;">배송완료</td>
						</c:when>
					</c:choose>
				</tr>	
				</c:forEach>
				</form>
			</table>
		</div>
	</div>
	<!-- delivery_list end -->

</div>


</body>
</html>