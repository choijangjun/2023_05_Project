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
					<div class="myPage-eventArticle">
						<div class="myPage-eventArticle-div">
							<ul>
								<li class="myPage-eventArticle-li"><button id="savedEventArticle" class="myPage-eventArticle-button">전체 이벤트</button></li>
								<li class="myPage-eventArticle-li"><button id="goSavedEventArticle" class="myPage-eventArticle-button">진행중인 이벤트</button></li>
								<li class="myPage-eventArticle-li"><button id="endSavedEventArticle" class="myPage-eventArticle-button">종료된 이벤트</button></li>
							</ul>
						</div>
					</div>
					<article>
						<div class="myEventArticle-table-div">
							<table>
								<colgroup>
									<col width="30px"/>
									<col/>
									<col width="100px"/>
									<col width="100px"/>
									<col width="100px"/>
									<col width="100px"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input type="checkbox" /></th>
										<th scope="col">이벤트 기간</th>
										<th scope="col">진행여부</th>
										<th scope="col">기업명</th>
										<th scope="col">상품</th>
										<th scope="col">조건</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="saveEventArticle" items="${saveEventArticles }">
										<tr>
											<td><input type="checkbox" /></td>
											<td>${saveEventArticle.period }</td>
											<td>진행중</td>
											<td>${saveEventArticle.name }</td>
											<td>${saveEventArticle.goods }</td>
											<td>${saveEventArticle.needs }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
								<div>
									<button></button>
									<button></button>
								</div>
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
	$(document).ready(function(){
	
		$("#savedEventArticle").css({
			"border": "2px solid #489CFF",
			"border-bottom": "2px solid #FFF",
			"background-color": "#FFF"
		});
		$("#goSavedEventArticle").css({
			"border-left": "2px solid #489CFF",
		});
		
	});
</script>
<script>
	$(function(){
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
		});
	});
</script>
