<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<BR>
	<BR>
	<input type="text" id="qq">
	<input type="button" onclick="">
	<BR>
	<BR>
	<BR>
	<div id="aa"></div>
	<input type="button" onclick="writefood()" name="등록">
	<input type="button" onclick="end()" name="닫기">
	<script>
		function writefood() {
			
			var img = document.createElement('img'); // 이미지 객체 생성
			img.src ='/Remart_teamProj/images/food/'+'[남양]프렌치카페 믹스 250입'+'.jpg';
			
			img.style.cursor = 'pointer'; // 커서 지정
			opener.document.getElementById("a").value = document.getElementById("qq").value
			document.getElementById('aa').appendChild(img);
			opener.document.getElementById('editorfood2').appendChild(img); // board DIV 에 이미지 동적 추가
			alert("asd");
			self.close();
		}
		function end() {

			self.close();
		}
	</script>
</body>
</html>