<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="myPage-center-section">
	<div class="myPage-center-div">
		<div class="table-box-type-1">
				<table class="table table-zebra w-full">
					<colgroup>
						<col width="200" />
					</colgroup>
					<tbody>
						<tr>
							<th>이름</th>
							<td>${rq.loginedMember.name }</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>${rq.loginedMember.nickname }</td>
						</tr>
					</tbody>
				</table>
			</div>
	</div>
</section>