<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp" %>
<div class="myPage-wrap">
		<section class="container-box">
			<section class="myPage-center-section">
				<div class="myPage-center-div">
					<div class ="myPage-head-div">
						<h2 class ="myPage-head-h2">즐겨찾기</h2>
					</div>
					<div id="myPage-eventArticle" class="myPage-eventArticle">
						<div class="myPage-eventArticle-div">
							<ul>
								<li class="myPage-eventArticle-li"><form action="/usr/myPage/mySaveEventArticle"><button id="savedEventArticle" class="myPage-eventArticle-button" name=progress value="3">전체 이벤트</button></form></li>
								<li class="myPage-eventArticle-li"><form action="/usr/myPage/mySaveEventArticle"><button id="goSavedEventArticle" class="myPage-eventArticle-button" name=progress value="1">진행중인 이벤트</button></form></li>
								<li class="myPage-eventArticle-li"><form action="/usr/myPage/mySaveEventArticle"><button id="endSavedEventArticle" class="myPage-eventArticle-button" name=progress value="0">종료된 이벤트</button></form></li>
							</ul>
						</div>
					</div>
					<article id="myEventArticle-article" class="myEventArticle-article">
						<div class="myEventArticle-article-head">
							<div class="myEventArticle-search-input-div">
								<form class="flex"action="/usr/myPage/mySaveEventArticle">
									<input class="myEventArticle-search-input" name="searchKeyword" placeholder="기업명, 조건, 상품 등 검색" maxlength="20" value="${searchKeyword}" />
									<button class="myEventArticle-search-button" name="progress" value="${progress}"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
								</form>
							</div>
							<div class="myEventArticle-delete-div">
								<button id="myEventArticle-delete-button" class="myEventArticle-delete-button btn-hover">삭제</button>
							</div>
						</div>
						<div class="myEventArticle-table-div">
							<div class="myEventArticle-table">
								<div>
									<input id="saveEventCheckBoxCol" type="checkbox" /><span>전체 선택</span>
								</div>
								<div>
									<c:set var="limitStart" value="${(page - 1) * itemsInAPage}"/>
									<c:forEach var="saveEventArticle"  begin="${limitStart }" end="${limitStart + itemsInAPage -1 }" items="${saveEventArticles }">
										<div id="saveEvent-Tbody${saveEventArticle.id}" class="saveEvent-Tbody">
											<div class="saveEvent-Tbody-div">
												<div class="saveEvent-Tbody-date">
													<span>
														<input id="saveEventCheckBox" class="saveEventCheckBox${saveEventArticle.id}" type="checkbox" name="saveEventCheckBox"  value="${saveEventArticle.id}"/>
														<span>
															${saveEventArticle.startDate.substring(2,16) } ~ ${saveEventArticle.endDate.substring(2,16) }
														</span>
														<c:if test="${saveEventArticle.progress == 1}">
															<span class="saveEvent-Tbody-progress" style="background-color: #47C83E;">진행중</span>
														</c:if>
														<c:if test="${saveEventArticle.progress == 0}">
															<span class="saveEvent-Tbody-progress" style="background-color: #FF0000;">종료됨</span>
														</c:if>
														<c:if test="${saveEventArticle.progress == 2}">
															<span class="saveEvent-Tbody-progress" style="background-color: #BDBDBD;">준비중</span>
														</c:if>
													</span>
												</div>
												<div class="saveEvent-Tbody-images-div">
													<div>
														<a href="${saveEventArticle.site}">
															<c:if test="${saveEventArticle.image != '0'}">
																<img class="myEventArticle-images" src="${saveEventArticle.image}" alt="" />
															</c:if>
															<c:if test="${saveEventArticle.image == '0'}">
																<img class="myEventArticle-images" src="/usr/eventArticle/file/${saveEventArticle.id}" alt="" />
															</c:if>
														</a>
													</div>
													<div class="saveEvent-Tbody-body">
														<table class="saveEvent-Tbody-table">
															<tr>
																<td>제목</td>
																<td><span class="saveEvent-Tbody-title">[${saveEventArticle.title }] ${saveEventArticle.name }</span></td>
															</tr>
															<tr>
																<td>상품</td>
																<td><span>${saveEventArticle.goods }</span></td>
															</tr>
															<tr>
																<td>참여 방법</td>
																<td><span>${saveEventArticle.needs }</span></td>
															</tr>
															<tr>
																<td>가격</td>
																<td><span>${saveEventArticle.price } 원</span></td>
															</tr>
														</table>
													</div>
														<div>
															<a class="h-full px-3 flex items-center" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=1ce061089c0f3113b3087e913c3f1f8a&redirect_uri=http://127.0.0.1:8082/usr/member/kakaoMessage&state=${saveEventArticle.id}"><span>메시지보내기</span></a>
														</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="myEventArticle-article-foot">
							<div>
								<form action="/usr/eventArticle/writeEventArticle">
									<button class="myEventArticle-write-button btn-hover">등록하기</button>
								</form>
							</div>
							<div class="page-click-div">
								<c:set var="endPage" value="${startPage + 4 <= pagesCount ? startPage + 4 : pagesCount }"/>
								<c:set var="pageBaseUri" value="?searchKeyword=${searchKeyword }"/>
								<c:if test="${startPage != 1}">
									<a class=" page-click" href="${pageBaseUri }&page=${startPage - 5}"><i class="page-click-span fa-solid fa-chevron-right fa-flip-horizontal"></i></a>
								</c:if>
								<c:forEach begin="${startPage }" end="${endPage }" var="i">
									<a id="page-click${i}" class="page-click" href="${pageBaseUri }&page=${i }&progress=${progress }"><span class="page-click-span">${i }</span></a>
								</c:forEach>
								<c:if test="${startPage + 4 < pagesCount}">
									<a class=" page-click" href="${pageBaseUri }&page=${startPage + 5}"><i class=" page-click-span fa-solid fa-chevron-right"></i></a>
								</c:if>
							</div>
							<div class="myEventArticle-delete-div">
								<button id="myEventArticle-delete-button" class="myEventArticle-delete-button btn-hover">삭제</button>
							</div>
						</div>
					</article>
				</div>
			</section>
			<%@ include file="../myPage/leftOnMyPage.jsp" %>
		</section>
	</div>
