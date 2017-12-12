<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<center>
	<br><br><br><br><br><br><br>
		<div class="w3-container">
			<table class="w3-table-all" style="width: 80%;">
				<tr height="30">
					<td width="125" align="center">글번호</td>
					<td width="125" align="center">${article.restaurant_recommand_id}</td>
				
				</tr>
				<tr height="30">
					<td width="125">작성자</td>
			<td width="125" align="center">${article.id}</td>
			<td width="125" align="center">작성일</td>
				<td align="center" width="125" >
				${article.reg_date}</td></tr>
				<tr height="30">
					<td align="center" width="125">글제목</td>
					<td align="center" width="375" colspan="3">
					${article.subject}</td>
				</tr><tr height="30">
					<td align="center" width="125">글내용</td>
					<td align="left" width="375" colspan="3"><pre>
         ${article.content}</pre>
         
         
         
         </td>
				</tr>
		
		
				
				<tr height="30">
			<td colspan="4" class="w3-center">
			
			 <input type="button" value="글목록"
		onclick="document.location.href='list?pageNum=${pageNum}'">
					</td></tr></table>
		</div></center></body></html>

