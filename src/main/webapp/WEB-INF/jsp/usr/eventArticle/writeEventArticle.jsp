<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp" %>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<div class="myPage-wrap">
		<section class="container-box">
			<section class="myPage-center-section">
				<div class="myPage-center-div">
					<div class ="myPage-head-div">
						<h2 class ="myPage-head-h2">이벤트 등록</h2>
					</div>
						<div class="writeEvent-box">
							<div class="writeEvnet-input-head">
								<h3>상호명</h3>
							</div>
							<div>
								<input class="writeEvent-input" type="text" name="name" placeholder="상호명을 입력해주세요."/>
							</div>
						</div>
						<div class="writeEvent-box">
							<div class="writeEvnet-input-head">
								<h3>이벤트 제목</h3>
							</div>
							<div>
								<input class="writeEvent-input" type="text" name="title" placeholder="이벤트의 제목을 입력해주세요."/>
							</div>
						</div>
						<div class="writeEvent-box">
							<div class="writeEvnet-input-head">
								<h3>사이트</h3>
							</div>
							<div>
								<span>진행중인 사이트의 URL주소를 입력해주세요</span>
							</div>
							<div>
								<input class="writeEvent-input" type="text" name="site" placeholder="이벤트가 진행중인 주소를 입력해주세요."/>
							</div>
						</div>
						<div class="writeEvent-box">
							<div class="writeEvnet-input-head">
								<h3>이미지</h3>
							</div>
							
							<form id="uploadForm">
								<div id="writeEvent-imageUpload" class="writeEvent-imageUpload">
									<input id="writeEvent-image" type="hidden" name="image"/>
									<i class="writeEvent-imageUpload-icon fa-solid fa-file-arrow-up"></i>
									<input class="writeEvent-imgUpload-input" type="file" name="file" onchange="setThumbnail(event);" />
								</div>
							</form>
							<div>
								<div>
									<div id="writeEvent-imageBtn" class="writeEvent-imageBtn">
										<span>이미지 URL주소로 등록</span>
									</div>
								</div>
								<div id="writeEvent-imageURL" class="writeEvent-imageURL">
									<div style="margin: 20px; width:400px; background-color: #fff;">
										<div>
											<span style="font-weight: 700;">이미지 URL주소로 등록</span>
										</div>
										<div>
											<input id="writeEvent-imageURL-input" class="writeEvent-imageURL-input"  type="text"  placeholder="이미지 URL주소를 입력하세요."/>
										</div>
										<div >
											<div class="writeEvent-imageURL-Btn btn-hover">저장</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="writeEvent-box">
							<div class="writeEvnet-input-head">
								<h3>기간</h3>
							</div>
								<div class="flex">
									<span class="startDate-span">시작일</span>
									<span class="endDate-span">종료일</span>
									<span class="winningDate-span">당첨일</span>
								</div>
							<div class="Date-div">
								<div class="writeEvent-Date-div writeEvent-startate">
									<input class="writeEvent-input-Date"  type="text" name="startDate" placeholder="시작 날짜을 입력하세요."/>
									<i class="calendar-icon fa-solid fa-calendar-days"></i>
								</div>
								<span>~</span>
								<div class="writeEvent-Date-div writeEvent-endDate">
									<input class="writeEvent-input-Date" type="text" name="endDate" placeholder="종료 날짜를 입력하세요."/>
									<i class="calendar-icon fa-solid fa-calendar-days"></i>
								</div>
								<div class="writeEvent-Date-div writeEvent-winningDate" >
									<input class="writeEvent-input-Date"  type="text" name="winningDate" placeholder=" 당첨일을 입력하세요."/>
									<i class="calendar-icon fa-solid fa-calendar-days"></i>
								</div>
							</div>
							<div class="writeEvent-Date-div">
								
							</div>	
						</div>
						<div class="writeEvent-box">
							<div class="writeEvnet-input-head">
								<h3>카테고리</h3>
							</div>
							<div>
								<span>관련된 카테고리를 선택해주세요</span>
								<br />
								<p class="writeEventArticle-warn">※중복선택이 가능합니다.</p>
							</div>
							<div class="writeEvent-box">
								<label class="section-label" for="movie">
									<input id="movie" type="checkbox" name="kategorie" value="영화"  />
									<span>영화</span>
								</label>
								<label class="section-label" for="fashion">
									<input id="fashion" type="checkbox"  name="kategorie" value="패션" />
									<span>패션</span>
								</label>
								<label class="section-label" for="dessert">
									<input id="dessert" type="checkbox" name="kategorie" value="디저트"/>
									<span>디저트</span>
								</label>
							</div>
						</div>
						<div class="writeEvent-box">
							<div class="writeEvnet-input-head">
								<h3>상품</h3>
							</div>
							<div>
								<input class="writeEvent-input" type="text" name="goods" placeholder="상품을 입력하세요."/>
							</div>
							<div class="writeEvnet-input-head">
								<h3>참여 방법</h3>
							</div>
							<div>
								<span>간략하게 적어주세요.</span>
								<p class="writeEventArticle-warn">ex) 제품 사진을 포함한 인스타 게재, 선착순</p>
							</div>
							<div>
								<input class="writeEvent-input" type="text" name="needs" placeholder="조건을 입력하세요."/>
							</div>
							<div class="writeEvnet-input-head">
								<h3>가격</h3>
							</div>
							<div>
								<input class="writeEvent-input" type="number" name="price" placeholder="가격을 입력하세요."/>
							</div>
						</div>
						<div class="writeEvent-btn-div">
							<button id="writeEvent-btn" class="writeEvent-btn btn-hover" >등록하기</button>
						</div>
					
