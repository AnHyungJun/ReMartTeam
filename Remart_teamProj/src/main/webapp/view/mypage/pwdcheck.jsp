<%@page import="model.BasketDataBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>


function checkPw() {
	var pwdcheck = eval("document.pwdcheck");
	if(!pwdcheck.passwd.value) {
		alert("비밀번호를 입력하세요");
		pwdcheck.passwd.focus();
		return false;
	}
	
	if(pwdcheck.passwd.value != pwdcheck.chkpasswd.value) {
		alert("비밀번호를 동일하게 입력하세요");
		return false;
	}
	
}

</script>
<title>REMART</title>
</head>
<body>
<div style="margin-top: 250px"></div>
<center>
<div class="w3-container">
<img src="<%=request.getContextPath()%>/images/icon/password.png" style="width:30px;" class="w3-center">
<div style="margin-top:20px;"></div>
<form action="updateForm?id=${memberInfo.id}" method="POST" name="pwdcheck">
<table class="talble-bordered" width="360">
	<tr height="30">
		<td align=center>
			<b>PASSWORD CHECK</b>
			<p style="font-size:12px;">비밀번호를 입력하세요.</p>
		</td>
	</tr>

	<tr height="30">
		<td align=center>
		<p style="font-size:13px;">
			<input type="password" size="20" maxlength="16" name="passwd" style="height:20px;"> </p>
		</td>
	</tr>
	
	<tr height="30">
		<td align=center>
		<br>
			<input type="submit" class="w3-button w3-black w3-hover-black" style="font-size:11px;" value="확인">
		</td>
	</tr>
</table>

</form>
</div>
</center>

</body>
</html>