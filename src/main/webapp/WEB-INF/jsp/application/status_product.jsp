<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>�� ü���</div>
		<div class="mp-header-top-text-line mt-3"></div>
		<div class="mp-menu-div d-flex justify-content-center">
			<div class="mp-menu ${nowapprovalCondition == 0 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=0'">���</a></div>
			<div class="mp-menu ${nowapprovalCondition == 1 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=1'">������</a></div>
			<div class="mp-menu ${nowapprovalCondition == 4 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=4'">����</a></div>
			<div class="mp-menu ${nowapprovalCondition == 2 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=2'">�ݷ�</a></div>
			<div class="mp-menu ${nowapprovalCondition == 3 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=3'">���</a></div>
		</div>
		<div class="mp-header-text-line"></div>
		<div class="board-table-style">
			<c:choose>
				<c:when test="${nowapprovalCondition == 1}">
					<div class="d-flex board-table-header-div bot-line">
						<div class="statusProduct-header-childText1 text-center">����</div>
						<div class="statusProduct-header-childText2 text-center">ü���</div>
						<div class="statusProduct-header-childText2 text-center">�Ⱓ</div>
						<div class="statusProduct-header-childText4 text-center">�����ο�</div>
						<div class="statusProduct-header-childText5 text-center">�����ο�</div>
						<div class="statusProduct-header-approval-childText1 text-center">������</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="d-flex board-table-header-div bot-line">
						<div class="statusProduct-header-childText1 text-center">����</div>
						<div class="statusProduct-header-childText2 text-center">����Ⱓ</div>
						<div class="statusProduct-header-childText3 text-center">ü���</div>
						<div class="statusProduct-header-childText4 text-center">�����ο�</div>
						<div class="statusProduct-header-childText5 text-center">����</div>
					</div>
				</c:otherwise>
			</c:choose>
			<c:forEach items="${cardViewList}" var="card">
			<!-- ��ǰ���λ��� ���� -->
					<c:choose>
						<c:when test="${nowapprovalCondition == 1}">
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
							<div class="statusProduct-header-childText2 text-center"><a href="/sellpost/product_detail_view?postId=${card.sellPost.id}">${card.sellPost.productName}</a></div>
							<fmt:formatDate var="endDate" value="${card.sellPost.endDate}" pattern="yyyy-MM-dd"/>
							<div class="statusProduct-header-childText2 text-center small-date-font"><span class="text-danger">${card.restOfDay}�� ����</span>(~${endDate})</div>
							<div class="statusProduct-header-childText4 text-center">${card.nowApplicants}��</div>
							<div class="statusProduct-header-childText4 text-center">${card.approvedApplicants}/${card.sellPost.numberOfApplicants}��</div>
							<div class="statusProduct-header-approval-childText1 text-center show-applicants" data-sellpost-id="${card.sellPost.id}"><a href="#">�����ں���<i class="xi-angle-right-min" data-sellpost-id="${card.sellPost.id}"></i></a></div>
						</div>
							<c:if test="${empty card.application}">
								<div class="board-table-content-div bot-line applicants-list" style="display:none" data-sellpost-id="${card.sellPost.id}">
									<div class="aling-items-center applicants-slide-div text-center">
									���� �����ڰ� �����ϴ�
									</div>
								</div>	
							</c:if>
						<c:forEach items="${card.application}" var="applicant" varStatus="number">
							<div class="board-table-content-div bot-line applicants-list" style="display:none" data-sellpost-id="${card.sellPost.id}">
								<div class="d-flex aling-items-center applicants-slide-div">
									<c:if test="${empty card.application}">
									���� �����ڰ� �����ϴ�
									</c:if>
									<fmt:formatDate var="applyDate" value="${applicant.createdAt}" pattern="yyyy-MM-dd"/>
									<div class="applicants-slide-div-childText0 text-center">${number.count}</div>
									<div class="applicants-slide-div-childText1">��û��:${applyDate}</div>
									<div class="applicants-slide-div-childText2">${applicant.memberLoginId}(${applicant.memberName})</div>
									<div class="applicants-slide-div-childText3 text-center">
										<c:choose>
											<c:when test="${applicant.status == 0}">
												<input type="button" class="applicant-approval-refusal-btn statusApplicants-btn-style-notsize" value="����" data-applicant-id="${applicant.memberId}" data-sellpost-id="${card.sellPost.id}" data-approval-applicants="${card.approvedApplicants}" data-number-applicants="${card.sellPost.numberOfApplicants}">
												<input type="button" class="applicant-approval-refusal-btn statusApplicants-btn-style-notsize" value="����" data-applicant-id="${applicant.memberId}" data-sellpost-id="${card.sellPost.id}">
											</c:when>
											<c:when test="${applicant.status == 1}">
												<span class="text-primary">���οϷ�</span>
											</c:when>
											<c:when test="${applicant.status == 2}">
												<span>�����û</span>
											</c:when>
											<c:when test="${applicant.status == 3}">
												<span class="text-danger">���</span>
											</c:when>
											<c:when test="${applicant.status == 4}">
												<span class="font-weight-bold text-primary">���޿Ϸ�</span>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
						</c:when>
						
						<c:when test="${nowapprovalCondition == 4}">
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
								<div class="statusProduct-header-childText5 text-center">����</div>
							</div>
						</c:when>
						
						<c:otherwise>
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
								<c:when test="${card.sellPost.approvalCondition == 0}">
									<div class="statusProduct-header-childText5 text-center">���</div>
								</c:when>
								<c:when test="${card.sellPost.approvalCondition == 1}">
									<div class="statusProduct-header-childText5 text-center">����</div>
								</c:when>
								<c:when test="${card.sellPost.approvalCondition == 2}">
									<div class="statusProduct-header-childText5 text-center">�ݷ�</div>
								</c:when>
								<c:when test="${card.sellPost.approvalCondition == 3}">
									<div class="statusProduct-header-childText5 text-center">���</div>
								</c:when>
							</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
			</c:forEach>
			
			<!-- ����¡ ��ư -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/application/manage_applicants_view/status_product_view?approvalCondition=${nowapprovalCondition}&postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/application/manage_applicants_view/status_product_view?approvalCondition=${nowapprovalCondition}&postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/application/manage_applicants_view/status_product_view?approvalCondition=${nowapprovalCondition}&postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  ����¡ ��ư �� -->
	</div>	
