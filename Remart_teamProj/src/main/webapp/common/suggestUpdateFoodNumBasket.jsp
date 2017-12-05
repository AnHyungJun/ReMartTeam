<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
	System.out.println("suggestUpdateFoodNumBasket start:");
   request.setCharacterEncoding("utf-8");
   int food_id = Integer.parseInt(request.getParameter("food_id"));
   int food_num = Integer.parseInt(request.getParameter("food_num"));
   String id = request.getParameter("id");

   System.out.println("hi : " + food_id);
   MybatisAjaxDBBean ajaxDBBean = new MybatisAjaxDBBean();
   ajaxDBBean.updateFoodNum(food_id, food_num, id);
   
%>