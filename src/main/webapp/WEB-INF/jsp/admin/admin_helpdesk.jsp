<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div><h5 class="font-weight-bold">1:1문의</h5></div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width0 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">이름(아이디)</div>
			<div class="top-title text-div-width2 text-center">타입</div>
			<div class="top-title text-div-noticeTitle text-center">제목</div>
			<div class="top-title text-div-width5 text-center">작성일</div>
			<div class="top-title text-div-width6 text-center">상태</div>
		</div>
		<c:forEach items="${helpdeskList}" var="helpdesk">
			<div class="d-flex bot-line p-1">
				<div class="text-div-width0 text-center">${helpdesk.helpdesk.id}</div>
				<div class="text-div-width1 text-center">${helpdesk.member.name} (${helpdesk.member.loginId})</div>
				<div class="text-div-width2 text-center">${helpdesk.helpdesk.inquiryType}</div>
				<div class="text-div-noticeTitle text-center">
					<a href="/admin/helpdesk_detail?helpdeskId=${helpdesk.helpdesk.id}">${helpdesk.helpdesk.inquiryTitle}</a>
					<span>(${helpdesk.numberOfReplies})</span>
				</div>
				<fmt:formatDate var="createdDate" value="${helpdesk.helpdesk.createdAt}" pattern="yyyy-MM-dd"/>
				<div class="text-div-width5 text-center">${createdDate}</div>
				<div class="text-div-width5 text-center">
					<c:choose>
						<c:when test="${helpdesk.numberOfReplies <= 0}">
							<span class="font-weight-bold text-danger">미답변</span>
						</c:when>
						<c:when test="${helpdesk.numberOfReplies > 0}">
							<span class="font-weight-bold text-primary">답변</span>
						</c:when>
					</c:choose>
				</div>
			</div>
		</c:forEach>
			<!-- 페이징 버튼 -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/admin/helpdesk?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        		<a href="/admin/helpdesk?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/admin/helpdesk?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  페이징 버튼 끝 -->
	</div>
</div>
