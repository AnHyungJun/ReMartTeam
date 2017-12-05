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
					�ڵ� <br> <input type="text" size="10" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> �̸�<br> <input
						type="text" size="20" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> ����<br> <input
						type="text" size="10" height="20"
						class="w3-margin-bottom w3-border w3-border-black" name=""
						style="font-size: 13px;"><br> ����<br>
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
					<br> <br> ī�װ�
					<p class="tiny"></p>
					<select id="selMainC" class="w3-border w3-border-black">
						<option value="">����</option>
						<option value="1">����</option>
						<option value="2">�߰�</option>
						<option value="3">ä��</option>
						<option value="4">���깰</option>
						<option value="5">�ػ깰</option>
						<option value="6">�Ǿ</option>
						<option value="7">����</option>
						<option value="8">�ø���</option>
						<option value="9">��</option>
						<option value="10">����</option>
						<option value="11">�ַ�</option>
						<option value="12">Ŀ��</option>
						<option value="13">����</option>
						<option value="14">��</option>
						<option value="15">���</option>
						<option value="16">����</option>
						<option value="17">�����</option>
						<option value="19">���</option>
						<option value="19">������</option>
						<option value="20">���̷�</option>
						<option value="21">���</option>
						<option value="22">����ǰ</option>
						<option value="23">�õ���ǰ</option>
						<option value="24">�����</option>
						<option value="25">�����ǰ</option>
					</select> <br>
					<div style="margin-top: 125px;"></div>
					<div class="w3-display-bottomright" style="font-size: 12px;">
						<input type="submit"
							class="w3-button w3-white w3-border w3-hover-black" value="��ǰ ���">
						<input type="reset"
							class="w3-button w3-white w3-border w3-hover-light-grey"
							value="���">
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
