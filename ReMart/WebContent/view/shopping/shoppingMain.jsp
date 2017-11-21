<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	cursor: pointer
}

img {
	margin-top: 15px;
	margin-bottom: 15px;
}

.dropdown_shopping {
	
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
	margin-top: 150px;
}
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    $('.__count_range input[count_range]').click(function(e){
        e.preventDefault();
        var type = $(this).attr('count_range');
        var $count = $(this).parent().children('input.count');
        var count_val = $count.val(); // min 1
        if(type=='m'){
            if(count_val<1){
                return;
            }
            $count.val(parseInt(count_val)-1);
        }else if(type=='p'){
            $count.val(parseInt(count_val)+1);
        }
    });
});



function numcheck(val,jaego){
                      if (val>jaego-1){
                              alert("재고량이 없습니다")
                              document.frm.ea.value=jaego}
                      else if (val<2){
                              document.frm.ea.value=1        }
      }
function up(val,jaego){
                      if (val>jaego-1){
                              alert("재고량이 없습니다")
                              document.frm.ea.value=jaego}
                      else{
                              document.frm.ea.value=(val/1)+1}
}
                                                       
function down(val){
                      if (val<2){
                              document.frm.ea.value=1}
                      else{
                              document.frm.ea.value=val-1}
}

</script>
</head>
<body>

	<div style="margin-top: 180px"></div>

	<!-- shopping_wrap -->
	<div align="center" class="shopping_wrap">
		<!-- dropdown_shopping -->
		<div class="dropdown_shopping" style="width: 900px">
			<ul>
				<li><a href="#">과일/견과/채소</a>
					<ul>
						<li><a href="#">과일</a></li>
						<li><a href="#">견과</a></li>
						<li><a href="#">채소</a></li>
					</ul></li>

				<li><a href="#">수산물/해산물/건어물</a>
					<ul>
						<li><a href="#">수산물</a></li>
						<li><a href="#">해산물</a></li>
						<li><a href="#">건어물</a></li>
					</ul></li>
				<li><a href="#">과자/시리얼/빵</a>
					<ul>
						<li><a href="#">과자</a></li>
						<li><a href="#">시리얼</a></li>
						<li><a href="#">빵</a></li>
					</ul></li>

				<li style="border-right: 1px solid #ddd;"><a href="#">음료/주류/커피/분유</a>
					<ul>
						<li><a href="#">음료</a></li>
						<li><a href="#">주류</a></li>
						<li><a href="#">커피</a></li>
						<li><a href="#">분유</a></li>
					</ul></li>

				<li><a href="#">쌀/잡곡</a>
					<ul>
						<li><a href="#">쌀</a></li>
						<li><a href="#">잡곡</a></li>
					</ul></li>

				<li><a href="#">정육/계란류</a>
					<ul>
						<li><a href="#">정육</a></li>
						<li><a href="#">계란류</a></li>
					</ul></li>

				<li><a href="#">라면/통조림/조미료/장류</a>
					<ul>
						<li><a href="#">라면</a></li>
						<li><a href="#">통조림</a></li>
						<li><a href="#">조미료</a></li>
						<li><a href="#">장류</a></li>
					</ul></li>

				<li style="border-right: 1px solid #ddd;"><a href="#">유제품/냉동식품/간편식</a>
					<ul>
						<li><a href="#">유제품</a></li>
						<li><a href="#">냉동식품</a></li>
						<li><a href="#">간편식</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- dropdown_shopping end -->

		<div class="shopping_list">
			<div class="w3-border"
				style="width: 25%; height: 350px; float: left; border-collapse: collapse;">
				<img alt="사진1"
					src="<%=request.getContextPath() %>/images/food/가브리살(300g).jpg"
					width="80%">
					<center>
				<h5>가브리살(300g)</h5>
				<h3>25800원</h3>
				</center>
				<!-- <div class="__count_range">
			  <input value="-" count_range="m" type="button">
			  <input class="count" value="1" readonly="" name="">
			  <input value="+" count_range="p" type="button">
			</div> -->

				<div>
					<form action="basket" name="frm">
						<table align="left" style="margin-left: 20px;">
							<tr>
								<td><input type="text" name="ea" class="form" size="2"
									value="1" maxlength="2"
									onblur="numcheck(this.form.ea.value,10)"
									onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};"
									style="font-size: 15px;">
								</td>
								<td valign="middle" height="30"><input type="button"
									value="▲" onclick="up(this.form.ea.value,10)"
									style="background-color: white; border: 0; height: 10px; font-size: 12px"
									name="plus"><br> <input type="button" value="▼"
									onclick="down(this.form.ea.value)"
									style="background-color: white; border: 0; height: 10px; font-size: 12px"
									name="minus"></td>
								<td><input type="submit" class="w3-white w3-border w3-border-black"
									style="font-size: 16px;" value="장바구니"></td>
							</tr>
						</table>
					</form>
				</div>


			</div>
			<div class="w3-border"
				style="width: 25%; height: 350px; float: left; border-collapse: collapse;">
				<img alt="사진1"
					src="<%=request.getContextPath() %>/images/food/가브리살(300g).jpg"
					width="80%">
				<center>
				<h5>가브리살(300g)</h5>
				<h3>25800원</h3>
				</center>
				<div>
					<form action="basket" name="frm">
						<table align="left" style="margin-left: 20px;">
							<tr>
								<td><input type="text" name="ea" class="form" size="2"
									value="1" maxlength="2"
									onblur="numcheck(this.form.ea.value,10)"
									onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};"
									style="font-size: 15px;">
								</td>
								<td valign="middle" height="30"><input type="button"
									value="▲" onclick="up(this.form.ea.value,10)"
									style="background-color: white; border: 0; height: 10px; font-size: 12px"
									name="plus"><br> <input type="button" value="▼"
									onclick="down(this.form.ea.value)"
									style="background-color: white; border: 0; height: 10px; font-size: 12px"
									name="minus"></td>
								<td><input type="submit" class="w3-white w3-border w3-border-black"
									style="font-size: 16px;" value="장바구니"></td>
							</tr>
						</table>
					</form>
				</div>


			</div>
			<div class="w3-border"
				style="width: 25%; height: 350px; float: left; border-collapse: collapse;">




			</div>
			<div class="w3-border"
				style="width: 25%; height: 350px; float: left; border-collapse: collapse;">




			</div>
			<div class="w3-border"
				style="width: 25%; height: 350px; float: left; border-collapse: collapse;">




			</div>



		</div>






















	</div>
	<!-- shopping_wrap end -->
</body>
</html>