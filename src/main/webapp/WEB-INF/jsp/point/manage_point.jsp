<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view"class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>����Ʈ����</div>
		<div class="d-flex justify-content-between point-button-parentDiv">
			<div class="semi-title">��������Ʈ</div>
			<input type="button" id="chargePointBtn" value="�����ϱ�">
			<input type="button" id="withdrawPointBtn" value="����ϱ�">
		</div>
		<div class="mp-bottom-text-line"></div>
		<div class="now-point-div d-flex align-items-center justify-content-center">
		
			<div class="now-point-text"><span class="font-weight-bold"><fmt:formatNumber value="${nowPoint}" type="number" /></span><span>P</span></div>
		</div>
		<div class="mp-header-top-text-line"></div>
		<div class="mp-menu-div d-flex justify-content-center">
			<div class="mp-menu"><a href="#">��ü</a></div>
			<div class="mp-menu"><a href="#">����</a></div>
			<div class="mp-menu"><a href="#">���</a></div>
			<div class="mp-menu"><a href="#">���</a></div>
			<div class="mp-menu"><a href="#">���</a></div>
		</div>
		<div class="mp-header-text-line"></div>
		<div class="board-table-style">
			<div class="d-flex board-table-header-div bot-line">
				<div class="board-table-header-childText1 text-center">��û��</div>
				<div class="board-table-header-childText2 text-center">��ó</div>
				<div class="board-table-header-childText3 text-center">�ݾ�</div>
				<div class="board-table-header-childText4 text-center">����</div>
			</div>
			<c:forEach items="${pointList}" var="point">
				<c:if test="${point.sort == 1 || point.sort == 3 || point.sort == 5}">
					<div class="d-flex board-table-content-div bot-line active-subtraction">
				</c:if>
				<c:if test="${point.sort == 0 || point.sort == 2 || point.sort == 4}">
					<div class="d-flex board-table-content-div bot-line active-plus">
				</c:if>
				<fmt:formatDate var="date" value="${point.createdAt}" pattern="yyyy-MM-dd"/>
				<div class="board-table-header-childText1 text-center">${date}</div>
				<c:choose>
					<c:when test="${point.sort == 0}">
						<div class="board-table-header-childText2 text-center">ü�������</div>
					</c:when>
					<c:when test="${point.sort == 1}">
						<div class="board-table-header-childText2 text-center">ü�������</div>
					</c:when>
					<c:when test="${point.sort == 2}">
						<div class="board-table-header-childText2 text-center">�����ϱ�</div>
					</c:when>
					<c:when test="${point.sort == 3}">
						<div class="board-table-header-childText2 text-center">����ϱ�</div>
					</c:when>
					<c:when test="${point.sort == 4}">
						<div class="board-table-header-childText2 text-center">��Ÿ</div>
					</c:when>
					<c:when test="${point.sort == 5}">
						<div class="board-table-header-childText2 text-center">��Ÿ</div>
					</c:when>
				</c:choose>
				<div class="board-table-header-childText3 text-center">
					<fmt:formatNumber value="${point.point}" type="number" />
				</div>
				<c:choose>
					<c:when test="${point.status == 0}">
						<div class="board-table-header-childText4 text-center">���</div>
					</c:when>
					<c:when test="${point.status == 1}">
						<div class="board-table-header-childText4 text-center">����</div>
					</c:when>
					<c:when test="${point.status == 2}">
						<div class="board-table-header-childText4 text-center">���</div>
					</c:when>
				</c:choose>
			</div>
			</c:forEach>
			<!-- ����¡ ��ư TEST -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/point/manage_point_view?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/point/manage_point_view?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/point/manage_point_view?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  ����¡ ��ư TEST �� -->
	</div>	
</div>
