<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
    
   request.setCharacterEncoding("utf-8");
   int food_id = Integer.parseInt(request.getParameter("food_id"));
   int food_num = Integer.parseInt(request.getParameter("food_num"));
   String id = request.getParameter("id");

   MybatisAjaxDBBean ajaxDBBean = new MybatisAjaxDBBean();
   ajaxDBBean.selectBasketDb(food_id, food_num, id);
   
%>