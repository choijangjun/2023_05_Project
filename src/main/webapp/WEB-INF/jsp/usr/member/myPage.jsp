<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MyPage" />
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp" %>
	<div class="myPage-wrap">
		<section class="container-box">
			<%@ include file="../myPage/myEventArticle.jsp" %>
			<%@ include file="../myPage/leftOnMyPage.jsp" %>
		</section>
	</div>
<%@ include file="../common/foot.jsp" %>