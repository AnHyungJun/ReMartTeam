<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
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

	function like() {
		alert("좋아요");
		var test = "like";
		var params = "like=" + encodeURIComponent(test);
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
	$(document).ready(function() {
		$(document).scroll(function() {
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();

			if (maxHeight <= currentScroll + 100) {
				getFeed();
			}
		})
	});
	function getFeed() {
		var test = "bookmark";
		var params = "like=" + encodeURIComponent(test);
		sendRequest("/Remart_teamProj/main/getFeed", params, return_getFeed, "GET");

	}
	function return_getFeed() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				document.getElementById("feed").innerHTML += httpRequest.responseText;
			}
		}
	}
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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


	<div class="w3-twothird" >
		<div id="feed" style="left: 30%; position: relative;">
			<c:forEach var="i" begin="1" end="18" step="1">
				<div style="float: left; width: 300px">
					<div class="w3-card-4">
						<div class="w3-display-container" style="height: 230">
							<img
								src="<%=request.getContextPath()%>/images/icon/noProfile.png"
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

							<div class="w3-container w3-light-grey"
								style="height: 200px; cursor: pointer"
								onclick="document.getElementById('userplant').style.display='block'">
								<p>좋아요 100개</p>
								<p>#자취생#감자</p>
								<p>맛있는 감자볶음</p>
								<p>
									유저1:댓글<br> 유저2:댓글
								</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="test"></div>
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