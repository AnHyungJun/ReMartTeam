
<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page import="java.util.List"%>
<%
    
	request.setCharacterEncoding("utf-8");
	String followStatus = request.getParameter("followStatus");
	String myid = request.getParameter("myid");
	String otherid = request.getParameter("otherid");
	
	MybatisAjaxDBBean dbPro = new MybatisAjaxDBBean();
	
	if(followStatus.equals("follow")){
		dbPro.insertFollow(myid,otherid);
	}else{
		dbPro.deleteFollow(myid, otherid);
	}
%>