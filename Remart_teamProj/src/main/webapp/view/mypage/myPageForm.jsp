<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>follow form</title>

<style>
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
	width:750px;
	height: 500px;
	z-index: 99999;
}
</style>

</head>
<body>
	<div style="margin-top: 140px"></div>
	<div class="w3-container w3-border-bottom">
		<div class="w3-left-align"
			style="float: left; margin-bottom: 20px; margin-top: 20px;">
			<h3>${member.id}님의프로필</h3>
		</div>
		<div class="w3-right-align"
			style="float: right; margin-bottom: 20px; margin-top: 20px;">

			<a
				href="<%=request.getContextPath() %>/mypage/likeForm?id=${member.id}"><img
				class="w3-right-align"
				src="<%=request.getContextPath()%>/images/icon/like_before.png"
				style="width: 50px; height: 50px; margin: 3px"></a> <a
				href="<%=request.getContextPath() %>/mypage/bookmarkForm?id=${member.id}"><img
				class="w3-right-align"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="width: 50px; height: 50px; margin: 3px"></a>
			<!-- 이부분은 팔로우  -->
			<a
				href="<%=request.getContextPath() %>/mypage/bookmarkForm?id=${member.id}"><img
				class="w3-right-align"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="width: 50px; height: 50px; margin: 3px"></a>
		</div>
	</div>
	<div class="w3-display-container w3-border" style="height: 350px;">
		<div class="w3-display-topleft"></div>
		<div class="w3-display-topright"></div>
		<div class="w3-display-bottomleft w3-center" style="margin-left: 5%;">
			<h4>${member.name }</h4>
		</div>
		<div class="w3-display-bottomright"></div>
		<div class="w3-display-left">
			<div style="float: left; margin: 30px; margin-left: 30%;">
				<img
					src="<%=request.getContextPath()%>/fileSave/${member.profileImg}"
					class="w3-circle" alt="Norway" style="width: 200px; height: 200px">
			</div>
		</div>
		<!-- 자기 아이디면 정보 수정 아니면 팔로우 -->
		<c:if test="${checkpage==0}">
			<div class="w3-display-right " style="margin-right: 10%;">
				<button class="w3-button w3-white w3-border" style="width: 200px;">
					<h4>회원 정보 수정</h4>
				</button>
			</div>
		</c:if>
		<c:if test="${checkpage==1}">
			<div class="w3-display-right " style="margin-right: 10%;">
				<button class="w3-button w3-white w3-border" style="width: 200px;">
					<h4>팔로우 하기</h4>
				</button>
			</div>
		</c:if>
		<div class="w3-display-middle">

			<div style="float: left; margin: 30px;">
				<h3>${member.writenum}</h3>
				<br>
				<h3>게시물</h3>
			</div>
			<div style="float: left; margin: 30px;">
				<h3>${member.follownum}</h3>
				<br>
				<h3>팔로우</h3>
			</div>
			<div style="float: left; margin: 30px;">
				<h3>${member.point}</h3>
				<br>
				<h3>적립금</h3>
			</div>
		</div>
		<div class="w3-display-topmiddle"></div>
		<div class="w3-display-bottommiddle "></div>
	</div>

	<div class="w3-container">
		<div>
			<br>
			<h4>마이페이지</h4>
			<br> <br>
		</div>
		<c:if test="${fn:length(feedlist) != 0}">
			<!-- 디비에서 데이터 받아와서 함수에 뿌려주는 부분  -->
			<c:forEach var="list" items="${feedlist}" varStatus="status">
				<%-- <c:if test="${status.count % 3 == 1}">
					<div class="w3-container" style="margin-bottom: 10px;border: solid 4px;"/>
				</c:if> --%>
				<div class="w3-container"
					style="float: left; width: 33%; height: 350px; margin-top: 10px;">

					<div class="w3-center">
					<!-- 함수 실행해서 이미지 이름 ,사이즈 등등 넘겨주는 부ㅜ분 -->
						<img id="${list.feed_id}" class="showMask"
							src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
							style="width: 300px; height: 300px" onclick="popup('${fn:length(list.img_name)}','${list}','${list.img_name}','${list.content}','${list.replelist}','${fn:length(list.replelist)}');"><br>
						${list.recipe_name }///${list.img_name[0]}///<%=request.getContextPath()%>
					</div>

				</div>
			</c:forEach>
		</c:if>
		<c:if test="${fn:length(feedlist) == 0}">
			<br>
			<br>
			<h1>아직 쓴 글이 없습니다.</h1>
			<br>
		</c:if>

	</div>
	
<!-- 레이어창 -->	
<div class="setDiv">
   
    <div class="mask"></div>
    <div class="window">
    
    
        <input type="button" href="#" class="close" value="(닫기)"/>
    	
    	<div style="width: 500px; height: 50px;">
			<!--글쓰는데 상단 고정바-->
			<button id="leftpage" style="float: left;"
				onclick="plusDivs(-1)">(이미지</button>
			<button id="rightpage" style="float: right" type="button"
				onclick="plusDivs(1)">이미지)</button>
		</div>
    </div>
</div>
<script type="text/javascript">

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
   		
		//리스트 받은거 문자 쪼개는거
   		imagename=imagename.substring(1,imagename.length-1);
   		contentname=contentname.substring(1,contentname.length-1);
   		repledata=repledata.substring(1,repledata.length-1);
   		<!-- feed_id,id,like_num,reg_date,recipe_name-->
   		imagename=imagename.split(', ');
   		feeddate=feeddate.split(',');
   		contentname=contentname.split(',');
   		repledata=repledata.split(',');
   		//버튼 보이고 안보이고
   		if(imagenum>1){
   			document.getElementById("rightpage").style.display = 'block';
   			document.getElementById("leftpage").style.display = 'none';
   		}else{
   			document.getElementById("rightpage").style.display = 'none';
   			document.getElementById("leftpage").style.display = 'none';
   		}
   		/*여기 부분은 슬라이드 등록 하는 부분*/
   		<!-- reple_id,feed_id,id,content,reg_date-->
   		for(var i=0;i<imagenum;i++){
   			
   			
   			var y="<div align=\"center\" class=\"mySlides\"\" style=\"float: left; width: 55%; height: 350px; margin-top: 10px;\">"+
    		"<img src='"+"/Remart_teamProj/fileSave/"+imagename[i]+"' width=100% height=100%><br>"+
    		"<label>"+contentname[i]+"</label>"
    		+"</div>";
    		
    		$('.window').append(y); 
    		
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
            $('.mySlides').remove();
            $('.mask, .window').hide();
        });
 
       
        $('.mask').click(function () {
            $(this).hide();
            slideIndex=1;
            $('.mySlides').remove();
            $('.window').hide();
        });
    });
</script>
</body>
</html>