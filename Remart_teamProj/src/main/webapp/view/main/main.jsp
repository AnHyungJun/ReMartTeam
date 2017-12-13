<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajax/httpRequest.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
<style>
a {
	text-decoration: none;
}

.display-none {
	display: none;
}

.loading {
	position: fixed;
	left: 0px;
	bottom: 50px;
	height: 60px;
	width: 100%;
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

.today:nth-child(2) {
	float: left;
	width: 100px;
	height: 350px;
	margin-top: 10px;
	display: none;
}

.today01 {
	transform-origin: 0% 0%;
	transform: rotate(-10deg);
	cursor: pointer;
}

.today02 {
	transform-origin: 5% 5%;
	transform: rotate(-10deg);
	cursor: pointer;
}

.today03 {
	transform-origin: 0% 0%;
	transform: rotate(20deg);
	cursor: pointer;
}

.today {
	background-image:
		url("<%=request.getContextPath()%>/images/bg/main_bg.png");
}
</style>
<head>

<title>REMART</title>
</head>
<body>
	<center>
		<div style="margin-top: 150px"></div>
		<div class="w3-container">
			<div style="margin-top: 50px;"></div>
			<div class="w3-center-align">
				<div class="today w3-center" style="width: 900px; height: 493px">
					<c:if test="${fn:length(todayRecomendFeed) != 0}">
						<!-- 디비에서 데이터 받아와서 함수에 뿌려주는 부분  -->
						<!-- 리스트가 있으면 뿌려주는 FOREACH -->
						<div class="w3-container"
							style="float: left; width: 100%; height: 200px; margin-top: 90px;">
							<div class="w3-center"
								style="width: 36%; float: left; margin-right: 40px;">
								<img id="${todayRecomendFeed[0].feed_id}"
									class="showMask today01 animated infinite wobble"
									src="<%=request.getContextPath()%>/fileSave/${todayRecomendFeed[0].img_name[0]}"
									style="width: 150px; height: 150px;"
									onclick="popup('${fn:length(todayRecomendFeed[0].img_name)}','${todayRecomendFeed[0]}','${todayRecomendFeed[0].img_name}','${todayRecomendFeed[0].content}','${todayRecomendFeed[0].replelist}','${fn:length(todayRecomendFeed[0].replelist)}');"><br>
								<p class="w3-text-white">
									<b>${todayRecomendFeed[0].recipe_name }</b>
								</p>
							</div>
							<div class="w3-right"
								style="width: 35%; float: left; margin-right: 50px; margin-top: 20px;">
								<img id="${todhayRecomendFeed[1].feed_id}"
									class="showMask today02 animated infinite wobble"
									src="<%=request.getContextPath()%>/fileSave/${todayRecomendFeed[1].img_name[0]}"
									style="width: 150px; height: 150px;"
									onclick="popup('${fn:length(todayRecomendFeed[1].img_name)}','${todayRecomendFeed[1]}','${todayRecomendFeed[1].img_name}','${todayRecomendFeed[1].content}','${todayRecomendFeed[1].replelist}','${fn:length(todayRecomendFeed[1].replelist)}');"><br>
								<p class="w3-text-white">
									<b>${todayRecomendFeed[1].recipe_name }</b>
								</p>
							</div>
							<div class="w3-center"
								style="width: 18%; float: left; margin-top: 120px;">
								<img id="${todayRecomendFeed[2].feed_id}"
									class="showMask today03 animated infinite wobble"
									src="<%=request.getContextPath()%>/fileSave/${todayRecomendFeed[2].img_name[0]}"
									style="width: 150px; height: 150px;"
									onclick="popup('${fn:length(todayRecomendFeed[2].img_name)}','${todayRecomendFeed[2]}','${todayRecomendFeed[2].img_name}','${todayRecomendFeed[2].content}','${todayRecomendFeed[2].replelist}','${fn:length(todayRecomendFeed[2].replelist)}');"><br>
								<br> <br>
								<p class="w3-text-white">
									<b>${todayRecomendFeed[2].recipe_name }</b>
								</p>
							</div>
						</div>
					</c:if>
					<c:if test="${fn:length(todayRecomendFeed) == 0}">
						<div style="font-size: 13px;"></div>
					</c:if>
				</div>
			</div>
			<div style="margin-top: 50px;"></div>
			<div style="max-width: 900px">
				<c:if test="${fn:length(Feeds) != 0}">
					<!-- 디비에서 데이터 받아와서 함수에 뿌려주는 부분  -->
					<!-- 리스트가 있으면 뿌려주는 FOREACH -->
					<div id="aditionalfeed" style="font-size: 14px;">
						<c:set var="mainLoop" value="false" />
						<c:forEach var="list" items="${Feeds}" varStatus="mainstatus">
							<c:if test="${not mainLoop}">
								<div class="w3-container"
									style="float: left; width: 300px; height: 350px; margin-top: 30px;">
									<div class="w3-border"
										style="position: relative; height: 350px;">
										<div id="userInfo" style="text-align: left;">
											<div style="margin-top: 3px"></div>
											<c:if test="${list.profileImg==null}">
												<img
													src="<%=request.getContextPath()%>/images/icon/noProfile.png"
													class="w3-circle" alt=""
													style="width: 20px; height: 20px; margin-left: 5px;">
											</c:if>
											<c:if test="${list.profileImg!=null}">
												<img
													src="<%=request.getContextPath()%>/fileSave/${list.profileImg}"
													class="w3-circle" alt=""
													style="width: 20px; height: 20px; margin-left: 5px;">
											</c:if>
											${list.id }
											<div style="margin-top: 5px"></div>
											<div class="w3-border-bottom"></div>
										</div>
										<div class="w3-center">
											<!-- 함수 실행해서 이미지 이름 ,사이즈 등등 넘겨주는 부ㅜ분 -->
											<c:if test="${list.feed_grade eq 'editor'}">
												<img
													src="<%=request.getContextPath()%>/images/icon/editor.png"
													style="margin-top: 5px; margin-bottom: 0px;">
												<img id="${list.feed_id}" class="showMask"
													src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
													style="width: 100%; height: 200px"
													onclick="document.getElementById('popup').style.display='block';
													 editorfeed('${fn:length(list.img_name)}','${list}','${list.feed_id}','${list.img_name}','${list.makecontent}','${list.replelist}','${fn:length(list.replelist)}','${list.food_id}','${list.hashtaglist}');">
												<%-- 
									${list.recipe_name } --%>
											</c:if>
											<c:if test="${list.feed_grade eq 'nomal'}">
												<img
													src="<%=request.getContextPath()%>/images/icon/normal.png"
													style="margin-top: 5px; margin-bottom: 0px;">
												<img id="${list.feed_id}" class="showMask"
													src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
													style="width: 100%; height: 200px"
													onclick="document.getElementById('popup').style.display='block';popup2('${list.feed_id}','${list.id }');">

												<%-- <div style="margin-top:10px;"></div>
									${list.recipe_name} --%>
											</c:if>
										</div>
										<div id="like_bookmark"
											style="text-align: left; margin-top: 15px; margin-left: 5px;">
											<!-- 로그인 안했을 때 -->
											<c:if test="${empty memberInfo }">
												<img onclick="needlogin()"
													src="<%=request.getContextPath()%>/images/icon/like_before.png"
													style="height: 20px; cursor: pointer;">
												<img
													src="<%=request.getContextPath()%>/images/icon/comment.png"
													style="height: 20px;">
												<img onclick="needlogin()"
													src="<%=request.getContextPath()%>/images/icon/bookmark.png"
													style="height: 20px; cursor: pointer;">
												<div style="margin-top: 8px"></div>
											</c:if>
											<!-- 로그인 했을 때 -->
											<c:if test="${!empty memberInfo }">
												<c:if test="${list.likestate==0 }">
													<label id="like${list.feed_id }"> <img
														onclick="like(${list.feed_id},'like');"
														src="<%=request.getContextPath()%>/images/icon/like_before.png"
														style="height: 20px; cursor: pointer;">
													</label>
												</c:if>
												<c:if test="${list.likestate>=1 }">
													<label id="like${list.feed_id }"> <img
														src="<%=request.getContextPath()%>/images/icon/like_after.png"
														style="height: 20px;"></label>
												</c:if>
												<img
													src="<%=request.getContextPath()%>/images/icon/comment.png"
													style="height: 20px;">
												<c:if test="${list.bookmarkstate==0 }">
													<img onclick="like(${list.feed_id},'bookmark')"
														src="<%=request.getContextPath()%>/images/icon/bookmark.png"
														style="height: 20px; cursor: pointer;">
												</c:if>
												<c:if test="${list.bookmarkstate>=1 }">
													<img
														src="<%=request.getContextPath()%>/images/icon/bookmark.png"
														style="height: 20px; cursor: pointer;">
												</c:if>
												<div style="margin-top: 8px"></div>
											</c:if>
											<div style="margin-top: 10px;"></div>
											${list.recipe_name }
										</div>

										<div id="hashtag"
											style="text-align: left; position: absolute; width: 100%; height: 75px; margin-left: 5px;">

											<c:set var="doneLoop" value="false" />
											<c:forEach var="hash" items="${list.hashtaglist}"
												varStatus="status">
												<c:if test="${not doneLoop}">
													<a href="#" onclick="search000('${hash}')">#${hash}</a>
													<c:if test="${status.count == 4}">
														<c:set var="doneLoop" value="true" />
														&nbsp;
													</c:if>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
								<c:if test="${mainstatus.count == 12}">
									<c:set var="mainLoop" value="true" />
								</c:if>
							</c:if>
						</c:forEach>
					</div>
				</c:if>
			</div>

		</div>
		<c:if test="${fn:length(Feeds) == 0}">
			<div style="margin-top: 100px; font-size: 13px;">
				<b> 아직 쓴 글이 없습니다. </b>
			</div>
		</c:if>

		<!-- 로딩 -->
		<div id="loading" class="loading display-none w3-center">
			<img src="<%=request.getContextPath()%>/images/icon/loading.gif"
				style="width: 100px;">
		</div>
	</center>
	<!-- 모달팝업 -->
	<div id="popup" class="w3-modal">
		<div class="w3-modal-content" style="width: 900px; height: 600px;">
			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('popup').style.display='none'"
					class="w3-button w3-xlarge w3-transparent w3-display-topright"
					title="Close Modal">×</span> <br>
			</div>
			<div id="popup2"></div>
		</div>
	</div>
	<script type="text/javascript">
	function search000(hash){
		location.href="<%=request.getContextPath()%>/main/searchForm?please="+encodeURIComponent("#"+hash);
	}
	var num;
	function like(feed_id,action) {
		num=feed_id;
		var params = "feed_id=" + encodeURIComponent(feed_id)+"&action="+ encodeURIComponent(action);
		sendRequest("/Remart_teamProj/main/like", params, return_like, "GET");
	}
	function return_like() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				document.getElementById("like"+num).innerHTML = httpRequest.responseText;
			}
		}
	}
	function popup2(feed_id,id){
		 var params = "feed_id=" + encodeURIComponent(feed_id)+"&id="+ encodeURIComponent(id);
		sendRequest("/Remart_teamProj/main/popup2", params, return_popup2, "GET");
	 
	}
	function return_popup2(){
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				document.getElementById("popup2").innerHTML = httpRequest.responseText;
			}
		}
	}
	function needlogin(){
		alert("로그인하세요");
	} 
	//무한스크롤
	var index = 1;
	var rindex = 1;
	$(document).ready(function() {
		$(document).scroll(function() {
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
			if (maxHeight <= currentScroll + 100) {
				$('.loading').removeClass('display-none');
				feedLoading(rindex);
				setTimeout(function() {
					index++;
				}, 2000);
			}
		});
	});
	function feedLoading(index){
		var id='<c:out value="${memberInfo.id}"/>'; 
		var params = "index=" + encodeURIComponent(index)+"&id="+id;
		sendRequest("/Remart_teamProj/main/getFeed", params, return_feedLoading,
		"GET"); 
	}
	function return_feedLoading(){
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				$('.loading').addClass('display-none');
				document.getElementById("aditionalfeed").innerHTML += httpRequest.responseText;
				rindex++;
			}
		}
	}
	//피드팝업