<!-- 					<form action="/usr/eventArticle/imageUpload" method="POST" enctype="multipart/form-data"> -->
					
				</div>
			</section>
			<%@ include file="../myPage/leftOnMyPage.jsp" %>
		</section>
	</div>
<%@ include file="../common/foot.jsp" %>
<script>
	function setThumbnail(event) {
		$("#writeEvent-image").val('');
		$(".writeEvent-imageUpload-image").remove();
	    var reader = new FileReader();
	
	    reader.onload = function(event) {
	    	Eimg = $('<img>', {
				'class' : 'writeEvent-imageUpload-image',
                'src' : event.target.result,
                'width' : '100%',

                'height' : '100%'
           });  
	    	$(Eimg).appendTo('#writeEvent-imageUpload');
	    };
	
	    reader.readAsDataURL(event.target.files[0]);
	  }
</script>
<script>
$(function(){
	$(document).on("click", "button[id='writeEvent-btn']", function() {
	  	var form = $('#uploadForm')[0];
	    var formData = new FormData(form);
	 
	    $.ajax({
	        url : "/usr/eventArticle/imageUpload",
	        type : 'POST',
	        data : formData,
	        contentType : false,
	        processData : false        
	    }).done(function(data){
	        callback(data);
	    });
	    
	    
	    
		
		var inputName = $("input[name='name']").val();
		var inputTitle = $("input[name='title']").val();
		var inputSite = $("input[name='site']").val();
		var inputImage = $("input[name='image']").val();
		var inputStartDate = $("input[name='startDate']").val();
		var inputEndDate = $("input[name='endDate']").val();
		var inputWinningDate = $("input[name='winningDate']").val();
		var inputKategorie = $("input[name='kategorie']").val();
		var inputGoods = $("input[name='goods']").val();
		var inputNeeds = $("input[name='needs']").val();
		var inputPrice = $("input[name='price']").val();
			
		$.ajax({
			type: "get"
			, url: "/usr/eventArticle/doWriteEventArticle?name=" + inputName +
					"&title=" + inputTitle +
					"&site=" + inputSite +
					"&image=" + inputImage +
					"&startDate=" + inputStartDate +
					"&endDate=" + inputEndDate +
					"&winningDate=" + inputWinningDate +
					"&kategorie=" + inputKategorie +
					"&goods=" + inputGoods +
					"&needs=" + inputNeeds +
					"&price=" + inputPrice
			, dataType : "text"
			, success: function(data) {
				alert("[" + inputTitle + "] \n 이벤트가 등록되었습니다.");
				location.replace("/usr/eventArticle/writeEventArticle");
			}
		});
	});
});
</script>

<script>
	$(function(){
		var imageBtn = $("#writeEvent-imageBtn");
		var imageURL = $("#writeEvent-imageURL");
		
		$("#writeEvent-imageBtn").click(function(){      
			if(imageURL.css('display') == 'none'){
				imageURL.show();
			} 
			else {
				imageURL.hide();
			}
			$(".writeEvent-imageURL-input").focus();
		});
		
		$(document).mouseup(function (e){
		    if(imageURL.has(e.target).length == 0) {
		    	imageURL.hide();
		    } 
		});
		$(document).on("click", ".writeEvent-imageURL-Btn", function (){
			var inputImage = $("#writeEvent-imageURL-input").val();
			$("#writeEvent-image").val(inputImage);
			$(".writeEvent-imageUpload-image").remove();
			vimg = $('<img>', { 
				'class' : 'writeEvent-imageUpload-image',
                'src' : inputImage,
                'width' : '100%',

                 'height' : '100%'

           });                             

			$(vimg).appendTo('#writeEvent-imageUpload');
			imageURL.hide();
		});
		
			
			
			
	});
</script>
<script>
 $(function(){
	 $("#myPage-left-myShareEventArticle").css({
		 "color": "#489CFF"
	 });
 });
</script>
<script>
	$('input[name="startDate"]').daterangepicker({
		singleDatePicker: true,
		timePicker: true,
		locale: {
		      format: 'YYYY-MM-DD HH:mm',
		    	  "applyLabel": "확인",                   
		    	    "cancelLabel": "취소",  
		    	    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		    	    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		    }
	});
	
	$('input[name="endDate"]').daterangepicker({
		singleDatePicker: true,
		timePicker: true,
		locale: {
		      format: 'YYYY-MM-DD HH:mm',
		    	  "applyLabel": "확인",                    
		    	    "cancelLabel": "취소",                  
		    	    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		    	    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		    }
	});
	
	$('input[name="winningDate"]').daterangepicker({
		singleDatePicker: true,
		timePicker: true,
		locale: {
		      format: 'YYYY-MM-DD HH:mm',
		    	  "applyLabel": "확인",                   
		    	    "cancelLabel": "취소",                   
		    	    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		    	    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		    }
	});
</script>
