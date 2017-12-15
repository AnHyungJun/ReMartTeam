<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body><br><br><br>
<div align="center">
   <input type="button" class="w3-bar-item w3-button w3-light-grey w3-hover-light-grey" style="font-size: 12px;" value="월별 매출" onclick="gragh('t');">
   <input type="button" class="w3-bar-item w3-button w3-light-grey w3-hover-light-grey" style="font-size: 12px;" value="회원 성비" onclick="gragh('sex');">
   <input type="button" class="w3-bar-item w3-button w3-light-grey w3-hover-light-grey" style="font-size: 12px;" value="최고,최저 상품" onclick="gragh('highlow');">
   <!-- <a href="makefile">aaaaaaaaaaaa</a> -->
   <br><br><br>
   <img src="<%=request.getContextPath()%>/viewImg/p.png" >
   <br><br><br>
   <c:if test="${tt==1}">
      <img src="<%=request.getContextPath()%>/viewImg/k.png" >
   </c:if>
</div>
<script type="text/javascript">
function gragh(h){
   location.replace("salesStatusForm?type="+h);
}

</script>
</body>
</html>