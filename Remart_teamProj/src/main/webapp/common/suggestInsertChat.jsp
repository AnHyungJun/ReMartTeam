<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
   System.out.println("suggestInsertChat.jsp start:");
   request.setCharacterEncoding("utf-8");

   String id = request.getParameter("id");
   String content = request.getParameter("content");

   MybatisAjaxDBBean ajaxDBBean = new MybatisAjaxDBBean();
   ajaxDBBean.insertChat(id, content);

%>