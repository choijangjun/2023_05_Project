<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Modify" />
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/toastUiEditorLib.jsp" %>
	<section class="pt-56 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModify" method="POST" onsubmit="submitForm(this); return false;">
				<input type="hidden" name="body" />
				<input type="hidden" name="id" value="${article.id }"/>
				<div class="table-box-type-1">
					<table class="table table-zebra w-full">
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<td><div class="badge">${article.id }</div></td>
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
								<td><input class="input input-bordered w-full" type="text" name="title" value="${article.title }" placeholder="제목을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<div class="toast-ui-editor">
      									<script type="text/x-template">${article.body }</script>
    								</div>
								</td>
							</tr>
							<tr>
								<td colspan="2"><button class="btn-text-link btn btn-active">수정</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>