<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp"%>


	<section>
		<div class="pt-56 text-xl container mx-auto px-3">
			<div class="table-box-type-1">
				<table class="table w-full">
					<colgroup>
						<col width="60"/>
						<col width="200"/>
						<col />
						<col width="120"/>
						<col width="60"/>
						<col width="40"/>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>날짜</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>추천</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articles }">
							<tr class="hover">
								<td>${article.id }</td>
								<td>${article.regDate.substring(2, 16) }</td>
								<td><a class="hover:underline" href="detail?id=${article.id }">${article.title }</a></td>
								<td>${article.writerName }</td>
								<td>${article.hitCount }</td>
								<td>${article.sumReactionPoint }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="mt-2 flex justify-end">
				<c:if test="${rq.getLoginedMemberId() != 0  }">
					<a class="btn-text-link btn btn-active" href="write">WRITE</a>
				</c:if>
			</div>
			<div class="mt-2 flex justify-center">
				<div class="btn-group">
					<c:set var="pageMenuLen" value="5" />
					<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
					<c:set var="endPage" value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount }" />
					
					<c:set var="pageBaseUri" value="?boardId=${board.id }&searchKeywordType=${searchKeywordType }&searchKeyword=${searchKeyword }" />
					
					<c:if test="${page == 1 }">
						<a class="btn btn-sm btn-disabled">«</a>
						<a class="btn btn-sm btn-disabled">&lt;</a>
					</c:if>
					<c:if test="${page > 1 }">
						<a class="btn btn-sm" href="${pageBaseUri }&page=1">«</a>
						<a class="btn btn-sm" href="${pageBaseUri }&page=${page - 1 }">&lt;</a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<a class="btn btn-sm ${page == i ? 'btn-active' : '' }" href="${pageBaseUri }&page=${i }">${i }</a>
					</c:forEach>
					<c:if test="${page < pagesCount }">
						<a class="btn btn-sm" href="${pageBaseUri }&page=${page + 1 }">&gt;</a>
						<a class="btn btn-sm" href="${pageBaseUri }&page=${pagesCount }">»</a>
					</c:if>
					<c:if test="${page == pagesCount }">
						<a class="btn btn-sm btn-disabled">&gt;</a>
						<a class="btn btn-sm btn-disabled">»</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>