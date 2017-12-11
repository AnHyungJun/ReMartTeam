<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART ADMIN</title>
</head>
<body>
<table class="w3-table w3-bordered w3-center" style="width: 700px; font-size: 12px;">
	<tr>
		<td align="center"><br>프로필 사진</td>
		<td width="330">
			<img src="<%=request.getContextPath()%>/fileSave/${articleCustomInfo[0].profileImg}"
			class="w3-circle" alt="" style="width: 100px; height: 100px">
		</td>
	</tr>
	<tr>
		<td width="200">이름</td>
		<td width="400">${articleCustomInfo[0].name }</td>
	</tr>
	<tr>
		<td width="200">성별</td>
		<td width="400">${articleCustomInfo[0].sex}</td>
	</tr>
	<tr>
		<td width="200">생년월일</td>
		<td width="400">${articleCustomInfo[0].jumin1 }</td>
	</tr>
	<tr>
		<td width="200">우편번호</td>
		<td width="400">${articleCustomInfo[0].zip1 }-${articleCustomInfo[0].zip2 }</td>
	</tr>
	<tr>
		<td width="200">주소</td>
		<td width="400">${articleCustomInfo[0].address1 }&nbsp;${articleCustomInfo[0].address2 }</td>
	</tr>
	<tr>
		<td width="200">휴대폰</td>
		<td width="400">${articleCustomInfo[0].phone }</td>
	</tr>
	<tr>
		<td width="200">이메일</td>
		<td width="400">${articleCustomInfo[0].email }</td>
	</tr>
</table>
</body>
</html>