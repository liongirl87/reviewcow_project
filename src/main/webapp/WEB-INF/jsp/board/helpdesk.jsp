<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
      
<div id="reviewList" class="d-flex justify-content-center helpdesk-div">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>�����ϱ�</div>
		<div class="d-flex justify-content-between helpdesk-button-parentDiv semi-title-margin">
			<div class="semi-title">���ǳ���</div>
			<input type="button" id="helpdeskInquireBtn" onclick="location.href='/board/helpdesk_write_view'" value="1:1�����ϱ�">
		</div>
		<div class="main-table-div">
			<div>
				<div class="form-inputBox-pm d-flex align-items-center top-header-div">
					<div class="text-margin01 text-center">�ۼ���</div>
					<div class="text-margin02 text-center">����</div>
					<div class="text-margin03 text-center">����</div>
					<div class="text-margin04 text-center">����</div>
				</div>
			</div>
			<c:forEach items="${helpdeskList}" var="helpdeskList">
				<div class="d-flex align-items-center reveiwList-content-div">
					<fmt:formatDate var="dateOfCreated" value="${helpdeskList.createdAt}" pattern="yyyy-MM-dd"/>
					<div class="text-margin01 text-center">${dateOfCreated}</div>
					<div class="text-margin02 text-center">${helpdeskList.inquiryType}</div>
					<div class="text-margin03 text-center"><a href="#">${helpdeskList.inquiryTitle}</a></div>
					<c:choose>
						<c:when test="${helpdeskList.replyOrNot == 0}">
							<div class="text-margin04 text-center">�̴亯</div>
						</c:when>
						<c:when test="${helpdeskList.replyOrNot == 1}">
							<div class="text-margin04 text-center">�亯�Ϸ�</div>
						</c:when>
					</c:choose>
				</div>
			</c:forEach>
		<!-- ����¡ ��ư TEST -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/board/helpdesk_view?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/board/helpdesk_view?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/board/helpdesk_view?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  ����¡ ��ư TEST �� -->
		</div>
	</div>
</div>
    
