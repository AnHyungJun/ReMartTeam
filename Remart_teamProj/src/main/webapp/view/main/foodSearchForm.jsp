<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART</title>
<style>
a {
	text-decoration: none;
	cursor: pointer
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
</style>

</head>
<body>

	<div style="margin-top: 200px"></div>
	
	<!-- shopping_wrap -->
	<center>
		<div class="shopping_wrap">
			
			<div class="shopping_list">
				<h2>푸드</h2>
				<c:forEach var="articleFood" items="${searchList}">
					<div class="w3-border"
						style="width: 25%; height: 310px; float: left; border-collapse: collapse;">
						<img alt="사진"
							src="<%=request.getContextPath() %>/images/food/${articleFood.name }.jpg"
							width="80%" style="margin-top: 8px;">
						<p style="font-size: 13px;">${articleFood.name }</p>
						<p style="font-size: 13px;">${articleFood.price }원</p>
						<form method="post" name="food_form" action="<%=request.getContextPath() %>/shopping/shoppingPro">
							<input type="hidden" name="food_id"
								value="${articleFood.food_id }">
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
								<input type="image"
									class="w3-black w3-round w3-border w3-border-black"
									src="<%=request.getContextPath()%>/images/icon/cart.png"
									style="font-size: 13px;" value="" name="confirm_basket">
							</div>
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

		function openConfirmBasket(food_form) {
			/* url = "confirmBasket?food_id=" + encodeURIComponent(food_form.food_id.value) */
			open("confirmBasket", "confirmbasket",
					"toolbar = no, location=no, status= no, menubar = no, "
							+ "resizable=no, width = 1000, height = 1000");
		}
	</script>


</body>
</html>