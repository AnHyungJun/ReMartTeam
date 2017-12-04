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
	font-size: 20px;
	font-weight: 700;
	padding-right: 30px;
	padding-left: 0;
}

.paysum li:first-child {
	border: 0;
}

.pay {
	
}

.tiny {
	font-size: 2px;
}

.count {
	border: 0px;
}

.count_btn {
	border: 0px;
}

</style>
</head>
<body>

	<div style="margin-top: 200px"></div>

	<div class="w3-row">
		<div class="w3-col" style="width: 380px;">
			<p>&nbsp;</p>
		</div>

		<div class="w3-col" style="width: 1142px;">
			<!-- basket_wrap -->
			<div class="basket_wrap">
				<!-- shopping_process -->
				<div class="shopping_process">
					<ol class="order">
						<li class="active"><em>01</em> <b>장바구니</b></li>
						<li class="second"><em>02</em> <b>주문결제</b></li>
						<li><em>03</em> <b>주문완료</b></li>
					</ol>
				</div>
				<!-- shopping_process end -->

				<!-- delivery_list -->
				<div class="delivery_list">
					<div class="list_head">
						<div class="list_head_title">
							<p style="vertical-align: middle;">매장 배송 상품</p>
							<p class="item_count">${count }</p>
						</div>
					</div>

					<div class="list_body">
						<table class="list_body_table" width="100%">
							<tr style="border-top: 1px solid #666; font-size: 13px;">
								<th width="auto"></th>
								<th width="35%" class="w3-center">상품정보</th>
								<th width="12%" class="w3-center">판매가</th>
								<th width="15%" class="w3-center">수량</th>
								<th width="10%" class="w3-center">할인금액</th>
								<th width="12%" class="w3-center">구매가</th>
								<th width="10%" class="w3-center">주문</th>
							</tr>

							<c:set var="totalPrice" value="0" />
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
											<a href="#" class="w3-center"
												style="vertical-align: middle;">${articleBasket.bname }</a>
										</div>
									</td>
									<td class="w3-center"
										style="font-size: 14px; vertical-align: middle;">${articleBasket.bprice }원</td>
									<td class="w3-center"
										style="font-size: 14px; vertical-align: middle;">
										<form method="post" name="update_foodNum" action="updateNumPro">
											<input type="hidden" name="basket_id"
												value="${articleBasket.basket_id }">
											<div class="__count_range">
												<div class="w3-row w3-border w3-left"
													style="width: 100px; margin-left: 20px;">
													<input type="button" value="-" count_range="m"
														class="count_btn w3-white" style="width: 20px;">
													<input class="count w3-center" value="${articleBasket.food_num }" readonly=""
														name="food_num" style="width: 40px; height: 30px;"
														id="food_num"> 
													<input type="button" value="+"
														class="count_btn w3-white" count_range="p"
														style="width: 25px;">
												</div>
												<input type="submit"
													class="w3-white w3-border w3-border-white w3-center"
													style="font-size: 13px; width: 100px; margin-top: 8px;"
													value="변경  ">
											</div>
										</form>
									</td>

									<td class="w3-center"
										style="font-size: 14px; vertical-align: middle;">-</td>
									<td class="w3-center"
										style="font-size: 14px; vertical-align: middle; color: red;">
										${articleBasket.bprice*articleBasket.food_num }원</td>
									<td><input type="button"
										class="w3-button w3-black w3-hover-black"
										style="font-size: 11px; width: 80px;" value="계속담기"
										onclick="document.location.href='shoppingMain'">
										<p class="tiny">
											<input type="button"
												class="w3-button w3-light-grey w3-hover-light-grey"
												style="font-size: 11px; width: 80px;" value="삭제"
												onclick="document.location.href='deleteBasket?basket_id=${articleBasket.basket_id}'"></td>
								</tr>
								<c:set var="totalPrice"
									value="${totalPrice + (articleBasket.bprice*articleBasket.food_num) }" />
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- delivery_list end -->


				<!-- paysum_wrap -->
				<br> <br>
				<div class="paysum_wrap">
					<div class="paysum" style="vertical-align: middle;">
						<ul>
							<li>
								<dl>
									<dt style="font-size: 15px;">판매가</dt>
									<br>

									<dd style="font-size: 16px;">
										<c:out value="${totalPrice }" />
										원
									</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt style="font-size: 15px;">할인금액</dt>
									<br>
									<dd style="font-size: 16px;">0원</dd>
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
									<dd style="color: red; font-size: 16px;">${totalPrice+2500 }원</dd>
								</dl>
							</li>
						</ul>
					</div>
				</div>
				<br> <br> <br>
				<!-- paysum_wrap end -->
				<form action="paymentInfo" method="post">
				<div class="w3-center">
					<input type="submit" value="결제하기" style="font-size: 13px;"
						class="w3-button w3-black w3-hover-red"/>
				</div>
				</form>
			</div>
			<!-- basket_wrap end -->
			
		</div>
		<div class="w3-col" style="width: 380px;">
			<p>&nbsp;</p>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			$('.__count_range input[count_range]').click(function(e) {
				e.preventDefault();
				var type = $(this).attr('count_range');
				var $count = $(this).parent().children('input.count');
				var count_val = $count.val(); // min 1
				if (type == 'm') {
					if (count_val < 1) {
						return;
					}
					$count.val(parseInt(count_val) - 1);
				} else if (type == 'p') {
					$count.val(parseInt(count_val) + 1);
				}
			});
		});
	</script>






</body>
</html>