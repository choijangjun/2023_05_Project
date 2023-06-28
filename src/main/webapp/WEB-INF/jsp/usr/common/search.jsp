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
				<form action="/usr/eventArticle/listEventArticle" class=" flex">
					<input class="search-input" name="searchKeyword" placeholder="찾으시는 이벤트를 검색해주세요" maxlength="20" value="${searchKeyword}"/>
					<button class="search-icon btn-text-link btn btn-active"><i class="text-xl fa-solid fa-magnifying-glass"></i></button>
				</form>
				
				<div class="flex">
					<div class="search-section-div">
						<div >
							<button id="search-button-title" class="search-button-title">
								<span class="mx-2">분야</span>
								<i id="arrow" class="fa-solid fa-caret-down "></i>
							</button>
						</div>
						<div id="layer-section" class="layer-section" >
							<div id="layer-section-in" class="layer-section-in ">
								<h1>분야</h1>
								<p>중복선택이 가능합니다.</p>
								<form id="kategorie-form" action="/usr/eventArticle/listEventArticle" method="get">
									<div>
										<label class="section-label" for="movie">
											<input id="movie" type="checkbox" name="checkKeyword" value="영화"  onclick="#search-btn" />
											<span>영화</span>
										</label>
										<label class="section-label" for="fashion">
											<input id="fashion" type="checkbox"  name="checkKeyword" value="패션" />
											<span>패션</span>
										</label>
										<label class="section-label" for="dessert">
											<input id="dessert" type="checkbox" name="checkKeyword" value="디저트"/>
											<span>디저트</span>
										</label>
										<div class="section-button">
											<button id="search-btn" class="btn-text-link btn btn-active" >적용</button>
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
	$(function(){
		var layerSection = $("#layer-section");
		var buttonSection = $("#search-button-title");
		var arrow =$("#arrow");
		
		$(document).mouseup(function (e){
		    if(layerSection.has(e.target).length == 0) {
		    	layerSection.hide();
		    	buttonSection.css({
					"color": "inherit ",
					"border": "1px solid #F3F3F3"
				});
		    	arrow.removeClass("fa-flip-vertical");
		    } 
		});
		
		$(document).on("click", "#search-button-title", function (){
			if(layerSection.css('display') == 'none'){
				layerSection.show();
				buttonSection.css({
					"color": "#489CFF",
					"border": "1px solid #489CFF"
				});
				arrow.addClass("fa-flip-vertical");
			
			} 
		});
		
	});
</script>
<script>
	<c:forEach items="${checkKeyword}" var="kategorie" varStatus="status">
		if('${kategorie}' == '영화') {
			$('#movie').prop('checked',true);
		} else if('${kategorie}' == '패션') {
			$('#fashion').prop('checked',true);
		} else if('${kategorie}' == '디저트') {
			$('#dessert').prop('checked',true);
		}
	</c:forEach>
</script>
	
<script>
</script>
<%@ include file="../common/foot.jsp" %>