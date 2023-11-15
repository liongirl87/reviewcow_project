<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
  
<!-- list_review_style.css ���̻�� -->
<div id="reviewList"class="d-flex justify-content-center apply_product_list">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>��û�� ü���</div>
		<div class="main-table-div-applyProduct">
			<div class="form-inputBox-pm d-flex align-items-center top-header-div">
					<div class="text-margin01-applyList text-center">��û��</div>
					<div class="text-margin02-applyList text-center">����</div>
					<div class="text-margin03-applyList text-center">ü���</div>
					<div class="text-margin04-applyList text-center">����</div>
					<div class="text-margin05-applyList text-center"></div>
			</div>
			<c:forEach items="${sellPostList}" var="applyList">
			<div class="d-flex align-items-center reveiwList-content-div">
				<fmt:formatDate var="dateOfApplication" value="${applyList.applicationCreatedAt}" pattern="yyyy-MM-dd"/>
				<div class="text-margin01-applyList text-center">${dateOfApplication}</div>
				<c:choose>
					<c:when test="${applyList.serviceCategory1 == 'onlineProduct'}">
						<div class="text-margin02-circle text-center">�¶��λ�ǰ</div>
					</c:when>
					<c:when test="${applyList.serviceCategory1 == 'offlineStore'}">
						<div class="text-margin02-circle text-center">��������</div>
					</c:when>
					<c:when test="${applyList.serviceCategory1 == 'pressCorps'}">
						<div class="text-margin02-circle text-center">���ڴ�</div>
					</c:when>
				</c:choose>
				
				<div class="text-margin03-applyList text-center "><a href="/sellpost/product_detail_view?postId=${applyList.id}"><span class="product-list-postname">${applyList.productName}</span></a></div>
				<c:choose>
					<c:when test="${applyList.status == 0}">
						<div class="text-margin04-applyList text-center font-weight-bold">�����</div>
					</c:when>
					<c:when test="${applyList.status == 1}">
						<div class="text-margin04-applyList approval text-center font-weight-bold">���οϷ�</div>
					</c:when>
					<c:when test="${applyList.status == 2}">
						<div class="text-margin04-applyList refuse text-center  font-weight-bold">���ΰ���</div>
					</c:when>
					<c:when test="${applyList.status == 3}">
						<div class="text-margin04-applyList refuse text-center  font-weight-bold">���</div>
					</c:when>
					<c:when test="${applyList.status == 4}">
						<div class="text-margin04-applyList approval text-center  font-weight-bold">���޿Ϸ�</div>
					</c:when>
				</c:choose>
				<div class="text-margin05-applyList text-center"><a href="#" class="cancelBtn" data-postid="${applyList.id}" data-toggle="modal" data-target="#modal"><i class="xi-close-circle"></i></a></div>
			</div>
			</c:forEach>
			<!-- ����¡ ��ư -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/application/apply_product_list_view?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/application/apply_product_list_view?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/application/apply_product_list_view?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
			<!--  ����¡ ��ư �� -->
		</div>	
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">����ϱ�</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <div class="modal-body">
	        �ش� ü��� ��û�� ����Ͻðڽ��ϱ�?
	  </div>
      <div class="modal-footer">
        <button type="button" id="modalApplyBtn" class="btn btn-primary">��û���</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">���ư���</button>
      </div>
    </div>
  </div>
</div>
<script>

$(document).ready(function(){
	$('.cancelBtn').on('click', function(e){
		e.preventDefault;
		let postId = $(this).data('postid');
		
		// ��� �±׿� postid ������ �ɱ�
		$('#modal').data('postid', postId);
	});
	
	
	$('#modal #modalApplyBtn').on('click', function(){
		let sellPostId = $('#modal').data('postid');
		
		let sellPostUrl = "/application/apply_product/" + sellPostId;
	    
	 	$.ajax({
			url: sellPostUrl
	 		
			,success:function(data) {
				if(data.code == 1) {
					alert("ü��� ��Ҹ� �Ϸ��Ͽ����ϴ�.");
					location.reload();
				} else {
					alert("��û ����, �α��� ���ּ���");
				}
			}
			,error:function(request, status, error) {
				alert("��û �����Ͽ����ϴ� �����ڿ��� �������ּ���")
			}
		}); 
	});
	
	
});

</script>