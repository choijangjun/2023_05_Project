<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Modify" />
<%@ include file="../common/head.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModify" method="POST">
				<input type="hidden" name="id" value="${article.id }"/>
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<td>${article.id }</td>
							</tr>
							<tr>
								<th>작성날짜</th>
								<td>${article.regDate }</td>
							</tr>
							<tr>
								<th>수정날짜</th>
								<td>${article.updateDate }</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${article.writerName }</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" value="${article.title }" placeholder="제목을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="body" placeholder="내용을 입력해주세요">${article.body }</textarea></td>
							</tr>
							
						</tbody>
					</table>
				</div>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
				<button class="btn-text-link btn btn-active btn-ghost" >수정완료</button>
			</div>
			</form>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>
