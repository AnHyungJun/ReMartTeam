<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
    
	request.setCharacterEncoding("utf-8");
	String food_id = request.getParameter("food_id");
	String food_num = request.getParameter("food_num");

	MybatisAjaxDBBean ajaxDBBean = new MybatisAjaxDBBean();
	ajaxDBBean.selectBasketDb(food_id, food_num);

%>