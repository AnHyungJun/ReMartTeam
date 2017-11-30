<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="dao.MybatisAjaxDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String searchValue = request.getParameter("searchValue");
		JSONArray arrayObj = new JSONArray();
		JSONObject jsonObj = null;

		//////////// 임의의 데이터(db라 가정하자) ////////////  
		ArrayList<String> dblist = new ArrayList<String>();
		ArrayList<String> resultlist = new ArrayList<String>();
		
		MybatisAjaxDBBean sel = new MybatisAjaxDBBean();
		
		List foodList = sel.selectFoodNameDb();
		for(int i=0; i<foodList.size(); i++){
			dblist.add((String)foodList.get(i));
		}


		for (String str : dblist) {
			if (str.toLowerCase().startsWith(searchValue)) {
				resultlist.add(str);
			}
		}
		///////////resultlist를 db에서 조회후 뽑아온 list라고 가정한다.///////////

		//뽑은 후 json파싱
		for (String str : resultlist) {
			jsonObj = new JSONObject();
			jsonObj.put("data", str);
			arrayObj.add(jsonObj);
		}

		PrintWriter pw = response.getWriter();
		pw.print(arrayObj);
		pw.flush();
		pw.close();
	%>
</body>
</html>