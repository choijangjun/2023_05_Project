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
	<section class="listEventArticle-main">
		<div class="mx-auto ">
			<div><span>이벤트 : ${eventArticlesCnt } 개</span></div>
			<div class="text-center">
				<c:forEach var="eventArticle" items="${eventArticles }">
					
						<div class="main-img inline-block m-2">
							<div class="main-img-div">
								<a class="main-img-a" target="_blank" href="${eventArticle.site }">
								<c:if test="${eventArticle.image != '0'}">
									<img class="main-img" src="${eventArticle.image }" />
								</c:if>
								<c:if test="${eventArticle.image == '0'}">
									<img class="main-img" src="/usr/eventArticle/file/${eventArticle.id}" />
								</c:if>
								</a>
								<div class="list-progress">
									<c:if test="${eventArticle.progress == 1}">
										<span class="saveEvent-Tbody-progress" style="background-color: #47C83E;">진행중</span>
									</c:if>
									<c:if test="${eventArticle.progress == 0}">
										<span class="saveEvent-Tbody-progress" style="background-color: #FF0000;">종료됨</span>
									</c:if>
									<c:if test="${eventArticle.progress == 2}">
										<span class="saveEvent-Tbody-progress" style="background-color: #BDBDBD;">준비중</span>
									</c:if>
								</div>
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
							</div>
							<div class="main-span">
								<span>${eventArticle.name }</span>				
								<br />
								<span>[${eventArticle.title }]</span>		
								<br />
								<span>조건 : ${eventArticle.needs }&nbsp;&nbsp;가격 : ${eventArticle.price } 원</span>				
								<br />
								<span>${eventArticle.startDate.substring(2,16) } ~ ${eventArticle.endDate.substring(2,16) }</span>
							</div>
						</div>
				</c:forEach>
			</div>
		</div>
	</section>

<%@ include file="../common/foot.jsp" %>
<script>
	<c:forEach items="${eventArticles}" var="eventArticle">
		$(function(){
		
		var save = '${eventArticle.save}';
		$(document).on("click", "button[id='save-btn${eventArticle.id}']", function() {
			if(save != 1){
				save = 1;
				$.ajax({
					type: "get"
					, url: "/usr/saveEventArticle/doInsertSaveEventArticle?relId=${eventArticle.id}&relTypeCode=eventArticle"
					, dataType : "text"
					, success: function(data) {
							let saveIcon = $('#non-saved-icon${eventArticle.id}');
							saveIcon.removeClass("fa-regular");
							saveIcon.addClass("fa-solid");
							saveIcon.attr('id', 'saved-icon${eventArticle.id}');
							
					}
				});
				
			} else if(save == 1){
				save = 0;
				$.ajax({
					type: "get"
					, url: "/usr/saveEventArticle/doDeleteSaveEventArticle?relId=${eventArticle.id}&relTypeCode=eventArticle"
					, dataType : "text"
					, success: function(data) {
							let saveIcon = $('#saved-icon${eventArticle.id}');
							saveIcon.removeClass("fa-solid");
							saveIcon.addClass("fa-regular");
							saveIcon.attr('id', 'non-saved-icon${eventArticle.id}');
							
						}
					});
				}
			});
		});
	</c:forEach>
</script>
