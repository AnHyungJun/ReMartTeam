<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div id="feedcontent"
	style="width: 350px; margin-left: 30px; font-size: 13px; float: left">
	<!-- 메인 컨텐츠 -->
	<c:if test="${feed.imgSize>1 }">
		<div id="changecontent0">
			<div class="w3-center">
		
				<button id="rightpage" style="float: right" type="button"
					class="w3-button w3-white w3-hover-white"
					onclick="changediv('changecontent0','changecontent1')">
					<b> 〉 </b>
				</button>
			</div>
			<img src="<%=request.getContextPath()%>/fileSave/${feed.img_name[0]}"
				style="width: 350px; height: 350px; display: block;">
				<div style="margin-top:15px;"></div>
				<!-- 좋아요 북마크 -->
	<div id="like_bookmark">
		<!-- 로그인 안했을 때 -->
		<c:if test="${id=='id_not_exist' }">
			<img onclick="needlogin()"
				src="<%=request.getContextPath()%>/images/icon/like_before.png"
				style="width: 17px; cursor: pointer;">
			<img onclick="needlogin()"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="width: 30px; cursor: pointer;">
			<div style="margin-top: 8px"></div>
		</c:if>
		<!-- 로그인 했을 때 -->
		<c:if test="${id!='id_not_exist' }">
			<c:if test="${feed.likestate==0 }">
				<label id="poplike${feed.feed_id }"> <img
					onclick="like(${feed.feed_id},'like');"
					src="<%=request.getContextPath()%>/images/icon/like_before.png"
					style="width: 17px; cursor: pointer;">
				</label>
			</c:if>
			<c:if test="${feed.likestate>=1 }">
				<label id="poplike${feed.feed_id }"> <img
					src="<%=request.getContextPath()%>/images/icon/like_after.png"
					style="width: 17px;"></label>
			</c:if>
			<c:if test="${feed.bookmarkstate==0 }">
				<img onclick="like(${feed.feed_id},'bookmark')"
					src="<%=request.getContextPath()%>/images/icon/bookmark.png"
					style="width: 30px; cursor: pointer;">
			</c:if>
			<c:if test="${feed.bookmarkstate>=1 }">
				<img src="<%=request.getContextPath()%>/images/icon/bookmark.png"
					style="width: 30px;">
			</c:if>
		</c:if>
	</div>
			<div style="margin-top: 20px;"></div>
		</div>
	</c:if>
	<!-- 다음컨텐츠 -->
	<c:forEach var="img" items="${feed.img_name }" begin="1" varStatus="st">
		<c:set var="cindex" value="${st.count }" />
		<div id="changecontent${st.count}" style="display: none;">
			<div class="w3-center">
				<button id="leftpage" style="float: left;"
					onclick="changediv('changecontent${st.count}','changecontent${st.count-1}')"
					class="w3-button w3-white w3-hover-white">
					<b>〈 </b>
				</button>
				<c:if test="${!st.last }">
					<button id="rightpage" style="float: right" type="button"
						class="w3-button w3-white w3-hover-white"
						onclick="changediv('changecontent${st.count}','changecontent${st.count+1}')">
						<b> 〉 </b>
					</button>
				</c:if>
			</div>
			
			<br> <br> <img
				src="<%=request.getContextPath()%>/fileSave/${img}"
				style="width: 350px; height: 350px;">
				<div style="margin-top:15px;"></div>
				<!-- 좋아요 북마크 -->
	<div id="like_bookmark">
		<!-- 로그인 안했을 때 -->
		<c:if test="${id=='id_not_exist' }">
			<img onclick="needlogin()"
				src="<%=request.getContextPath()%>/images/icon/like_before.png"
				style="width: 17px; cursor: pointer;">
			<img onclick="needlogin()"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="width: 30px; cursor: pointer;">
			<div style="margin-top: 8px"></div>
		</c:if>
		<!-- 로그인 했을 때 -->
		<c:if test="${id!='id_not_exist' }">
			<c:if test="${feed.likestate==0 }">
				<label id="poplike${feed.feed_id }"> <img
					onclick="like(${feed.feed_id},'like');"
					src="<%=request.getContextPath()%>/images/icon/like_before.png"
					style="width: 17px; cursor: pointer;">
				</label>
			</c:if>
			<c:if test="${feed.likestate>=1 }">
				<label id="poplike${feed.feed_id }"> <img
					src="<%=request.getContextPath()%>/images/icon/like_after.png"
					style="width: 17px;"></label>
			</c:if>
			<c:if test="${feed.bookmarkstate==0 }">
				<img onclick="like(${feed.feed_id},'bookmark')"
					src="<%=request.getContextPath()%>/images/icon/bookmark.png"
					style="width: 30px; cursor: pointer;">
			</c:if>
			<c:if test="${feed.bookmarkstate>=1 }">
				<img src="<%=request.getContextPath()%>/images/icon/bookmark.png"
					style="width: 30px;">
			</c:if>
		</c:if>
	</div>
				<p>
				${feed.content[cindex]}</p>
		</div>
	</c:forEach>
	
	<div style="margin-top: 10px;"></div>
	<!-- 음식이름 -->
	<div id="recipe_name">
		음식이름 : <b>${feed.recipe_name }</b>
	</div>
	<!-- 재료 -->
	<div id="food">
		<c:forEach var="food" items="${feed.food_id }">
${food }
</c:forEach>
	</div>
	<!-- 해시태그 -->
	<div id="hashtag" class="w3-text-indigo" style="margin-top: 10px;">
		<c:forEach var="hash" items="${feed.hashtaglist }">
			<a href="#" onclick="search000('${hash}')">#${hash}</a>
		</c:forEach>
	</div>
</div>
<!-- 댓글 -->
<div id="reple" class="" style="float: left; margin-left: 30px; margin-top:40px;">
		<form name="repleform">
			<input type="text" name="reple"
				style="font-size: 12px; width: 200px;"> <input value="reple"
				style="font-size: 12px;" type="button"
				class="w3-button w3-white w3-hover-white w3-padding-small"
				onclick="replecommit(this.form,'${feed.feed_id}');this.form.reple.value='';">
		</form>
	<div id="showreple">
		<c:forEach var="reple" items="${feed.replelist }">
${reple.id } ${reple.content }<br>
		</c:forEach>
		<c:if test="${empty feed.replelist }">
			<p style="font-size: 12px;">작성된 리플이 없습니다.</p>
		</c:if>
	</div>
</div>

<!-- 장바구니 -->
<c:if test="${feed.feed_grade eq 'editor'}">
	<div id="basket" class="" style="float: left; margin-left: 20px; margin-top:30px;">
		<form method="post">
			<c:forEach var="food" items="${feed.food_id }">
				<input type="checkbox" name="chk_info" value="${food }">
				<img src="<%=request.getContextPath()%>/images/food/${food }.jpg"
					width="100" height="100/">
				<br>
			</c:forEach>
			<div style="margin-top: 20px;"></div>
			<input
				class="w3-button w3-border w3-white w3-hover-white w3-padding-small"
				style="font-size: 11px; margin-left: 30px;" type="button"
				onclick="editorbasket(this.form);" value="장바구니">
			<div style="margin-top: 20px;"></div>
		</form>
	</div>
</c:if>


