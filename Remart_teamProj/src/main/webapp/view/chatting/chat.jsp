<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset style="width: 500; height: 400;">
		<input type="hidden" value="${id }" id="id">
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text" style="margin-top: 20px; width: 350px;" onkeyup="enterkey()"/>
        <input type="submit" value="send" style="margin-top: 20px; " onclick="send()" />
    </fieldset>
</body>
    <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8080/Remart_teamProj/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
        var id = document.getElementById('id');
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        /* textarea.value += event.data + "\n"; */
        var message = event.data.split(":");
        var sender = message[0].trim();
        var content = message[1].trim();
        
        
        if(content.substring(0,1) == "/") {
        	var temp = content.split(" ");
        	
        	if(temp[0] == "/"+id.value){
            	var aaa = content.replace(temp[0], "(귓속말) : ");
            	textarea.value += sender + aaa + "\n";
        	}else {}
        	
        }else {
        	textarea.value += sender + " : " + content + "\n";
        }
        
    }
    function onOpen(event) {
        textarea.value += "${id}님이 채팅에 참여하였습니다.\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
    	// 내 메세지
        textarea.value += "나 : " + inputMessage.value + "\n";
    	// 메세지 보내기
        webSocket.send(id.value + " : " + inputMessage.value);
        inputMessage.value = "";
    }
    
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
  </script>
</body>
</html>