<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART</title>
</head>

<body>
<center>
	<c:if test="${check==1}">
	<table width = "270" border="0" cellspacing = "0" cellpadding = "5" style="margin-top:25px;">
		<tr>
			<td class="w3-center" height = "39" style="font-size:13px;"><b> ${id } </b> 는 <br>  이미 사용중인 아이디입니다.</td>
		</tr>
	</table>
	<form name = "checkForm" method="post" action="confirmId">
		<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
			<tr>
				<td align = "center" style="font-size:13px;">다른 아이디를 입력하세요.<p>
				<div style="margin-top:30px;"></div>
				<div class="w3-row w3-center">
				<div class="w3-half" style="width:160px; margin-left:10px;">
					<input type = "text" size = "20" maxlength = "12" name = "id"></div>
					<div class="w3-half" style="width:50px;">
					<input type = "submit" class="w3-button w3-black w3-hover-black w3-padding-small" style="font-size:11px; height:21px;" value = "ID중복확인">
				</div>
				</div>
				</td>
			</tr>
		</table>
	</form>
	</c:if>
	<c:if test="${check!=1}">
	<table width = "270" border = "0" cellspacing = "0" cellpadding = "5" style="margin-top:20px;">
		<tr>
			<td align = "center" style="font-size:13px;">
				
				<p>입력하신 <b> ${id } </b> 는 <br> 사용하실 수 있는 ID입니다.</p>
				<div style="margin-top:50px;"></div>
				<input type = "button" class="w3-button w3-black w3-hover-black" style="font-size:11px;" value = "닫기" onclick = "setid()">
			</td>
			
		</tr>
	</table>
	</c:if>
	</center>
</body>
</html>

<script>
	function setid(){
		opener.document.userinput.id.value = "${id}";
		opener.document.userinput.idchk.value = "Y";
		self.close();
	}
</script>