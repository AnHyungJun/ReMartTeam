<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART ADMIN</title>
<style>
.tiny {
	font-size: 3px;
}

.count {
	border: 0px;
}

.count_btn {
	border: 0px;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<div style="margin-top: 120px;"></div>
	<center>
		<div class="w3-container w3-border w3-center" style="width: 900px;">
			<div style="margin-top: 17px;"></div>
			<div class="w3-row">
				<div class="w3-col" style="width: 45%;">
					<div class="" style="width: 389px; height: 389px;">
						<tr>
							<td></td>
						</tr>
					</div>
					<div style="margin-top: 10px;"></div>

					<tr>
						<td width="330"><input type="file" size="40" maxlength="30"
							name="uploadfile" style="width: 100%;"></td>
					</tr>
				</div>
				<div class="w3-col" style="width: 10%;">&nbsp;</div>
				<div class="w3-display-container w3-col w3-left-align"
					style="width: 45%; font-size: 13px;">
					<div style="margin-top: 30px;"></div>
					코드 <br> <input type="text" size="10" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> 이름<br> <input
						type="text" size="20" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> 가격<br> <input
						type="text" size="10" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> 수량<br>
					<p class="tiny">
					<div class="__count_range">
						<div class="w3-row w3-border w3-border-black w3-left"
							style="width: 100px;">
							<input type="button" value="-" count_range="m"
								class="count_btn w3-white" style="width: 20px; height: 20px;">
							<input class="count w3-center" value="1" readonly=""
								name="food_num" style="width: 40px; height: 20px;" id="food_qty">
							<input type="button" value="+" class="count_btn w3-white"
								count_range="p"
								style="width: 25px; height: 20px; font-size: 9px;">
						</div>
					</div>
					<br> <br> 카테고리
					<p class="tiny"></p>
					<select id="selMainC" class="w3-border w3-border-black">
						<option value="">선택</option>
						<option value="1">과일</option>
						<option value="2">견과</option>
						<option value="3">채소</option>
						<option value="4">수산물</option>
						<option value="5">해산물</option>
						<option value="6">건어물</option>
						<option value="7">과자</option>
						<option value="8">시리얼</option>
						<option value="9">빵</option>
						<option value="10">음료</option>
						<option value="11">주류</option>
						<option value="12">커피</option>
						<option value="13">분유</option>
						<option value="14">쌀</option>
						<option value="15">잡곡</option>
						<option value="16">정육</option>
						<option value="17">계란류</option>
						<option value="19">라면</option>
						<option value="19">통조림</option>
						<option value="20">조미료</option>
						<option value="21">장류</option>
						<option value="22">유제품</option>
						<option value="23">냉동식품</option>
						<option value="24">간편식</option>
						<option value="25">냉장식품</option>
					</select> <br>
					<div style="margin-top: 125px;"></div>
					<div class="w3-display-bottomright" style="font-size: 12px;">
						<input type="submit"
							class="w3-button w3-white w3-border w3-hover-black" value="상품 등록">
						<input type="reset"
							class="w3-button w3-white w3-border w3-hover-light-grey"
							value="취소">
					</div>
				</div>
			</div>
			<div style="margin-top: 17px;"></div>
		</div>
	</center>

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
