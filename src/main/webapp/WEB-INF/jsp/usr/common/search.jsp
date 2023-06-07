<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function(){
	
		$(".search-input").focus();
	});
</script>


	<section class="search-head  mt-12 text-sm bg-white border-bottom-line w-full">
		<div class="my-6 mx-auto px-3">
			<div class="mb-2  items-center flex">
				<form class=" flex">
					<input class="search-input ml-5 pl-5 text-xl " name="searchKeyword" placeholder="찾으시는 이벤트를 검색해주세요" maxlength="20" value="${searchKeyword}"/>
					
					<button class="search-icon btn-text-link btn btn-active"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
					<%-- <input type="hidden" name="boardId" value="${board.id }"/> --%>
				</form>
				
				<div class="flex">
					<div class="search-section-div">
						<div>
							<button class="search-button-title" onclick="doDisplay()">
								<span class="mx-2">분야</span>
								<i class="fa-solid fa-caret-down "></i>
							</button>
						</div>
						<div id="layer-section" class="layer-section" >
							<div class="layer-section-in ">
								<h1>분야</h1>
								<p>중복선택이 가능합니다.</p>
								<form action="/usr/eventArticle/listToCheckKeyword" method="get">
									<div>
										<label class="section-label" for="movie">
											<input id="movie" type="checkbox" name="checkKeyword" value="movie"  />
											<span>영화</span>
										</label>
										<label class="section-label" for="fashion">
											<input id="fashion" type="checkbox"  name="checkKeyword" value="fashion" />
											<span>패션</span>
										</label>
										<label class="section-label" for="dessert">
											<input id="dessert" type="checkbox" name="checkKeyword" value="dessert"/>
											<span>디저트</span>
										</label>
										<div class="section-button">
											<button class="btn-text-link btn btn-active" >적용</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>  
		</div>
	</section>
<script>
    function doDisplay(){
        var con = document.getElementById("layer-section");
        con.style.display = (con.style.display != 'none') ? "none" : "block";
    }

</script>

<script>
	<c:forEach items="${checkKeyword}" var="section" varStatus="status">
		console.log('${section}');
		if('${section}' == 'movie') {
			$('#movie').prop('checked',true);
		} else if('${section}' == 'fashion') {
			$('#fashion').prop('checked',true);
		} else if('${section}' == 'dessert') {
			$('#dessert').prop('checked',true);
		}
	</c:forEach>

</script>
	
<script>
</script>
<%@ include file="../common/foot.jsp" %>