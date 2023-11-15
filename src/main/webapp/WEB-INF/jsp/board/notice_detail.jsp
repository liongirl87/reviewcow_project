<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<div id="helpdesk-write" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>공지사항</div>
		<div class="semi-title-margin">
			<div id="form-div" class="top-line">
				<div class="d-flex align-items-center helpdesk-content-title bot-line">
					<div class="d-flex align-items-center helpdesk-content-title-child1">
						<span class="ml-3">제목</span>
					</div>
					<div class="helpdesk-content-title-Rline text-center"></div>
					<div class="helpdesk-content-title-child2 text-center">${notice.category}</div>
					<div class="helpdesk-content-title-child3">${notice.postTitle}</div>
				</div>
			</div>
			<div class="d-flex helpdesk-createdAt-div bot-line">
				<div class="helpdesk-createdAt-text"> 작성일</div>
				<fmt:formatDate var="createDate" value="${notice.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
				<div class="helpdesk-createdAt-text2">${createDate}</div>
			</div>
			<div class="content-text-div bot-line">
				<div>${notice.content}</div>
			</div>
			<div class="d-flex justify-content-end mt-3">
				<input type="button" class="helpdesk-bot-buttons text-center" value="목록" onclick="location.href='/board/notice_list'">		
			</div>
		</div>	
	</div>
</div>
