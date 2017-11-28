<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
    
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("keyword");

	MybatisAjaxDBBean ajaxDBBean = new MybatisAjaxDBBean();
	String username = ajaxDBBean.selectUserNameDb(keyword);
	out.print(username);

%>