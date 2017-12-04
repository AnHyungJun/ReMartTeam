<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>REMART</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajax/httpRequest.js"></script>
<style>
table {
	border: 2px solid grey;
}
</style>
<script>
	function followPush(userInput) {
		var followStatus = userInput.follow.value;
		var otherid = userInput.otherid.value;
		var myid = userInput.myid.value;
		if (document.getElementById('loginId').value == "N") {
			alert("로그인후 이용하세요");
		} else {
			var params = "followStatus=" + encodeURIComponent(followStatus) + "&myid=" + encodeURIComponent(myid) + "&otherid=" + encodeURIComponent(otherid);
			sendRequest("<%=request.getContextPath()%>
	/view/main/followButton.jsp",
					params, followResult, 'POST');
			if (userInput.follow.value == "follow") {
				userInput.follow.value = "unfollow";
			} else {
				userInput.follow.value = "follow";
			}
		}
	}
	function followResult() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

			} else {
				alert("에러: " + httpRequest.status);
			}
		}
	}
</script>
<c:if test="${memberInfo eq null }">
	<input type="hidden" value="N" id="loginId" name="loginId">
</c:if>
<c:if test="${memberInfo ne null }">
	<input type="hidden" value="Y" id="loginId" name="loginId">
</c:if>
<body>

	<div style="margin-top: 200px"></div>
	<div>

		<div class="w3-col" style="width: 25%">
			<p>&nbsp;</p>
		</div>

		<div class="w3-col" style="width: 50%">
			<c:if test="${divi eq  '0'}">
				<h3>
					<b>USER</b>
				</h3>
			</c:if>
			<c:if test="${divi eq  '1'}">
				<h3>
					<b>FOLLOWING</b>
				</h3>
			</c:if>
			<c:if test="${divi eq  '2'}">
				<h3>
					<b>FOLLOWER</b>
				</h3>
			</c:if>
			<div style="margin-top: 50px"></div>
			<c:forEach items="${searchList }" var="search">
				<form action="userSearchPro" method="post">
					<div style="height: 100px">
						<div style="float: left; margin: 30px;">
							<img
								src="<%=request.getContextPath()%>/fileSave/${search.profileImg}"
								class="w3-circle" alt="Norway" style="width: 60px; height: 60px">

						</div>

						<div style="float: left; margin: 30px;">
							<c:if test="${memberInfo.id eq search.id  }">
								 ${search.id }
							</c:if>
							<c:if test="${memberInfo.id ne search.id  }">
								<a
									href="<%=request.getContextPath()%>/mypage/myPageForm?id=${search.id }"
									style="text-decoration: none;" class="con_link"
									onmouseover="this.style.textDecoration='none';"
									onmouseout="this.style.textDecoration='none';">${search.id }</a>
								<input type="hidden" value="${search.id }" name="otherid">
								<input type="hidden" value="${memberInfo.id }" name="myid">
							</c:if>

							<br> ${search.info }
						</div>

						<div style="float: right; margin: 30px;">
							<c:if test="${search.follow_status == 0}">
								<c:if test="${memberInfo.id ne search.id  }">
									<input type="button"
										class="w3-button w3-white w3-hover-black w3-border"
										style="font-size: 13px;" onclick="followPush(this.form)"
										value="follow" name="follow">
								</c:if>
							</c:if>
							<c:if test="${search.follow_status == 1}">
								<c:if test="${memberInfo.id ne search.id  }">
									<input type="button" onclick="followPush(this.form)"
										value="unfollow" name="follow">
								</c:if>
							</c:if>
						</div>


					</div>
					<br>

				</form>
			</c:forEach>
		</div>


		<div class="w3-col" style="width: 25%">
			<p>&nbsp;</p>
		</div>
	</div>

</body>
</html>