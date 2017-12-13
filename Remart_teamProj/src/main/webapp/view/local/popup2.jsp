<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="contentslide" style="width: 100%; height: 50px;">
	<!--�۾��µ� ��� ������-->

</div>
<div id="recipe_name">�����̸�:${feed.recipe_name }</div>
<div id="changecontent0">
	<c:if test="${feed.imgSize>1 }">
		<button id="rightpage" style="float: right" type="button"
			class="w3-button w3-white w3-hover-white"
			onclick="changediv('changecontent0','changecontent1')">
			<b> �� </b>
		</button>
	</c:if>
	<br> <br> <img
		src="<%=request.getContextPath()%>/fileSave/${feed.img_name[0]}"
		style="width: 200px; height: 200px; display: block;">
	<p style="display: block;">${feed.content[0] }</p>
</div>
<c:forEach var="img" items="${feed.img_name }" begin="1" varStatus="st">
	<c:set var="cindex" value="${st.count }" />
	<div id="changecontent${st.count}" style="display: none;">
		<button id="leftpage" style="float: left;"
			onclick="changediv('changecontent${st.count}','changecontent${st.count-1}')"
			class="w3-button w3-white w3-hover-white">
			<b>�� </b>
		</button>
		<c:if test="${!st.last }">
			<button id="rightpage" style="float: right" type="button"
				class="w3-button w3-white w3-hover-white"
				onclick="changediv('changecontent${st.count}','changecontent${st.count+1}')">
				<b> �� </b>
			</button>
		</c:if>
		<br> <br> <img
			src="<%=request.getContextPath()%>/fileSave/${img}"
			style="width: 200px; height: 200px;">
		<p>${feed.content[cindex]}</p>
	</div>
</c:forEach>
<div id="like_bookmark">
	<!-- �α��� ������ �� -->
	<c:if test="${id=='id_not_exist' }">
		<img onclick="needlogin()"
			src="<%=request.getContextPath()%>/images/icon/like_before.png"
			style="height: 20px; cursor: pointer;">
		<img src="<%=request.getContextPath()%>/images/icon/comment.png"
			style="height: 20px;">
		<img onclick="needlogin()"
			src="<%=request.getContextPath()%>/images/icon/bookmark.png"
			style="height: 20px; cursor: pointer;">
		<div style="margin-top: 8px"></div>
	</c:if>
	<!-- �α��� ���� �� -->
	<c:if test="${id!='id_not_exist' }">
		<c:if test="${feed.likestate==0 }">
			<label id="poplike${feed.feed_id }"> <img
				onclick="like(${feed.feed_id},'like');"
				src="<%=request.getContextPath()%>/images/icon/like_before.png"
				style="height: 20px; cursor: pointer;">
			</label>
		</c:if>
		<c:if test="${feed.likestate>=1 }">
			<label id="poplike${feed.feed_id }"> <img
				src="<%=request.getContextPath()%>/images/icon/like_after.png"
				style="height: 20px;"></label>
		</c:if>
		<img src="<%=request.getContextPath()%>/images/icon/comment.png"
			style="height: 20px;">
		<c:if test="${feed.bookmarkstate==0 }">
			<img onclick="like(${feed.feed_id},'bookmark')"
				src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="height: 20px; cursor: pointer;">
		</c:if>
		<c:if test="${feed.bookmarkstate>=1 }">
			<img src="<%=request.getContextPath()%>/images/icon/bookmark.png"
				style="height: 20px;">
		</c:if>
	</c:if>
</div>

<div id="hashtag">
	<c:forEach var="hash" items="${feed.hashtaglist }">
#${hash },
</c:forEach>
</div>
<div id="reple">
	<c:if test="${id!='id_not_exist' }">
		<form name="repleform">
			<input type="text" name="reple"> <input value="��۴ޱ�" type="button"
				onclick="replecommit(this.form,'${feed.feed_id}');this.form.reple.value='';">
		</form>
	</c:if>
	<div id="showreple">
		<c:forEach var="reple" items="${feed.replelist }">
${reple.id }���� ���:${reple.content }<br>
		</c:forEach>
		<c:if test="${empty feed.replelist }">
�ۼ��� ������ �����ϴ�.
</c:if>
	</div>
</div>

