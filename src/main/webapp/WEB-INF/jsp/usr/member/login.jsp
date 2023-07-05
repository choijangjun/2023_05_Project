<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<c:set var="pageTitle" value="Login" />
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/search.jsp" %>
	<section class="pt-44 text-xl">
		<div class="container mx-auto px-3">
			<form action="doLogin" method="POST">
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>로그인 아이디</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="loginId" placeholder="아이디를 입력해주세요"/></td>
							</tr>
							<tr>
								<th>로그인 비밀번호</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="loginPw" placeholder="비밀번호를 입력해주세요"/></td>
							</tr>
							<tr>
								<td colspan="2"><button class="btn-text-link btn btn-active">로그인</button></td>
							</tr>
						</tbody>
					</table>
				</div>	
			</form>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button" onclick="history.back();">뒤로가기</button>
			</div>
			<div class="flex">
			      <a   class="kakao-btn" onclick="kakaoLogin();" href="javascript:void(0)">
			          <span class="kakao-btn">카카오 로그인</span>
			      </a>
			      <a  class="kakao-btn"  onclick="kakaoLogout();" href="javascript:void(0)">
			          <span class="kakao-btn">카카오 로그아웃</span>
			      </a>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('b87a3b2707fbf06581e58759982ed737'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>