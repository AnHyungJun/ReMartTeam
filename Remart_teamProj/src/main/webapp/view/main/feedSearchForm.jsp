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
	height: 500px;
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
					<c:if test="${fn:length(searchList) != 0}">
						<!-- 디비에서 데이터 받아와서 함수에 뿌려주는 부분  -->
						<c:forEach var="list" items="${searchList}" varStatus="status">
							<%-- <c:if test="${status.count % 3 == 1}">
					<div class="w3-container" style="margin-bottom: 10px;border: solid 4px;"/>
				</c:if> --%>
							<div class="w3-container"
								style="float: left; width: 33%; height: 350px; margin-top: 10px;">

								<div class="w3-center">
									<!-- 함수 실행해서 이미지 이름 ,사이즈 등등 넘겨주는 부ㅜ분 -->
									<img id="${list.feed_id}" class="showMask"
										src="<%=request.getContextPath()%>/fileSave/${list.img_name[0]}"
										style="width: 300px; height: 300px"
										onclick="popup('${fn:length(list.img_name)}','${list}','${list.img_name}','${list.content}','${list.replelist}','${fn:length(list.replelist)}');"><br>
									${list.recipe_name }
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<c:if test="${fn:length(searchList) == 0}">
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
			<div style="margin-top:40px;"></div>
			<div style="width: 100%; height: 50px;">
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
		if (slideIndex == 1) {
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
   	function popup(imagenum,feeddate,imagename,contentname,repledata,replenum){
   		var myArray ;
		//리스트 받은거 문자 쪼개는거
   		imagename=imagename.substring(1,imagename.length-1);
   		contentname=contentname.substring(1,contentname.length-1);
   		repledata=repledata.substring(1,repledata.length-1);
   		<!-- feed_id,id,like_num,reg_date,recipe_name-->
   		imagename=imagename.split(', ');
   		feeddate=feeddate.split(',');
   		feeddate=feeddate[0].substring(22);
   		
   		contentname=contentname.split(',');
   		if(imagenum>1){
   			document.getElementById("rightpage").style.display = 'block';
   			document.getElementById("leftpage").style.display = 'none';
   		}else{
   			document.getElementById("rightpage").style.display = 'none';
   			document.getElementById("leftpage").style.display = 'block';
   		}
   		for(var i=0;i<imagenum;i++){   			
   			var y="<div align=\"center\" class=\"mySlides\" style=\"float: left; width: 55%; height: 350px; margin-top: 10px;\">"+
    		"<img src='"+"/Remart_teamProj/fileSave/"+imagename[i]+"' width=100% height=100%><br>"+
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
   	   		var makereplelist="";
   	   		for(var i=0;i<replenum;i++){
   	   			makereplelist+="<lable>"+myArray[i][2]+"님의 댓글 /"+myArray[i][3]+"</lable><br>";
   	   		}
   	   		var z="<div align=\"center\"  class=\"reples\"style=\"float: left; width: 45%; height: 350px; margin-top: 10px;\"><input type=\"text\" name=\""+feeddate+"\"/><input type=\"button\" value=\"replecontent\""
   	   		+"  onclick=\"replecommit('"+feeddate+"','${memberInfo.id}')\"/><br>"
   	   		+makereplelist+"</div>"
   	   		
   	   		$('.window').append(z); 
   		}
   		
   		
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
				var keywordList = null;
				alert(res);
				/* if (count > 0) {
					keywordList = res[1].split('=');
					var html = "<table class=\"w3-table w3-bordered w3-centered\" width=100%><tr><th width=200;>상품</th><th width=150;>상품명</th><th>가격</th><th>상품 등록</th></tr>";
					for (var i = 0; i < keywordList.length; i++) {
						
						var keywordList2 = keywordList[i].split('-');
						html += "<tr height=140px;><td align=\"center\">"
								+"<img src=\"/Remart_teamProj/images/food/"+keywordList2[1]+".jpg\" width=110 height=110><br>"
								+"</td><td align=\"center\">"
								+ keywordList2[1] + "</td><td align=\"center\">"
								+ keywordList2[2] + "</td><td align=\"center\">"
								+"<button type=\"button\" onclick=\"writefood('"+keywordList[i]+"')\">등록</button></td></tr>";
						// alert(html); 
					}
					html += "</table>";
					var listView = document.getElementById('suggestList');
					listView.innerHTML = html;
					show('suggest');
					reload();
				}*/
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
</body>
</html>