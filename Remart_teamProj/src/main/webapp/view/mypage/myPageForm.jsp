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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajax/httpRequest.js"></script>
<title>REMART</title>

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
	width: 890px;
	height: 610px;
	z-index: 99999;
}

a {
	text-decoration: none;
}
</style>

</head>
<body>
	<div style="margin-top: 140px"></div>

	<center>
		<div class="w3-center" style="width: 1000px">
			<div class="w3-container w3-border-bottom">
				<div class="w3-left-align"
					style="float: left; margin-bottom: 5px; margin-top: 30px; font-size: 14px;">
				<b>${member.id}</b> 님
				</div>
				<div class="w3-right-align"
					style="float: right; margin-bottom: 0px; margin-top: 20px;">
					<c:if test="${checkpage==0}">
						<a
							href="<%=request.getContextPath() %>/mypage/followForm?id=${member.id}"><img
							class="w3-right-align"
							src="<%=request.getContextPath()%>/images/icon/follow.png"
							style="width: 27px;"></a>
						<a
							href="<%=request.getContextPath() %>/mypage/likeForm?id=${member.id}"><img
							class="w3-right-align"
							src="<%=request.getContextPath()%>/images/icon/like_before.png"
							style="width: 17px;"></a>
						<a
							href="<%=request.getContextPath() %>/mypage/bookmarkForm?id=${member.id}"><img
							class="w3-right-align"
							src="<%=request.getContextPath()%>/images/icon/bookmark.png"
							style="width: 30px;"></a>
							<a
							href="<%=request.getContextPath() %>/shopping/historyPayment?id=${memberInfo.id}"><img
							class="w3-right-align"
							src="<%=request.getContextPath()%>/images/icon/order.png"
							style="width: 24px;"></a>
					</c:if>
				</div>
			</div>
			<div class="w3-display-container w3-border-bottom"
				style="height: 330px;">
				<div class="w3-bar w3-display-bottomleft w3-center"
					style="margin-left: 8%; font-size: 14px; margin-top: 30px;">${member.info}<div
						style="margin-top: 20px;"></div>
				</div>
				<div class="w3-display-bottomright"></div>
				<div class="w3-display-left">
					<div style="float: left; margin-left: 30%;">
						<img
							src="<%=request.getContextPath()%>/fileSave/${member.profileImg}"
							class="w3-circle" alt=""
							style="width: 200px; height: 200px">
					</div>
				</div>
				<!-- 자기 아이디면 정보 수정 아니면 팔로우 -->
				<c:if test="${checkpage==0}">
					<div class="w3-display-right" style="margin-left:30px;">
						<button
							class="w3-button w3-white w3-hover-light-grey w3-border w3-round-xlarge"
							style="width: 130px; font-size: 12px;"
							onclick="document.location.href='pwdcheck?id=${memberInfo.id}'">
							프로필 수정</button>
					</div>
				</c:if>
				<c:if test="${checkpage==1}">
				
					<c:if test="${member.follow_status == 0}">
						<div class="w3-display-right" style="margin-left:30px;">
							<input
								class="w3-button w3-white w3-hover-light-grey w3-border w3-round-xlarge"
								style="width: 130px; font-size: 12px;" value="follow" id="follow"
								type="button" onclick="followPush('${member.id}','${memberInfo.id}')" />
						</div>
					</c:if>
					<c:if test="${member.follow_status == 1}">
						
						<input
								class="w3-button w3-white w3-hover-light-grey w3-border w3-round-xlarge"
								style="width: 130px; font-size: 12px;" value="unfollow" id="follow"
								type="button" onclick="followPush('${member.id}','${memberInfo.id}')" />
					</c:if>
				</c:if>
				<div class="w3-display-middle" style="margin-left:70px;">

					<div style="float: left; margin: 30px; font-size: 13px;">
						<h4>
							<b>${member.writenum}</b>
						</h4>
						게시물
					</div>
					<div style="float: left; margin: 30px; font-size: 13px;">
						<a
							href="<%=request.getContextPath()%>/mypage/following?id=${member.id}"
							style="text-decoration: none;" class="con_link"
							onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';">
							<h4>
								<b>${member.follownum}</b>
							</h4>
						</a> 팔로잉
					</div>
					<div style="float: left; margin: 30px; font-size: 13px;">
						<a
							href="<%=request.getContextPath()%>/mypage/follower?id=${member.id}"
							style="text-decoration: none;" class="con_link"
							onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';">
						<h4>
							<b>${member.followernum}</b>
						</h4></a>
						
						팔로워
					</div>
					<div style="float: left; margin: 30px; font-size: 13px;">
						<h4>
							<b>${member.point}</b>
						</h4>
						적립금
					</div>
				</div>
				
				<div class="w3-display-topmiddle"></div>
				<div class="w3-display-bottommiddle "></div>
			</div>

			<div class="w3-container">
				<div style="margin-top: 30px;"></div>
				<div class="w3-center">
					<c:if test="${fn:length(feedlist) != 0}">
						<!-- 디비에서 데이터 받아와서 함수에 뿌려주는 부분  -->
						<c:forEach var="list" items="${feedlist}" varStatus="status">
							<div class="w3-cell w3-center"
						style="display: inline; width: 302px; float: left; border: 0px solid #ddd; margin-left: 17px; margin-bottom: 25px;">

								<div class="w3-center">
									<!-- 함수 실행해서 이미지 이름 ,사이즈 등등 넘겨주는 부ㅜ분 -->
									<c:if test="${list.feed_grade eq 'editor'}">
									<c:if test="${member.id ne memberInfo.id}"><!-- 에디터<br> --></c:if><img id="${list.feed_id}" class="showMask"
										src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
										style="width: 300px; height: 300px"
										onclick="editorfeed('${fn:length(list.img_name)}','${list}','${list.feed_id}','${list.img_name}','${list.makecontent}','${list.replelist}','${fn:length(list.replelist)}','${list.food_id}','${list.hashtaglist}','${list.likestate}','${list.bookmarkstate}');">
									</c:if>
									<c:if test="${list.feed_grade eq 'nomal'}">
									<img id="${list.feed_id}" class="showMask"
										src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
										style="width: 300px; height: 300px"
										onclick="nomalfeed('${fn:length(list.img_name)}','${list}','${list.feed_id}','${list.img_name}','${list.makecontent}','${list.replelist}','${fn:length(list.replelist)}','${list.hashtaglist}','${list.likestate}','${list.bookmarkstate}');">
									</c:if>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<c:if test="${fn:length(feedlist) == 0}">
					<div style="margin-top: 100px; font-size: 13px;">
						<b> 아직 쓴 글이 없습니다. </b>
					</div>
				</c:if>

			</div>
		</div>
	</center>

	<!-- 레이어창 -->
	<div class="setDiv">
		<div class="mask"></div>
		<div class="window w3-modal w3-modal-content w3-animate-opacity">
			<button type="button" href="#" class="close w3-button w3-white w3-hover-white w3-right"> X </button>
			<div style="margin-top:0px;"></div>
			<div style="width: 49%; height: 40px;">
				<!--글쓰는데 상단 고정바-->
				<button id="leftpage" style="float: left;" onclick="plusDivs(-1)"
				class="w3-button w3-white w3-hover-white"> <b>〈 </b> </button>
				<button id="rightpage" style="float: right" type="button"
					class="w3-button w3-white w3-hover-white" onclick="plusDivs(1)"> <b> 〉 </b></button>
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
		var z = document.getElementsByClassName("mySlide");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
			z[i].style.display = "none";
		}
		if (x.length == 1) {
			document.getElementById("leftpage").style.display = 'none';
			document.getElementById("rightpage").style.display = 'none';
		} else if (slideIndex == 1) {
			document.getElementById("leftpage").style.display = 'none';
			document.getElementById("rightpage").style.display = 'block';
		} else if (slideIndex == x.length) {
			document.getElementById("leftpage").style.display = 'block';
			document.getElementById("rightpage").style.display = 'none';
		} else {
			document.getElementById("leftpage").style.display = 'block';
			document.getElementById("rightpage").style.display = 'block';
		}
		x[slideIndex - 1].style.display = "block";
		z[slideIndex - 1].style.display = "block";
	}
	function nomalfeed(imagenum,feeddate,feedid,imagename,contentname,repledata,replenum,hashtag,like,book){
   		var myArray ;
   		var title ;
   		var id;
   		var myid='${memberInfo.id}';
   		//넘겨준 데이터 쪼갬
   		imagename=imagename.substring(1,imagename.length-1);
   		repledata=repledata.substring(1,repledata.length-1);
   		hashtag=hashtag.substring(1,hashtag.length-1);
   		imagename=imagename.split(', ');
   		hashtag=hashtag.split(', ');
   		contentname=contentname.split('@!');
   		feeddate=feeddate.split(', ');
   		
   		id=feeddate[1].substring(3,feeddate[1].length);
   		
   		title=feeddate[5].substring(12,feeddate[5].length);
   		//이미지와 제목 해쉬테그 좋아요
   		var y="<div class=\"leftdiv\" style=\"float: left; width: 55%;\">"
   		//피드 상단 프로필사진
   		y+="<div align=\"left\" style=\"width:100%; height:70px\">"+
   		"<a href=\"myPageForm?id=${memberInfo.id}\" ><img	src=\"/Remart_teamProj/fileSave/${member.profileImg}\"class=\"w3-circle\" style=\"width:30px; height:30px\"></a></div>";
   		
   		//이미지
   		for(var i=0;i<imagenum;i++){   			
   			y+="<div align=\"center\" class=\"mySlides\" style=\"width: 100%; height: 350px; border: solid 1px;\">"+
    		"<img src='"+"/Remart_teamProj/fileSave/"+imagename[i]+"' width=100% height=350></div>";
    		//+"<label>"+contentname[i]+"</label>"+"</div>";
   		}
   		y+="<div align=\"left\" style=\"width:100%; height:40px;\">";
		if(like==0){
			y+="<img src=\"/Remart_teamProj/images/icon/like_before.png\" class=\"like\" onclick=\"like('"+feedid+"','like','"+myid+"');\" style=\"width:40px; height:40px;\">";
		}else{
			y+="<img src=\"/Remart_teamProj/images/icon/like_after.png\"  class=\"like\" style=\"width:40px; height:40px;\">";
		}
		if(book==0){
			y+="<img src=\"/Remart_teamProj/images/icon/bookmark.png\" class=\"book\" onclick=\"like('"+feedid+"','bookmark','"+myid+"');\" style=\"width:40px; height:40px;\">";
		}else{
			y+="<img src=\"/Remart_teamProj/images/icon/bookmark.png\" class=\"book\" onclick=\"like('"+feedid+"','unbookmark','"+myid+"');\" style=\"width:40px; height:40px;\">";
		}
		y+="</div>";
   		
		
		var resulthashtag="";
   		var size=0;
		for(var i=0;i<hashtag.length;i++){
			if(size<30){
				resulthashtag+="<a href=\"/Remart_teamProj/main/searchForm?please=#"+hashtag[i]+"\"> #"+hashtag[i]+"</a>";
				size+=hashtag[i].length;
			}else{
				size=0;
				resulthashtag+="<br><a href=\"/Remart_teamProj/main/searchForm?please=#"+hashtag[i]+"\"> #"+hashtag[i]+"</a>";
				size+=hashtag[i].length;
			}
		}
		
		
		y+="<div class=\"mySlide\" style=\"width:100%; height:50px; font-size:13px;\">"
		+"<label> 음식 이름 : "+title+"</label><br>"
		+"<label>재료 : "+contentname[0]+"</label><br>"+"</div>";
		for(var i=1;i<imagenum;i++){ 
			y+="<div class=\"mySlide\" style=\"width:100%; height:50px; font-size:13px;\">"
			+"<br><label>"+contentname[0]+"</label>"+"</div>";
		}
  		y+="<div align=\"left\"  class=\"hash\"style=\" width: 100%; height: 50px; font-size:12px;\">"
  	  		+resulthashtag+"</div>";
  	  	y+="</div>";
  	 
  	  	$('.window').append(y); 
   		
  	  
   		/*리플 */
   		if(replenum!=0){
   			myArray = new Array( new Array(replenum), new Array(5) );
   			repledata=repledata.split(', ');
   			for(var i=0;i<replenum;i++){
   					var tmp=repledata[i].split(',');
   					myArray[i]=tmp;
   			}
   	   		var makereplelist="";
   	   		for(var i=0;i<replenum;i++){
   	   			makereplelist+="<lable  class=\"commentreple\">"+myArray[i][2]+"&nbsp;"+myArray[i][3]+"</lable><br>";
   	   		}
   	   		var z="<div align=\"center\"  class=\"reples\"style=\"float: left; width: 46%; height: 550px; margin-top: 10px;\"><input type=\"text\" name=\""+feedid+"\"/><input type=\"button\" value=\"reple\""
   	   		+"  onclick=\"replecommit('"+feedid+"','${memberInfo.id}')\"/><br>"
   	   		+makereplelist+"</div>"
   	   		
   	   		$('.window').append(z); 
   		}else{
   			var z="<div align=\"center\"  class=\"reples\"style=\"float: left; width: 46%; height: 550px; margin-top: 10px;\"><input type=\"text\" name=\""+feedid+"\"/><input type=\"button\" value=\"reple\""
   	   		+"  onclick=\"replecommit('"+feedid+"','${memberInfo.id}')\"/><br>"
   	   		+"</div>"
   	   		
   	   		$('.window').append(z); 
   		}
   		
   		$('.window').show();
   		showDivs(1);//슬라이더 처음값
   	}
   	function editorfeed(imagenum,feeddate,feedid,imagename,contentname,repledata,replenum,foodname,hashtag,like,book){
   		var myArray ;
   		var title ;
   		var id;
   		var myid='${memberInfo.id}';
   		imagename=imagename.substring(1,imagename.length-1);
   		foodname=foodname.substring(1,foodname.length-1);
   		repledata=repledata.substring(1,repledata.length-1);
   		hashtag=hashtag.substring(1,hashtag.length-1);
   		hashtag=hashtag.split(', ');
   		imagename=imagename.split(', ');
   		foodname=foodname.split(', ');
   		contentname=contentname.split('@!');
   		feeddate=feeddate.split(', ');
   		id=feeddate[1].substring(3,feeddate[1].length);
   		title=feeddate[5].substring(12,feeddate[5].length);
   		//이미지와 제목 해쉬테그 좋아요
   		var y="<div class=\"leftdiv\" style=\"float: left; width: 45%; margin-top: 10px;\">" 
   	   		//피드 상단 프로필사진
   	   		y+="<div align=\"left\" style=\"width:100%; height:55px; margin-left:20px;\">"+
   	    		"<a href=\"myPageForm?id=${memberInfo.id}\" ><img	src=\"/Remart_teamProj/fileSave/${member.profileImg}\"class=\"w3-circle\" style=\"width:50px; height:50px\"></a></div>";//이미지
   	   		for(var i=0;i<imagenum;i++){   			
   	   			y+="<div align=\"center\" class=\"mySlides\" style=\"margin-left:20px; width: 100%; height: 350px;\">"+
   	    		"<img src='"+"/Remart_teamProj/fileSave/"+imagename[i]+"' width=100% height=350></div>";
   	    		//+"<label>"+contentname[i]+"</label>"+"</div>";
   	   		}
   	   		y+="<div align=\"left\" style=\"margin-top:10px; margin-left:20px; width:100%; height:40px;\">";
   			if(like==0){
   				y+="<img src=\"/Remart_teamProj/images/icon/like_before.png\" class=\"like\" onclick=\"like('"+feedid+"','like','"+myid+"');\" style=\"width:17px;\">";
   			}else{
   				y+="<img src=\"/Remart_teamProj/images/icon/like_after.png\"  class=\"like\" style=\"width:17px;\">";
   			}
   			if(book==0){
   				y+="<img src=\"/Remart_teamProj/images/icon/bookmark.png\" class=\"book\" onclick=\"like('"+feedid+"','bookmark','"+myid+"');\" style=\"width:30px;\">";
   			}else{
   				y+="<img src=\"/Remart_teamProj/images/icon/bookmark.png\" class=\"book\" onclick=\"like('"+feedid+"','unbookmark','"+myid+"');\" style=\"width:30px;\">";
   			}
   			y+="</div>";
   	   		var resulthashtag="";
   	   		var size=0;
   			for(var i=0;i<hashtag.length;i++){
   				if(size<30){
   					resulthashtag+="<a href=\"/Remart_teamProj/main/searchForm?please=#"+hashtag[i]+"\"> #"+hashtag[i]+"</a>";
   					size+=hashtag[i].length;
   				}else{
   					size=0;
   					resulthashtag+="<br><a href=\"/Remart_teamProj/main/searchForm?please=#"+hashtag[i]+"\"> #"+hashtag[i]+"</a>";
   					size+=hashtag[i].length;
   				}
   			}
   			y+="<div align=\"left\" class=\"mySlide\" style=\"width:100%; height:50px; margin-left:20px; font-size:13px;\">"
   			+"<label> 음식 이름 : "+"<b>"+title+"</b>"+"</label><br>"
   			+"<label> 재료 : "+contentname[0]+"</label><br>"+"</div>";
   			for(var i=1;i<imagenum;i++){ 
   				y+="<div align=\"left\" class=\"mySlide\" style=\"width:100%; height:50px; margin-left:20px; font-size:13px;\">"
   				+"<br><label style=\"font-size:13px;\">"+contentname[0]+"</label>"+"</div>";
   			}
   	  		y+="<div align=\"left\"  class=\"hash\"style=\"margin-left:20px; width: 100%; height: 50px; font-size:13px;\">"
   	  	  		+resulthashtag+"</div>";
   	  	  	y+="</div>";
   	  	 
   	  	  	$('.window').append(y); 
   		/*리플 */
   		
   		if(replenum!=0){
   			myArray = new Array( new Array(replenum), new Array(5) );
   			repledata=repledata.split(', ');
   			for(var i=0;i<replenum;i++){
   					var tmp=repledata[i].split(',');
   					myArray[i]=tmp;
   			}
   	   		var makereplelist="";
   	   		for(var i=0;i<replenum;i++){
   	   			makereplelist+="<lable class=\"commentreple\">"+myArray[i][2]+"&nbsp;"+myArray[i][3]+"</lable><br>";
   	   		}
   	   		var z="<div align=\"left\"  class=\"reples\"style=\"float: left; width: 29%; margin-top: 65px; margin-left:40px; font-size:12px;\"><input type=\"text\" style=\"width:200px;\" name=\""+feedid+"\"/><input class=\"w3-button w3-center w3-white w3-hover-white w3-padding-small\" style=\"font-size:12px;\" type=\"button\" value=\"reple\""
   	   		+"  onclick=\"replecommit('"+feedid+"','${memberInfo.id}')\"/><br>"
   	   		+makereplelist+"</div>"
   	   		
   	   		$('.window').append(z);  
   		}else{
   			var z="<div align=\"left\"  class=\"reples\"style=\"float: left; width: 29%; margin-top: 65px; font-size:12px;\"><input type=\"text\"style=\"width:200px;\"name=\""+feedid+"\"/><input class=\"w3-button w3-center w3-white w3-hover-white w3-padding-small\" style=\"font-size:12px;\" type=\"button\" value=\"reple\""
   	   		+"  onclick=\"replecommit('"+feedid+"','${memberInfo.id}')\"/><br>"
   	   		+"</div>"
   	   		
   	   		$('.window').append(z); 
   		}
   		
   		
   		
   		
   		var editorfood="";
  		for(var i=0;i<foodname.length;i++){
  			
  			editorfood+="<input type=\"checkbox\" name=\"chk_info\" value=\""+foodname[i]+"\">"+"<img src=\"/Remart_teamProj/images/food/"+foodname[i]+".jpg\" width=100 height=100/><br>";
  		}
  		var z="<div align=\"left\"  class=\"food \"style=\"float: left; width: 13%; margin-top: 65px; margin-left:30px;\">"
  		+"<form action=\"\" method=\"post\">"
  		+editorfood+"<div style=\"margin-top:50px;\"></div>"+"<input class=\"w3-button w3-border w3-white w3-hover-white w3-padding-small\" style=\"font-size:11px; margin-left:30px;\" type=\"submit\" value=\"장바구니\"></form></div>"
  		
  		$('.window').append(z); 
  		
   		$('.window').show();
   		showDivs(1);//슬라이더 처음값
   	}
	function editorbasket(){
		var params="";
		var checklist="";
		var a=${memberInfo.id};
		$("input[name=chk_info]:checked").each(function() {
			checklist += $(this).val()+",";
				
		});
		
		checklist=checklist.substring(0,checklist.length-1);
		params="food_name="+encodeURIComponent(checklist)+"&"+"id="+encodeURIComponent(a);
		
		sendRequest("<%=request.getContextPath()%>/common/addBasketlist.jsp",
				params, addbasket, 'GET');
		
		
		
	}
	function like(feed_id,action,id) {
		num=feed_id;
		var params = "feed_id=" + encodeURIComponent(feed_id)+"&action="+ encodeURIComponent(action)+"&id="+encodeURIComponent(id);
		sendRequest("<%=request.getContextPath()%>/common/likeaction.jsp",
				params, return_like, 'GET');
	}
	function return_like() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var resText = httpRequest.responseText;
				resText=resText.trim();
				var arry=resText.split("|");
				if(arry[1]=='L'){
					var likeimg=$('.like');
					likeimg.removeAttr('onclick');
					likeimg.attr('src','/Remart_teamProj/images/icon/like_after.png');
					
				}else if(arry[1]=='B'){
					
					var bookimg=$('.book');
					bookimg.onclick="";
				/* 	bookimg.onclick=function() {
						like(arry[0],'unbookmark','${memberInfo.id}');
					}; */
					bookimg.attr('onclick','like(\''+arry[0]+'\',\'unbookmark\',\'${memberInfo.id}\')');
					alert("북마크 되었습니다.");
				}else{
					
					var bookimg=$('.book');
					bookimg.onclick="";
					/* bookimg.onclick=function() {
						like(arry[0],'bookmark','${memberInfo.id}');
					}; */
					bookimg.attr('onclick','like(\''+arry[0]+'\',\'bookmark\',\'${memberInfo.id}\')');
					alert("북마크 취소되었습니다.");
				}
			}
		}
	}
	function addbasket(){
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var q = confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
		     	if (q == true) {
		            location.replace("../shopping/basket");

		         } else {
		            
		         }
			}
		}
	}
   	function replecommit(feed_id,m_id) {
		
		var txtval=$('input:text[name="'+feed_id+'"]');
		
		if(txtval.val()=='') alert("입력하신 댓글이 없습니다");
		else{
			var params =  "feed_id="+feed_id+"&id="+encodeURIComponent(m_id)+"&content="+encodeURIComponent(txtval.val());
			
			sendRequest("<%=request.getContextPath()%>/common/repleInsert.jsp",
			params, displayResult, 'GET');
		}
		txtval.val("");
   	}
   	
   	function displayResult() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var resText = httpRequest.responseText;
				//사이즈 , 코드 , 이름=사진 ,가격 
				var res = resText.split('|');
				var count = parseInt(res[0]);
				
				myArray = new Array( new Array(count), new Array(5) );
				
				var repledata=res[1].split('=');
	   			for(var i=0;i<count;i++){
	   					var tmp=repledata[i].split(',');
	   					myArray[i]=tmp;
	   			}
	   			
	   	   		var makereplelist="";
	   	   		for(var i=0;i<count;i++){
	   	   			makereplelist+="<lable  class=\"commentreple\" style=\"font-size:12px;\">"+myArray[i][2]+"&nbsp;"+myArray[i][3]+"</lable><br>";
	   	   		}
	   	   
	   	   	var z="<input type=\"text\"  style=\"width:200px; font-size:12px;\" name=\""+myArray[0][1]+"\"/><input class=\"w3-button w3-white w3-hover-white w3-padding-small\" style=\"font-size:12px;\" type=\"button\" value=\"reple\""
   	   		+"  onclick=\"replecommit('"+myArray[0][1]+"','${memberInfo.id}')\"/><br>"
   	   		+makereplelist;
   	  
   	   		$('.reples').empty();
	   	   		$('.reples').append(z); 
	   	 
			} else {
				alert("에러: " + httpRequest.status);
			} 
		}
	}
   	
	function wrapWindowByMask(){
       
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
       
        $('.mask').css({'width':maskWidth,'height':maskHeight});
 
       
        $('.mask').fadeIn(1000);
        $('.mask').fadeTo("slow",0.8);
 
       
        var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
        var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 3 );
 
      
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
            $('.food').remove();
            $('.reples').remove();
            $('.leftdiv').remove();
            $('.mask, .window').hide();
        });
 
       
        $('.mask').click(function () {
            $(this).hide();
            slideIndex=1;
            $('.food').remove();
            $('.reples').remove();
            $('.leftdiv').remove();
            $('.window').hide();
        });
    });
    
    function followPush(otherid,myid) {
		var follow=$('#follow');
		var followStatus=follow.val();
		
		var params = "followStatus=" + encodeURIComponent(followStatus) + "&myid=" + encodeURIComponent(myid) + "&otherid=" + encodeURIComponent(otherid);
		sendRequest("<%=request.getContextPath()%>/view/main/followButton.jsp",
				params, followResult, 'POST');
		if (follow.val() == "follow") {
			follow.val("unfollow");
			
		} else {
			follow.val("follow");
			
		}
		
	}
	function followResult() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

			} else {
				alert("에러: " + httpRequest.status);
			}
		}
	}
</script>
</body>
</html>