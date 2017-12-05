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
.uploadimg {
	font-size: 7px;
	position: absolute;
	height: 380px;
	width: 380px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: alpha(opacity = 0);
	cursor: pointer;
}

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
		<div class="w3-container w3-border w3-center" style="width: 800px;">
			<div style="margin-top: 25px;"></div>
			<div class="w3-row">
				<div class="w3-col" style="width: 45%; margin-left: 10px;">
					<div class="mySlides">
						<div class="mySlides">
							<img align="center" id="blah1"
								src="<%=request.getContextPath()%>/images/icon/noProduct.png"
								alt="" width="380" height="380" class="" /><br> <br>
							<input type="file" class="uploadimg"
								style="left: 570px; top: 250px; border: solid 4px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()">
						</div>
					</div>
					<div style="margin-top: 10px;"></div>
				</div>
				<div class="w3-col" style="width: 10%;">&nbsp;</div>
				<div class="w3-display-container w3-col w3-left-align"
					style="width: 45%; font-size: 13px; margin-left: 60px;">
					<div class="w3-margin-left" style="margin-top: 30px;">
					코드 <br> <input type="text" size="10" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> 이름<br> <input
						type="text" size="40" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> 가격<br> <input
						type="text" size="20" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> 수량<br>
					<p class="tiny">
					<div class="__count_range">
						<div class="w3-row w3-border w3-border-black w3-left"
							style="width: 100px;">
							<input type="button" value="-" count_range="m"
								class="count_btn w3-white" style="width: 20px; height: 20px;">
							<input class="count w3-center" value="1" readonly=""
								style="width: 40px; height: 20px;"> <input type="button"
								value="+" class="count_btn w3-white" count_range="p"
								style="width: 25px; height: 20px; font-size: 9px;">
						</div>
					</div>
					<br> <br> 카테고리
					<p class="tiny"></p>
					<!-- <select id="selMainC" class="w3-border w3-border-black">
						<option value="">main category</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="selSubC" class="w3-border w3-border-black">
						<option value="">sub category</option>
					</select> <br> -->
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
					</select> <br> </div>
				</div>
			</div>
		</div>
		<div style="margin-top: 15px;"></div>
		<div class="" style="width: 800px; font-size: 12px;">
			<input type="reset"
				class="w3-button w3-white w3-border w3-hover-light-grey w3-right"
				value="취소"> <input type="submit"
				class="w3-button w3-white w3-border w3-hover-black w3-right w3-margin-right"
				value="상품 등록" >
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

		var slideIndex = 1;

		function statefile(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#blah' + slideIndex).attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}

		}
	</script>
</body>
</html>
