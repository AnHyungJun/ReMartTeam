<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	
	<div style="margin-top: 150px"></div>
	<div align="center"
		style="width: 100%; height: 600px; border: solid 4px;">
		<!-- 전체 테두리 -->
		<div style="width: 500px; height: 50px;">
			<!--글쓰는데 상단 고정바-->
			<button id="leftpage" style="float: left; display: none;"
				onclick="plusDivs(-1)">(이미지</button>
			글쓰기
			<button id="rightpage" style="float: right" type="button"
				onclick="plusDivs(1)">이미지)</button>
		</div>
		<form action="">

			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			<div class="mySlides">
				<img align="center" id="blah1" src="/ReMart/images/icon/noimage.PNG" alt="your image" width="650" height="400"/><br>
				file:<input type="file" size="40" maxlength="30"
					onchange="statefile(this);" name="uploadfile"> <br>
					
					
					 내용<br>
				<input type="text" size="50" height="14">
			</div>
			
			
		</form>
	</div>

	<a class="w3-btn-floating" onclick="plusDivs(-1)">&#10094;</a>
	<a class="w3-btn-floating" onclick="plusDivs(+1)">&#10095;</a>
	<script>
		var slideIndex = 1;
		var checkimage = new Array(11);
		for (var i = 0; i < checkimage.length; i++) {
			checkimage[i] = false;
		}

		showDivs(slideIndex);

		function plusDivs(n) {
			if (n == 1 && checkimage[slideIndex] == false) {
				alert("이미지 업로드 하세요");
			} else {
				showDivs(slideIndex += n);

			}
		}
		function statefile(input) {
			checkimage[slideIndex] = true;
			if (input.files && input.files[0]) { 
				var reader = new FileReader(); reader.onload = function (e) {
					$('#blah'+slideIndex).attr('src', e.target.result); 
				}
				reader.readAsDataURL(input.files[0]);
			}

		}
		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			if (slideIndex == 1) {
				document.getElementById("leftpage").style.display = 'none';
			} else if (slideIndex == 10) {
				document.getElementById("rightpage").style.display = 'none';
			} else {
				document.getElementById("leftpage").style.display = 'block';
				document.getElementById("rightpage").style.display = 'block';
			}
			x[slideIndex - 1].style.display = "block";
		}
	</script>


</body>
</html>