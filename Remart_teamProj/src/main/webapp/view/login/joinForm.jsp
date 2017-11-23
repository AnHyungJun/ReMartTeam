<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<title>REMART</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.uploadimg {
	font-size: 7px;
	position: absolute;
	height: 150px;
	width: 150px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: alpha(opacity = 0);
	cursor: pointer;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	function checkIt() {
		var userinput = eval("document.userinput");
		if (!userinput.id.value) {
			alert("ID를 입력하세요");
			userinput.id.focus();
			return false;
		}
		if (!userinput.passwd.value) {
			alert("비밀번호를 입력하세요");
			userinput.passwd.focus();
			return false;
		}
		if (userinput.passwd.value != userinput.passwd2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			userinput.passwd2.focus();
			return false;
		}
		if (!userinput.name.value) {
			alert("이름을 입력하세요");
			userinput.name.focus();
			return false;
		}
		if (!userinput.zip1.value) {
			alert("우편번호");
			userinput.zip1.focus();
			return false;
		}
		if (!userinput.jumin1.value) {
			alert("생년월일을 입력하세요");
			userinput.jumin1.focus();
			return false;
		}
		if (!userinput.phone.value) {
			alert("연락처를 입력하세요");
			userinput.phone.focus();
			return false;
		}
		if (!userinput.email.value) {
			alert("email을 입력하세요");
			userinput.email.focus();
			return false;
		}
		if (!userinput.address2.value) {
			alert("address1을 입력하세요");
			userinput.address2.focus();
			return false;
		}
		if (userinput.idchk.value != "Y") {
			alert("id중복확인을 하세요");
			userinput.idchk.focus();
			return false;
		}
	}

	function openConfirmid(userinput) {
		if (userinput.id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}
		url = "confirmId?id=" + encodeURIComponent(userinput.id.value);

		open(url, "confirm",
				"toolbar = no,location=no, status= no, menubar = no,"
						+ "resizable=no, width = 300, height = 200");
	}
</script>

<body>
	<div style="margin-top: 45px"></div>
	<center>
		<div class="w3-container">
			<a href="<%=request.getContextPath()%>/main/main"><img
				src="<%=request.getContextPath()%>/images/icon/join.png"
				style="width: 100px;"></a> <br> <br> <br>

			<form method="post" action="joinPro" name="userinput"
				enctype="multipart/form-data" onSubmit="return checkIt()">
				<table class="w3-table w3-bordered w3-center"
					style="width: 700px; font-size: 12px;">
					<tr>
						<td align="center"><br>프로필 사진</td>
						<td width="330">
							<div class="mySlides">

								<img align="center" id="blah1"
									src="<%=request.getContextPath()%>/images/icon/noProfile.png"
									alt="your image" width="150" height="150" class="w3-circle" /><br>
								<br> <input type="file" class="uploadimg"
									style="left: 800px; top: 220px; border: solid 4px;" onchange="statefile(this);"
									name="uploadfile" onfocus="this.blur()">
							</div>

						</td>
					</tr>
					<tr>
						<td width="200">아이디</td>
						<td width="400"><input type="text" name="id" size="18"
							class="w3-border" maxlength="12"> <input type="hidden"
							name="idchk"> <input type="button"
							class="w3-white w3-border" style="font-size: 12px; height:19px;"
							name="confirm_id" value="중복확인" OnClick="openConfirmid(this.form)"></td>
					</tr>
					<tr>
						<td width="200">비밀번호</td>
						<td width="400"><input type="password" name="passwd"
							size="15" class="w3-border" maxlength="12"></td>
					</tr>
					<tr>
						<td width="200">비밀번호확인</td>
						<td width="400"><input type="password" name="passwd2"
							size="15" class="w3-border" maxlength="12"></td>
					</tr>
					<tr>
						<td width="200">이름</td>
						<td width="400"><input type="text" name="name" size="15"
							class="w3-border" maxlength="10"></td>
					</tr>
					<tr>
						<td width="200">성별</td>
						<td width="400"><input type="radio" name="sex" value="M"
							checked="checked" style="vertical-align: middle;"> 남성
							&nbsp;&nbsp; <input type="radio" name="sex" value="F"
							style="vertical-align: middle;"> 여성 <br></td>
					</tr>
					<tr>
						<td width="200">생년월일</td>
						<td width="400"><input type="text" name="jumin1" size="15"
							class="w3-border" maxlength="10" placeholder="ex) 1995-06-08"></td>
					</tr>

					<tr>
						<th scope="row" rowspan="3"><label for="zip">주소</label></th>
						<td class="bg_none"><input type="text" id='zip1' name='zip1'
							readonly="readonly" style="width: 60px" class="w3-border" /> - <input
							type="text" id='zip2' name='zip2' readonly="readonly"
							style="width: 60px" class="w3-border"></input> <input
							type="button" class="w3-white w3-border" style="font-size: 12px; height:20px;"
							onclick="openDaumPostcode();" value="우편번호"></td>
					</tr>
					<tr>
						<td class="bg_none"><label for="address1" class="tts">기본주소
						</label>&nbsp;&nbsp;<input type="text" id="address1" name="address1"
							class="w3-border" readonly="readonly"
							style="width: 340px; margin-right: 5px" /></td>
					</tr>
					<tr>
						<td><label for="address2" class="tts">상세주소
								&nbsp;&nbsp;</label><input type="text" id="address2" name="address2"
							class="w3-border" style="width: 340px; margin-right: 5px" /></td>
					</tr>
					<tr>
						<td width="200">휴대폰</td>
						<td width="400"><input type="text" name="phone" size="15"
							class="w3-border" maxlength="11"></td>
					</tr>
					<tr>
						<td width="200">이메일</td>
						<td width="400"><input type="text" name="email" size="40"
							class="w3-border" maxlength="30"></td>
					</tr>

					<tr>
						<td width="200">자기소개</td>
						<td width="400"><textarea rows="5" cols="40" name="info"
								class="w3-border"></textarea>
					</tr>

				</table>
				<tr>
					<br>
				<tr height="30">
					<td align=center><br> <input type="submit"
						class="w3-button w3-white w3-border w3-hover-black"
						style="font-size: 12px;" value="회원가입"> <input type="reset"
						class="w3-button w3-white w3-border" style="font-size: 12px;"
						value="취소"></td>
				</tr>
				</td>
				</tr>
			</form>
			<br> <br>
		</div>
	</center>
	<script>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js">
	
</script>
<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('zip1').value = data.postcode1;
				document.getElementById('zip2').value = data.postcode2;
				document.getElementById('address1').value = data.address;
				document.getElementById('address2').focus();
			}
		}).open();
	}
</script>
