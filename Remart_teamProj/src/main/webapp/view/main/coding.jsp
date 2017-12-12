<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REMART</title>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<script type="text/javascript">
	$(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "editor",
	        sSkinURI: "<%=request.getContextPath()%>/resources/editor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부
	            bUseModeChanger : true,
	        }
	    });
	    //전송버튼
	    $("#insertBoard").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#insertBoardFrm").submit();
	    });
	});
</script>
<body>
<div style="margin-top:200px;"></div>
<center>
	<form class="w3-center" action="<%=request.getContextPath() %>/main/insertBoard" method="post" id="insertBoardFrm" enctype="multipart/form-data">
		<textarea name="editor" id="editor" style="width: 700px; height: 400px;"></textarea>
		<div style="margin-top:20px;"></div>
		<input type="button" class="w3-button w3-black w3-hover-black" style="font-size:12px;" id="insertBoard" value="등록" />
	</form> </center>

</body>
</html>
