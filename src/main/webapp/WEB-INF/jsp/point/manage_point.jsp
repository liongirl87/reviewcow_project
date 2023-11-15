<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>포인트관리</div>
		<div class="d-flex justify-content-between point-button-parentDiv">
			<div class="semi-title">보유포인트</div>
			<input type="button" id="chargePointBtn" value="충전하기" onclick="location.href='/point/manage_point_view/deposit_view'">
			<input type="button" id="withdrawPointBtn" value="출금하기" onclick="location.href='/point/manage_point_view/withdraw_view'">
		</div>
		<div class="mp-bottom-text-line"></div>
		<div class="now-point-div d-flex align-items-center justify-content-center">
		
		<div class="now-point-text"><span class="font-weight-bold"><fmt:formatNumber value="${nowPoint}" type="number" /></span><span>P</span></div>
		</div>
		<div class="mp-header-top-text-line"></div>
		<div class="mp-menu-div d-flex justify-content-center">
			<div class="mp-menu"><a href="#" onclick="movePointStatus(3)">전체</a></div>
			<div class="mp-menu"><a href="#" onclick="movePointStatus(1)">승인</a></div>
			<div class="mp-menu"><a href="#" onclick="movePointStatus(2)">취소</a></div>
			<div class="mp-menu"><a href="#" onclick="movePointStatus(0)">대기</a></div>
		</div>
		<div class="mp-header-text-line"></div>
		<div class="board-table-style">
			<div class="d-flex board-table-header-div bot-line">
				<div class="board-table-header-childText1 text-center">신청일</div>
				<div class="board-table-header-childText2 text-center">출처</div>
				<div class="board-table-header-childText3 text-center">금액</div>
				<div class="board-table-header-childText4 text-center">상태</div>
			</div>
			<c:forEach items="${pointList}" var="point">
				<c:if test="${point.sort == 1 || point.sort == 3 || point.sort == 5}">
					<div class="d-flex board-table-content-div bot-line">
				</c:if>
				<c:if test="${point.sort == 0 || point.sort == 2 || point.sort == 4}">
					<div class="d-flex board-table-content-div bot-line">
				</c:if>
				<fmt:formatDate var="date" value="${point.createdAt}" pattern="yyyy-MM-dd"/>
				<div class="board-table-header-childText1 text-center">${date}</div>
				<c:choose>
					<c:when test="${point.sort == 0}">
						<div class="board-table-header-childText2 text-center active-plus">체험단적립</div>
					</c:when>
					<c:when test="${point.sort == 1}">
						<div class="board-table-header-childText2 text-center active-subtraction">체험단지출</div>
					</c:when>
					<c:when test="${point.sort == 2}">
						<div class="board-table-header-childText2 text-center active-plus">충전하기</div>
					</c:when>
					<c:when test="${point.sort == 3}">
						<div class="board-table-header-childText2 text-center active-subtraction">출금하기</div>
					</c:when>
					<c:when test="${point.sort == 4}">
						<div class="board-table-header-childText2 text-center active-plus">기타</div>
					</c:when>
					<c:when test="${point.sort == 5}">
						<div class="board-table-header-childText2 text-center active-subtraction">기타</div>
					</c:when>
				</c:choose>
				<c:if test="${point.point >= 0}">
					<div class="board-table-header-childText3 text-center active-plus">
						<fmt:formatNumber value="${point.point}" type="number" />
					</div>
				</c:if>
				<c:if test="${point.point < 0}">
					<div class="board-table-header-childText3 text-center active-subtraction">
						<fmt:formatNumber value="${point.point}" type="number" />
					</div>
				</c:if>
				<c:choose>
					<c:when test="${point.status == 0}">
						<div class="board-table-header-childText4 text-center">대기</div>
					</c:when>
					<c:when test="${point.status == 1}">
						<div class="board-table-header-childText4 text-center">승인</div>
					</c:when>
					<c:when test="${point.status == 2}">
						<div class="board-table-header-childText4 text-center">취소</div>
					</c:when>
				</c:choose>
				</div>
				</c:forEach>
			<!-- 페이징 버튼 TEST -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/point/manage_point_view?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/point/manage_point_view?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/point/manage_point_view?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  페이징 버튼 TEST 끝 -->
	</div>	
</div>
<script>
$(document).ready(function(){
	movePointStatus = function(n) {
		if (n == 0) {	// 대기
			$("#managePoint-view").load("/point/change_point_status?status=" + n);
		} else if (n == 1) {	// 승인
			$("#managePoint-view").load("/point/change_point_status?status=" + n);
		} else if (n == 2) {	// 취소
			$("#managePoint-view").load("/point/change_point_status?status=" + n);
		} else if (n == 3) {	// 전체
			$("#managePoint-view").load("/point/change_point_status?status=" + n);
		} 
	}
	
});

</script>
