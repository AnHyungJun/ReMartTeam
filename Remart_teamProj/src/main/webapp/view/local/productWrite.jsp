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
		<!-- form���� name �̸� �ٲ�� �Ǹ� �Ʒ� �ڹٽ�ũ��Ʈ �κ� �ٲ�� �� -->
		<form action="<%=request.getContextPath() %>/admin/productWritePro" name="productWrite" method="POST" enctype="multipart/form-data">
			<div class="w3-container w3-border w3-center" style="width: 800px;">
				<div style="margin-top: 17px;"></div>
				<div class="w3-row">
					<div class="w3-col" style="width: 45%;">
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
					<div class="w3-col" style="width: 10%;">&nbsp;</div>
					<div class="w3-display-container w3-col w3-left-align"
						style="width: 45%; font-size: 13px; marign-left:100px;">
						<div style="margin-top: 30px;"></div>
						�̸�<br> <input
							type="text" size="20" height="20"
							class="w3-margin-bottom w3-border w3-border-black" name="name"
							style="font-size: 13px;"><br> ����<br> <input
							type="text" size="10" height="20"
							class="w3-margin-bottom w3-border w3-border-black" name="price"
							style="font-size: 13px;"><br> ����<br>
						<p class="tiny">
						<div class="__count_range">
							<div class="w3-row w3-border w3-border-black w3-left"
								style="width: 100px;">
								<input type="button" value="-" count_range="m"
									class="count_btn w3-white" style="width: 20px; height: 20px;">
								<input class="count w3-center" value="1" readonly=""
									name="qty" style="width: 40px; height: 20px;"
									> <input type="button" value="+"
									class="count_btn w3-white" count_range="p"
									style="width: 25px; height: 20px; font-size: 9px;">
							</div>
						</div>
						<br> <br> ī�װ�
						<p class="tiny"></p>
						<select name="main"
							onChange="showSub(this.options[this.selectedIndex].value);">
							<option value="">main category</option>
							<option value="m1">����/�߰�/ä��</option>
							<option value="m2">���깰/�ػ깰/�Ǿ</option>
							<option value="m3">����/�ø���/��</option>
							<option value="m4">����/�ַ�/Ŀ��/����</option>
							<option value="m5">��/���</option>
							<option value="m6">����/�����</option>
							<option value="m7">���/������/���̷�/���</option>
							<option value="m8">����ǰ/�õ��������ǰ/�����</option>
						</select> <select id="selMainC" class="w3-border w3-border-black"
							name="SUB1" style="display:;" onchange="aaa(this.value)">
							<option value="">sub category</option>
							<option value="1">����</option>
							<option value="2">�߰�</option>
							<option value="3">ä��</option>
						</select> <select id="selMainC" class="w3-border w3-border-black"
							name="SUB2" style="display: none;" onchange="aaa(this.value)">
							<option value="">sub category</option>
							<option value="4">���깰</option>
							<option value="5">�ػ깰</option>
							<option value="6">�Ǿ</option>
						</select> <select id="selMainC" class="w3-border w3-border-black"
							name="SUB3" style="display: none;" onchange="aaa(this.value)">
							<option value="">sub category</option>
							<option value="7">����</option>
							<option value="8">�ø���</option>
							<option value="9">��</option>
						</select> <select id="selMainC" class="w3-border w3-border-black"
							name="SUB4" style="display: none;" onchange="aaa(this.value)">
							<option value="">sub category</option>
							<option value="10">����</option>
							<option value="11">�ַ�</option>
							<option value="12">Ŀ��</option>
							<option value="13">����</option>
						</select> <select id="selMainC" class="w3-border w3-border-black"
							name="SUB5" style="display: none;" onchange="aaa(this.value)">
							<option value="">sub category</option>
							<option value="14">��</option>
							<option value="15">���</option>
						</select> <select id="selMainC" class="w3-border w3-border-black"
							name="SUB6" style="display: none;" onchange="aaa(this.value)">
							<option value="">sub category</option>
							<option value="16">����</option>
							<option value="17">�����</option>
						</select> <select id="selMainC" class="w3-border w3-border-black"
							name="SUB7" style="display: none;" onchange="aaa(this.value)">
							<option value="">sub category</option>
							<option value="19">���</option>
							<option value="19">������</option>
							<option value="20">���̷�</option>
							<option value="21">���</option>
						</select> <select id="selMainC" class="w3-border w3-border-black"
							name="SUB8" style="display: none;" onchange="aaa(this.value)">
							<option value="">sub category</option>
							<option value="22">����ǰ</option>
							<option value="23">�õ���ǰ</option>
							<option value="24">�����</option>
							<option value="25">�����ǰ</option>
						</select>
					</div>
				</div>
				
			</div>
			<div style="margin-top: 15px;"></div>
			<div class="" style="width: 800px; font-size: 12px;">
			<input type="reset"
				class="w3-button w3-white w3-border w3-hover-light-grey w3-right"
				value="���"> <input type="submit"
				class="w3-button w3-white w3-border w3-hover-black w3-right w3-margin-right"
				value="��ǰ ���" >
		</div>
		<input type="hidden" name="category_id" id="category_id">
		</form>
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

		function aaa(str) {
			alert(str);
			document.getElementById('category_id').value = str;
			var f = document.forms.productWrite;
			f.item.value = str;
		}

		function showSub(obj) {
			f = document.forms.productWrite;

			if (obj == "m1") {
				f.SUB1.style.display = "";
				f.SUB2.style.display = "none";
				f.SUB3.style.display = "none";
				f.SUB4.style.display = "none";
				f.SUB5.style.display = "none";
				f.SUB6.style.display = "none";
				f.SUB7.style.display = "none";
				f.SUB8.style.display = "none";
			} else if (obj == "m2") {
				f.SUB1.style.display = "none";
				f.SUB2.style.display = "";
				f.SUB3.style.display = "none";
				f.SUB4.style.display = "none";
				f.SUB5.style.display = "none";
				f.SUB6.style.display = "none";
				f.SUB7.style.display = "none";
				f.SUB8.style.display = "none";
			} else if (obj == "m3") {
				f.SUB1.style.display = "none";
				f.SUB2.style.display = "none";
				f.SUB3.style.display = "";
				f.SUB4.style.display = "none";
				f.SUB5.style.display = "none";
				f.SUB6.style.display = "none";
				f.SUB7.style.display = "none";
				f.SUB8.style.display = "none";
			} else if (obj == "m4") {
				f.SUB1.style.display = "none";
				f.SUB2.style.display = "none";
				f.SUB3.style.display = "none";
				f.SUB4.style.display = "";
				f.SUB5.style.display = "none";
				f.SUB6.style.display = "none";
				f.SUB7.style.display = "none";
				f.SUB8.style.display = "none";
			} else if (obj == "m5") {
				f.SUB1.style.display = "none";
				f.SUB2.style.display = "none";
				f.SUB3.style.display = "none";
				f.SUB4.style.display = "none";
				f.SUB5.style.display = "";
				f.SUB6.style.display = "none";
				f.SUB7.style.display = "none";
				f.SUB8.style.display = "none";
			} else if (obj == "m6") {
				f.SUB1.style.display = "none";
				f.SUB2.style.display = "none";
				f.SUB3.style.display = "none";
				f.SUB4.style.display = "none";
				f.SUB5.style.display = "none";
				f.SUB6.style.display = "";
				f.SUB7.style.display = "none";
				f.SUB8.style.display = "none";
			} else if (obj == "m7") {
				f.SUB1.style.display = "none";
				f.SUB2.style.display = "none";
				f.SUB3.style.display = "none";
				f.SUB4.style.display = "none";
				f.SUB5.style.display = "none";
				f.SUB6.style.display = "none";
				f.SUB7.style.display = "";
				f.SUB8.style.display = "none";
			} else if (obj == "m8") {
				f.SUB1.style.display = "none";
				f.SUB2.style.display = "none";
				f.SUB3.style.display = "none";
				f.SUB4.style.display = "none";
				f.SUB5.style.display = "none";
				f.SUB6.style.display = "none";
				f.SUB7.style.display = "none";
				f.SUB8.style.display = "";
			}
		}
	</script>
</body>
</html>
