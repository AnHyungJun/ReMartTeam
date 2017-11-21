<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.uploadimg {
	font-size: 7px;
	position: absolute;
	height: 400px;
	width: 650px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: alpha(opacity = 0);
	cursor: pointer;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

	<div style="margin-top: 150px"></div>
	<div align="center"
		style="width: 100%; height: 900px; border: solid 4px;">
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
				<br>메인 메뉴 등록<br> <img align="center" id="blah1"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="제     목"> <br> <input type="text"
					size="50" height="14" placeholder="재     료">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah2"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah3"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah4"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah5"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah6"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah7"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah8"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah9"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">

			</div>
			<div class="mySlides">
				<br>메인 메뉴 등록<br> <img align="center" id="blah10"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="400" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 200px;"
					onchange="statefile(this);" name="uploadfile" onfocus="this.blur()">
				<br> <input type="text" size="50" height="14"
					placeholder="내     용">


			</div>
			<c:if test="${memberInfo.grade eq 'editor'}">
				<div style="width: 500px;" align="center">
					<!--밑에 등록 버튼-->
					<br> 에디터 상품 등록 <br>
					<div id="editorfood2"
						style="width: 100%; height: 170px; border: solid 4px;"></div>
					<input type="text" id="a">
					<br>
					<button type="button" onclick="findfood()" />
					<br>
				</div>
			</c:if>
			<div style="width: 500px;" align="center">
				<!--밑에 등록 버튼-->

				<br>해시태그<br>
				<textarea rows="5" cols="70"></textarea>
				<br>
			</div>


			<div style="width: 500px; height: 50px;">
				<!--밑에 등록 버튼-->
				<br> <br> <br> <input type="submit" name="작성">
			</div>

		</form>
	</div>

	<script>
		var openWin;

		function findfood() {
			// window.name = "부모창 이름"; 
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("editorsearch", "childForm",
					"width=570, height=350, resizable = no, scrollbars = no");
		}

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
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#blah' + slideIndex).attr('src', e.target.result);
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