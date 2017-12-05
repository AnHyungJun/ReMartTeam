<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>REMART</title>
</head>
<script	type = "text/javascript" src = "<%=request.getContextPath() %>/ajax/httpRequest.js">

</script>
<script type="text/javascript">
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
		var keyword = document.search.keyword.value;
		if(keyword == ''){
			lastKeyword = '';
			hide('suggest');
		}
		else if(keyword != lastKeyword){
			lastKeyword = keyword;
			if(keyword != ''){
				var params = "keyword=" + encodeURIComponent(keyword);
				sendRequest("<%=request.getContextPath()%>/common/suggestFileSearch.jsp", params, displayResult, 'POST');
			}
			else{
				hide('suggest');
			}
		}
		setTimeout("sendKeyword();",500);
	}
	
	function displayResult(){
		if(httpRequest.readyState == 4) {
	         if(httpRequest.status == 200) {
	            var resText = httpRequest.responseText;
	            var res =  resText.split('|');
	            var count = parseInt(res[0]);
	            var keywordList = null;
	            if( count > 0 ) {
	               keywordList = res[1].split('=');
	               var html = "<table class=\"w3-table w3-bordered w3-centered\"><tr><th>상품코드</th><th>상품명</th><th>가격</th></tr>";
	               for ( var i = 0 ; i < keywordList.length ; i++) {
	                  
	            	   var keywordList2 = keywordList[i].split('-');
	                  html+= "<tr><td><a href=\"javascript:select('" +
	                  keywordList2[0]+"-"+keywordList2[1] +"-"+keywordList2[2]  + "')\">" +
	                  keywordList2[0] + "</a></td><td>" + keywordList2[1] 
	                  +"</td><td>" + keywordList2[2] +"</td></tr>";
	                   // alert(html); 
	               }
	               html+= "</table></form>";
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
	function select(selectedKeyword){
		document.search.keyword.value = selectedKeyword;
		loopSendKeyword = false;
		checkFirst = false;
		hide('suggest');
	}
	function show(elementId){
		var element = document.getElementById(elementId);
		if(element){
			element.style.display = '';
		}
	}
	function hide(elementId){
		var element = document.getElementById(elementId);
		if(element){
			element.style.display = 'none';
		}
	}
	function aaaaa(){
		alert(document.getElementById('keyword').value);
				
	 	var table = window.opener.document.getElementById('offlineSearchTable');
		var rowlen = table.rows.length;
		var row = table.insertRow(rowlen);	// HTML에서의 권장 표준 문법
		
		var aa = document.getElementById('keyword').value.split('-');
		
		row.insertCell(0).innerHTML = "<input class='w3-input w3-center' type='text' name = 'no' value = '"+rowlen+"'>";
		row.insertCell(1).innerHTML = "<input class='w3-input' type='text' name = 'food_id' value = '"+aa[0]+"'>";
		row.insertCell(2).innerHTML = "<input class='w3-input' type='text' name = 'name' value = '"+aa[1]+"'>";
		row.insertCell(3).innerHTML = "<button onclick=\"up("+aa[0]+")\" class=\"w3-button w3-white w3-hover-white \" type=\"button\">▲</button>"
		+ "<input type='text w3-center' size='2' style=\"height:30px;\" name = 'qty' value = '1' id='"+aa[0]+"q'>" 
		+ "<button onclick=\"down("+aa[0]+")\" class=\"w3-button w3-white w3-hover-white\" type=\"button\">▼</button>";
		row.insertCell(4).innerHTML = "<input class='w3-input' type='text' name = 'price' value = '"+aa[2]+"'  id='"+aa[0]+"p'>" ;
		row.insertCell(5).innerHTML = "<button onclick=\"remove_this()\" class=\"w3-button w3-border w3-round-xlarge\" style=\"font-size:12px;\" type=\"button\">삭제</button>";
		
		window.opener.sumsum();
		
		self.close(); 
	} 
</script>
<style>
	#view{
		border: 1px solid #999;
	}
</style>
</head>
<body>
<form	name = "search">
	<input   type="text" name = "keyword" id = "keyword" onkeydown = "startSuggest()"/>
	<input type="button" value="확인" onclick = "aaaaa()"/>
	<div id="suggest" style = "display:; position: absolute; left:0px; top:50px;">
		<div id = "suggestList">
			
		</div>
	</div>
</form>
</body>
</html>