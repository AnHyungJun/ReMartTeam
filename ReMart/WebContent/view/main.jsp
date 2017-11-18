<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.2.7/css/swiper.css" rel="stylesheet" type="text/css" media="screen" />

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
<head >
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body >
	<div style="margin-top: 100px"></div>
	
	<div>
		<section class="main-artist-rolling">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				
				<div class="swiper-slide">
					<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" class="w3-circle" style="cursor: pointer; width: 600px; height: 450px;" />
				</div>

				<div class="swiper-slide">
					<img src="<%=request.getContextPath() %>/images/temp/계란국수8.JPG" class="w3-circle" style="cursor: pointer; width: 600px; height: 450px;" />
				</div>

				<div class="swiper-slide">
					<img src="<%=request.getContextPath() %>/images/temp/만두전6.JPG" class="w3-circle" style="cursor: pointer; width: 600px; height: 450px;" />
				</div>

				<div class="swiper-slide">
					<img src="<%=request.getContextPath() %>/images/temp/바나나샐러드4.JPG" class="w3-circle" style="cursor: pointer; width: 600px; height: 450px;" />
				</div>

			</div>


			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>

		</section>
	</div>
	<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.2.7/js/swiper.js"></script>
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
	<div id="enters" >

		<div class="w3-twothird" id="feed">
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
						<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
						<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
						<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>
			<div style="float: left; width: 30%">
				<div class="w3-card-4">
					<div class="w3-display-container">
						<img src="<%=request.getContextPath() %>/images/temp/감자볶음4.JPG" style="width: 300px">
					</div>
					<div>
					<img src="<%=request.getContextPath() %>/images/icon/like_before.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/comment.png" style="width: 30px"> 
						<img src="<%=request.getContextPath() %>/images/icon/bookmark.png" style="width: 30px">
					</div>
					<div class="w3-container w3-light-grey">
						<p>#자취생#감자</p>
					</div>
					<div class="w3-container w3-light-grey">
						<p>맛있는 감자볶음</p>
					</div>
				</div>
			</div>


		</div>

	</div>
	<div id="test"></div>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(window).scroll(function(){
				var scrollHeight = $(window).scrollTop() + $(window).height();
				var documentHeight = $(document).height();
				if (scrollHeight == documentHeight) {
					for (var i = 0; i < 10; i++) {
						$('<h1>무한스크롤</h1>').appendTo('#test');
					}
				}
			});
			
		});
		
		/* var page = 1;

		$(window)
				.scroll(
						function() {
							if ($(window).scrollTop() == $(document).height()
									- $(window).height()) {

								console.log(++page);
								$("#test")
										.append(
												"<h1>Page "
														+ page
														+ "</h1><BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~");

							}
						}); */
	</script>

</body>
</html>