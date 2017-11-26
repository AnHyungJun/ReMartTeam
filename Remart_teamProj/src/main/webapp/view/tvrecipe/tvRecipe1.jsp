<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	border: 2px solid grey;
}
</style>
<%




String url ="http://tv.jtbc.joins.com/photo/pr10010331/pm10026814";

String line2="";
String line="";
try {
	Document doc;
	doc = Jsoup.connect(url).get();
	Elements media2 = doc.select("head");
	
	Elements media1 = doc.select("div._paginate-board-wrap");
	



	
	
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


<div style="margin-top: 200px"></div>
<div>
	<%=line %>

</div>



</body>
</html>