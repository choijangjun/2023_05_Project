<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Login" />
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp" %>
	<section class="mt-44 ">
		<div class="loginBox">
			<form action="doLogin" method="POST">
				<div class="">
					
				</div>
			</form>
			<div class="flex">
			      <a class="kakao-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=1ce061089c0f3113b3087e913c3f1f8a&redirect_uri=http://127.0.0.1:8082/usr/member/kakaoOauth" >
			          <span class="kakao-btn">카카오 로그인</span>
			      </a>
			</div>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>


