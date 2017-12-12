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
	width: 750px;
	height: 600px;
	z-index: 99999;
}
</style>

</head>
<body>
	<div style="margin-top: 140px"></div>

	<center>
		<div class="w3-center" style="width: 1000px">

			<div class="w3-container">
				<div style="margin-top: 50px;"></div>
				<div class="w3-center">
					<c:if test="${fn:length(feedlist) != 0}">
						<!-- 디비에서 데이터 받아와서 함수에 뿌려주는 부분  -->
						<c:forEach var="list" items="${feedlist}" varStatus="status">
							<div class="w3-cell"
						style="display: inline; width: 302px; height: 302px; float: left; border: 0px solid #ddd; margin-left: 20px; margin-bottom: 30px;">

								<div class="w3-center">
									<!-- 함수 실행해서 이미지 이름 ,사이즈 등등 넘겨주는 부ㅜ분 -->
									<c:if test="${list.feed_grade eq 'editor'}">
									<img id="${list.feed_id}" class="showMask"
										src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
										style="width: 300px; height: 300px"
										onclick="editorfeed('${fn:length(list.img_name)}','${list}','${list.img_name}','${list.content}','${list.replelist}','${fn:length(list.replelist)}','${list.food_id}');">
										<div style="margin-top:10px; font-size:12px;"><b>${list.recipe_name }</b></div>
									</c:if>
									<c:if test="${list.feed_grade eq 'nomal'}">
									<img id="${list.feed_id}" class="showMask"
										src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
										style="width: 300px; height: 300px"
										onclick="nomalfeed('${fn:length(list.img_name)}','${list}','${list.img_name}','${list.content}','${list.replelist}','${fn:length(list.replelist)}');"><br>
									<div style="margin-top:10px; font-size:12px;"><b>${list.recipe_name }</b></div>
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
			<div style="width: 45%; height: 40px;">
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
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
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
	}
	
	function editorfeed(imagenum,feeddate,imagename,contentname,repledata,replenum,foodname){
   		var myArray ;
   		var feedid;
   		$('.window').css('width', 920);
   		imagename=imagename.substring(1,imagename.length-1);
   		foodname=foodname.substring(1,foodname.length-1);
   		contentname=contentname.substring(1,contentname.length-1);
   		repledata=repledata.substring(1,repledata.length-1);
   		<!-- feed_id,id,like_num,reg_date,recipe_name-->
   		imagename=imagename.split(', ');
   		feeddate=feeddate.split(', ');
   		foodname=foodname.split(', ');
   		feedid=feeddate[0].substring(22);
   		contentname=contentname.split(',');
   		title = feeddate[5].substring(12, feeddate[5].length);
   		for(var i=0;i<imagenum;i++){   			
   			var y="<div align=\"center\" class=\"mySlides\" style=\"float: left; width: 45%; height: 450px;\">"+
    		"<img src='"+"/Remart_teamProj/fileSave/"+imagename[i]+"' width=94% height=350>"+"<div style=\"margin-top:10px;\"></div>"+
    		"<label style=\"font-size:13px;\">"+"<b>"+title+"</b>"+"<br>"+contentname[i]+"</label>"+"</div>";
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
   	   		var makereplelist="";
   	   		for(var i=0;i<replenum;i++){
   	   			makereplelist+="<lable class=\"commentreple\" style=\"font-size:12px;\">"+myArray[i][2]+"&nbsp;"+myArray[i][3]+"</lable><br>";
   	   		}
   	   		var z="<div align=\"left\"  class=\"reples\"style=\"float: left; width: 26%; margin-top: 10px; marign-left:2px;\"><input type=\"text\" name=\""+feedid+"\"/><input class=\"w3-button w3-black w3-hover-black w3-padding-small\" style=\"font-size:12px;\" type=\"button\" value=\"reple\""
   	   		+"  onclick=\"replecommit('"+feedid+"','${memberInfo.id}')\"/><br>"
   	   		+makereplelist+"</div>"
   	   		
   	   		$('.window').append(z); 
   		}else{
   			var z="<div align=\"left\"  class=\"reples\"style=\"float: left; width: 26%; margin-top: 10px;\"><input type=\"text\" name=\""+feedid+"\"/><input class=\"w3-button w3-black w3-hover-black w3-padding-small\" style=\"font-size:12px;\" type=\"button\" value=\"reple\""
   	   		+"  onclick=\"replecommit('"+feedid+"','${memberInfo.id}')\"/><br>"
   	   		+"</div>"
   	   		
   	   		$('.window').append(z); 
   		}
   		
   		
   		
   		
  		var editorfood="";
  		for(var i=0;i<foodname.length;i++){
  			
  			editorfood+="<input type=\"checkbox\" name=\"chk_info\" value=\""+foodname[i]+"\">"+"<img src=\"/Remart_teamProj/images/food/"+foodname[i]+".jpg\" width=100 height=100/><br>";
  		}
  		var z="<div align=\"left\"  class=\"food\"style=\"float: left; width: 13%; margin-top: 10px;\">"
  		+"<form action=\"\" method=\"post\">"
  		+editorfood+"<div style=\"margin-top:50px;\"></div>"+"<input class=\"w3-button w3-border w3-white w3-hover-white w3-padding-small\" style=\"font-size:11px; margin-left:30px;\" type=\"submit\" value=\"장바구니\"></form></div>"
  		
  		$('.window').append(z); 
   		
   		
   		
   		
   		
   		
   		
   		$('.window').show();
   		showDivs(1);//슬라이더 처음값
   	}
   	function replecommit(feed_id,m_id) {
		
		var txtval=$('input:text[name="'+feed_id+'"]');
		
		if(txtval.val()=='') alert("입력하신 댓글이 없습니다");
		else{
			var params =  "feed_id="+feed_id+"&id="+m_id+"&content="+encodeURIComponent(txtval.val());
			
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
	   	   			makereplelist+="<lable  class=\"commentreple\" style=\"font-size:12px; marign-left:2px;\">"+myArray[i][2]+"&nbsp;"+myArray[i][3]+"</lable><br>";
	   	   		}
	   	   
	   	   	var z="<input type=\"text\" name=\""+myArray[0][1]+"\"/><input class=\"w3-button w3-black w3-hover-black w3-padding-small\" style=\"font-size:12px;\" type=\"button\" value=\"reple\""
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
            $('.mySlides').remove();
            $('.mask, .window').hide();
        });
 
       
        $('.mask').click(function () {
            $(this).hide();
            slideIndex=1;
            $('.food').remove();
            $('.reples').remove();
            $('.mySlides').remove();
            $('.window').hide();
        });
    });
</script>
</body>
</html>