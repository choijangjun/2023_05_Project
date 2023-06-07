<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section class="pt-44 ">
		<div class="mx-auto ">
			<div><span>진행중인 이벤트 : ${eventArticlesCnt } 개</span></div>
			<div class="ml-6">실시간 가장 핫한 이벤트</div>
			<div class="text-center">
				<c:forEach var="eventArticle" items="${eventArticles }">
					<div class="inline-block m-2">
						<div class="main-img-div">
							<a class="main-img-a" target="_blank" href="${eventArticle.site }"><img class="main-img" src="${eventArticle.image }" alt="" /></a>
							<button class="list-save-button">
								<i class="list-save-icon fa-sharp fa-solid fa-bookmark"><span class="list-save-span">저장</span></i>
							</button>						
						</div>
						<div class="main-span">
							<span>[${eventArticle.name }]</span>				
							<br />
							<span>조건 : ${eventArticle.needs } , 가격 : ${eventArticle.price }원</span>				
							<br />
							<span>${eventArticle.period }</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>