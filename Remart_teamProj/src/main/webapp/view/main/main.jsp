<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.2.7/css/swiper.css"
	rel="stylesheet" type="text/css" media="screen" />

<style>
.swiper-container {
	width: 980px;
	height: 100%;
	z-index: 0;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.setDiv {
	padding-top: 100px;
	text-align: center;
}

.mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	background-color: #000;
	display: none;
}

.window {
	display: none;
	background-color: #ffffff;
	width: 750px;
	height: 500px;
	z-index: 99999;
}
</style>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
	var httpRequest = null;
	function sendRequest(url, params, callback, method) {
		httpRequest = new XMLHttpRequest();
		var httpMethod = method ? method : 'GET';
		if (httpMethod != 'GET' && httpMethod != 'POST') {
			httpMethod = 'GET';
		}

		var httpParams = (params == null || params == '') ? null : params;
		var httpUrl = url;
		if (httpMethod == 'GET' && httpParams != null) {
			httpUrl = httpUrl + "?" + httpParams;
		}

		httpRequest.open(httpMethod, httpUrl, true);
		httpRequest.setRequestHeader('content-Type',
				'application/x-www-form-urlencoded');
		httpRequest.onreadystatechange = callback;
		httpRequest.send(httpMethod == 'POST' ? httpParams : null);
	}

	function like(feed_id) {
		alert("dd");
		alert(feed_id);
		var params = "feed_id=" + encodeURIComponent(feed_id);
		sendRequest("/Remart_teamProj/main/like", params, return_like, "GET");
	}
	function return_like() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

				document.getElementById("like").innerHTML = httpRequest.responseText;
			}
		}
	}
	function bookmark() {
		alert("북마크");
		var test = "bookmark";
		var params = "like=" + encodeURIComponent(test);
		sendRequest("/Remart_teamProj/main/like", params, return_like, "GET");

	}
	function return_bookmark() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				alert("s");
				//document.getElementById("dd").innerHTML = httpRequest.responseText;
			}
		}
	}
	// Add contents for max height
	/* $(document).ready(function() {
		$(document).scroll(function() {
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();

			if (maxHeight <= currentScroll + 100) {
				getFeed();
			}
		})
	}); */
	function getFeed() {
		var test = "bookmark";
		var params = "like=" + encodeURIComponent(test);
		sendRequest("/Remart_teamProj/main/getFeed", params, return_getFeed,
				"GET");

	}
	function return_getFeed() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				document.getElementById("feed").innerHTML += httpRequest.responseText;
			}
		}
	}
	function login() {
		alert("로그인하세요");
	}
	
