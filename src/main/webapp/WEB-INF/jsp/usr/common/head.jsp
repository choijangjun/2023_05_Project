<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet" type="text/css" />
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
</head>
<body>

	<div class="h-20 flex container mx-auto text-4xl">
		<a href="/" class="px-3 flex items-center flex image-box overflow-hidden mx-auto"><img class="object-cover w-full h-full" src="data:image/png;base64,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"></a>
		<div class="flex-grow"></div>
		<ul class="flex">
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=1"><span>NOTICE</span></a></li>
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=2"><span>FREE</span></a></li>
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/login"><span>LOGIN</span></a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != 0  }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/doLogout"><span>LOGOUT</span></a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/join"><span>SIGNUP</span></a></li>
			</c:if>
		</ul>
	</div>
	
	<section class="my-3 text-2xl">
		<div class="container mx-auto px-3">
			<h1>${pageTitle }</h1>
		</div>
	</section>