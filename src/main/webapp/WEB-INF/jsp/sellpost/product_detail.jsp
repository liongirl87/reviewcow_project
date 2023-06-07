<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="productDetail">
	<div class="d-flex justify-content-center">
		<div class="productDetail-child1">
			<div class="product-top-detail d-flex justify-content-between">
				<div class="leftImgDiv">
					<div class="thumbnailImg">
						<img src="${cardView.sellPost.thumbnailImgPath}" alt="��ǰ�̹���" class="product-image">
					</div>
					<div class="imgBotLine">
					</div>
					<div class="thumbnailbanner1">
						#���� ����1(400 x 80)
					</div>
					<div class="thumbnailbanner2">
						#���� ����2(400 x 200)
					</div>
				</div>
				<div class="rightTextDiv">
					<div class="titleText d-flex justify-content-end align-items-start">
						${cardView.sellPost.productName}
					</div>			
					<div class="categoryDetail d-flex justify-content-end align-items-start">
						<c:choose>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								�¶���
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'offlineStore'}">
								�������θ���
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'pressCorps'}">
								���ڴ�
							</c:when>
						</c:choose> | 
						<c:choose>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								<c:choose>
									<c:when test="${cardView.sellPost.serviceCategory2Online == 'smartstore'}" >
										����Ʈ�����
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Online == 'coupang'}" >
										����
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Online == 'gmarket'}" >
										G����
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Online == 'auction'}" >
										����
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Online == '11st'}" >
										11st
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Online == 'wemakeprice'}" >
										������
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Online == 'other'}" >
										��Ÿ
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'offlineStore'}">
								<c:choose>
									<c:when test="${cardView.sellPost.serviceCategory2Offline == 'cafe'}" >
										ī��
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Offline == 'foodstore'}" >
										����
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Offline == 'travel'}" >
										����
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Offline == 'beauty'}" >
										��Ƽ
									</c:when>
									<c:when test="${cardView.sellPost.serviceCategory2Offline == 'other'}" >
										��Ÿ
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'pressCorps'}">
								����
							</c:when>
						</c:choose>
						
						 | ����Ʈ ������
					</div>			
					<div class="priceDiv d-flex justify-content-end align-items-start">
						<c:choose>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								<div class="saleText"><fmt:formatNumber value="${cardView.sellPost.discountRate / cardView.price * 100}" pattern="#" />%</div>
								<div class="originalPrice"><fmt:formatNumber value="${cardView.sellPost.sellPrice}" type="number" />��</div>
								<div class="price"><span class="font-weight-bold"><fmt:formatNumber value="${cardView.sellPost.sellPrice - cardView.sellPost.discountRate}" type="number" /></span>��</div>
							</c:when>
							<c:otherwise>
								<div class="price"><span class="font-weight-bold"><fmt:formatNumber value="${cardView.sellPost.scriptFees}" type="number" /></span>��</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="rightTextDivBotLine">
					</div>
								
					<div class="rewardPoint d-flex justify-content-end align-items-start">
						<div class="rewardCoinImgDiv">
							<img src="/static/img/coin.png" class="pointIcon" alt="Point-icon">
						</div>
						<c:choose>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								<span class="font-weight-bold"><fmt:formatNumber value="${cardView.sellPost.discountRate}" type="number" /></span>P ������
							</c:when>
							<c:otherwise>
								<span class="font-weight-bold"><fmt:formatNumber value="${cardView.sellPost.scriptFees}" type="number" /></span>P ������
							</c:otherwise>
						</c:choose>
					</div>
					<div class="dateInfo d-flex justify-content-between align-items-center">
						<div class="font-weight-bold ml-3">����Ⱓ</div>
						<fmt:formatDate var="startDate" value="${cardView.sellPost.startDate}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="endDate" value="${cardView.sellPost.endDate}" pattern="yyyy-MM-dd"/>
						<div class="mr-2">${startDate} ~ ${endDate}</div>
					</div>
					<div class="applicantsInfo1">
					�����û�ο�
					</div>
					<div class="applicantsInfo2 d-flex justify-content-center">
						<div class="d-flex align-items-center">
						<span class="">${cardView.nowApplicants} / ${cardView.sellPost.numberOfApplicants} </span><span class="h2 applicantsSideText"> ��</span>
						</div>
					</div>
					<div class="applyBtnDiv">
					<c:choose>
						<c:when test="${cardView.checkedApply == true}">
						<input type="button" value="����ϱ�" class="applyBtn" data-toggle="modal" data-target="#modal" data-postid="${cardView.sellPost.id}">
						</c:when>
						<c:when test="${cardView.checkedApply == false}">
						<input type="button" value="���ݽ�û�ϱ�" class="applyBtn" data-toggle="modal" data-target="#modal" data-postid="${cardView.sellPost.id}">
						</c:when>
					</c:choose>
					</div>
					<div class="likeAndShareBtnDiv d-flex justify-content-between">
						<!-- <input type="button" value="���ϱ�" class="checkLikeBtn"> -->
						<button class="checkLikeBtn" data-like="${cardView.sellPost.id}">
							<c:if test="${cardView.checkedLike == true}">
								<i class="xi-heart active i-on"></i>
							</c:if>
							<c:if test="${cardView.checkedLike == false}">
								<i class="xi-heart-o i-off"></i>
							</c:if>
						</button>
						<input type="button" value="�����ϱ�" class="shareBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="productDetail-child-url">
			<div class="product-top-detail-url">
				<div class="d-flex">
					<div class="child2MainText">
					��ǰ ����URL	
					</div>
					<input type="text"  value="${cardView.sellPost.productURL}" class="form-control url-input" >
					<a href="#" id="copyUrlBtn"><i class="xi-documents-o ml-2"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="productDetail-child2">
			<div class="product-top-detail2">
				<div>
					<div class="child2MainText">
					���� ���� / ��ǰ
					</div>
					<div class="offeringServiceText">
						�����Ǵ� ���� ����!!!
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="productDetail-child3">
			<div class="product-top-detail3">
				<div>
					<div class="child2MainText">
					�Ǹ��� ��û����
					</div>
					<div class="requestedTermText">
						${cardView.sellPost.productDescriptions}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <c:if test="${cardView.checkedApply == false}">
        <h5 class="modal-title" id="exampleModalLabel">��û�ϱ�</h5>
      </c:if>
      <c:if test="${cardView.checkedApply == true}">
        <h5 class="modal-title" id="exampleModalLabel">����ϱ�</h5>
      </c:if>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <c:if test="${cardView.checkedApply == false}">
	    <div class="modal-body">
	        	�ش� ü��ܿ� �����Ͻðڽ��ϱ�?
	    </div>
	  </c:if>
	  <c:if test="${cardView.checkedApply == true}">
	    <div class="modal-body">
	        	�ش� ü��� ��û�� ����Ͻðڽ��ϱ�?
	    </div>
	  </c:if>
      <div class="modal-footer">
      	<c:if test="${cardView.checkedApply == false}">
        	<button type="button" id="modalApplyBtn" class="btn btn-primary">��û�ϱ�</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">����ϱ�</button>
        </c:if> 
      	<c:if test="${cardView.checkedApply == true}">
        	<button type="button" id="modalApplyBtn" class="btn btn-primary">��û���</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">���ư���</button>
        </c:if> 
      </div>
    </div>
  </div>
