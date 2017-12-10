
<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page import="java.util.List"%>
<%
    
	request.setCharacterEncoding("utf-8");
	String feed_id = request.getParameter("feed_id");
	String action = request.getParameter("action");
	String id = request.getParameter("id");
	MybatisAjaxDBBean dbPro = new MybatisAjaxDBBean();
	out.print(feed_id);
	out.print("|");
	if (action.equals("like")){
		dbPro.like(id, feed_id,"L");
		out.print("L");
	}else if (action.equals("bookmark")){
		dbPro.like(id, feed_id,"B");
		out.print("B");
	}else if (action.equals("unbookmark")){
		dbPro.unlike(id, feed_id,"B");
		out.print("C");
	}
%>