</div>

<script>
	$(document).ready(function(){
		
		$('.show-applicants').on('click', function(e){
			e.preventDefault();
			/* alert("dddd"); */
			var postid = $(this).data("sellpost-id");
			
			if($('.xi-angle-right-min[data-sellpost-id='+postid+']').hasClass('rotation')){
				$('.xi-angle-right-min[data-sellpost-id='+postid+']').removeClass('rotation');
				} else {
				$('.xi-angle-right-min[data-sellpost-id='+postid+']').addClass('rotation');
				}
			
			if($('.applicants-list[data-sellpost-id=' + postid  + ']').is(":visible")) {
				$('.applicants-list[data-sellpost-id=' + postid  + ']').slideUp();
			} else {
				$('.applicants-list[data-sellpost-id=' + postid  + ']').slideDown();
			}
			
		});
		
		$('.applicant-approval-refusal-btn').on('click',function(){
			let memberId = $(this).data("applicant-id");
			let sellPostId = $(this).data("sellpost-id");
			
			if ($(this).val() == '����') {
				let approvedApplicants = $(this).data("approval-applicants");
				let numberOfApplicants = $(this).data("number-applicants");
				if (approvedApplicants >= numberOfApplicants) {
					alert("���ΰ����� �ο��� �ʰ��Ͽ����ϴ�.");
					return;
				}
				var status = 1;
			} else if ($(this).val() == '����') {
				var status = 3;
			} 
			
			$.ajax({
				type: "PUT"
				, url: "/application/approval_applicant"
				, data: {"memberId" : memberId, "sellPostId": sellPostId, "status" : status}
				, success:function(data) {
					if(data.code >= 200 && data.code < 400) {
						alert(data.resultMessage);
						location.reload();
					} else if (data.code >= 400) {
						alert(data.resultMessage);
						location.reload();
					} 
					else {
						alert("���ο� �����Ͽ����ϴ�.");
					}
				}
				, error:function(request,status,error){
					alert("���ο� �����Ͽ����ϴ�, �����ڿ��� �������ּ���.")
				}
			});
		});
	});

</script>