</div>


<script>
$(document).ready(function(){
	 $('.checkLikeBtn').on("click",function(){
			let likeSellPostId = "/like/" + $(this).data("like");
		    
	 		$.ajax({
				url: likeSellPostId
	 		
				,success:function(data) {
					if(data.code == 1) {
						alert("���ƿ伺��");
						location.reload();
					} else {
						alert("���ƿ� ����, �α��� ���ּ���");
					}
				}
				,error:function(request, status, error) {
					alert("���ƿ信 �����Ͽ����ϴ� �����ڿ��� �������ּ���")
				}
			}); 
		});
	
	$('#copyUrlBtn').on('click',function(e){
		e.preventDefault();
		let copyUrl = $('.url-input').val();
	      window.navigator.clipboard.writeText($('.url-input').val()).then(() => {
	          // ���簡 �Ϸ�Ǹ� ȣ��ȴ�.
	          alert("�ּҸ� �����Ͽ����ϴ�.");
	       });
	});
	
	
	$('#modalApplyBtn').on("click",function(){
		alert("ttt");
		let sellPostId = "/application/apply_product/" + $('.applyBtn').data("postid");
		    
	 	$.ajax({
			url: sellPostId
	 		
			,success:function(data) {
				if(data.code == 1) {
					alert("��û����");
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
