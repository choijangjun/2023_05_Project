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
						<h2 class ="myPage-head-h2">저장한 이벤트</h2>
					</div>
					<div id="myPage-eventArticle" class="myPage-eventArticle">
						<div class="myPage-eventArticle-div">
							<ul>
								<li class="myPage-eventArticle-li"><button id="savedEventArticle" class="myPage-eventArticle-button">전체 이벤트</button></li>
								<li class="myPage-eventArticle-li"><button id="goSavedEventArticle" class="myPage-eventArticle-button">진행중인 이벤트</button></li>
								<li class="myPage-eventArticle-li"><button id="endSavedEventArticle" class="myPage-eventArticle-button">종료된 이벤트</button></li>
							</ul>
						</div>
					</div>
					<article id="myEventArticle-article" class="myEventArticle-article">
						<div class="myEventArticle-article-head">
							<div class="myEventArticle-search-input-div">
								<form class="flex"action="/usr/myPage/myEventArticle">
									<input class="myEventArticle-search-input" name="searchKeyword" placeholder="기업명, 조건, 상품 등 검색" maxlength="20" value="${searchKeyword}" />
									<button class="myEventArticle-search-button"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
								</form>
							</div>
							<div class="myEventArticle-delete-div">
								<button id="myEventArticle-delete-button" class="myEventArticle-delete-button">삭제</button>
							</div>
						</div>
						<div class="myEventArticle-table-div">
							<table class="myEventArticle-table">
								<colgroup>
									<col width="30px"/>
									<col width="250px"/>
									<col/>
									<col width="100px"/>
									<col width="100px"/>
									<col width="100px"/>
									<col width="100px"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input id="saveEventCheckBoxCol" type="checkbox" /></th>
										<th scope="col">이벤트 기간</th>
										<th scope="col">기업명</th>
										<th scope="col">상품</th>
										<th scope="col">조건</th>
										<th scope="col">가격</th>
										<th scope="col">진행</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="saveEventArticle" items="${saveEventArticles }">
										<tr id="saveEvent-Tbody${saveEventArticle.id}">
											<td><input id="saveEventCheckBox" class="saveEventCheckBox${saveEventArticle.id}" type="checkbox" name="saveEventCheckBox"  value="${saveEventArticle.id}"/></td>
											<td>${saveEventArticle.startDate.substring(2,16) } ~ <br /> ${saveEventArticle.endDate.substring(2,16) }</td>
											<td class="myEventArticle-goSite"><a href="${saveEventArticle.site}">${saveEventArticle.name }</a></td>
											<td>${saveEventArticle.goods }</td>
											<td>${saveEventArticle.needs }</td>
											<td>${saveEventArticle.price }</td>
											<c:if test="${saveEventArticle.progress == 1}">
												<td style="color: #47C83E; font-size: 5px"><i class="fa-solid fa-circle"></i></td>
											</c:if>
											<c:if test="${saveEventArticle.progress != 1}">
												<td style="color: #FF0000; font-size: 5px"><i class="fa-solid fa-circle"></i></td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="myEventArticle-article-foot">
							<div class="page-click-div">
								<c:set var="endPage" value="${startPage + 9 <= pagesCount ? startPage + 9 : pagesCount }"/>
								<c:set var="pageBaseUri" value="?searchKeyword=${searchKeyword }"/>
								<c:if test="${startPage != 1}">
									<a class=" page-click" href="${pageBaseUri }&page=${startPage - 10}"><i class="page-click-span fa-solid fa-chevron-right fa-flip-horizontal"></i></a>
								</c:if>
								<c:forEach begin="${startPage }" end="${endPage }" var="i">
									<a id="page-click${i}" class="page-click" href="${pageBaseUri }&page=${i }"><span class="page-click-span">${i }</span></a>
								</c:forEach>
								<c:if test="${startPage + 9 < pagesCount}">
									<a class=" page-click" href="${pageBaseUri }&page=${startPage + 10}"><i class=" page-click-span fa-solid fa-chevron-right"></i></a>
								</c:if>
							</div>
							<div class="myEventArticle-delete-div">
								<button id="myEventArticle-delete-button" class="myEventArticle-delete-button">삭제</button>
							</div>
						</div>
					</article>
					<article id="myEventArticle-progressArticle" class="myEventArticle-article">
						<div class="myEventArticle-article-head">
							<div class="myEventArticle-search-input-div">
								<form class="flex"action="/usr/myPage/myEventArticle">
									<input class="myEventArticle-search-input" name="searchKeyword" placeholder="기업명, 조건, 상품 등 검색" maxlength="20" value="${searchKeyword}" />
									<button class="myEventArticle-search-button"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
								</form>
							</div>
							<div class="myEventArticle-delete-div">
								<button id="myEventArticle-delete-button" class="myEventArticle-delete-button">삭제</button>
							</div>
						</div>
						<div class="myEventArticle-table-div">
							<table class="myEventArticle-table">
								<colgroup>
									<col width="30px"/>
									<col width="250px"/>
									<col/>
									<col width="100px"/>
									<col width="100px"/>
									<col width="100px"/>
									<col width="100px"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input id="saveEventCheckBoxCol" type="checkbox" /></th>
										<th scope="col">이벤트 기간</th>
										<th scope="col">기업명</th>
										<th scope="col">상품</th>
										<th scope="col">조건</th>
										<th scope="col">가격</th>
										<th scope="col">진행</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="progressSaveEventArticle" items="${progressSaveEventArticles }">
										<tr id="saveEvent-Tbody${progressSaveEventArticle.id}">
											<td><input id="saveEventCheckBox" class="saveEventCheckBox${progressSaveEventArticle.id}" type="checkbox" name="saveEventCheckBox"  value="${saveEventArticle.id}"/></td>
											<td>${progressSaveEventArticle.startDate.substring(2,16) } ~ <br /> ${progressSaveEventArticle.endDate.substring(2,16) }</td>
											<td class="myEventArticle-goSite"><a href="${progressSaveEventArticle.site}">${progressSaveEventArticle.name }</a></td>
											<td>${progressSaveEventArticle.goods }</td>
											<td>${progressSaveEventArticle.needs }</td>
											<td>${progressSaveEventArticle.price }</td>
											<td style="color: #47C83E; font-size: 5px"><i class="fa-solid fa-circle"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="myEventArticle-article-foot">
							<div class="page-click-div">
								<c:set var="endPage" value="${progressStartPage + 9 <= progressPagesCount ? progressStartPage + 9 : progressPagesCount }"/>
								<c:set var="pageBaseUri" value="?searchKeyword=${searchKeyword }"/>
								<c:if test="${progressStartPage != 1}">
									<a class=" page-click" href="${pageBaseUri }&page=${startPage - 10}"><i class="page-click-span fa-solid fa-chevron-right fa-flip-horizontal"></i></a>
								</c:if>
								<c:forEach begin="${progressStartPage }" end="${endPage }" var="i">
									<a id="progress-page-click${i}" class="page-click" href="${pageBaseUri }&page=${i }"><span class="page-click-span">${i }</span></a>
								</c:forEach>
								<c:if test="${progressStartPage + 9 < progressPagesCount}">
									<a class="page-click" href="${pageBaseUri }&page=${progressStartPage + 10}"><i class=" page-click-span fa-solid fa-chevron-right"></i></a>
								</c:if>
							</div>
							<div class="myEventArticle-delete-div">
								<button id="myEventArticle-delete-button" class="myEventArticle-delete-button">삭제</button>
							</div>
						</div>
					</article>
					<article id="myEventArticle-endArticle" class="myEventArticle-article">
						<div class="myEventArticle-article-head">
							<div class="myEventArticle-search-input-div">
								<form class="flex"action="/usr/myPage/myEventArticle">
									<input class="myEventArticle-search-input" name="searchKeyword" placeholder="기업명, 조건, 상품 등 검색" maxlength="20" value="${searchKeyword}" />
									<button class="myEventArticle-search-button"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
								</form>
							</div>
							<div class="myEventArticle-delete-div">
								<button id="myEventArticle-delete-button" class="myEventArticle-delete-button">삭제</button>
							</div>
						</div>
						<div class="myEventArticle-table-div">
							<table class="myEventArticle-table">
								<colgroup>
									<col width="30px"/>
									<col width="250px"/>
									<col/>
									<col width="100px"/>
									<col width="100px"/>
									<col width="100px"/>
									<col width="100px"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input id="saveEventCheckBoxCol" type="checkbox" /></th>
										<th scope="col">이벤트 기간</th>
										<th scope="col">기업명</th>
										<th scope="col">상품</th>
										<th scope="col">조건</th>
										<th scope="col">가격</th>
										<th scope="col">진행</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="endSaveEventArticle" items="${endSaveEventArticles }">
										<tr id="saveEvent-Tbody${endSaveEventArticle.id}">
											<td><input id="saveEventCheckBox" class="saveEventCheckBox${endSaveEventArticle.id}" type="checkbox" name="saveEventCheckBox"  value="${saveEventArticle.id}"/></td>
											<td>${endSaveEventArticle.startDate.substring(2,16) } ~ <br /> ${endSaveEventArticle.endDate.substring(2,16) }</td>
											<td class="myEventArticle-goSite"><a href="${endSaveEventArticle.site}">${endSaveEventArticle.name }</a></td>
											<td>${endSaveEventArticle.goods }</td>
											<td>${endSaveEventArticle.needs }</td>
											<td>${endSaveEventArticle.price }</td>
											<td style="color: #FF0000; font-size: 5px"><i class="fa-solid fa-circle"></i></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="myEventArticle-article-foot">
							<div class="page-click-div">
								<c:set var="endPage" value="${endStartPage + 9 <= endPagesCount ? endStartPage + 9 : endPagesCount }"/>
								<c:set var="pageBaseUri" value="?searchKeyword=${searchKeyword }"/>
								<c:if test="${endStartPage != 1}">
									<a class=" page-click" href="${pageBaseUri }&page=${endStartPage - 10}"><i class="page-click-span fa-solid fa-chevron-right fa-flip-horizontal"></i></a>
								</c:if>
								<c:forEach begin="${endStartPage }" end="${endPage }" var="i">
									<a id="end-page-click${i}" class="page-click" href="${pageBaseUri }&page=${i }"><span class="page-click-span">${i }</span></a>
								</c:forEach>
								<c:if test="${endStartPage + 9 < endPagesCount}">
									<a class=" page-click" href="${pageBaseUri }&page=${endStartPage + 10}"><i class=" page-click-span fa-solid fa-chevron-right"></i></a>
								</c:if>
							</div>
							<div class="myEventArticle-delete-div">
								<button id="myEventArticle-delete-button" class="myEventArticle-delete-button">삭제</button>
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
		
		$("#progress-page-click${page }").css({
			"border": "1px solid #000"
			
		});
		
		$("#end-page-click${page }").css({
			"border": "1px solid #000"
			
		});
		
	});
