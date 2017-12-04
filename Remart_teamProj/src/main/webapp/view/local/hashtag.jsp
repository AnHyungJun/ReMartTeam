<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%	request.setCharacterEncoding("utf-8"); %>
<%@ include file="/WEB-INF/common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>jQuery awesomeCloud Plugin Demos</title>
<meta name="description" content="A Word Cloud plugin for jQuery.">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script src="jquery.awesomeCloud-0.2.js"></script>
<style type="text/css">
.wordcloud {
border: 1px solid #036;
height: 7in;
margin: 0.5in auto;
padding: 0;
page-break-after: always;
page-break-inside: avoid;
width: 7in;
}
</style>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
</head>
<body>
<div style="height: 180px"></div>
<center><h2>여자</h2></center>
<div id="wordcloud2" class="wordcloud">
<c:forEach items="${hashtagCnt }" var="hash">
	<span data-weight="${hash.cnt * 5 }">${hash.hashtag_content }</span>
</c:forEach>
</div>

<center><h2>남자</h2></center>

<div id="wordcloud3" class="wordcloud">
<c:forEach items="${hashtagCnt2 }" var="hash">
	<span data-weight="${hash.cnt * 5 }">${hash.hashtag_content }</span>
</c:forEach>
</div>

<script>
			$(document).ready(function(){
				$(document).ready(function(){
					$("#wordcloud2").awesomeCloud({
						"size" : {
							"grid" : 9,
							"factor" : 1
						},
						"options" : {
							"color" : "random-dark",
							"rotationRatio" : 0.35
						},
						"font" : "'Times New Roman', Times, serif",
						"shape" : "circle"
					});
					$("#wordcloud3").awesomeCloud({
						"size" : {
							"grid" : 9,
							"factor" : 1
						},
						"options" : {
							"color" : "random-dark",
							"rotationRatio" : 0.35
						},
						"font" : "'Times New Roman', Times, serif",
						"shape" : "circle"
					});
				});
				
			});
		</script> 
        
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