var slideIndex = 1;//슬라이드 변수

	

	function plusDivs(n) {
		
		showDivs(slideIndex += n);

	}
	//버튼 하고 슬라이드 처리 해주는 함수
	function showDivs(n) {
		
		var i;
		var x = document.getElementsByClassName("mySlides");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		if (slideIndex == 1) {
			document.getElementById("leftpage").style.display = 'none';
		} else if (slideIndex == x.length) {
			document.getElementById("leftpage").style.display = 'block';
			document.getElementById("rightpage").style.display = 'none';
		} else {
			document.getElementById("leftpage").style.display = 'block';
			document.getElementById("rightpage").style.display = 'block';
		}
		x[slideIndex - 1].style.display = "block";
	}
   	function popup(imagenum,feeddate,imagename,contentname,repledata,replenum){
   		var myArray ;
		//리스트 받은거 문자 쪼개는거
		
   		imagename=imagename.substring(1,imagename.length-1);
   		contentname=contentname.substring(1,contentname.length-1);
   		repledata=repledata.substring(1,repledata.length-1);
   		<!-- feed_id,id,like_num,reg_date,recipe_name-->
   		imagename=imagename.split(', ');
   		feeddate=feeddate.split(',');
   		contentname=contentname.split(',');
   		if(imagenum>1){
   			document.getElementById("rightpage").style.display = 'block';
   			document.getElementById("leftpage").style.display = 'none';
   		}else{
   			document.getElementById("rightpage").style.display = 'none';
   			document.getElementById("leftpage").style.display = 'none';
   		}
   		alert(imagename[0]);
   		for(var i=0;i<imagenum;i++){   			
   			var y="<div align=\"center\" class=\"mySlides\" style=\"float: left; width: 55%; height: 350px; margin-top: 10px;\">"+
    		"<img src='"+"/Remart_teamProj/fileSave/"+encodeURIcomponent(imagename[i])/* +imagename[i] */+".JPG' width=100% height=100%><br>"+
    		"<label>"+contentname[i]+"</label>"+"</div>";
    		$('.window').append(y); 
    		
   		}
   		/*reple_id,feed_id,id,content,reg_date  */
   		if(replenum!=0){
   			myArray = new Array( new Array(replenum), new Array(5) );
   			repledata=repledata.split(', ');
   			for(var i=0;i<replenum;i++){
   					var tmp=repledata[i].split(',');
   					myArray[i]=tmp;
   			}
   			alert(myArray[0][2]);
   	   		var makereplelist="";
   	   		for(var i=0;i<replenum;i++){
   	   			makereplelist+="<lable>"+myArray[i][2]+"님의 댓글 /"+myArray[i][3]+"</lable><br>";
   	   		}
   	   		var z="<div align=\"center\"  class=\"reples\"style=\"float: left; width: 45%; height: 350px; margin-top: 10px;\">"
   	   		+makereplelist+"</div>"
   	   		
   	   		$('.window').append(z); 
   		}
   		
   		
   		showDivs(1);//슬라이더 처음값
   		
   	}
	function wrapWindowByMask(){
       
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
       
        $('.mask').css({'width':maskWidth,'height':maskHeight});
 
       
        $('.mask').fadeIn(1000);
        $('.mask').fadeTo("slow",0.8);
 
       
        var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
        var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );
 
      
        $('.window').css({'left':left,'top':top, 'position':'absolute'});
 
        
        $('.window').show();
    }
 
    $(document).ready(function(){
       
        $('.showMask').click(function(e){
            
            e.preventDefault();
            wrapWindowByMask();
        });
 
       
        $('.window .close').click(function (e) {
            e.preventDefault();
            slideIndex=1;
            $('.reples').remove();
            $('.mySlides').remove();
            $('.mask, .window').hide();
        });
 
       
        $('.mask').click(function () {
            $(this).hide();
            slideIndex=1;
            
            $('.reples').remove();
            $('.mySlides').remove();
            $('.window').hide();
        });
    });
