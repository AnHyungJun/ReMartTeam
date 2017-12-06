<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.uploadimg {
	font-size: 7px;
	position: absolute;
	height: 120px;
	width: 120px;
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
</script>
<title>Insert title here</title>
</head>
<body>
<div style="margin-top: 180px"></div>
<div>
<center>
	<div class="w3-container">
	<a href="<%=request.getContextPath()%>/main/main">
		<img src="<%=request.getContextPath()%>/images/icon/modify.png" style="width:100px;">
	</a> <br> <br> <br>
	
	<form method="post" action="updatePro?id=${member.id}" name="userinput" enctype="multipart/form-data" onSubmit="return checkIt()">
		<input type="hidden" value="${memberInfo.id }" name="id">
		<table class="w3-table w3-bordered w3-center" style="width: 700px; font-size: 12px;">
			<tr>
				<td align="center"><br>프로필 사진</td>
				<td width="330">
					<div class="mySlides">
						<img src="<%=request.getContextPath()%>/fileSave/${memberInfo.profileImg}"
					class="w3-circle" alt="" style="width: 200px; height: 100px">
						<br> <input type="file" class="uploadimg"
							style="left: 850px; top: 220px; border: solid 0px;" onchange="statefile(this);"
							name="uploadfile" onfocus="this.blur()" value=${memberInfo.profileImg }>
					</div>
				</td>
			</tr>
			<tr>
				<td width="200">비밀번호</td>
				<td width="400">
					<input type="password" name="passwd" size="15" class="w3-border" maxlength="12">
				</td>
			</tr>
			<tr>
				<td width="200">비밀번호확인</td>
				<td width="400">
					<input type="password" name="passwd2" size="15" class="w3-border" maxlength="12">
				</td>
			</tr>
			<tr>
				<td width="200">이름</td>
				<td width="400">
					<input name="name" size="15" class="w3-border" maxlength="10" value="${memberInfo.name }">
				</td>
			</tr>
			<tr>
				<td width="200">성별${memberInfo.sex }</td>
				<c:if test="${memberInfo.sex == 'M'}">
				<td width="400"><input type="radio" name="sex" value="M"
					checked="checked" style="vertical-align: middle;"> 남성
					&nbsp;&nbsp; <input type="radio" name="sex" value="F"
					style="vertical-align: middle;"> 여성 <br></td>
				</c:if>
				<c:if test="${memberInfo.sex == 'F'}">
				<td width="400"><input type="radio" name="sex" value="M"
					checked="checked" style="vertical-align: middle;"> 남성
					&nbsp;&nbsp; <input type="radio" name="sex" value="F"
					checked="checked" style="vertical-align: middle;"> 여성 <br></td>
				</c:if>
			</tr>
			<tr>
				<td width="200">생년월일</td>
				<td width="400"><input type="text" name="jumin1" size="15"
					class="w3-border" maxlength="10" value="${memberInfo.jumin1 }"></td>
			</tr>

			<tr>
				<th scope="row" rowspan="3"><label for="zip">주소</label></th>
				<td class="bg_none">
					<input type="text" id='zip1' name='zip1' value="${memberInfo.zip1 }"
					readonly="readonly" style="width: 60px" class="w3-border" /> - <input
					type="text" id='zip2' name='zip2' readonly="readonly" value="${memberInfo.zip2 }"
					style="width: 60px" class="w3-border"/> 
					<input type="button" class="w3-white w3-border" style="font-size: 12px; height:20px;"
					onclick="openDaumPostcode();" value="우편번호"></td>
			</tr>
			<tr>
				<td class="bg_none"><label for="address1" class="tts">기본주소
				</label>&nbsp;&nbsp;<input type="text" id="address1" name="address1" value="${memberInfo.address1 }"
					class="w3-border" readonly="readonly"
					style="width: 340px; margin-right: 5px" /></td>
			</tr>
			<tr>
				<td><label for="address2" class="tts">상세주소
						&nbsp;&nbsp;</label><input type="text" id="address2" name="address2"
					class="w3-border" style="width: 340px; margin-right: 5px" value="${memberInfo.address2 }"/></td>
			</tr>
			<tr>
				<td width="200">휴대폰</td>
				<td width="400"><input type="text" name="phone" size="15" value="${memberInfo.phone }"
					class="w3-border" maxlength="11"></td>
			</tr>
			<tr>
				<td width="200">이메일</td>
				<td width="400"><input type="text" name="email" size="40" value="${memberInfo.email }"
					class="w3-border" maxlength="30"></td>
			</tr>

			<tr>
				<td width="200">자기소개</td>
				<td width="400"><textarea rows="5" cols="40" name="info"
						class="w3-border" >${memberInfo.info }</textarea>
			</tr>

		</table>
		<tr>
			<br>
		<tr height="30">
			<td align=center><br> <input type="submit"
				class="w3-button w3-white w3-border w3-hover-black"
				style="font-size: 12px;" value="수정"> <input type="reset"
				class="w3-button w3-white w3-border" style="font-size: 12px;"
				value="취소"></td>
		</tr>
		</td>
		</tr>
	</form>
		<br> <br>
	</div>
</center>
















</div>
</body>
</html>