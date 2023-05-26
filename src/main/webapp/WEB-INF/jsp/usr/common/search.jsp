<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function(){
	
		$(".search-input").focus();
	});
</script>
	<section class="fixed mt-12 text-sm bg-white  border-bottom-line w-full">
		<div class="my-6 mx-auto px-3">
			<div class="mb-2 justify-between">
				<form class="items-center flex">
					<input class="search-input ml-5 pl-5 text-xl " name="searchKeyword" placeholder="찾으시는 이벤트를 검색해주세요" maxlength="20" value="${searchKeyword}"/>
					<button class="search-icon btn-text-link btn btn-active"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
					<input type="hidden" name="boardId" value="${board.id }"/>
					<div class="ml-5 mt-5">
						<select data-value="${searchKeywordType }" class="search-select mx-2" name="searchKeywordType">
							<option value="name">상호명</option>
							<option value="section">분야</option>
							<option value="goods">상품</option>
							<option value="needs">조건</option>
							<option value="price">가격</option>
						</select>
						
					</div>
				</form>
			</div>  
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>