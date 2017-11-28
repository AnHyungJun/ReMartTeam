<%@page import="model.FoodDataBean"%>
<%@ page import="dao.MybatisAjaxDBBean" %>
<%@ page contentType="text/plain; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%
    
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("keyword");
	if(keyword!=null && !keyword.equals("")){
		MybatisAjaxDBBean sel = new MybatisAjaxDBBean();
		List keywordList = sel.selectFoodDb(keyword);
		out.print(keywordList.size());
		out.print("|");
		for(int i=0; i<keywordList.size(); i++){
			FoodDataBean drug = (FoodDataBean)keywordList.get(i);
			out.print(drug);
			if(i<keywordList.size() - 1 ){
				out.print("=");
			}
		}
	}
%>