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
<style>
table {
	border: 2px solid grey;
}
</style>
<script>
	function followPush() {
		if (document.getElementById('loginId').value == "N") {
			alert("로그인후 이용하세요");
		} else {

		}
	}
	function unfollowPush() {
		if (document.getElementById('loginId').value == "N") {
			alert("로그인후 이용하세요");
		} else {

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
			<h2>사람</h2>
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
									href="<%=request.getContextPath()%>/mypage/myPageForm?id=${search.id }">${search.id }</a>
							</c:if>

							<br> ${search.info }
						</div>

						<div style="float: right; margin: 30px;">
							<c:if test="${search.follow_status == 0}">
								<c:if test="${memberInfo.id ne search.id  }">
									<button type="button" onclick="followPush()">follow</button>
								</c:if>
							</c:if>
							<c:if test="${search.follow_status == 1}">
								<button type="button" onclick="unfollowPush()">unfollow</button>
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