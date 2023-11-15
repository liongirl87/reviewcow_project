<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
  
<!-- list_review_style.css ���̻�� -->
<div id="reviewList"class="d-flex justify-content-center like_product_list">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>����</div>
		<div class="main-table-div-applyProduct">
			<div class="form-inputBox-pm d-flex align-items-center top-header-div">
					<div class="text-margin01-applyList text-center"></div>
					<div class="text-margin02-applyList text-center">����</div>
					<div class="text-margin03-applyList text-center">ü���</div>
					<div class="text-margin04-applyList text-center">����</div>
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
						<div class="text-margin02-circle text-center">�¶��λ�ǰ</div>
					</c:when>
					<c:when test="${likeList.serviceCategory1 == 'offlineStore'}">
						<div class="text-margin02-circle text-center">��������</div>
					</c:when>
					<c:when test="${likeList.serviceCategory1 == 'pressCorps'}">
						<div class="text-margin02-circle text-center">���ڴ�</div>
					</c:when>
				</c:choose>
				<div class="text-margin03-applyList text-center"><a href="/sellpost/product_detail_view?postId=${likeList.id}">${likeList.productName}</a></div>
				<div class="text-margin04-applyList text-center"><a href="#" class="cancelLikeBtn" data-postid="${likeList.id}"><i class="xi-close-circle"></i></a></div>
			</div>
			</c:forEach>
			<!-- ����¡ ��ư -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/like_list_view?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/like_list_view?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/like_list_view?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
			<!--  ����¡ ��ư �� -->
		</div>	
	</div>
</div>
<script>

$(document).ready(function(){
	$('.cancelLikeBtn').on('click', function(e){
		e.preventDefault;
		let delLikeSellPostId = "/like/" + $(this).data("postid");
		let result = confirm("�ش� ��ǰ�� ���Ͽ��� ���� �Ͻðڽ��ϱ�?")
		
		if(result) {
			
		} else {
			return;
		}
		
 		$.ajax({
			url: delLikeSellPostId
			,success:function(data) {
				if(data.code == 1) {
					alert("�����Ͽ����ϴ�.");
					location.reload();
				} else {
					alert("���� ����, �α��� ���ּ���");
				}
			}
			,error:function(request, status, error) {
				alert("������ �����Ͽ����ϴ� �����ڿ��� �������ּ���")
			}
		}); 
	});
	
});

</script>