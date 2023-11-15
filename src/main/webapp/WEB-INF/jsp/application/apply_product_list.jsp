<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
  
<!-- list_review_style.css 같이사용 -->
<div id="reviewList"class="d-flex justify-content-center apply_product_list">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>신청한 체험단</div>
		<div class="main-table-div-applyProduct">
			<div class="form-inputBox-pm d-flex align-items-center top-header-div">
					<div class="text-margin01-applyList text-center">신청일</div>
					<div class="text-margin02-applyList text-center">유형</div>
					<div class="text-margin03-applyList text-center">체험단</div>
					<div class="text-margin04-applyList text-center">상태</div>
					<div class="text-margin05-applyList text-center"></div>
			</div>
			<c:forEach items="${sellPostList}" var="applyList">
			<div class="d-flex align-items-center reveiwList-content-div">
				<fmt:formatDate var="dateOfApplication" value="${applyList.applicationCreatedAt}" pattern="yyyy-MM-dd"/>
				<div class="text-margin01-applyList text-center">${dateOfApplication}</div>
				<c:choose>
					<c:when test="${applyList.serviceCategory1 == 'onlineProduct'}">
						<div class="text-margin02-circle text-center">온라인상품</div>
					</c:when>
					<c:when test="${applyList.serviceCategory1 == 'offlineStore'}">
						<div class="text-margin02-circle text-center">오프라인</div>
					</c:when>
					<c:when test="${applyList.serviceCategory1 == 'pressCorps'}">
						<div class="text-margin02-circle text-center">기자단</div>
					</c:when>
				</c:choose>
				
				<div class="text-margin03-applyList text-center "><a href="/sellpost/product_detail_view?postId=${applyList.id}"><span class="product-list-postname">${applyList.productName}</span></a></div>
				<c:choose>
					<c:when test="${applyList.status == 0}">
						<div class="text-margin04-applyList text-center font-weight-bold">대기중</div>
					</c:when>
					<c:when test="${applyList.status == 1}">
						<div class="text-margin04-applyList approval text-center font-weight-bold">승인완료</div>
					</c:when>
					<c:when test="${applyList.status == 2}">
						<div class="text-margin04-applyList refuse text-center  font-weight-bold">승인거절</div>
					</c:when>
					<c:when test="${applyList.status == 3}">
						<div class="text-margin04-applyList refuse text-center  font-weight-bold">취소</div>
					</c:when>
					<c:when test="${applyList.status == 4}">
						<div class="text-margin04-applyList approval text-center  font-weight-bold">지급완료</div>
					</c:when>
				</c:choose>
				<div class="text-margin05-applyList text-center"><a href="#" class="cancelBtn" data-postid="${applyList.id}" data-toggle="modal" data-target="#modal"><i class="xi-close-circle"></i></a></div>
			</div>
			</c:forEach>
			<!-- 페이징 버튼 -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/application/apply_product_list_view?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/application/apply_product_list_view?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/application/apply_product_list_view?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
			<!--  페이징 버튼 끝 -->
		</div>	
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">취소하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <div class="modal-body">
	        해당 체험단 신청을 취소하시겠습니까?
	  </div>
      <div class="modal-footer">
        <button type="button" id="modalApplyBtn" class="btn btn-primary">신청취소</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">돌아가기</button>
      </div>
    </div>
  </div>
</div>
<script>

$(document).ready(function(){
	$('.cancelBtn').on('click', function(e){
		e.preventDefault;
		let postId = $(this).data('postid');
		
		// 모달 태그에 postid 데이터 심기
		$('#modal').data('postid', postId);
	});
	
	
	$('#modal #modalApplyBtn').on('click', function(){
		let sellPostId = $('#modal').data('postid');
		
		let sellPostUrl = "/application/apply_product/" + sellPostId;
	    
	 	$.ajax({
			url: sellPostUrl
	 		
			,success:function(data) {
				if(data.code == 1) {
					alert("체험단 취소를 완료하였습니다.");
					location.reload();
				} else {
					alert("신청 실패, 로그인 해주세요");
				}
			}
			,error:function(request, status, error) {
				alert("신청 실패하였습니다 관리자에게 문의해주세요")
			}
		}); 
	});
	
	
});

</script>