<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center" id="side-menu-top-div">
	<!-- side-menu 배치를 위해 position: relative 가운데 정렬 부모 div -->
	<div id="side-menu-div">	
		<div class="side-menu">
			<div class="side-menu-location">
				<div class="mt-3">	
					<c:choose>
						<c:when test="${member.memberType eq 'businessMember'}">
							<a href="/sellpost/upload_product_view"><button type="button" class="side-button button-color1 button-margin">체험단 모집</button></a>
							<a href="/application/manage_applicants_view"><button type="button" class="side-button button-color2 button-margin border-bot">체험단 관리</button></a>
						</c:when>
						<c:otherwise>
							<a href="/application/apply_product_list_view"><button type="button" class="side-button button-color1 button-margin">신청한 체험단</button></a>
							<a href="/review/myreview_list_view#"><button type="button" class="side-button button-color2 button-margin border-bot">리뷰관리</button></a>
						</c:otherwise>
					</c:choose>
					<div class="border-div border-bot"></div>
				</div>
				<ul>
					<c:choose>
						<c:when test="${member.memberType eq 'businessMember'}">
							<li class="mt-3"><a href="/member/modify_myinfo_view" class="text-color-important">회원정보 수정</a></li>
							<li class="text-margin"><a href="/point/manage_point_view">포인트관리</a></li>
							<li><a href="/board/helpdesk_view">문의하기</a></li>
							<li class="text-margin"><a href="#">공지사항</a></li>
							<li class="text-margin"><a href="#">알림</a></li>
							<li><a href="#">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li class="mt-3"><a href="/member/modify_myinfo_view" class="text-color-important">회원정보 수정</a></li>
							<li class="text-margin"><a href="/point/manage_point_view">포인트관리</a></li>
							<li><a href="/board/helpdesk_view">문의하기</a></li>
							<li class="text-margin"><a href="#">공지사항</a></li>
							<li><a href="#">알림</a></li>
							<li class="text-margin"><a href="/like_list_view">찜목록</a></li>
							<li><a href="#">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>