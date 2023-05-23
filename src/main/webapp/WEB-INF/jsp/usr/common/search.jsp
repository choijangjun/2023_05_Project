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
				<form class="items-center flex ">
					<input class="search-input ml-5 pl-5 text-xl " name="searchKeyword" placeholder="찾으시는 이벤트를 검색해주세요" maxlength="20" value="${searchKeyword}"/>
					<button class="search-icon btn-text-link btn btn-active"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
					<input type="hidden" name="boardId" value="${board.id }"/>
					<div class="ml-5 mt-5">
						<select data-value="${searchKeywordType }" class="search-select mx-2" name="searchKeywordType">
							<option value="title,body">모든 분야</option>
							<option value="body">영화</option>
							<option value="title,body">디저트</option>
							<option value="title,body">옷</option>
						</select>
						<select data-value="${searchKeywordType }" class="search-select mx-2" name="searchKeywordType">
							<option value="title">모든 할인</option>
							<option value="body">0%~100%까지 적용(부동산 사이트 처럼)</option>
						</select>
						<select data-value="${searchKeywordType }" class="search-select mx-2" name="searchKeywordType">
							<option value="title">이벤트 기간</option>
							<option value="body">기간 선택(야놀자처럼)</option>
						</select>
						<select data-value="${searchKeywordType }" class="search-select mx-2" name="searchKeywordType">
							<option value="title">진행중인 이벤트</option>
							<option value="body">진행중 + 종료된 이벤트</option>
							<option value="title,body">종료된 이벤트</option>
						</select>
						<span>정렬</span>
						<select data-value="${searchKeywordType }" class="search-select mx-2" name="searchKeywordType">
							<option value="title">최신순</option>
							<option value="body">조회수순</option>
							<option value="title,body">추천순</option>
						</select>
					</div>
				</form>
			</div>  
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>