<%@page import="model.RepleDataBean"%>
<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
    
	request.setCharacterEncoding("utf-8");
	String feed_id = request.getParameter("feed_id");
	String id = request.getParameter("id");
	String content =request.getParameter("content");
	System.out.print(feed_id+id+content);
 	
		MybatisAjaxDBBean sel = new MybatisAjaxDBBean();
		sel.insertReple(feed_id, content,id);
		List keywordList = sel.selectReple(feed_id);
		
		out.print(keywordList.size());
		out.print("|");
		for(int i=0; i<keywordList.size(); i++){
			RepleDataBean drug = (RepleDataBean)keywordList.get(i);
			out.print(drug);
			if(i<keywordList.size() - 1 ){
				out.print("=");
			}
		}
	
%>