<%@ include file="../common/foot.jsp" %>
<script>
$(function(){
	$(document).on("click", "button[id='test']", function() {
		location.replace("https://kauth.kakao.com/oauth/authorize?client_id=2158fb2a838a4c24d9390600c33aff2b&redirect_uri=http://127.0.0.1:8082/kakaotalk&response_type=code&scope=talk_message");
	});
});
	
</script>
<script>
	<c:forEach items="${saveEventArticles}" var="saveEventArticle">
		$(function(){
			$(document).on("click", "button[id='myEventArticle-delete-button']", function() {
				if($('.saveEventCheckBox${saveEventArticle.id}').is(":checked")){
					$.ajax({
						type: "get"
						, url: "../saveEventArticle/doDeleteSaveEventArticle?relId=${saveEventArticle.id}&relTypeCode=eventArticle"
						, dataType : "text"
						, success: function(data) {
								$("#saveEvent-Tbody${saveEventArticle.id}").remove();
						}
					});
				}
				
			});
		});
	</c:forEach>
</script>
<script>
	$(function(){
		$("#page-click${page }").css({
			"border": "1px solid #000"
			
		});
		
		$("html, body").animate({scrollTop: 0});
		
	});
</script>
<script>
	$(document).ready(function(){
	
		$(".myEventArticle-search-input").focus();
	});
</script>
<script>
	$(function(){
		if(${progress} == 3){
			$("#savedEventArticle").css({
				"border": "2px solid #489CFF",
				"border-bottom": "2px solid #FFF",
				"background-color": "#FFF",
			});
			$("#goSavedEventArticle").css({
				"border": "2px solid #489CFF",
				"border-top": "2px solid #D8D8D8",
				"border-right": "2px solid #D8D8D8",
				"background-color": "#EAEAEA"
			});
			$("#endSavedEventArticle").css({
				"border": "2px solid #D8D8D8",
				"border-bottom": "2px solid #489CFF",
				"background-color": "#EAEAEA"
			});
			
		} else if(${progress} == 1){
			$("#goSavedEventArticle").css({
				"border": "2px solid #489CFF",
				"border-bottom": "2px solid #FFF",
				"background-color": "#FFF"
			});
			$("#savedEventArticle").css({
				"border": "2px solid #D8D8D8",
				"border-bottom": "2px solid #489CFF",
				"background-color": "#EAEAEA"
			});
			$("#endSavedEventArticle").css({
				"border": "2px solid #D8D8D8",
				"border-left": "2px solid #489CFF",
				"border-bottom": "2px solid #489CFF",
				"background-color": "#EAEAEA"
			});
		} else{
			$("#endSavedEventArticle").css({
				"border": "2px solid #489CFF",
				"border-bottom": "2px solid #FFF",
				"background-color": "#FFF"
			});
			$("#savedEventArticle").css({
				"border": "2px solid #D8D8D8",
				"border-bottom": "2px solid #489CFF",
				"background-color": "#EAEAEA"
			});
			$("#goSavedEventArticle").css({
				"border": "2px solid #D8D8D8",
				"border-bottom": "2px solid #489CFF",
				"background-color": "#EAEAEA"
			});
		}
	});
</script>



<script>
 $(function(){
	 $("#myPage-left-mySaveEventArticle").css({
		 "color": "#1266FF"
	 });
 });
</script>

<script>
	$(function() {
		$("#saveEventCheckBoxCol").click(function() {
			if($("#saveEventCheckBoxCol").is(":checked")) $("input[id=saveEventCheckBox]").prop("checked", true);
			else $("input[id=saveEventCheckBox]").prop("checked", false);
		});
	
		$("input[id=saveEventCheckBox]").click(function() {
			var total = $("input[id=saveEventCheckBox]").length;
			var checked = $("input[id=saveEventCheckBox]:checked").length;
	
			if(total != checked) $("#saveEventCheckBoxCol").prop("checked", false);
			else $("#saveEventCheckBoxCol").prop("checked", true); 
		});
	});
</script>