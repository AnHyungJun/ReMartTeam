<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.uploadimg {
	font-size: 7px;
	position: absolute;
	height: 365px;
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
	<div style="margin-top: 200px"></div>

			<div align="center" style="width: 100%;">
				<!-- 전체 테두리 -->
				<div style="width: 500px;">
					<!--글쓰는데 상단 고정바-->
					<button class="w3-button w3-border w3-hover-white w3-white"
						id="leftpage" style="float: left; display: none; font-size: 12px;"
						onclick="plusDivs(-1)">이전</button>
					Write
					<button class="w3-button w3-border w3-hover-white w3-white"
						id="rightpage" style="float: right; font-size: 12px;"
						type="button" onclick="plusDivs(1)">다음</button>
					<form action="">

						<div class="mySlides">
							<br>Main Photo<br> <br> <img align="center"
								id="blah1" src="/ReMart/images/icon/noimage.PNG"
								alt="your image" width="650" height="365" /><br> <input
								type="file" class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" class="w3-margin-bottom"
								placeholder="음식 이름"> <br> <input type="text"
								size="50" height="14" class="w3-margin-bottom"
								placeholder="주 메뉴"> <br> <input type="text"
								size="50" height="14" class="w3-margin-bottom"
								placeholder="부 메뉴">
						</div>
						<div class="mySlides">
							<img align="center" id="blah2"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<div class="mySlides">
							<img align="center" id="blah3"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<div class="mySlides">
							<img align="center" id="blah4"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<div class="mySlides">
							<img align="center" id="blah5"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<div class="mySlides">
							<img align="center" id="blah6"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<div class="mySlides">
							<img align="center" id="blah7"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<div class="mySlides">
							<img align="center" id="blah8"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<div class="mySlides">
							<img align="center" id="blah9"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<div class="mySlides">
							<img align="center" id="blah10"
								src="/ReMart/images/icon/noimage.PNG" alt="your image"
								width="650" height="365" /><br> <input type="file"
								class="uploadimg" style="left: 200px; top: 200px;"
								onchange="statefile(this);" name="uploadfile"
								onfocus="this.blur()"> <br> <input type="text"
								size="50" height="14" placeholder="내용">
						</div>
						<br>
						<div style="width: 500px;">
							<!--밑에 등록 버튼-->
							<input type="submit"
								class="w3-button w3-white w3-border w3-hover-white"
								style="font-size: 12px;" value="전송">
						</div>

					</form>
				</div>
		</div>
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