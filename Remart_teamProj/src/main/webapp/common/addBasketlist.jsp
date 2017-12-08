<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
	
   request.setCharacterEncoding("utf-8");
   String food_name[] = request.getParameter("food_name").split(",");
   String id = request.getParameter("id");
	
  
   MybatisAjaxDBBean ajaxDBBean = new MybatisAjaxDBBean();
   for(int i=0;i<food_name.length;i++){
	   int food_id=ajaxDBBean.selectfoodId(food_name[i]);
	   
	   int x = ajaxDBBean.confirmBasket(food_id, id);
	  	 System.out.print(food_id);
	   if(x==1){
		   ajaxDBBean.updateFoodNum(food_id, 1, id);
	   }else{
		   ajaxDBBean.selectBasketDb(food_id, 1, id);
	   }
	   
   }

    
%>