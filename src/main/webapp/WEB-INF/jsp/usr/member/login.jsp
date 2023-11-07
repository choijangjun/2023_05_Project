<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Login" />
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp" %>
	<section >
		<div class="loginBox">
			<form action="doLogin" method="POST">
			 	<div>
					<header class="header-loginId">아이디</header>
					<div class="input-box">
						<input class="input-loginId" type="text" name="loginId" placeholder="아이디 입력"/>
					</div>
			 	</div>
			 	<div>
					<header class="header-loginPw">비밀번호</header>
					<div class="input-box">
						<input class="input-loginPw" type="password" name="loginPw" placeholder="비밀번호 입력"/>
					</div>
			 	</div>
			 	<div class="login-box">
			 		<button class="login-btn">로그인</button>
			 	</div>
			</form>
			<div class="kakaoLogin-box">
			      <a class="kakao-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=1ce061089c0f3113b3087e913c3f1f8a&redirect_uri=http://127.0.0.1:8082/usr/member/kakaoLogin">카카오 로그인</a>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>


