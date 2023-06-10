<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp" %>
	<script>
		function pleaseLogin() {
			alert("로그인 후 이용해주세요");
			return;
		}
	</script>
	<section class="pt-44 ">
		<div class="mx-auto ">
			<div><span>진행중인 이벤트 : ${eventArticlesCnt } 개</span></div>
			<div class="ml-6">실시간 가장 핫한 이벤트</div>
			<div class="text-center">
				<c:forEach var="eventArticle" items="${eventArticles }">
						<div class="inline-block m-2">
							<div class="main-img-div">
								<a class="main-img-a" target="_blank" href="${eventArticle.site }"><img class="main-img" src="${eventArticle.image }" alt="" /></a>
								
								<c:if test="${rq.getLoginedMemberId() == 0 }">
									<button class="list-save-button" onClick="pleaseLogin()">
										<i class="list-save-icon fa-regular fa-star" ></i>
									</button>
								</c:if>
								<c:if test="${rq.getLoginedMemberId() != 0 }">
									<button class="list-save-button" id="save-btn${eventArticle.id}">
										<c:if test="${eventArticle.save != 1}">
											<i id="non-saved-icon${eventArticle.id}" class="list-save-icon fa-regular fa-star" ></i>
										</c:if>
										<c:if test="${eventArticle.save == 1}">
											<i id="saved-icon${eventArticle.id}" class="list-save-icon fa-solid fa-star" ></i>
										</c:if>
									</button>
								</c:if>
								
<%-- 								<button class="list-save-button" id="save-btn${eventArticle.id}"> --%>
<%-- 									<i id="saved-icon${eventArticle.id}" class="list-save-icon fa-regular fa-star" ></i> --%>
<!-- 								</button> -->
							</div>
							<div class="main-span">
								<span>[${eventArticle.name }]</span>				
								<br />
								<span>조건 : ${eventArticle.needs } , 가격 : ${eventArticle.price }원</span>				
								<br />
								<span>${eventArticle.period }</span>
							</div>
						</div>
						<script>
							var save = ${eventArticle.save};
							$('#save-btn${eventArticle.id}').click(function(){
								
								if(save != 1){
									$.ajax({
										type: "get"
										, url: "../saveEventArticle/doInsertSaveEventArticle?relId=${eventArticle.id}&relTypeCode=eventArticle"
										, dataType : "text"
										, success: function(data) {
		 									let saveIcon = $('#non-saved-icon${eventArticle.id}');
		 									saveIcon.removeClass("fa-regular");
		 									saveIcon.addClass("fa-solid");
		 									saveIcon.attr('id', 'saved-icon${eventArticle.id}');
		 									
										}
									});
									save = 1;
								} else if(save == 1){
									$.ajax({
										type: "get"
										, url: "../saveEventArticle/doDeleteSaveEventArticle?relId=${eventArticle.id}&relTypeCode=eventArticle"
										, dataType : "text"
										, success: function(data) {
											console.log(data);
		 									let saveIcon = $('#saved-icon${eventArticle.id}');
		 									saveIcon.removeClass("fa-solid");
		 									saveIcon.addClass("fa-regular");
		 									saveIcon.attr('id', 'non-saved-icon${eventArticle.id}');
										}
										
									});
									save = 0;
								}
							});
							
						</script>
				</c:forEach>
			</div>
		</div>
	</section>

<%@ include file="../common/foot.jsp" %>

