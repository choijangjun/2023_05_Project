<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function(){
	
		$(".search-input").focus();
	});
	
</script>
	<section class="fixed mt-12 text-xl bg-white  border-bottom-line w-full">
		<div class="my-6 mx-auto px-3">
			<div class="mb-2 flex justify-between">
				<form>
					<input class="search-input ml-5 pl-5 " name="searchKeyword" placeholder="찾으시는 이벤트 검색" maxlength="20" value="${searchKeyword}"/>
					<button class="search-icon  btn-text-link btn btn-active -"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
					<input type="hidden" name="boardId" value="${board.id }"/>
					<div class="ml-5 mt-5">
						<select data-value="${searchKeywordType }" class="search-select mx-2" name="searchKeywordType">
							<option value="title">제목</option>
							<option value="body">내용</option>
							<option value="title,body">제목 + 내용</option>
						</select>
						<select data-value="${searchKeywordType }" class="search-select mx-2 select select-bordered" name="searchKeywordType">
							<option value="title">제목</option>
							<option value="body">내용</option>
							<option value="title,body">제목 + 내용</option>
						</select>
						<select data-value="${searchKeywordType }" class="search-select mx-2 select select-bordered" name="searchKeywordType">
							<option value="title">제목</option>
							<option value="body">내용</option>
							<option value="title,body">제목 + 내용</option>
						</select>
						<select data-value="${searchKeywordType }" class="search-select mx-2 select select-bordered" name="searchKeywordType">
							<option value="title">제목</option>
							<option value="body">내용</option>
							<option value="title,body">제목 + 내용</option>
						</select>
					</div>
				</form>
				<ul class="flex">
					<li class="hover:underline flex"><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=1"><span>공지사항</span></a></li>
					<li class="hover:underline flex" ><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=2"><span>자유게시판</span></a></li>
				</ul>
				<div class="flex items-center"><span>진행중인 이벤트 : ${articlesCnt } 개</span></div>
			</div>  
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>