<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART</title>
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
	<div style="margin-top: 200px"></div>

	<center>
	<form action="writePro" method="post" enctype="multipart/form-data">
		<div class="w3-bar" style="width: 650px;">
			<!-- 글쓰기 head -->


			<div class="w3-row">
				<div class="w3-center">
					<b>WRITE</b>
				</div>

				<button class="w3-button w3-hover-white w3-white" id="leftpage"
					style="float: left; display: none; font-size: 12px;"
					onclick="plusDivs(-1)">이전</button>
				<button class="w3-button w3-hover-white w3-white" id="rightpage"
					style="float: right; font-size: 12px;" type="button"
					onclick="plusDivs(1)">다음</button>
			</div>
			<!-- 글쓰기 head 끝 -->
	
			<!-- 글쓰기 body -->
			<div class="">
				
					<div class="mySlides">
						<div class="w3-col w3-center"
							style="width: 650px; font-size: 12px;">
							<p>main photo</p>
						</div>

						<br> <br> <img align="center" id="blah1"
							src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
							alt="your image" width="650" height="365" /><br> <input
							type="file" class="uploadimg" style="left: 350px; top: 300px; border: solid 5px;"
							onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>

						<br>
						<div class="w3-left">
							<div style="font-size: 13px;" align="left">음식 이름</div>
							<input type="text" size="50" height="20" class="w3-margin-bottom"
								name="recipe_name" style="font-size: 13px;"><br>
							<div style="font-size: 13px;" align="left">재료</div>
							<input type="text" size="50" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

					<div class="mySlides">
						<div class="w3-col w3-center"
							style="width: 650px; font-size: 12px;">
							<p>&nbsp;</p>
						</div>
						<br> <br> <img align="center" id="blah2"
							src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
							alt="your image" width="650" height="365" /><br> <input
							type="file" class="uploadimg" style="left: 350px; top: 300px;"
							onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
						<br>
						<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

					<div class="mySlides">
						<div class="w3-col w3-center"
							style="width: 650px; font-size: 12px;">
							<p>&nbsp;</p>
						</div>
						<br> <br> <img align="center" id="blah3"
							src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
							alt="your image" width="650" height="365" /><br> <input
							type="file" class="uploadimg" style="left: 350px; top: 300px;"
							onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
						<br>
						<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

			<div class="mySlides">
				<div class="w3-col w3-center" style="width: 650px; font-size: 12px;">
					<p>&nbsp;</p>
				</div>
				<br> <br> <img align="center" id="blah4"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="365" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 300px;"
					onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
				<br>
				<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>
					

			<div class="mySlides">
				<div class="w3-col w3-center" style="width: 650px; font-size: 12px;">
					<p>&nbsp;</p>
				</div>
				<br> <br> <img align="center" id="blah5"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="365" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 300px;"
					onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
				<br>
				<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

			<div class="mySlides">
				<div class="w3-col w3-center" style="width: 650px; font-size: 12px;">
					<p>&nbsp;</p>
				</div>
				<br> <br> <img align="center" id="blah6"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="365" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 300px;"
					onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
				<br>
				<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

			<div class="mySlides">
				<div class="w3-col w3-center" style="width: 650px; font-size: 12px;">
					<p>&nbsp;</p>
				</div>
				<br> <br> <img align="center" id="blah7"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="365" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 300px;"
					onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
					<br>
				<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

			<div class="mySlides">
				<div class="w3-col w3-center" style="width: 650px; font-size: 12px;">
					<p>&nbsp;</p>
				</div>
				<br> <br> <img align="center" id="blah8"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="365" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 300px;"
					onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
				<br>
				<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

			<div class="mySlides">
				<div class="w3-col w3-center" style="width: 650px; font-size: 12px;">
					<p>&nbsp;</p>
				</div>
				<br> <br> <img align="center" id="blah9"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="365" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 300px;"
					onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
				<br>
				<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

			<div class="mySlides">
				<div class="w3-col w3-center" style="width: 650px; font-size: 12px;">
					<p>&nbsp;</p>
				</div>
				<br> <br> <img align="center" id="blah10"
					src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
					alt="your image" width="650" height="365" /><br> <input
					type="file" class="uploadimg" style="left: 350px; top: 300px;"
					onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
				<br>
				<div class="w3-left">
							<div style="font-size: 13px;" align="left">설명</div>
							<input type="text" size="80" height="20" class="w3-margin-bottom"
								name="content" style="font-size: 13px;">
						</div>
					</div>

			
		</div>
		</div>
		<div style="width: 650px;">
			<div style="width: 650px;" align="left">
				<div style="font-size: 13px;">#HASHTAG</div>
				<input type="text" name="hashtag" size="94" height="20"
					style="font-size: 13px;" /> <br> <br>
			</div>
		</div>
		
		<c:if test="${memberInfo.grade eq 'editor'}">
				<div style="width:610px;" align="center">
					<!--밑에 등록 버튼-->
					<br> 에디터 상품 등록 <br>
					
					<table id="editorfood2" width="100%" >
						<tr align="center" height="30"><th width="80">상품 </th><th width="200">상품 이미지</th><th width="150">상품 이름</th><th width="80">상품 가격</th><th width="100">삭 제</th></tr>
					</table>
					
					
					<br> <br> <br>
					<button type="button" onclick="findfood()" />
					<br>

				</div>

			</c:if>
			
		<br>
		<br>
		<div style="width: 650px;" align="right">
			<input type="submit" value="작성" style="font-size: 12px;"
				class="w3-button w3-border w3-white w3-hover-black">
		</div>
		</form>
		<br> <br>
	</center>

	<script>
		var openWin;
		var rowlen=1;
		function foodimg(foodname) {
			
			
			var table = document.getElementById("editorfood2");
			var food = foodname.split('-');
			
			var row = "<tr height=\"140\"><input type=\"hidden\" name=\"food_id\" value=\""+food[0]+"\"/>"; 
			row += "<td>"+rowlen+"</td>"; 
			rowlen++;
			row += "<td>"+"<img src=\"/Remart_teamProj/images/food/"+food[1]+".jpg\" width=110 height=110/>"+"</td>"; 
			row += "<td>"+food[1]+"</td>"; 
			row += "<td>"+food[2]+"</td>";
			row += "<td><button name=\"delStaff\" type=\"button\">삭제</button></td>"; 
			row += "</tr>";
			alert(row);
			$("#editorfood2").append(row);
		}
		$(document).on("click","button[name=delStaff]",function(){
		        var trHtml = $(this).parent().parent();
		        rowlen--;
		        trHtml.remove();
		         
		});
		
		function findfood() {
			// window.name = "부모창 이름"; 
			window.name = "parentForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			openWin = window.open("editorsearch", "childForm",
					"width=600, height=800, resizable = no, scrollbars = no");
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