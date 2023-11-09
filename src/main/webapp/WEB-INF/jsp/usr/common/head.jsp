<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet" type="text/css" />
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<link rel="stylesheet" href="/resource/common.css" />
<link rel="shortcut icon" href="/resource/images/favicon.ico" />
<script src="/resource/common.js" defer="defer"></script>
</head>
<body>
	<header class="head-header text-sm border-bottom-line">
		<div class ="flex items-center">
			<a href="/" class="flex h-10 w-20 image-box overflow-hidden items-center mx-3"><img class="object-cover " src="/resource/images/logo.png" /></a>
			<a class=" hover:underline h-full px-3 flex items-center" href="/usr/eventArticle/writeEventArticle"><span>이벤트 공유</span></a>
			<a class="hover:underline h-full px-3 flex items-center" href="/usr/member/login"><span>쇼핑</span></a>
			<a class="hover:underline h-full px-3 flex items-center" href="/usr/article/list?boardId=1"><span>공지사항</span></a>
			<a class="hover:underline h-full px-3 flex items-center" href="/usr/article/list?boardId=2"><span>자유게시판</span></a>
			<a class="hover:underline h-full px-3 flex items-center" href="/usr/member/login"><span>소개</span></a>
		</div>
		<ul class=" flex">
			<li ><a class="hover:text-gray-600 h-10 px-3 flex items-center cursor-pointer" onclick=""><i class=" fa-solid fa-bell"></i></a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=1ce061089c0f3113b3087e913c3f1f8a&redirect_uri=http://127.0.0.1:8082/usr/member/kakaoMessage"><span>메시지보내기</span></a></li>
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/login"><span>로그인</span></a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/join"><span>회원가입</span></a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != 0  }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/myPage"><span>마이페이지</span></a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=1ce061089c0f3113b3087e913c3f1f8a&redirect_uri=http://127.0.0.1:8082/usr/member/kakaoLogout"><span>로그아웃</span></a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="https://kauth.kakao.com/oauth/logout?client_id=1ce061089c0f3113b3087e913c3f1f8a&logout_redirect_uri=http://127.0.0.1:8082/usr/member/doLogout"><span>카카오계정 로그아웃</span></a></li>
			</c:if>
			<li class="mr-3"></li>
		</ul>
	</header>
