<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>내 체험단</div>
		<div class="mp-header-top-text-line mt-3"></div>
		<div class="mp-menu-div d-flex justify-content-center">
			<div class="mp-menu ${nowapprovalCondition == 0 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=0'">대기</a></div>
			<div class="mp-menu ${nowapprovalCondition == 1 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=1'">진행중</a></div>
			<div class="mp-menu ${nowapprovalCondition == 4 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=4'">마감</a></div>
			<div class="mp-menu ${nowapprovalCondition == 2 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=2'">반려</a></div>
			<div class="mp-menu ${nowapprovalCondition == 3 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=3'">취소</a></div>
		</div>
		<div class="mp-header-text-line"></div>
		<div class="board-table-style">
			<c:choose>
				<c:when test="${nowapprovalCondition == 1}">
					<div class="d-flex board-table-header-div bot-line">
						<div class="statusProduct-header-childText1 text-center">유형</div>
						<div class="statusProduct-header-childText2 text-center">체험단</div>
						<div class="statusProduct-header-childText2 text-center">기간</div>
						<div class="statusProduct-header-childText4 text-center">지원인원</div>
						<div class="statusProduct-header-childText5 text-center">승인인원</div>
						<div class="statusProduct-header-approval-childText1 text-center">더보기</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="d-flex board-table-header-div bot-line">
						<div class="statusProduct-header-childText1 text-center">유형</div>
						<div class="statusProduct-header-childText2 text-center">진행기간</div>
						<div class="statusProduct-header-childText3 text-center">체험단</div>
						<div class="statusProduct-header-childText4 text-center">모집인원</div>
						<div class="statusProduct-header-childText5 text-center">상태</div>
					</div>
				</c:otherwise>
			</c:choose>
			<c:forEach items="${cardViewList}" var="card">
			<!-- 상품승인상태 영역 -->
					<c:choose>
						<c:when test="${nowapprovalCondition == 1}">
						<div class="d-flex board-table-content-div bot-line">
							<c:choose>
								<c:when test="${card.sellPost.serviceCategory1 == 'onlineProduct'}">
									<div class="statusProduct-header-childText1 text-center">
										<span class="statusProduct-category-style">온라인</span>
									</div>
								</c:when>
								<c:when test="${card.sellPost.serviceCategory1 == 'offlineStore'}">
									<div class="statusProduct-header-childText1 text-center">
										<span class="statusProduct-category-style">체험단</span>
									</div>
								</c:when>
								<c:when test="${card.sellPost.serviceCategory1 == 'pressCorps'}">
									<div class="statusProduct-header-childText1 text-center">
										<span class="statusProduct-category-style">기자단</span>
									</div>
								</c:when>
							</c:choose>
							<div class="statusProduct-header-childText2 text-center"><a href="/sellpost/product_detail_view?postId=${card.sellPost.id}">${card.sellPost.productName}</a></div>
							<fmt:formatDate var="endDate" value="${card.sellPost.endDate}" pattern="yyyy-MM-dd"/>
							<div class="statusProduct-header-childText2 text-center small-date-font"><span class="text-danger">${card.restOfDay}일 남음</span>(~${endDate})</div>
							<div class="statusProduct-header-childText4 text-center">${card.nowApplicants}명</div>
							<div class="statusProduct-header-childText4 text-center">${card.approvedApplicants}/${card.sellPost.numberOfApplicants}명</div>
							<div class="statusProduct-header-approval-childText1 text-center show-applicants" data-sellpost-id="${card.sellPost.id}"><a href="#">지원자보기<i class="xi-angle-right-min" data-sellpost-id="${card.sellPost.id}"></i></a></div>
						</div>
							<c:if test="${empty card.application}">
								<div class="board-table-content-div bot-line applicants-list" style="display:none" data-sellpost-id="${card.sellPost.id}">
									<div class="aling-items-center applicants-slide-div text-center">
									아직 지원자가 없습니다
									</div>
								</div>	
							</c:if>
						<c:forEach items="${card.application}" var="applicant" varStatus="number">
							<div class="board-table-content-div bot-line applicants-list" style="display:none" data-sellpost-id="${card.sellPost.id}">
								<div class="d-flex aling-items-center applicants-slide-div">
									<c:if test="${empty card.application}">
									아직 지원자가 없습니다
									</c:if>
									<fmt:formatDate var="applyDate" value="${applicant.createdAt}" pattern="yyyy-MM-dd"/>
									<div class="applicants-slide-div-childText0 text-center">${number.count}</div>
									<div class="applicants-slide-div-childText1">신청일:${applyDate}</div>
									<div class="applicants-slide-div-childText2">${applicant.memberLoginId}(${applicant.memberName})</div>
									<div class="applicants-slide-div-childText3 text-center">
										<c:choose>
											<c:when test="${applicant.status == 0}">
												<input type="button" class="applicant-approval-refusal-btn statusApplicants-btn-style-notsize" value="승인" data-applicant-id="${applicant.memberId}" data-sellpost-id="${card.sellPost.id}" data-approval-applicants="${card.approvedApplicants}" data-number-applicants="${card.sellPost.numberOfApplicants}">
												<input type="button" class="applicant-approval-refusal-btn statusApplicants-btn-style-notsize" value="거절" data-applicant-id="${applicant.memberId}" data-sellpost-id="${card.sellPost.id}">
											</c:when>
											<c:when test="${applicant.status == 1}">
												<span class="text-primary">승인완료</span>
											</c:when>
											<c:when test="${applicant.status == 2}">
												<span>검토요청</span>
											</c:when>
											<c:when test="${applicant.status == 3}">
												<span class="text-danger">취소</span>
											</c:when>
											<c:when test="${applicant.status == 4}">
												<span class="font-weight-bold text-primary">지급완료</span>
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
											<span class="statusProduct-category-style">온라인</span>
										</div>
									</c:when>
									<c:when test="${card.sellPost.serviceCategory1 == 'offlineStore'}">
										<div class="statusProduct-header-childText1 text-center">
											<span class="statusProduct-category-style">체험단</span>
										</div>
									</c:when>
									<c:when test="${card.sellPost.serviceCategory1 == 'pressCorps'}">
										<div class="statusProduct-header-childText1 text-center">
											<span class="statusProduct-category-style">기자단</span>
										</div>
									</c:when>
								</c:choose>
								<fmt:formatDate var="startDate" value="${card.sellPost.startDate}" pattern="yyyy-MM-dd"/>
								<fmt:formatDate var="endDate" value="${card.sellPost.endDate}" pattern="yyyy-MM-dd"/>
								<div class="statusProduct-header-childText2 text-center small-date-font">${startDate} ~ ${endDate}</div>
								<div class="statusProduct-header-childText3 text-center"><a href="/sellpost/product_detail_view?postId=${card.sellPost.id}">${card.sellPost.productName}</a></div>
								<div class="statusProduct-header-childText4 text-center">${card.nowApplicants}/${card.sellPost.numberOfApplicants}</div>
								<div class="statusProduct-header-childText5 text-center">마감</div>
							</div>
						</c:when>
						
						<c:otherwise>
							<div class="d-flex board-table-content-div bot-line">
							<c:choose>
								<c:when test="${card.sellPost.serviceCategory1 == 'onlineProduct'}">
									<div class="statusProduct-header-childText1 text-center">
										<span class="statusProduct-category-style">온라인</span>
									</div>
								</c:when>
								<c:when test="${card.sellPost.serviceCategory1 == 'offlineStore'}">
									<div class="statusProduct-header-childText1 text-center">
										<span class="statusProduct-category-style">체험단</span>
									</div>
								</c:when>
								<c:when test="${card.sellPost.serviceCategory1 == 'pressCorps'}">
									<div class="statusProduct-header-childText1 text-center">
										<span class="statusProduct-category-style">기자단</span>
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
									<div class="statusProduct-header-childText5 text-center">대기</div>
								</c:when>
								<c:when test="${card.sellPost.approvalCondition == 1}">
									<div class="statusProduct-header-childText5 text-center">승인</div>
								</c:when>
								<c:when test="${card.sellPost.approvalCondition == 2}">
									<div class="statusProduct-header-childText5 text-center">반려</div>
								</c:when>
								<c:when test="${card.sellPost.approvalCondition == 3}">
									<div class="statusProduct-header-childText5 text-center">취소</div>
								</c:when>
							</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
			</c:forEach>
			
			<!-- 페이징 버튼 -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/application/manage_applicants_view/status_product_view?approvalCondition=${nowapprovalCondition}&postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/application/manage_applicants_view/status_product_view?approvalCondition=${nowapprovalCondition}&postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/application/manage_applicants_view/status_product_view?approvalCondition=${nowapprovalCondition}&postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  페이징 버튼 끝 -->
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
			
			if ($(this).val() == '승인') {
				let approvedApplicants = $(this).data("approval-applicants");
				let numberOfApplicants = $(this).data("number-applicants");
				if (approvedApplicants >= numberOfApplicants) {
					alert("승인가능한 인원을 초과하였습니다.");
					return;
				}
				var status = 1;
			} else if ($(this).val() == '거절') {
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
						alert("승인에 실패하였습니다.");
					}
				}
				, error:function(request,status,error){
					alert("승인에 실패하였습니다, 관리자에게 문의해주세요.")
				}
			});
		});
	});

</script>