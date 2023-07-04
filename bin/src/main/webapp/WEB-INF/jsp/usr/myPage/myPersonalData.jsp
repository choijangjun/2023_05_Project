<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp" %>
<div class="myPage-wrap">
	<section class="container-box">
		<section class="myPage-center-section">
			<div class="myPage-center-div">
				<div class="table-box-type-1">
					<table class="table table-zebra w-full">
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>가입일</th>
								<td>${rq.loginedMember.regDate }</td>
							</tr>
							<tr>
								<th>로그인 아이디</th>
								<td>${rq.loginedMember.loginId }</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${rq.loginedMember.name }</td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td>${rq.loginedMember.nickname }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${rq.loginedMember.cellphoneNum }</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${rq.loginedMember.email }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btns mt-2 flex justify-between">
					<button class="btn-text-link btn btn-active" type="button" onclick="history.back();">뒤로가기</button>
					<a class="btn-text-link btn btn-active" href="checkPassword">회원정보 수정</a>
				</div>
			</div>
		</section>
<%@ include file="../myPage/leftOnMyPage.jsp" %>
	</section>
</div>
<%@ include file="../common/foot.jsp" %>

<script>
 $(function(){
	 $("#myPage-left-personalData").css({
		 "color": "#1266FF"
	 });
 });
</script>