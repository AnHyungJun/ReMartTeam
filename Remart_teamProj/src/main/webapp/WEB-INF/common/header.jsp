<%@page import="model.R_memberDataBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>REMART</title>
<script src="http://code.jquery.com/jquery-1.7.js"
	type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="<%=request.getContextPath() %>/ajax/httpRequest.js"></script>
</head>
<style>
.ui-autocomplete {
	overflow-y: scroll;
	overflow-x: hidden;
}
a, button, .w3-bar {
	font-family: ‘Noto Sans KR’, sans-serif;
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: 'Nanum Gothic', sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}

.btn_search {
border : 0px;
background : #ffffff;
}

.search {
border : 0px;
}

.search_mold {
border : 1px solid #000000;
width : 350px;
margin-left : 100px;
}
</STYLE>
<script>
function myFunction() {
	var x = document.getElementById("navDemo");
	if (x.className.indexOf("w3-show") == -1) {
		x.className += " w3-show";
	} else {
		x.className = x.className.replace(" w3-show", "");
	}
}

	$(function() {
		$("#autocompleteText").autocomplete({
			source : function(request, response) {
				//많이 봤죠? jquery Ajax로 비동기 통신한 후 
				//json객체를 서버에서내려받아서 리스트 뽑는 작업 
				$.ajax({
					//호출할 URL 
					url : "<%=request.getContextPath()%>/view/main/search.jsp",
					//우선 jsontype json으로 
					dataType : "json",
					// parameter 값이다. 여러개를 줄수도 있다. 
					data : {
						//request.term >> 이거 자체가 text박스내에 입력된 값이다. 
						searchValue : request.term
					},
					success : function(result) {
						//return 된놈을 response() 함수내에 다음과 같이 정의해서뽑아온다. 
						response($.map(result, function(item) {
							return {
								//label : 화면에보여지는 텍스트 
								//value : 실제 text태그에 들어갈 값 
								//본인은 둘다 똑같이 줬음 
								//화면에 보여지는 text가 즉,value가 되기때문 
								label : item.data,
								value : item.data
							}
						}));
					}
					
				});
				
			}, //최소 몇자 이상되면 통신을 시작하겠다라는 옵션 
			//minLength : 2,
			//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현
			//구현없으면 단순 text태그내에 값이 들어간다. 
			select : function(event, ui) {
			}
		});
	})
	
	$(function() {
		$("#autocompleteText2").autocomplete({
			source : function(request, response) {
				//많이 봤죠? jquery Ajax로 비동기 통신한 후 
				//json객체를 서버에서내려받아서 리스트 뽑는 작업 
				$.ajax({
					//호출할 URL 
					url : "<%=request.getContextPath()%>/view/main/search2.jsp",
					//우선 jsontype json으로 
					dataType : "json",
					// parameter 값이다. 여러개를 줄수도 있다. 
					data : {
						//request.term >> 이거 자체가 text박스내에 입력된 값이다. 
						searchValue : request.term
					},
					success : function(result) {
						//return 된놈을 response() 함수내에 다음과 같이 정의해서뽑아온다. 
						response($.map(result, function(item) {
							return {
								//label : 화면에보여지는 텍스트 
								//value : 실제 text태그에 들어갈 값 
								//본인은 둘다 똑같이 줬음 
								//화면에 보여지는 text가 즉,value가 되기때문 
								label : item.data,
								value : item.data
							}
						}));
					}
					
				});
				
			}, //최소 몇자 이상되면 통신을 시작하겠다라는 옵션 
			//minLength : 2,
			//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현
			//구현없으면 단순 text태그내에 값이 들어간다. 
			select : function(event, ui) {
			}
		});
	})
</script>
<body>
	
