<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style type="text/css">
.shopping_process {
	border: 2px solid #24221f;
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

.list_head {
	position: relative;
	min-height: 60px;
	border-top: 1px solid #24221f;
	background: #f4f8f9;
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

.paysum_wrap {
	margin-bottom: 15px;
	border: 1px solid #25211e;
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

.pay {
	
}
</style>
</head>
<body>

	<div style="margin-top: 150px"></div>

	<!-- basket_wrap -->
	<form method="post"
		action="<%=request.getContextPath() %>/shopping/paymentInfo">
		<div class="basket_wrap">
			<!-- shopping_process -->

			<div class="shopping_process">
				<ol class="order">
					<li class="active"><em>01</em> 장바구니</li>
					<li class="second"><em>02</em> 주문결제</li>
					<li><em>03</em> 주문완료</li>
				</ol>
			</div>
			<!-- shopping_process end -->

			<!-- delivery_list -->
			<div class="delivery_list">
				<div class="list_head">
					<div class="list_head_title">
						<p>매장 배송 상품</p>
						<p class="item_count">1</p>
					</div>
				</div>

				<div class="list_body">
					<table class="list_body_table" width="100%">
						<tr>
							<th width="auto"></th>
							<th width="44%">상품정보</th>
							<th width="8%">판매가</th>
							<th width="7%">수량</th>
							<th width="10%">할인금액</th>
							<th width="10%">구매가</th>
							<th width="8%">배송비</th>
							<th width="8%">주문</th>
						</tr>
						<tr>
							<td></td>
							<td class="pro_info">
								<div class="pro_img">
									<img alt="사진1"
										src="<%=request.getContextPath() %>/images/food/가브리살(300g).jpg"
										width="100" height="100">
								</div>
								<div class="pro_name">
									<a href="#">가브리살(300g)</a>
								</div>
							</td>
							<td>25800원</td>
							<td><input type="text" name="ea" class="form" size="2"
								value="1" maxlength="2" onblur="numcheck(this.form.ea.value,10)"
								onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};">

								<input type="button" value="▲"
								onclick="up(this.form.ea.value,10)"
								style="background-color: white; border: 0; height: 10px; font-size: 12px"
								name="plus"><br> <input type="button" value="▼"
								onclick="down(this.form.ea.value)"
								style="background-color: white; border: 0; height: 10px; font-size: 12px"
								name="minus"></td>

							<td>-</td>
							<td style="color: red;">25800원</td>
							<td>2500원</td>
							<td><input
								style="border: 1px; solid: maroon; background: transparent;"
								class="w3-border w3-border-grey w3-white w3-center w3-margin-top"
								type="button" value="삭제">
								<p>
									<input
										style="border: 1px; solid: maroon; background: transparent;"
										class="w3-border w3-border-grey w3-white w3-center"
										type="button" value="계속담기"></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- delivery_list end -->


			<!-- paysum_wrap -->
			<div class="paysum_wrap">
				<div class="paysum">
					<ul>
						<li>
							<dl>
								<dt>판매가</dt>
								<dd>0원</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>할인금액</dt>
								<dd>0원</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>배송비</dt>
								<dd>0원</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주문금액</dt>
								<dd style="color: red;">0원</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<!-- paysum_wrap end -->

			<div>
				<center>
					<input style="border: 1px; solid: maroon; background: transparent; font-size:13px;"
						class="w3-button w3-hover-black w3-border w3-border-grey w3-white w3-center"
						 type="submit" value="결제하기">
				</center>
			</div>
		</div>
		<!-- basket_wrap end -->
	</form>
</body>
</html>