</script>
<title>REMART</title>
</head>
<body>
	<div style="margin-top: 100px"></div>

	<div>
		<section class="main-artist-rolling">
		<div class="swiper-container">
			<div class="swiper-wrapper">

				<div class="swiper-slide">
					<img src="<%=request.getContextPath()%>/images/temp/감자볶음4.JPG"
						class="w3-circle"
						style="cursor: pointer; width: 600px; height: 450px;" />
				</div>

				<div class="swiper-slide">
					<img src="<%=request.getContextPath()%>/images/temp/계란국수8.JPG"
						class="w3-circle"
						style="cursor: pointer; width: 600px; height: 450px;" />
				</div>

				<div class="swiper-slide">
					<img src="<%=request.getContextPath()%>/images/temp/만두전6.JPG"
						class="w3-circle"
						style="cursor: pointer; width: 600px; height: 450px;" />
				</div>

				<div class="swiper-slide">
					<img src="<%=request.getContextPath()%>/images/temp/바나나샐러드4.JPG"
						class="w3-circle"
						style="cursor: pointer; width: 600px; height: 450px;" />
				</div>

			</div>


			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>

		</section>
	</div>
	<script type="text/javascript" language="javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.2.7/js/swiper.js"></script>
	<script>
		var swiper = new Swiper('.swiper-container', {
			pagination : '.swiper-pagination',
			nextButton : '.swiper-button-next',
			prevButton : '.swiper-button-prev',
			paginationClickable : true,
			spaceBetween : 30,
			centeredSlides : true,
			autoplay : 3000,
			autoplayDisableOnInteraction : false
		});
	</script>


	<div class="w3-twothird">
		<div id="feed" style="left: 30%; position: relative;">
			<c:if test="${empty Feeds }">
		게시글이 없습니다.
		</c:if>
			<c:set var="Loop" value="true" />
			<c:forEach var="i" begin="0" end="17" step="1">
				<c:if test="${empty Feeds[i] }">
					<c:set var="Loop" value="false" />
				</c:if>
				<c:if test="${Loop==true}">
					<div style="float: left; width: 300px">
						<div class="w3-card-4">
							<div class="w3-display-container" style="height: 230">
								<img
									src="<%=request.getContextPath()%>/images/icon/noProfile.png"
									style="width: 25px; height: 25px"><b>${Feeds[i].id }</b>
								<img
									src="<%=request.getContextPath()%>/fileSave/${Feeds[i].last}.JPG"
									style="width: 300px; height: 200px">
							</div>
							<div style="width: 300px">
								<div class="w3-container w3-white">
									<label id="like"> <img
										onclick="like(${Feeds[i].feed_id})"
										src="<%=request.getContextPath()%>/images/icon/like_before.png"
										style="height: 20px; cursor: pointer;"></label> <img
										src="<%=request.getContextPath()%>/images/icon/comment.png"
										style="height: 20px; cursor: pointer;"> <img
										onclick="bookmark()"
										src="<%=request.getContextPath()%>/images/icon/bookmark.png"
										style="height: 20px; cursor: pointer; position: relative; left: 80%">
									<%-- <img src="<%=request.getContextPath()%>/images/icon/like_before.png"
											style="height: 20px;">: ${Feeds[i].like_num }
											<img src="<%=request.getContextPath()%>/images/icon/comment.png"
											style="height: 20px;">:${Feeds[i].repleNum } --%>
								</div>

								<div class="w3-container w3-light-grey"
									style="height: 150px; cursor: pointer"
									onclick="popup('${fn:length(Feeds[i].img_name)}','${Feeds[i]}','${Feeds[i].img_name}','${Feeds[i].content}','${Feeds[i].replelist}','${fn:length(Feeds[i].replelist)}');">

									<p>#자취생#감자</p>
									<p>${Feeds[i].recipe_name }</p>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>



</body>


<div id="userplant" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 300px">
		<div class="w3-center">
			<span
				onclick="document.getElementById('userplant').style.display='none'"
				class="w3-button w3-xlarge w3-transparent w3-display-topright"
				title="Close Modal">×</span> <br>
		</div>
		<div class="w3-display-container" style="height: 230">
			<img src="<%=request.getContextPath()%>/images/icon/noProfile.png"
				style="width: 25px; height: 25px"><b>이재연</b> <img
				src="<%=request.getContextPath()%>/images/temp/감자볶음4.JPG"
				style="width: 300px; height: 200px">
		</div>
		<div style="width: 300px">
			<div class="w3-container w3-white">
				<c:if test="${likely_bookmark!=null }">

				</c:if>
				<label id="like"> <img onclick="like()"
					src="<%=request.getContextPath()%>/images/icon/like_before.png"
					style="height: 20px; cursor: pointer;"></label> <img
					src="<%=request.getContextPath()%>/images/icon/comment.png"
					style="height: 20px; cursor: pointer;"> <img
					onclick="bookmark()"
					src="<%=request.getContextPath()%>/images/icon/bookmark.png"
					style="height: 20px; cursor: pointer; position: relative; left: 80%">
			</div>

			<div class="w3-container w3-light-grey" style="height: 200px;">
				<p>좋아요 100개</p>
				<p>#자취생#감자</p>
				<p>맛있는 감자볶음</p>
				<p>
					유저1:댓글<br> 유저2:댓글
				</p>
			</div>
		</div>
		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">

			<button
				onclick="document.getElementById('userplant').style.display='none'"
				type="button" class="w3-button w3-red w3-right">취소</button>
		</div>

	</div>
</div>
<div class="setDiv">

	<div class="mask"></div>
	<div class="window">


		<input type="button" href="#" class="close" value="(닫기)" />

		<div style="width: 500px; height: 50px;">
			<!--글쓰는데 상단 고정바-->
			<button id="leftpage" style="float: left;" onclick="plusDivs(-1)">(이미지</button>
			<button id="rightpage" style="float: right" type="button"
				onclick="plusDivs(1)">이미지)</button>
		</div>
	</div>
</div>