<div class="w3-top w3-white">
	<div class="w3-bar w3-border-bottom w3-center-align w3-large"
		style="height: 135px;">
		<div class="w3-row">
			<div class="w3-col" style="width: 20%">
				<p>&nbsp;</p>
			</div>

			<div class="w3-col" style="width: 60%">
				<div class="w3-bar-block" style="height: 135px">
					<div class="w3-bar-item w3-right-align" style="height: 10px">
						<c:if test="${empty memberInfo }">
							<a href="<%=request.getContextPath()%>/login/loginForm"
								style="font-size: 12px; text-decoration: none;" class="con_link"
								onmouseover="this.style.textDecoration='none';"
								onmouseout="this.style.textDecoration='none';">로그인</a>
								| <a href="<%=request.getContextPath()%>/login/joinForm"
								style="font-size: 12px; text-decoration: none;" class="con_link"
								onmouseover="this.style.textDecoration='none';"
								onmouseout="this.style.textDecoration='none';">회원가입</a>
						</c:if>
						<c:if test="${!empty memberInfo }">
							<a href="<%=request.getContextPath()%>/login/loginOut"
								style="font-size: 12px; text-decoration: none;" class="con_link"
								onmouseover="this.style.textDecoration='none';"
								onmouseout="this.style.textDecoration='none';">로그아웃</a>
								| <a
								href="<%=request.getContextPath()%>/mypage/myPageForm?id=${memberInfo.id}"
								style="font-size: 12px; text-decoration: none;" class="con_link"
								onmouseover="this.style.textDecoration='none';"
								onmouseout="this.style.textDecoration='none';">마이페이지</a>
						</c:if>
						| <a href="<%=request.getContextPath()%>/shopping/basket"
							style="font-size: 12px; text-decoration: none;" class="con_link"
							onmouseover="this.style.textDecoration='none';"
							onmouseout="this.style.textDecoration='none';">장바구니</a>
					</div>

					<div class="w3-bar-item" style="height: 135px">
						<div class="w3-row">
							<div class="w3-col w3-left" style="width: 20%">
								<a href="<%=request.getContextPath()%>/main/main"><img
									alt="로고"
									src="<%=request.getContextPath()%>/images/icon/logo.png"
									width="100px"></a>
							</div>
							<div class="w3-col" style="width: 50%">
								<div class="w3-bar-block w3-center">
									<div class="w3-center w3-margin-top" style="height: 40px;">
									<div class="search_mold">
										
										<form action="<%=request.getContextPath()%>/main/searchForm" method="post">
										<c:if test="${curPage != 'shopping' }">
										<input class="search" type="text" id="autocompleteText" name="autocompleteText"
											style="width: 300px; font-size: 14px; height: 30px;"><button class="btn_search" style="font-size: 13px; height: 30px;" >
											<img src="<%=request.getContextPath()%>/images/icon/search.png">
										</button>
										</c:if>
										
										<c:if test="${curPage == 'shopping' }">
										<input class="search" type="text" id="autocompleteText2" name="autocompleteText2"
											style="width: 300px; font-size: 14px; height: 30px;"><button class="btn_search" style="font-size: 13px; height: 30px;" >
											<img src="<%=request.getContextPath()%>/images/icon/search.png">
										</button>
										</c:if>
									</form>
										
										</div> 
										
									</div>
									
									<div class="w3-bar-item" style="height: 100px;">
										<a href="#" style="font-size: 12px; text-decoration: none;"
											class="con_link w3-button w3-hover-white"
											onmouseover="this.style.textDecoration='none';"
											onmouseout="this.style.textDecoration='none';">EDITOR
											RECOMMAND</a> <a
											href="<%=request.getContextPath()%>/tvrecipe/tvRecipe1"
											style="font-size: 12px; text-decoration: none;"
											class="con_link w3-button w3-hover-white"
											onmouseover="this.style.textDecoration='none';"
											onmouseout="this.style.textDecoration='none';">TV RECIPE</a>
										<c:if test="${!empty memberInfo }">
											<a href="<%=request.getContextPath()%>/writepage/writeForm"
												style="font-size: 12px; text-decoration: none;"
												class="con_link w3-button w3-hover-white"
												onmouseover="this.style.textDecoration='none';"
												onmouseout="this.style.textDecoration='none';">WRITE</a>
										</c:if>
										<c:if test="${empty memberInfo }">
											<a href="<%=request.getContextPath()%>/login/loginForm"
												style="font-size: 12px; text-decoration: none;"
												class="con_link w3-button w3-hover-white"
												onmouseover="this.style.textDecoration='none';"
												onmouseout="this.style.textDecoration='none';">WRITE</a>
										</c:if>
										<a href="<%=request.getContextPath()%>/view/local/hashtag.jsp"
												style="font-size: 12px; text-decoration: none;"
												class="con_link w3-button w3-hover-white"
												onmouseover="this.style.textDecoration='none';"
												onmouseout="this.style.textDecoration='none';">#</a>
									</div>
								</div>
							</div>
							<div class="w3-col" style="width: 30%;">
								<div class="w3-bar-block">
									<div class="w3-bar-item" style="height: 30px;">&nbsp;</div>
									<div class="w3-bar-item" style="height: 50px;">
										<a href="<%=request.getContextPath()%>/shopping/shoppingMain"><img
											alt="로고"
											src="<%=request.getContextPath()%>/images/icon/foodmall.png"
											width="130px" align="right"></a>
									</div>
									<div class="w3-bar-item" style="height: 20px;">&nbsp;</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="w3-col" style="width: 20%">
				<p>&nbsp;</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>