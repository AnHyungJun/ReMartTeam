<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID �ߺ�Ȯ��</title>
</head>

<body>
	<c:if test="${check==1}">
	<table width = "270" border="0" cellspacing = "0" cellpadding = "5">
		<tr>
			<td height = "39">${id }�� �̹� ������� ���̵��Դϴ�.</td>
		</tr>
	</table>
	<form name = "checkForm" method="post" action="confirmId">
		<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
			<tr>
				<td align = "center">�ٸ� ���̵� �����ϼ���.<p>
					<input type = "text" size = "10" maxlength = "12" name = "id">
					<input type = "submit" value = "ID�ߺ�Ȯ��">
				</td>
			</tr>
		</table>
	</form>
	</c:if>
	<c:if test="${check!=1}">
	<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
		<tr>
			<td align = "center">
				
				<p>�Է��Ͻ�${id }�� ����Ͻ� �� �ִ� ID�Դϴ�.</p>
				<input type = "button" value = "�ݱ�" onclick = "setid()">
			</td>
			
		</tr>
	</table>
	</c:if>
</body>
</html>

<script>
	function setid(){
		opener.document.userinput.id.value = "${id}";
		opener.document.userinput.idchk.value = "Y";
		self.close();
	}
</script>