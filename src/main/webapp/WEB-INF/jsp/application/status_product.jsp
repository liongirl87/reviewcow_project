<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>�� ü���</div>
		<div class="mp-header-top-text-line mt-3"></div>
		<div class="mp-menu-div d-flex justify-content-center">
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?aprovalCondition=0'">���</a></div>
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?aprovalCondition=1'">����</a></div>
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?aprovalCondition=0'">����</a></div>
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?aprovalCondition=2'">�ݷ�</a></div>
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?aprovalCondition=3'">���</a></div>
		</div>
		<div class="mp-header-text-line"></div>
		<div class="board-table-style">
			<div class="d-flex board-table-header-div bot-line">
				<div class="statusProduct-header-childText1 text-center">����</div>
				<div class="statusProduct-header-childText2 text-center">�Ⱓ</div>
				<div class="statusProduct-header-childText3 text-center">ü���</div>
				<div class="statusProduct-header-childText4 text-center">�����ο�</div>
				<div class="statusProduct-header-childText5 text-center">����</div>
			</div>
			<c:forEach items="${cardViewList}" var="card">
				<div class="d-flex board-table-content-div bot-line">
					<c:choose>
						<c:when test="${card.sellPost.serviceCategory1 == 'onlineProduct'}">
							<div class="statusProduct-header-childText1 text-center">
								<span class="statusProduct-category-style">�¶���</span>
							</div>
						</c:when>
						<c:when test="${card.sellPost.serviceCategory1 == 'offlineStore'}">
							<div class="statusProduct-header-childText1 text-center">
								<span class="statusProduct-category-style">ü���</span>
							</div>
						</c:when>
						<c:when test="${card.sellPost.serviceCategory1 == 'pressCorps'}">
							<div class="statusProduct-header-childText1 text-center">
								<span class="statusProduct-category-style">���ڴ�</span>
							</div>
						</c:when>
					</c:choose>
					<fmt:formatDate var="startDate" value="${card.sellPost.startDate}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="endDate" value="${card.sellPost.endDate}" pattern="yyyy-MM-dd"/>
					<div class="statusProduct-header-childText2 text-center small-date-font">${startDate} ~ ${endDate}</div>
					<div class="statusProduct-header-childText3 text-center"><a href="/sellpost/product_detail_view?postId=${card.sellPost.id}">${card.sellPost.productName}</a></div>
					<div class="statusProduct-header-childText4 text-center">${card.nowApplicants}/${card.sellPost.numberOfApplicants}</div>
					<c:choose>
						<c:when test="${card.sellPost.aprovalCondition == 0}">
							<div class="statusProduct-header-childText5 text-center">���</div>
						</c:when>
						<c:when test="${card.sellPost.aprovalCondition == 1}">
							<div class="statusProduct-header-childText5 text-center">����</div>
						</c:when>
						<c:when test="${card.sellPost.aprovalCondition == 2}">
							<div class="statusProduct-header-childText5 text-center">�ݷ�</div>
						</c:when>
						<c:when test="${card.sellPost.aprovalCondition == 3}">
							<div class="statusProduct-header-childText5 text-center">���</div>
						</c:when>
					</c:choose>
				</div>
			</c:forEach>
			<!-- ����¡ ��ư TEST -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/application/manage_applicants_view/status_product_view?aprovalCondition=${nowAprovalCondition}&postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/application/manage_applicants_view/status_product_view?aprovalCondition=${nowAprovalCondition}&postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/application/manage_applicants_view/status_product_view?aprovalCondition=${nowAprovalCondition}&postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  ����¡ ��ư TEST �� -->
	</div>	
</div>
