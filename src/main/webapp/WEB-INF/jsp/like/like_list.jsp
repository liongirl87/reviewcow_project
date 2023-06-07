<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
  
<!-- list_review_style.css 같이사용 -->
<div id="reviewList"class="d-flex justify-content-center like_product_list">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>찜목록</div>
		<div class="main-table-div-applyProduct">
			<div class="form-inputBox-pm d-flex align-items-center top-header-div">
					<div class="text-margin01-applyList text-center"></div>
					<div class="text-margin02-applyList text-center">유형</div>
					<div class="text-margin03-applyList text-center">체험단</div>
					<div class="text-margin04-applyList text-center">상태</div>
					<div class="text-margin05-applyList text-center"></div>
			</div>
			<c:forEach items="${likeSellPostList}" var="likeList">
			<div class="d-flex align-items-center reveiwList-content-div">
				<div class="text-margin01-applyList text-center d-flex justify-content-center">
					<div class="like-thumnailImg">
						<img src="${likeList.thumbnailImgPath}" class="thumnail-100s">
					</div>
				</div>
				<c:choose>
					<c:when test="${likeList.serviceCategory1 == 'onlineProduct'}">
						<div class="text-margin02-circle text-center">온라인상품</div>
					</c:when>
					<c:when test="${likeList.serviceCategory1 == 'offlineStore'}">
						<div class="text-margin02-circle text-center">오프라인</div>
					</c:when>
					<c:when test="${likeList.serviceCategory1 == 'pressCorps'}">
						<div class="text-margin02-circle text-center">기자단</div>
					</c:when>
				</c:choose>
				<div class="text-margin03-applyList text-center"><a href="#">${likeList.productName}</a></div>
						<div class="text-margin04-applyList text-center font-weight-bold">진행중</div>
				<div class="text-margin05-applyList text-center"><a href="#" class="cancelLikeBtn" data-postid="${likeList.id}"><i class="xi-close-circle"></i></a></div>
			</div>
			</c:forEach>
		</div>	
	</div>
</div>
<script>

$(document).ready(function(){
	$('.cancelLikeBtn').on('click', function(e){
		e.preventDefault;
		
		let likeSellPostId = "/like/" + $(this).data("postid");
	    
 		$.ajax({
			url: likeSellPostId
 		
			,success:function(data) {
				if(data.code == 1) {
					alert("좋아요성공");
					location.reload();
				} else {
					alert("좋아요 실패, 로그인 해주세요");
				}
			}
			,error:function(request, status, error) {
				alert("좋아요에 실패하였습니다 관리자에게 문의해주세요")
			}
		}); 
	});
	
});

</script>