<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>REMART</title>
</head>
<style>
table {
	border: 2px solid grey;
}
</style>
<%




String url ="http://program.tving.com/tvn/3bobfisherman2/14/Board/View";

String line2="";
String line="";
try {
	Document doc;
	doc = Jsoup.connect(url).get();
	Elements media2 = doc.select("head");
	
	Elements media1 = doc.select("div.contentInnerWrap");
	



	
	
	/*   for (Element src : media3) {

	    String templine = src.toString();
	     line+=templine;
		
	}
	for (Element src : media4) {

	    String templine = src.toString();
	     line+=templine;
		
	}   */
for (Element src : media2) {
	    
	    String templine = src.html();
	   
	    
	     line+=templine;
	     
		
	}

	for (Element src : media1) {
	    
	    String templine = src.html();
	   
	    
	     line+=templine;
	     
		
	}
/* for (Element src : media2) {
	    
	    String templine = src.html();
	   
	    
	     line+=templine;
	     
		
	}
for (Element src : media3) {
    
    String templine = src.html();
   
    
     line+=templine;
     
	
} */
 
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
//line = line.substring(0, line.length()-1);
//line = line.replace("src=\"", "src=\"http://www.ikea.com");

%>
<body>

	<div style="margin-top: 200px"></div>

	<center>

		<div class="w3-bar" style="width: 1000px;">
			<div class="w3-center" style="font-size: 12px;">
				<a class="w3-button w3-white w3-border w3-hover-white" href="<%=request.getContextPath() %>/tvrecipe/tvRecipe1">냉장고를
					부탁해</a> <a class="w3-button w3-white w3-border w3-hover-white" href="<%=request.getContextPath() %>/tvrecipe/tvRecipe2">집밥
					백선생</a> <a class="w3-button w3-white w3-border w3-hover-white" href="<%=request.getContextPath() %>/tvrecipe/tvRecipe3">삼시세끼</a>
			</div>
			<div style="margin-top:30px;"></div>
			<%=line %>
		</div>

	</center>

</body>
</html>