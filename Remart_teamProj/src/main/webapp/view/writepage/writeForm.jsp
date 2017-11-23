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
.ttt{	
	width: 150px; 
	height: 150px; 
	float: left;
	border: solid 4px;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<div style="margin-top: 150px"></div>

<center>

<div class="w3-bar" style="width: 700px;">
	<!-- 글쓰기 head -->
		

	<div class="w3-row">
		<div class="w3-center">
        	<span>WRITE</span>
        </div>
        
		<button class="w3-button w3-border w3-hover-white w3-white"
         id="leftpage" style="float: left; display: none; font-size: 12px;"
         onclick="plusDivs(-1)">이전</button>
        <button class="w3-button w3-border w3-hover-white w3-white"
        id="rightpage" style="float: right; font-size: 12px;"
        type="button" onclick="plusDivs(1)">다음</button>
	</div><!-- 글쓰기 head 끝 -->
		
	<!-- 글쓰기 body -->
	<div class="">
	<form action="writePro" method="post" enctype="multipart/form-data">
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah1" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br> 
	        <input type="text" size="50" height="20" class="w3-margin-bottom"  name="recipe_name" placeholder="음식 이름"><br> 
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="재료"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah2" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah3" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah4" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah5" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah6" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah7" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah8" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah9" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<div class="mySlides">
			<br>main photo<br><br>
			<img align="center" id="blah10" src="<%=request.getContextPath()%>/images/icon/noimage.PNG"
	        alt="your image" width="650" height="365" /><br> 
	        <input type="file" class="uploadimg" style="left: 200px; top: 200px;"
	        onchange="statefile(this);" name="img_name" onfocus="this.blur()"><br>
	        <input type="text" size="50" height="20" class="w3-margin-bottom" name="content" placeholder="내용"> 
		</div>
		
		<c:if test="${memberInfo.grade eq 'editor'}">
				<div style="width: 500px;" align="center">
					<!--밑에 등록 버튼-->
					<br> 에디터 상품 등록 <br>
					<div id="editorfood2" align="center" >
						
					</div>
					<br><br><br>
					<button type="button" onclick="findfood()"/>
					<br>	
					
				</div>
				
			</c:if>
			<div style="width: 500px;" align="center">
				<!--밑에 등록 버튼-->

				<br>해시태그<br>
				<input type="text" name="hashtag"/>
				<br>
			</div>

			<div style="width: 500px; height: 100px; color: white;">
				<!--밑에 등록 버튼-->
				<br> <br> <br> <input type="submit" name="작성">
			</div>


	</form>
	</div><!-- 글쓰기 body 끝 -->
	
	
	

</div>


</center>












<script>
	var openWin;
	var foodnum=0;
	function foodimg(foodname){
        	foodnum++;
        	var y="<div align=\"center\" class=\"ttt\" id="+"ttt"+foodnum+"\">"+
        	"<img src=\""+foodname+"\" width=110 height=110><br>"+
        	"<label>"+foodname+"</label>"
        	+"</div>";
        	$(editorfood2).append(y);
	}
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