</script>
<script>
	$(document).ready(function(){
	
		$(".myEventArticle-search-input").focus();
	});
</script>
<script>
	$(function(){
		var set = 3;
		$("#savedEventArticle").css({
			"border": "2px solid #489CFF",
			"border-bottom": "2px solid #FFF",
			"background-color": "#FFF"
		});
		$("#goSavedEventArticle").css({
			"border-left": "2px solid #489CFF",
		});
		$("#myEventArticle-progressArticle").hide();
		$("#myEventArticle-endArticle").hide();
		
		if(set == 2){
			console.log('123123');
		};
		
		$(document).on("click", "#savedEventArticle", function (){
			$("#savedEventArticle").css({
				"border": "2px solid #489CFF",
				"border-bottom": "2px solid #FFF",
				"background-color": "#FFF"
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
			$("#myEventArticle-article").show();
			$("#myEventArticle-progressArticle").hide();
			$("#myEventArticle-endArticle").hide();
			
			set = 2;
			
			
		});
		
		$(document).on("click", "#goSavedEventArticle", function (){
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
			
			$("#myEventArticle-progressArticle").show();
			$("#myEventArticle-article").hide();
			$("#myEventArticle-endArticle").hide();
			
			set = 1;
		});
		$(document).on("click", "#endSavedEventArticle", function (){
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
			$("#myEventArticle-endArticle").show();
			$("#myEventArticle-article").hide();
			$("#myEventArticle-progressArticle").hide();
			
			set = 0;
		});
	});
</script>



<script>
 $(function(){
	 $("#myPage-left-myEventArticle").css({
		 "color": "#489CFF"
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