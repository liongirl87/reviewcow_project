<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<div id="helpdesk-write" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>1:1문의</div>
		<div class="semi-title-margin">
			<div id="form-div" class="top-line">
				<div class="d-flex align-items-center helpdesk-content-title bot-line">
					<div class="d-flex align-items-center helpdesk-content-title-child1">
						<span class="ml-3">제목</span>
					</div>
					<div class="helpdesk-content-title-Rline text-center"></div>
					<div class="helpdesk-content-title-child2 text-center">${helpdesk.inquiryType}</div>
					<div class="helpdesk-content-title-child3">${helpdesk.inquiryTitle}</div>
				</div>
			</div>
			<div>
				<div class="d-flex align-items-center helpdesk-content-title bot-line">
					<div class="d-flex align-items-center helpdesk-content-title-child1">
						<span class="ml-3">작성자</span>
					</div>
					<div class="helpdesk-content-title-Rline text-center"></div>
					<div class="helpdesk-content-title-child3">${memberLoginId}</div>
				</div>
			</div>
			<div class="d-flex helpdesk-createdAt-div bot-line">
				<div class="helpdesk-createdAt-text"> 작성일</div>
				<fmt:formatDate var="createDate" value="${helpdesk.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
				<div class="helpdesk-createdAt-text2">${createDate}</div>
			</div>
			<div class="content-text-div bot-line">
				<div>${helpdesk.inquiryContent}</div>
			</div>
			<div class="d-flex justify-content-end mt-3">
				<input type="button" id="helpdeskModifyBtn" class="helpdesk-bot-buttons text-center mr-1" value="수정" onclick="location.href='/board/helpdesk_modify?postId=${helpdesk.id}'">		
				<input type="button" id="helpdeskDeleteBtn" class="helpdesk-bot-buttons text-center mr-1" value="삭제">		
				<input type="button" class="helpdesk-bot-buttons text-center" value="목록" onclick="location.href='/board/helpdesk_view'">		
			</div>
			<div class="helpdesk-reply-div mt-3">
				<div class="d-flex align-items-center helpdesk-reply-div-writer bot-line">
					<div class="helpdesk-reply-div-child1">ReviewCow</div>
					<div class="ml-3 helpdesk-createdAt-text2">2023-06-14 20:11:50</div>
				</div>
				<div class="helpdesk-reply-div-content">
					안녕하세요~문의 답변입니다 안녕하세요~문의 답변입니다 안녕하세요~문의 답변입니다 안녕하세요~문의 답변입니다 안녕하세요~문의 답변입니다 안녕하세요~문의 답변입니다
				</div>
			</div>
		</div>	
	</div>
</div>
<script>
$(document).ready(function(){
	$('#helpdeskModifyBtn').on('click', function(){
		alert("ddd");
	});

});


</script>