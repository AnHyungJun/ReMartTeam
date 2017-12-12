<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<title>REMART</title>
</head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajax/httpRequest.js">
</script>
<body>
	<BR>
	<BR>
	<form name="search">
	<div class="w3-row">
		<div style="height: 50px;" align="center">
			<div class="w3-half" style="width:50%;" ><input class="w3-right" type="text" id="searchFood" name="searchFood"
				onkeydown="startSuggest()" style="height:26px; margin-right:1px;"/></div>
				<div class="w3-half" style="width:50%;"><input type="button"
				class="w3-left w3-button w3-black w3-hover-black w3-padding-small" style="font-size: 12px;"
				onclick="" value="찾기"></div>
		</div> </div>
		<div align="center" id="suggest" style="display:; margin-top: 20px;">
			<div class="" id="suggestList" align="center"
				style="width: 500px; height: 100%;"></div>
		</div>
		<div class="w3-row">
		<div class="w3-col w3-center" style="width:50px; margin-left:865px; margin-top: 30px;">
			<input type="button"
				class="w3-button w3-white w3-hover-white w3-border"
				style="font-size: 11px;" onclick="end()" value="닫기">
		</div></div>
	</form>
	<script>
	var checkFirst = false;
	var lastKeyword = '';
	var loopSendKeyword = false;
	function startSuggest(){
		
		if(checkFirst == false){
			setTimeout("sendKeyword();",500);
			loopSendKeyword = true;
		}
		checkFirst = true;
	}
	function sendKeyword(){
		if(loopSendKeyword == false)
			return;
		var keyword = document.search.searchFood.value;
		if(keyword == ''){
			lastKeyword = '';
			hide('suggest');
		}
		else if(keyword != lastKeyword){
			lastKeyword = keyword;
			if(keyword != ''){
				var params = "keyword=" + encodeURIComponent(keyword);
				sendRequest("<%=request.getContextPath()%>/common/suggestFileSearch.jsp",
				params, displayResult, 'POST');
			} else {
				hide('suggest');
			}
		}
		setTimeout("sendKeyword();", 500);
	}

		function displayResult() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					var resText = httpRequest.responseText;
					//사이즈 , 코드 , 이름=사진 ,가격 
					var res = resText.split('|');
					
					var count = parseInt(res[0]);
					var keywordList = null;
					if (count > 0) {
						keywordList = res[1].split('=');
						var html = "<table class=\"w3-table w3-bordered w3-centered\" style=\"font-size:13px;\" width=100%><tr><th width=200;>상품</th><th width=130;>상품명</th><th>가격</th><th>상품 등록</th></tr>";
						for (var i = 0; i < keywordList.length; i++) {
							
							var keywordList2 = keywordList[i].split('-');
							html += "<tr height=140px;><td align=\"center\" style=\"vertical-align: middle;\">"
									+"<img src=\"/Remart_teamProj/images/food/"+keywordList2[1]+".jpg\" width=110 height=110><br>"
									+"</td><td align=\"center\" style=\"vertical-align: middle;\">"
									+ keywordList2[1] + "</td><td align=\"center\" style=\"vertical-align: middle;\">"
									+ keywordList2[2] + "</td><td align=\"center\" style=\"vertical-align: middle;\">"
									+"<input type=\"button\" class=\"w3-button w3-padding-small w3-black w3-hover-black\" style=\"font-size:12px; vertical-align: middle;\" value=\"등록\" onclick=\"writefood('"+keywordList[i]+"')\"></td></tr>";
							// alert(html); 
						}
						html += "</table>";
						var listView = document.getElementById('suggestList');
						listView.innerHTML = html;
						show('suggest');
						reload();
					}
				} else {
					alert("에러: " + httpRequest.status);
				}
			}
		}
		function show(elementId) {
			var element = document.getElementById(elementId);
			if (element) {
				element.style.display = '';
			}
		}
		function hide(elementId) {
			var element = document.getElementById(elementId);
			if (element) {
				element.style.display = 'none';
			}
		}

		function writefood(key) {
			opener.parent.foodimg(key);
			document.search.searchFood.value = "";
			loopSendKeyword = false;
			lastKeyword = '';
			checkFirst = false;
			hide('suggest');
		}
		function end() {

			self.close();
		}
	</script>
</body>
</html>