<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="mainOfflineProduct" class="mainView-i-style category-top-margin">
	<div class="deadline d-flex justify-content-center">
		<div class="title1 mb-5">
		<span class="title1-text title-bot-line">���ڴ� ����</span>
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div class="dealine-product d-flex justify-content-start">
			<c:forEach items="${pressProductList}" var="card">
			<div class="dealine-product-child">
				<div class="product-img-box">
					<div class="product-img">
						<a href="/sellpost/product_detail_view?postId=${card.sellPost.id}" class="goToSellPostDetail" data-post="${card.sellPost.id}">
							<img src="${card.sellPost.thumbnailImgPath}" alt="��ǰ�̹���" class="product-image">
						</a>
					</div>
					<div class="mt-1 d-flex justify-content-between align-items-end">
						<div class="like-productBtn">
							<a href="#" class="likeBtn" data-like="${card.sellPost.id}">
								<c:if test="${card.checkedLike == true}">
									<i class="xi-heart active"></i>
								</c:if>
								<c:if test="${card.checkedLike == false}">
									<i class="xi-heart-o"></i>
								</c:if>
							</a>
						</div>
						<div class="like-productText">
						${card.likeCount}
						</div>
						<c:choose>
							<c:when test="${card.restOfDay == 0}">
							<div class="remain-period">���ø���</div>
							</c:when>
							<c:otherwise>
							<div class="remain-period ml-3">${card.restOfDay}�� ����</div>
							</c:otherwise>
						</c:choose>
						<div class="numberOf-applicant">��û <span class="numberOf-applicant-now">${card.nowApplicants}</span>/${card.sellPost.numberOfApplicants}</div>
					</div>
				</div>
				<div class="product-info">
					<div class="d-flex prduct-IN align-items-center">
						<div class="product-icon">
							<img src="/static/img/paper_icon2.png" alt="ü���" class="product-icon-img-paper">
						</div>
						<div class="product-name">${card.sellPost.productName}</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="sale-price"><fmt:formatNumber value="${card.sellPost.scriptFees}" type="number" />��</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="d-flex align-items-center acquire-point">
							<div class="coin-box">
							<img src="/static/img/coin.png" class="coin-box-img">
							</div>
							<fmt:formatNumber value="${card.sellPost.scriptFees}" type="number" />p ����
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	 $('.likeBtn').on("click",function(e){
			e.preventDefault();
			let likeSellPostId = "/like/" + $(this).data("like");
		    var category = $(this).data('category');
		    
	 		$.ajax({
				url: likeSellPostId
	 		
				,success:function(data) {
					if(data.code == 1) {
						alert("���ƿ伺��");
						moveCategoryOnline(category);
						/* location.reload();  */
						
					} else {
						alert("���ƿ� ����, �α��� ���ּ���");
					}
				}
				,error:function(request, status, error) {
					alert("���ƿ信 �����Ͽ����ϴ� �����ڿ��� �������ּ���")
				}
			}); 
		});
});
</script>