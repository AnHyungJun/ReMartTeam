<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</style>
</head>
<body>
<div style="margin-top: 200px"></div>
	<div class="w3-row">
		<div class="w3-col" style="width: 380px">
			<p>&nbsp;</p>
		</div>

		<div class="w3-col" style="width: 1142px;">
			<div class="orderFinish_wrap">
				<!-- shopping_process -->
				<div class="shopping_process">
					<ol class="order">
						<li class="second"><em>01</em> <b>장바구니</b></li>
						<li class="second"><em>02</em> <b>주문결제</b></li>
						<li class="active"><em>03</em> <b>주문완료</b></li>
					</ol>
				</div>
				<!-- shopping_process end -->
				
				<div class="w3-center">
				<h6> <b> 결제가 완료되었습니다 ${memberInfo.id }</b> </h6>
				</div>
				
				<div>
					<a href="historyPayment?payment_id=${payment_id }">결제내역보기</a>
				</div>
			</div>
			
		</div>
		<div class="w3-col" style="width: 380px;">
		<p>&nbsp;</p>
	</div>
	</div>
</body>
</html>