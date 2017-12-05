<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
   System.out.println("confirmBasket start:");
   request.setCharacterEncoding("utf-8");
   int food_id = Integer.parseInt(request.getParameter("food_id"));
   int food_num = Integer.parseInt(request.getParameter("food_num"));
   String id = request.getParameter("id");

   MybatisAjaxDBBean ajaxDBBean = new MybatisAjaxDBBean();
   int x = ajaxDBBean.confirmBasket(food_id, id);
	System.out.println("x="+x);
   out.print(x);
   out.print(",");
   out.print(food_id);
   out.print(",");
   out.print(food_num);
   out.print(",");
   out.print(id);
%>