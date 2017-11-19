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
    font-size: 22px;
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

.pro_name a{
	overflow: hidden;
    max-height: 37px;
    margin: -2px 0 0 0;
    color: #111;
    font-size: 14px;
    font-weight: 700;
    line-height: 7;
    letter-spacing: 0;	/*글자 사이 간격 */
    text-decoration: none;
}
.paysum_wrap {
    margin-bottom: 15px;
    border: 2px solid #25211e;
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

<div style="margin-top: 150px"></div>

<!-- paymentInfo -->
<div class="paymentInfo" style="margin-left: 50px; margin-right: 50px;">
	<h2>주문자 정보</h2>
	<div class="info_area">
	<table class="w3-table w3-bordered">
		<tr style="border-top: 1px solid #666">
			<th width="15%" style="border-right: none; background-color: #fff; font-weight: 100;">보내는 분</th>
			<td width="auto" style="padding: 12px 0 10px 20px;">
				<input type="text" style="width: 100%; height: 28px; line-height: 28px; text-indent: 4px; border: 1px solid #bbb;" value="정지은">
			</td>
		</tr>
		<tr>
			<th width="15%" style="border-right: none; background-color: #fff; font-weight: 100;">휴대폰</th>
			<td width="auto" style="padding: 12px 0 10px 20px;">
				<input type="text" style="width: 100%; height: 28px; line-height: 28px; text-indent: 4px; border: 1px solid #bbb;" value="0101234567">
			</td>
		</tr>
		<tr>
			<th width="15%" style="border-right: none; background-color: #fff; font-weight: 100;">이메일</th>
			<td width="auto" style="padding: 12px 0 10px 20px;">
				<input type="text" style="width: 100%; height: 28px; line-height: 28px; text-indent: 4px; border: 1px solid #bbb;" value="recipe@recipe.com">
			</td>
		</tr>
	</table>
	</div>
	<br/>
	
	<h2>배송지 정보</h2>
	<div class="info_area">
	<table class="w3-table w3-bordered">
		<tr style="border-top: 1px solid #666">
			<th width="15%" style="border-right: none; background-color: #fff; font-weight: 100;">받는 분</th>
			<td width="auto" style="padding: 12px 0 10px 20px;">
				<input type="text" style="width: 100%; height: 28px; line-height: 28px; text-indent: 4px; border: 1px solid #bbb;" value="정지은">
			</td>
		</tr>
		<tr>
			<th width="15%" style="border-right: none; background-color: #fff; font-weight: 100;">휴대폰</th>
			<td width="auto" style="padding: 12px 0 10px 20px;">
				<input type="text" style="width: 100%; height: 28px; line-height: 28px; text-indent: 4px; border: 1px solid #bbb;" value="0101234567">
			</td>
		</tr>
		<tr>
			<th width="15%" style="border-right: none; background-color: #fff; font-weight: 100;">주소</th>
			<td width="auto" style="padding: 12px 0 10px 20px;">
				<input type="text" style="width: 100%; height: 28px; line-height: 28px; text-indent: 4px; border: 1px solid #bbb;" value="">
			</td>
		</tr>
	</table>
	</div>
	<br/>
	
	<h2>주문 상품</h2>
	<div class="info_area">
			<table class="w3-table w3-bordered" width="100%">
				<tr style="border-top: 1px solid #666">
					<th width="auto"></th>
					<th width="44%">상품정보</th>
					<th width="8%">판매가</th>
					<th width="7%">수량</th>
					<th width="10%">할인금액</th>
					<th width="10%">구매가</th>
					<th width="8%">배송정보</th>
					<th width="8%">주문</th>
				</tr>
				<tr>
					<td> </td>
					<td class="pro_info">
						<div class="pro_img"><img alt="사진1" src="<%=request.getContextPath() %>/images/food/가브리살(300g).jpg" width="100" height="100"></div>
						<div class="pro_name"><a href="#">가브리살(300g)</a></div>
					</td>
					<td>
						25800원
					</td>
					<td>
                 		<input type="text" name="ea" class="form" size="2" value="1" maxlength="2" onblur="numcheck(this.form.ea.value,10)" onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};">
                 		
                 		<input type="button" value="▲" onclick="up(this.form.ea.value,10)" style="background-color:white;border:0; height:10px;font-size:12px" name="plus"><br>
                 		<input type="button" value="▼" onclick="down(this.form.ea.value)" style="background-color:white;border:0; height:10px;font-size:12px" name="minus">
                 	</td>
                 	
                 	<td>
                 	-
                 	</td>
                 	<td style="color: red;">
                 	25800원
                 	</td>
                 	<td>
                 	2500원
                 	</td>
                 	<td>
                 		<input type="button" value="삭제">
                 		<p>
                 		<input type="button" value="계속담기">
                 	</td>
				</tr>
			</table>
		</div>
		
		<!-- paysum_wrap -->
	<div class="paysum_wrap">
		<div class="paysum">
		<ul>
			<li>
				<dl>
					<dt>판매가</dt>
					<dd>
						0원
					</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>할인금액</dt>
					<dd>
						0원
					</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>배송비</dt>
					<dd>
						0원
					</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>주문금액</dt>
					<dd style="color: red;">
						0원
					</dd>
				</dl>
			</li>
		</ul>
		</div>
	</div><!-- paysum_wrap end -->
	<br/>
	
	<h2>결제수단 선택</h2>
	<div class="info_area">
	<table class="w3-table w3-bordered" >
		<tr style="border-top: 1px solid #666">
			<th width="15%" style="border-right: none; background-color: #fff; font-weight: 100;">결제 수단</th>
			<td width="auto" style="padding: 12px 0 10px 20px;">
				<input type="checkbox" name="pay_method" value="신용카드">&nbsp;신용카드&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="pay_method" value="실시간계좌이체">&nbsp;실시간계좌이체&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="pay_method" value="가상계좌">&nbsp;가상계좌
			</td>
			<td width="20%">
				<input type="submit" value="결제하기">
			</td>
		</tr>
	</table>
	</div>
	
	
	
</div><!-- paymentInfo end -->




</body>
</html>