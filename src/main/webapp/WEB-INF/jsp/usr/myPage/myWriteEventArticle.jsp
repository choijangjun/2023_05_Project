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
						<h2 class ="myPage-head-h2">내 이벤트</h2>
					</div>
					<div id="myPage-eventArticle" class="myPage-eventArticle">
						<div class="myPage-eventArticle-div">
							<ul>
								<li class="myPage-eventArticle-li"><form action="/usr/myPage/myWriteEventArticle"><button id="savedEventArticle" class="myPage-eventArticle-button" name=progress value="3">전체 이벤트</button></form></li>
								<li class="myPage-eventArticle-li"><form action="/usr/myPage/myWriteEventArticle"><button id="goSavedEventArticle" class="myPage-eventArticle-button" name=progress value="1">진행중인 이벤트</button></form></li>
								<li class="myPage-eventArticle-li"><form action="/usr/myPage/myWriteEventArticle"><button id="endSavedEventArticle" class="myPage-eventArticle-button" name=progress value="0">종료된 이벤트</button></form></li>
							</ul>
						</div>
					</div>
					<article id="myEventArticle-article" class="myEventArticle-article">
						<div class="myEventArticle-article-head">
							<div class="myEventArticle-search-input-div">
								<form class="flex"action="/usr/myPage/myEventArticle">
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
									<c:forEach var="myWriteEventArticle"  begin="${limitStart }" end="${limitStart + itemsInAPage -1 }" items="${myWriteEventArticles }">
										<div id="saveEvent-Tbody${myWriteEventArticle.id}" class="saveEvent-Tbody">
											<div class="saveEvent-Tbody-div">
												<div class="saveEvent-Tbody-date">
													<span>
														<input id="saveEventCheckBox" class="saveEventCheckBox${myWriteEventArticle.id}" type="checkbox" name="saveEventCheckBox"  value="${myWriteEventArticle.id}"/>
														<span>
															${myWriteEventArticle.startDate.substring(2,16) } ~ ${myWriteEventArticle.endDate.substring(2,16) }
														</span>
														<c:if test="${myWriteEventArticle.progress == 1}">
															<span class="saveEvent-Tbody-progress" style="background-color: #47C83E;">진행중</span>
														</c:if>
														<c:if test="${myWriteEventArticle.progress == 0}">
															<span class="saveEvent-Tbody-progress" style="background-color: #FF0000;">종료됨</span>
														</c:if>
														<c:if test="${myWriteEventArticle.progress == 2}">
															<span class="saveEvent-Tbody-progress" style="background-color: #BDBDBD;">준비중</span>
														</c:if>
													</span>
												</div>
												<div class="saveEvent-Tbody-images-div">
													<div>
														<a href="${myWriteEventArticle.site}">
															<c:if test="${myWriteEventArticle.image != '0'}">
																<img class="myEventArticle-images" src="${myWriteEventArticle.image}" alt="" />
															</c:if>
															<c:if test="${myWriteEventArticle.image == '0'}">
																<img class="myEventArticle-images" src="/usr/eventArticle/file/${myWriteEventArticle.id}" alt="" />
															</c:if>
														</a>
													</div>
													<div class="saveEvent-Tbody-body">
														<table class="saveEvent-Tbody-table">
															<tr>
																<td>제목</td>
																<td><span class="saveEvent-Tbody-title">[${myWriteEventArticle.title }] ${myWriteEventArticle.name }</span></td>
															</tr>
															<tr>
																<td>상품</td>
																<td><span>${myWriteEventArticle.goods }</span></td>
															</tr>
															<tr>
																<td>참여 방법</td>
																<td><span>${myWriteEventArticle.needs }</span></td>
															</tr>
															<tr>
																<td>가격</td>
																<td><span>${myWriteEventArticle.price } 원</span></td>
															</tr>
														</table>
													</div>
													<div class="eventAticle-modify-div">
														<form action="/usr/eventArticle/modifyEventArticle" method="POST">
															<button class="eventAticle-modify-btn" name="id" value="${myWriteEventArticle.id }">수정하기</button>
														</form>
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
	<c:forEach items="${myWriteEventArticles}" var="myWriteEventArticle">
		$(function(){
			
			$(document).on("click", "button[id='myEventArticle-delete-button']", function() {
				if($('.saveEventCheckBox${myWriteEventArticle.id}').is(":checked")){
					if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
			            return false;
			        }
					$.ajax({
						type: "get"
						, url: "/usr/eventArticle/doDeleteEventArticle?id=${myWriteEventArticle.id}"
						, dataType : "text"
						, success: function(data) {
							$("#saveEvent-Tbody${myWriteEventArticle.id}").remove();
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
	 $("#myPage-left-myWriteEventArticle").css({
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