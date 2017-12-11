<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>REMART ADMIN</title>
<style>
.list_body {
	table-layout: fixed; /* 셀안의 데이터가 길어서 지정한 너비 이상으로 셀을 밀어버리는 것을 방지 */
	word-break: break-all; /* 테이블 고정 줄바꿈 일어남 */
	width: 100%;
	position: relative;
}

.list_body_table th {
	padding: 14px 0 12px 0;
	font-size: 13px;
	border-top: 1px solid #24221f;
	border-bottom: 1px solid #bbb;
	line-height: 1.2;
}

.list_body_table td {
	border-left: 0;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	border-bottom: 1px solid #bbb;
}

.tiny {
	font-size: 2px;
}
</style>
</head>
<body>

	<div style="margin-top: 120px"></div>
	<center>
		<div id="search" style="text-align: center; width: 900px;">
			<div class="w3-right">
				<form id="searchForm" action="customForm" method="post"
					name="searchForm">
					<p>
						<select name="searchOption" style="font-size: 13px;">
							<option value="id">ID</option>
							<option value="name">NAME</option>
							<option value="">PROFILE</option>
							<option value="">GRADE</option>
						</select> <input style="height: 23px;" type="text" name="searchWord"
							size="30" maxlength="50" /> <input
							class="w3-button w3-white w3-hover-white w3-padding-small"
							style="font-size: 12px;" type="submit" value="검색" />
					</p>
				</form>
			</div>
		</div>
		<div style="margin-top: 10px;"></div>

		<div class="w3-container w3-center" style="width: 900px;">
			<div class="list_body">
				<table class="list_body_table w3-table w3-center" width="100%"
					style="font-size: 13px;">
					<tr
						style="border-top: 1px solid #666; background-color: #f7f7f7; font-size: 13px;">
						<th width="25%" class="w3-center">ID</th>
						<th width="20%" class="w3-center">NAME</th>
						<th width="15%" class="w3-center">GRADE</th>
						<th width="15%" class="w3-center">CHAGNE</th>
						<th width="15%" class="w3-center">PROFILE</th>
					</tr>

					<c:if test="${articleFindMember == null }">
						<c:forEach var="member" items="${articleMember}">
							<c:if test="${member.id != 'admin' }">
								<form name="memInfo" action="customPro" method="post">
									<input type="hidden" id="id" name="id" value="${member.id }">
									<input type="hidden" id="grade" name="grade"
										value="${member.grade }">
									<tr>
										<td class="w3-center" style="vertical-align: middle;">${member.id }</td>
										<td class="w3-center" style="vertical-align: middle;">${member.name }</td>
										<c:if test="${member.grade == 'nomal' }">
											<td class="w3-center" style="vertical-align: middle;">일반</td>
										</c:if>
										<c:if test="${member.grade == 'editor' }">
											<td class="w3-center" style="vertical-align: middle;">에디터</td>
										</c:if>
										<td class="w3-center" style="vertical-align: middle;"><input
											class="w3-button w3-black w3-hover-black w3-padding-small"
											style="font-size: 11px;" type="submit" value="change"></td>
										<td class="w3-center" style="vertical-align: middle;"><input
											class="w3-button w3-black w3-hover-black w3-padding-small"
											style="font-size: 11px;" type="button" value="상세보기"
											onclick="memberInfo(this.form)"></td>
									</tr>
								</form>
							</c:if>
						</c:forEach>
					</c:if>

					<c:if test="${articleFindMember != null }">
						<c:forEach var="findmember" items="${articleFindMember}">
							<form name="memInfo" action="customPro" method="post">
								<input type="hidden" id="id" name="id" value="${findmember.id }">
								<input type="hidden" id="grade" name="grade"
									value="${findmember.grade }">
								<tr>
									<td class="w3-center" style="vertical-align: middle;">${findmember.id }</td>
									<td class="w3-center" style="vertical-align: middle;">${findmember.name }</td>
									<c:if test="${findmember.grade == 'nomal' }">
										<td style="vertical-align: middle;">일반</td>
									</c:if>
									<c:if test="${findmember.grade == 'editor' }">
										<td style="vertical-align: middle;">에디터</td>
									</c:if>
									<td class="w3-center" style="vertical-align: middle;"><input
										class="w3-button w3-black w3-hover-black w3-padding-small"
										style="font-size: 11px;" type="submit" value="change"></td>
									<td class="w3-center" style="vertical-align: middle;"><input
										class="w3-button w3-black w3-hover-black w3-padding-small"
										style="font-size: 11px;" type="button" value="상세보기"
										onclick="memberInfo(this.form)"></td>
								</tr>
							</form>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</center>

	<script>
		function memberInfo(thisform) {
			var id = thisform.id.value;
			url = "customInfo?id=" + id;

			open(url, "customInfo",
					"toolbar = no,location=no, status= no, menubar = no,"
							+ "resizable=no, width = 600, height = 600");
		}
	</script>
</body>
</html>