<%@page import="model.RepleDataBean"%>
<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%

   request.setCharacterEncoding("utf-8");
   String feed_id = request.getParameter("feed_id");
   String id = request.getParameter("id");
   String content = request.getParameter("content");
	
   MybatisAjaxDBBean ajaxDBBean = new MybatisAjaxDBBean();
   ajaxDBBean.insertReple(feed_id, content, id);
   List repleList = ajaxDBBean.selectReple(feed_id);
	out.print(repleList.size());
	out.print("|");
	for(int i=0; i<repleList.size(); i++){
		RepleDataBean drug = (RepleDataBean)repleList.get(i);
		out.print(drug);
		if(i<repleList.size() - 1 ){
			out.print("=");
		}
	}
%>