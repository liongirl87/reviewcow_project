<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
      
<div id="reviewList" class="d-flex justify-content-center helpdesk-div">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>공지사항</div>
		<div class="d-flex justify-content-between helpdesk-button-parentDiv semi-title-margin">
			<div class="semi-title">공지리스트</div>
		</div>
		<div class="main-table-div">
			<div>
				<div class="form-inputBox-pm d-flex align-items-center top-header-div">
					<div class="text-margin01 text-center">작성일</div>
					<div class="text-margin02 text-center">유형</div>
					<div class="text-margin03 text-center">제목</div>
					<div class="text-margin04 text-center">작성자</div>
				</div>
			</div>
			<c:forEach items="${noticeList}" var="notice">
				<div class="d-flex align-items-center reveiwList-content-div">
					<fmt:formatDate var="dateOfCreated" value="${notice.notice.createdAt}" pattern="yyyy-MM-dd"/>
					<div class="text-margin01 text-center">${dateOfCreated}</div>
					<div class="text-margin02 text-center">${notice.notice.category}</div>
					<div class="text-margin03 text-center"><a href="/board/notice_detail?noticeId=${notice.notice.id}" class="helpdesk-title-text">${notice.notice.postTitle}</a></div>
					<div class="text-margin04 text-center">${notice.member.name}</div>
				</div>
			</c:forEach>
		<!-- 페이징 버튼 -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/board/helpdesk_view?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/board/helpdesk_view?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/board/helpdesk_view?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  페이징 버튼 끝 -->
		</div>
	</div>
</div>
    
