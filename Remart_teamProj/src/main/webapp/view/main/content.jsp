<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<div style="margin-top:200px;"></div>
	<center>
		<div class="w3-container">
			<table class="w3-table w3-bordered" style="width: 900px; font-size:12px;">
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
					<td align="center" width="125" style="vertical-align: middle;">글내용</td>
					<td align="left" width="375" style="vertical-align: middle;" colspan="3"><pre>
         ${article.content}</pre>
         
         
         
         </td>
				</tr>
		
		
				
				<tr height="30">
			<td colspan="4" class="w3-center">
			
			 <input type="button" style="font-size:11px;"
						class="w3-button w3-light-grey w3-hover-light-grey" value="글목록"
						onclick="document.location.href='list?pageNum=${pageNum}'"></td></tr></table>
		</div></center></body></html>

