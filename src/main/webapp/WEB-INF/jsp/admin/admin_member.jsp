<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div class="d-flex justify-content-between business-list-table">
		<h5 class="font-weight-bold">회원목록</h5>
		<div>
			<span><a href="/admin/member_list?memberType=member">개인멤버</a></span>
			<span>/</span>
			<span><a href="/admin/member_list?memberType=businessMember">사업자멤버</a></span>
			<span>/</span>
			<span><a href="/admin/member_list?memberType=influencerMember">인플루언서</a></span>
		</div>
	</div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width1 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">분류</div>
			<div class="top-title text-div-width1 text-center">아이디</div>
			<div class="top-title text-div-width2 text-center">이름</div>
			<div class="top-title text-div-width3 text-center">번호</div>
			<div class="top-title text-div-width5 text-center">가입일</div>
			<div class="top-title text-div-width6 text-center">상태</div>
		</div>
		<c:forEach items="${memberList}" var="member">
			<div class="d-flex bot-line p-1">
				<div class="text-div-width1 text-center">${member.id}</div>
				<div class="text-div-width1 text-center">
					<c:choose>
						<c:when test="${member.memberType == 'member'}">
							개인멤버
						</c:when>
						<c:when test="${member.memberType == 'businessMember'}">
							사업자회원
						</c:when>
						<c:when test="${member.memberType == 'influencerMember'}">
							인플루언서
						</c:when>
					</c:choose>
				</div>
				<div class="text-div-width1 text-center">${member.loginId}</div>
				<div class="text-div-width2 text-center">${member.name}</div>
				<div class="text-div-width3 text-center">${member.mobilePhoneNumber}</div>
				<fmt:formatDate var="createdDate" value="${member.createdAt}" pattern="yyyy-MM-dd"/>
				<div class="text-div-width5 text-center">${createdDate}</div>
				<div class="text-div-width5 text-center">
					<c:choose>
						<c:when test="${member.approvalCondition == 1}">
							승인
						</c:when>
						<c:when test="${member.approvalCondition == 0}">
							미승인
						</c:when>
					</c:choose>
				</div>
			</div>
		</c:forEach>
		
		<c:choose>
			<c:when test="${empty memberType}">
				<!-- 페이징 버튼 -->
				<div class="list_number">
		    		<div>
			        	<div class="list_n_menu">
			        		<a href="/admin/member_list?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
				        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
				        	<a href="/admin/member_list?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }" onclick="postPaging()">${num}</a>
				        	</c:forEach>
				        	<a href="/admin/member_list?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
				        	</a>
			        	</div>
		    		</div>
				</div>
				<!--  페이징 버튼 끝 -->
			</c:when>
			<c:when test="${memberType eq 'member'}">
				<!-- 페이징 버튼 -->
				<div class="list_number">
		    		<div>
			        	<div class="list_n_menu">
			        		<a href="/admin/member_list?memberType=${memberType}&postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
				        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
				        	<a href="/admin/member_list?memberType=${memberType}&postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }" onclick="postPaging()">${num}</a>
				        	</c:forEach>
				        	<a href="/admin/member_list?memberType=${memberType}&postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
				        	</a>
			        	</div>
		    		</div>
				</div>
				<!--  페이징 버튼 끝 -->
			</c:when>
			<c:when test="${memberType eq 'businessMember'}">
				<!-- 페이징 버튼 -->
				<div class="list_number">
		    		<div>
			        	<div class="list_n_menu">
			        		<a href="/admin/member_list?memberType=${memberType}&postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
				        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
				        	<a href="/admin/member_list?memberType=${memberType}&postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }" onclick="postPaging()">${num}</a>
				        	</c:forEach>
				        	<a href="/admin/member_list?memberType=${memberType}&postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
				        	</a>
			        	</div>
		    		</div>
				</div>
				<!--  페이징 버튼 끝 -->
			</c:when>
			<c:when test="${memberType eq 'influencerMember'}">
				<!-- 페이징 버튼 -->
				<div class="list_number">
		    		<div>
			        	<div class="list_n_menu">
			        		<a href="/admin/member_list?memberType=${memberType}&postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
				        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
				        	<a href="/admin/member_list?memberType=${memberType}&postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }" onclick="postPaging()">${num}</a>
				        	</c:forEach>
				        	<a href="/admin/member_list?memberType=${memberType}&postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
				        	</a>
			        	</div>
		    		</div>
				</div>
				<!--  페이징 버튼 끝 -->
			</c:when>
		</c:choose>
	</div>
</div>
<script>
	$(document).ready(function(){
		$(".confirm-button").on('click', function(){
			let id = $(this).data("member-id");
			if ($(this).val() == '승인') {
				var approvalCondition = 1;
			} else if ($(this).val() == '거절') {
				var approvalCondition = 3;
			}
			
			$.ajax({
				type: "PUT"
				, url: "/admin/approval_business_member"
				, data: {"id" : id, "approvalCondition" : approvalCondition}
				, success:function(data) {
					location.reload();
					alert("성공");
				}
				, error:function(request, status, error) {
					alert("승인에 실패하였습니다. 관리자에게 문의해주세요");
				}
			});
			
		});
	});
</script>