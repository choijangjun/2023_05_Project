<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Detail" />
<%@ include file="../common/head.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
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
							<td></td>
							<input type="text" placeholder=${article.title }maxlength=20 style="width:100%" >
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea placeholder=${article.body }style="width: 100%; height: 100%"></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btns">
				<button class="btn-text-link" type="button" onclick="history.back();">뒤로가기</button>
				<a class="btn-text-link" href="modify?id=${article.id }">수정</a>
				<a class="btn-text-link" href="doDelete?id=${article.id }">삭제</a>
				
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>