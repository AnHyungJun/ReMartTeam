<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART</title>

<style type="text/css">
.shopping_process {
	border: 1px solid #bbb;
	padding: 0px;
	margin-bottom: 50px;
}

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
.paymentInfo h2 {
	font-size: 20px;
	font-weight: 700;
	line-height: 1.2;
	letter-spacing: -.05em;
	text-align: left;
	padding-bottom: 10px;
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

.paysum_wrap {
	margin-bottom: 15px;
	border: 1px solid #c2c2c2;
}

.paysum ul {
	display: table;
	table-layout: fixed;
	width: 100%;
	list-style: none;
	color: #666;
}

.paysum li {
	display: table-cell;
	border-left: 1px solid #e2e2e2;
}

.paysum dl {
	min-height: 118px;
	padding: 12px 10px 12px 20px;
	background: #fff;
	color: #111;
}

.paysum dt {
	font-size: 18px;
}

.paysum dd {
	position: relative;
	text-align: right;
	min-height: 20px;
	font-family: NerisBlack;
	font-size: 22px;
	font-weight: 700;
	padding-right: 30px;
	padding-left: 0;
}

.paysum li:first-child {
	border: 0;
}
</style>
</head>
<body>

	<div style="margin-top: 200px"></div>
	<div class="w3-row">
		<div class="w3-col" style="width: 380px">
			<p>&nbsp;</p>
		</div>

		<div class="w3-col" style="width: 1142px;">
			<div class="basket_wrap">
				<!-- shopping_process -->
				<div class="shopping_process">
					<ol class="order">
						<li class="second"><em>01</em> <b>장바구니</b></li>
						<li class="active"><em>02</em> <b>주문결제</b></li>
						<li><em>03</em> <b>주문완료</b></li>
					</ol>
				</div>
				<!-- shopping_process end -->
			
			<form action="paymentPro" method="post" name="paymentInfo_form">
			<!-- paymentInfo -->
			<div class="paymentInfo"
				style="margin-left: 50px; margin-right: 50px;">
				<h6>
					<b>주문자 정보</b>
				</h6>
				<div class="info_area">
					<table class="w3-table w3-bordered" style="font-size: 13px;">
						<tr style="border-top: 1px solid #666">
							<th width="15%"
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">
								보내는 분</th>
							<td width="auto" style="padding: 12px 0 10px 20px;">
								<input type="text" style="width: 15%; height: 23px; line-height: 20px; 
								text-indent: 4px; border: 1px solid #bbb;" value="${name }"></td>
						</tr>
						<tr>
							<th width="15%"
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">휴대폰</th>
							<td width="auto" style="padding: 12px 0 10px 20px;">
								<input type="text"style="width: 25%; height: 23px; line-height: 20px; 
								text-indent: 4px; border: 1px solid #bbb;" value="${phone }"></td>
						</tr>
						<tr>
							<th width="15%"
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">이메일</th>
							<td width="auto" style="padding: 12px 0 10px 20px;">
								<input type="text" style="width: 40%; height: 23px; line-height: 20px; 
								text-indent: 4px; border: 1px solid #bbb;" value="${email }"></td>
						</tr>
					</table>
				</div>
				<br />

				<h6>
					<b>배송지 정보</b>
				</h6>
				<div class="info_area">
					<table class="w3-table w3-bordered" style="font-size: 13px;">
						<tr style="border-top: 1px solid #666">
							<th width="15%" 
							style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">
							받는 분</th>
							<td width="auto" style="padding: 12px 0 10px 20px;">
							<input name="name" type="text" style="width: 15%; height: 23px; line-height: 28px; 
							text-indent: 4px; border: 1px solid #bbb;" value="${name }"></td>
						</tr>
						<tr>
							<th width="15%"
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">휴대폰</th>
							<td width="auto" style="padding: 12px 0 10px 20px;">
								<input name="phone" type="text" style="width: 25%; height: 23px; line-height: 28px; 
								text-indent: 4px; border: 1px solid #bbb;" value="${phone }"></td>
						</tr>
						<tr>
							<th scope="row" rowspan="3"><label for="zip"
								style="vertical-align: middle;">주소</label></th>
							<td class="bg_none">&nbsp;&nbsp;<input type="text" id='zip1'
								name='zip1' readonly="readonly" style="width: 60px" value="${zip1 }"
								class="w3-border" /> - <input type="text" id='zip2' name='zip2'
								readonly="readonly" style="width: 60px; height: 23px;"
								class="w3-border" value="${zip2 }"></input> <input type="button"
								class="w3-white w3-border"
								style="font-size: 12px; height: 23px;"
								onclick="openDaumPostcode();" value="우편번호"></td>
						</tr>
						<tr>
							<td class="bg_none"><label for="address1" class="tts">기본주소
							</label>&nbsp;&nbsp;<input type="text" id="address1" name="address1"
								class="w3-border" readonly="readonly"
								style="width: 340px; height: 23px; margin-right: 5px" value="${address1 }" /></td>
						</tr>
						<tr>
							<td><label for="address2" class="tts">상세주소
									&nbsp;&nbsp;</label><input type="text" id="address2" name="address2"
								class="w3-border"
								style="width: 340px; height: 23px; margin-right: 5px" value="${address2 }"  /></td>
						</tr>
					</table>
				</div>
				<br />

				<h6>
					<b>주문상품</b>
				</h6>
				<div class="info_area">
					<table class="w3-table w3-bordered" width="100%">
						<tr style="border-top: 1px solid #666; font-size: 13px;">
							<th width="auto"></th>
							<th width="37%" class="w3-center">상품정보</th>
							<th width="14%" class="w3-center">판매가</th>
							<th width="15%" class="w3-center">수량</th>
							<th width="14%" class="w3-center">할인금액</th>
							<th width="14%" class="w3-center">구매가</th>
						</tr>
						
						<c:set var="totalPrice" value="0"/>
						<c:forEach var="articleBasket" items="${articleBasketList}">
						<tr>
							<td></td>
							<td class="pro_info">
								<div class="pro_img">
									<img alt="사진1"
										src="<%=request.getContextPath()%>/images/food/${articleBasket.bname }.jpg"
										width="100" height="100">
								</div>
								<div class="pro_name">
									<a href="#" class="w3-center" style="vertical-align: middle;">${articleBasket.bname }</a>
								</div>
							</td>
							<td class="w3-center"
								style="font-size: 14px; vertical-align: middle;">${articleBasket.bprice }원</td>
							<td class="w3-center" 
								style="vertical-align: middle;">${articleBasket.food_num }</td>
							<td class="w3-center"
								style="font-size: 14px; vertical-align: middle;">-</td>
							<td class="w3-center"
								style="color: red; font-size: 14px; vertical-align: middle;">
								${articleBasket.bprice*articleBasket.food_num }원</td>
						</tr>
						<input type="hidden" name="pro_name" value="${articleBasket.bname }">
						<c:set var="totalPrice" value="${totalPrice + (articleBasket.bprice*articleBasket.food_num) }"/>
						</c:forEach>
					</table>
				</div>

				<!-- paysum_wrap -->
				<br> <br>
				<div class="paysum_wrap">
					<div class="paysum" style="vertical-align: middle;">
						<ul>
							<li>
								<dl>
									<dt style="font-size: 15px;">판매가</dt>
									<br>
									<dd style="font-size: 16px;"><c:out value="${totalPrice }"/>원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt style="font-size: 15px;">적립금</dt>
									<br>
									<dd style="font-size: 16px;">${checkpoint }원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt style="font-size: 15px;">배송비</dt>
									<br>
									<dd style="font-size: 16px;">2500원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt style="font-size: 15px;">주문금액</dt>
									<br>
									<dd style="color: red; font-size: 16px;">${totalPrice+2500-checkpoint }원</dd>
								</dl>
							</li>
						</ul>
					</div>
				</div>
				<!-- paysum_wrap end -->
				<br />

				<h6>
					<b>결제수단 선택</b>
				</h6>
				<div class="info_area">
					<table class="w3-table w3-bordered" style="font-size: 13px;">
						<tr style="border-top: 1px solid #666">
							<th width="15%"
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">결제
								수단</th>
							<td width="auto" style="padding: 12px 0 10px 20px;"><input
								type="checkbox" name="pay_method" value="card"
								style="vertical-align: middle;">&nbsp;신용카드&nbsp;&nbsp;&nbsp;
								<!-- <input type="checkbox" name="pay_method" value="실시간계좌이체"
								style="vertical-align: middle;">&nbsp;실시간계좌이체&nbsp;&nbsp;&nbsp;
								<input type="checkbox" name="pay_method" value="가상계좌"
								style="vertical-align: middle;">&nbsp;가상계좌</td> -->
						</tr>
					</table>
				</div>
				<br> <br> <br>
				<div class="w3-center">
					<input type="submit" value="결제하기" style="font-size: 13px;"
						class="w3-button w3-border w3-white w3-hover-black">
				</div>
			</div>
		</div>
		<input type="hidden" name="all_price" value="${totalPrice+2500 }">
		</form>
		
		<div class="w3-col" style="width: 380px">
			<p>&nbsp;</p>
		</div>
	</div>
	<div style="margin-bottom: 50px"></div>
</body>
</html>