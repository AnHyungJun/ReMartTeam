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
	margin-left:-16px;
	background-color: #ffffff;
}

.dropdown_shopping ul li:hover ul {
	display: block;
	z-index: 10000;
}

.dropdown_shopping ul ul li {
	float: none;
	width: 225px;
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
					<div class="w3-cell"
						style="display: inline; width: 24.85%; height: 310px; float: left; border: 1px solid #ddd; margin-left: 1px; margin-bottom: 1px;">
						
						<c:if test="${articleFood.type eq '0' }">
						<img alt="사진"
							src="<%=request.getContextPath() %>/images/food/${articleFood.name }.jpg"
							width="80%" style="margin-top: 8px;">
							
						</c:if>	
						<c:if test="${articleFood.type ne '0' }">
						<img alt="사진"
							src="<%=request.getContextPath() %>/fileSave/${articleFood.type }"
							width="80%" style="margin-top: 8px;">
							
						</c:if>	
						<p style="font-size: 13px;">${articleFood.name }</p>
						<p style="font-size: 13px;">${articleFood.price }원</p>
						<form method="post" name="<%=request.getContextPath() %>/shopping/food_form" action="shoppingPro">
							<div class="__count_range">
								<div class="w3-row w3-border w3-left"
									style="width: 100px; margin-left: 20px;">
									<input type="button" value="-" count_range="m"
										class="count_btn w3-white" style="width: 20px;"> <input
										class="count w3-center" value="1" readonly="" name="food_num"
										style="width: 40px; height: 30px;" id="food_num"> <input
										type="button" value="+" class="count_btn w3-white"
										count_range="p" style="width: 25px; font-size:9px;">
								</div>
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
 			
		   var params = "food_id=" + encodeURIComponent(food_id) + "&food_num=" + encodeURIComponent(food_num) + "&id=" + encodeURIComponent(id);
		   sendRequest("<%=request.getContextPath()%>/common/suggestConfirmBasket.jsp", params, displayResult, 'POST');
		}
		
		function displayResult(){
			if(httpRequest.readyState == 4) {
		         if(httpRequest.status == 200) {
	        	 	var resText = httpRequest.responseText;
	        	 	var res =  resText.split(',');
        	 		var food_id = res[1];
		 			var food_num = res[2];
		 			var id = res[3];
		 			
		        	 if(res[0] == 1) {
		        		var q = confirm("동일한 상품이 이미 담겨있습니다. 추가하시겠습니까?");
			         	if (q == true) {
			         		var params = "food_id=" + encodeURIComponent(res[1]) + "&food_num=" + encodeURIComponent(food_num)+ "&id=" + encodeURIComponent(id);
							   sendRequest("<%=request.getContextPath()%>/common/suggestUpdateFoodNumBasket.jsp", params, displayResult2, 'POST');
							location.replace("basket");
				         } else {
				            location.replace("shoppingMain");
				         }
		        	 }else {
		        		 var params = "food_id=" + encodeURIComponent(food_id) + "&food_num=" + encodeURIComponent(food_num)+ "&id=" + encodeURIComponent(id);
						   sendRequest("<%=request.getContextPath()%>/common/suggestFileBasketSearch.jsp", params, displayResult1, 'POST');
						var q = confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
			         	if (q == true) {
				            location.replace("basket");

				         } else {
				            location.replace("shoppingMain");
				         }
		        		 
		        	 }
		         }else {
			            alert("에러: " + httpRequest.status);
		         }
			}
		}
		
		function displayResult1(){}
		function displayResult2(){}
	</script>


</body>
</html>