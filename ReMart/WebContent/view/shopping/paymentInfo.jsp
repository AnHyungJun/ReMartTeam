<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>

<style type="text/css">
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

	<div style="margin-top: 180px"></div>
	<div class="w3-row">
		<div class="w3-col" style="width: 345px">
			<p>&nbsp;</p>
		</div>

		<div class="w3-col" style="width: 1213px">
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
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">보내는
								분</th>
							<td width="auto" style="padding: 12px 0 10px 20px;"><input
								type="text"
								style="width: 15%; height: 23px; line-height: 20px; text-indent: 4px; border: 1px solid #bbb;"
								value=""></td>
						</tr>
						<tr>
							<th width="15%"
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">휴대폰</th>
							<td width="auto" style="padding: 12px 0 10px 20px;"><input
								type="text"
								style="width: 25%; height: 23px; line-height: 20px; text-indent: 4px; border: 1px solid #bbb;"
								value=""></td>
						</tr>
						<tr>
							<th width="15%"
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">이메일</th>
							<td width="auto" style="padding: 12px 0 10px 20px;"><input
								type="text"
								style="width: 40%; height: 23px; line-height: 20px; text-indent: 4px; border: 1px solid #bbb;"
								value=""></td>
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
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">받는
								분</th>
							<td width="auto" style="padding: 12px 0 10px 20px;"><input
								type="text"
								style="width: 15%; height: 23px; line-height: 28px; text-indent: 4px; border: 1px solid #bbb;"
								value=""></td>
						</tr>
						<tr>
							<th width="15%"
								style="border-right: none; background-color: #fff; font-weight: 100; vertical-align: middle;">휴대폰</th>
							<td width="auto" style="padding: 12px 0 10px 20px;"><input
								type="text"
								style="width: 25%; height: 23px; line-height: 28px; text-indent: 4px; border: 1px solid #bbb;"
								value=""></td>
						</tr>
						<tr>
							<th scope="row" rowspan="3"><label for="zip"
								style="vertical-align: middle;">주소</label></th>
							<td class="bg_none">&nbsp;&nbsp;<input type="text" id='zip1'
								name='zip1' readonly="readonly" style="width: 60px"
								class="w3-border" /> - <input type="text" id='zip2' name='zip2'
								readonly="readonly" style="width: 60px; height: 23px;"
								class="w3-border"></input> <input type="button"
								class="w3-white w3-border"
								style="font-size: 12px; height: 23px;"
								onclick="openDaumPostcode();" value="우편번호"></td>
						</tr>
						<tr>
							<td class="bg_none"><label for="address1" class="tts">기본주소
							</label>&nbsp;&nbsp;<input type="text" id="address1" name="address1"
								class="w3-border" readonly="readonly"
								style="width: 340px; height: 23px; margin-right: 5px" /></td>
						</tr>
						<tr>
							<td><label for="address2" class="tts">상세주소
									&nbsp;&nbsp;</label><input type="text" id="address2" name="address2"
								class="w3-border"
								style="width: 340px; height: 23px; margin-right: 5px" /></td>
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
							<th width="32%" class="w3-center">상품정보</th>
							<th width="11%" class="w3-center">판매가</th>
							<th width="15%" class="w3-center">수량</th>
							<th width="10%" class="w3-center">할인금액</th>
							<th width="10%" class="w3-center">구매가</th>
							<th width="8%" class="w3-center">배송비</th>
							<th width="8%" class="w3-center">주문</th>
						</tr>
						<tr>
							<td></td>
							<td class="pro_info">
								<div class="pro_img">
									<img alt="사진1"
										src="<%=request.getContextPath()%>/images/food/가브리살(300g).jpg"
										width="100" height="100">
								</div>
								<div class="pro_name">
									<a href="#" class="w3-center" style="vertical-align: middle;">가브리살
										(300g)</a>
								</div>
							</td>
							<td class="w3-center"
								style="font-size: 14px; vertical-align: middle;">25800원</td>
							<td class="w3-center" style="vertical-align: middle;"><input
								type="text" style="width: 30px;" name="ea" class="form" size="2"
								value="1" maxlength="2" onblur="numcheck(this.form.ea.value,10)"
								onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};">

								<input type="button" value="▲"
								onclick="up(this.form.ea.value,10)"
								style="background-color: white; border: 0; height: 10px; font-size: 12px"
								name="plus"><br> <input type="button" value="▼"
								onclick="down(this.form.ea.value)"
								style="background-color: white; border: 0; height: 10px; font-size: 12px"
								name="minus"></td>

							<td class="w3-center"
								style="font-size: 14px; vertical-align: middle;">-</td>
							<td class="w3-center"
								style="color: red; font-size: 14px; vertical-align: middle;">25800원</td>
							<td class="w3-center"
								style="font-size: 14px; vertical-align: middle;">2500원</td>
							<td style="vertical-align: middle;"><input type="button"
								class="w3-button w3-white w3-hover-white"
								style="font-size: 12px; width: 100px;" value="삭제">
								<p>
									<input type="button" class="w3-button w3-white w3-hover-white"
										style="font-size: 12px; width: 100px;" value="계속담기"></td>
						</tr>
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
									<dd style="font-size: 16px;">0원</dd>
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
									<dd style="font-size: 16px;">0원</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt style="font-size: 15px;">주문금액</dt>
									<br>
									<dd style="color: red; font-size: 16px;">0원</dd>
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
								type="checkbox" name="pay_method" value="신용카드"
								style="vertical-align: middle;">&nbsp;신용카드&nbsp;&nbsp;&nbsp;
								<input type="checkbox" name="pay_method" value="실시간계좌이체"
								style="vertical-align: middle;">&nbsp;실시간계좌이체&nbsp;&nbsp;&nbsp;
								<input type="checkbox" name="pay_method" value="가상계좌"
								style="vertical-align: middle;">&nbsp;가상계좌</td>
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

		<div class="w3-col" style="width: 345px">
			<p>&nbsp;</p>
		</div>
	</div>
	<div style="margin-bottom: 50px"></div>
</body>
</html>