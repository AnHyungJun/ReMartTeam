<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script   type = "text/javascript" 
	src = "<%=request.getContextPath() %>/ajax/httpRequest.js">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART</title>
<style>
a {
	text-decoration: none;
	cursor: pointer;
}

.dropdown_shopping ul {
	border-top: 2.5px solid #ccc;
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.dropdown_shopping ul li {
	width: 25%;
	float: left;
	border-left: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 8px 16px;
}

.dropdown_shopping ul li a {
	display: block;
}

.dropdown_shopping ul ul {
	border: 1px solid #ddd;
	display: none;
	position: absolute;
	margin-top: 8px;
	background-color: #ffffff;
}

.dropdown_shopping ul li:hover ul {
	display: block;
	z-index: 10000;
}

.dropdown_shopping ul ul li {
	float: none;
	width: 200px;
}

.shopping_list {
	width: 900px;
	margin-top: 100px;
}

.count {
	border: 0px;
}

.count_btn {
	border: 0px;
}
.btn_basket {
	background-image: url("<%=request.getContextPath()%>/images/icon/cart.png");
	cursor: pointer;
}
</style>

</head>
<body>

	<div style="margin-top: 200px"></div>

	<!-- shopping_wrap -->
	<center>
		<div class="shopping_wrap">

			<div class="shopping_list">

				<c:forEach var="articleFood" items="${searchList}">
					<div class="w3-border"
						style="width: 25%; height: 310px; float: left; border-collapse: collapse;">
						<img alt="사진"
							src="<%=request.getContextPath() %>/images/food/${articleFood.name }.jpg"
							width="80%" style="margin-top: 8px;">
						<p style="font-size: 13px;">${articleFood.name }</p>
						<p style="font-size: 13px;">${articleFood.price }원</p>
						<form method="post" name="food_form" action="<%=request.getContextPath() %>/shopping/shoppingPro">
							<div class="__count_range">
								<div class="w3-row w3-border w3-left"
									style="width: 100px; margin-left: 20px;">
									<input type="button" value="-" count_range="m"
										class="count_btn w3-white" style="width: 20px;"> <input
										class="count w3-center" value="1" readonly="" name="food_num"
										style="width: 40px; height: 30px;" id="food_num"> <input
										type="button" value="+" class="count_btn w3-white"
										count_range="p" style="width: 25px;">
								</div>
								<!-- <input type="button" class="w3-white w3-border w3-border-black" 
									style="font-size: 16px; width: 50%; margin-top: 8px;" value="장바" 
									name="confirm_basket" onclick="inputbasket(this.form)"> -->
								<input type="button" class="btn_basket w3-black w3-round w3-border w3-border-black" 
									style="font-size: 16px; margin-top: 8px; width:40px; height:30px"
									name="confirm_basket" onclick="inputbasket(this.form)">
								
							</div>
							<input type="hidden" name="id" value="${memberInfo.id }">
							<input type="hidden" name="food_id" value="${articleFood.food_id }">
						</form>
					</div>
				</c:forEach>
			</div>



		</div>
		<!-- shopping_wrap end -->
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
		
		function inputbasket(thisform){
			   
			   var food_id = thisform.food_id.value;
			   var food_num = thisform.food_num.value;
			   var id = thisform.id.value;
			   
			   var params = "food_id=" + encodeURIComponent(food_id) + "&food_num=" + encodeURIComponent(food_num)+ "&id=" + encodeURIComponent(id);
			   sendRequest("<%=request.getContextPath()%>/common/suggestFileBasketSearch.jsp", params, displayResult, 'POST');
			   var q = confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
	         	if (q == true) {
		            location.replace("<%=request.getContextPath() %>/shopping/basket");

		         } else {
		            location.replace("shoppingMain");
		         }
			}
		
		function displayResult(){ }
	</script>


</body>
</html>