function changediv(mydiv, nextdiv){
	var setnone=document.getElementById(mydiv);
	var setblock=document.getElementById(nextdiv);
	setnone.style.display='none';
	setblock.style.display='block';	
}
function replecommit(feed_id, m_id) {

	var txtval = $('input:text[name="' + feed_id + '"]');

	if (txtval.val() == '')
		alert("입력하신 댓글이 없습니다");
	else {
		var params = "feed_id=" + feed_id + "&id=" + m_id + "&content="
				+ encodeURIComponent(txtval.val());

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

			myArray = new Array(new Array(count), new Array(5));

			var repledata = res[1].split('=');
			for (var i = 0; i < count; i++) {
				var tmp = repledata[i].split(',');
				myArray[i] = tmp;
			}

			var makereplelist = "";
			for (var i = 0; i < count; i++) {
				makereplelist += "<lable  class=\"commentreple\">"
						+ myArray[i][2] + "님의 댓글 /" + myArray[i][3]
						+ "</lable><br>";
			}

			var z = "<input type=\"text\" name=\"" + myArray[0][1]
					+ "\"/><input type=\"button\" value=\"replecontent\""
					+ "  onclick=\"replecommit('" + myArray[0][1]
					+ "','${memberInfo.id}')\"/><br>" + makereplelist;
					document.getElementById("popupcontent3").innerHTML = z;
			//$('.reples').empty();
			//$('.reples').append(z);

		} else {
			alert("에러: " + httpRequest.status);
		}
	}
}
</script>
</body>
</html>