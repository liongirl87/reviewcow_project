<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="productDetail">
	<div class="d-flex justify-content-center">
		<div class="productDetail-child1">
			<div class="product-top-detail d-flex justify-content-between">
				<div class="leftImgDiv">
					<div class="thumbnailImg">
						<img src="${cardView.sellPost.thumbnailImgPath}" alt="상품이미지"
							class="product-image">
					</div>
					<div class="imgBotLine"></div>
					<div class="thumbnailbanner1">#베너 영역1(400 x 80)</div>
					<div class="thumbnailbanner2">#베너 영역2(400 x 200)</div>
				</div>
				<div class="rightTextDiv">
					<div class="titleText d-flex justify-content-end align-items-start">
						${cardView.sellPost.productName}</div>
					<div
						class="categoryDetail d-flex justify-content-end align-items-start">
						<c:choose>
							<c:when
								test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								온라인
							</c:when>
							<c:when
								test="${cardView.sellPost.serviceCategory1 == 'offlineStore'}">
								오프라인매장
							</c:when>
							<c:when
								test="${cardView.sellPost.serviceCategory1 == 'pressCorps'}">
								기자단
							</c:when>
						</c:choose>
						|
						<c:choose>
							<c:when
								test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								<c:choose>
									<c:when
										test="${cardView.sellPost.serviceCategory2Online == 'smartstore'}">
										스마트스토어
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Online == 'coupang'}">
										쿠팡
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Online == 'gmarket'}">
										G마켓
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Online == 'auction'}">
										옥션
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Online == '11st'}">
										11st
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Online == 'wemakeprice'}">
										위메프
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Online == 'other'}">
										기타
									</c:when>
								</c:choose>
							</c:when>
							<c:when
								test="${cardView.sellPost.serviceCategory1 == 'offlineStore'}">
								<c:choose>
									<c:when
										test="${cardView.sellPost.serviceCategory2Offline == 'cafe'}">
										카페
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Offline == 'foodstore'}">
										맛집
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Offline == 'travel'}">
										여행
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Offline == 'beauty'}">
										뷰티
									</c:when>
									<c:when
										test="${cardView.sellPost.serviceCategory2Offline == 'other'}">
										기타
									</c:when>
								</c:choose>
							</c:when>
							<c:when
								test="${cardView.sellPost.serviceCategory1 == 'pressCorps'}">
								통합
							</c:when>
						</c:choose>

						| 포인트 리워드
					</div>
					<div class="priceDiv d-flex justify-content-end align-items-start">
						<c:choose>
							<c:when
								test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								<div class="saleText">
									<div>
										<fmt:formatNumber value="${cardView.sellPost.discountRate / cardView.sellPost.sellPrice * 100}"	pattern="#" />%
									</div>
								</div>
								<div class="originalPrice">
									<fmt:formatNumber value="${cardView.sellPost.sellPrice}"
										type="number" />
									원
								</div>
								<div class="price">
									<span class="font-weight-bold"><fmt:formatNumber
											value="${cardView.sellPost.sellPrice - cardView.sellPost.discountRate}"
											type="number" /></span>원
								</div>
							</c:when>
							<c:otherwise>
								<div class="price">
									<span class="font-weight-bold"><fmt:formatNumber
											value="${cardView.sellPost.scriptFees}" type="number" /></span>원
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="rightTextDivBotLine"></div>

					<div
						class="rewardPoint d-flex justify-content-end align-items-start">
						<div class="rewardCoinImgDiv">
							<img src="/static/img/coin.png" class="pointIcon"
								alt="Point-icon">
						</div>
						<c:choose>
							<c:when
								test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								<span class="font-weight-bold"><fmt:formatNumber
										value="${cardView.sellPost.discountRate}" type="number" /></span>P 리워드
							</c:when>
							<c:otherwise>
								<span class="font-weight-bold"><fmt:formatNumber
										value="${cardView.sellPost.scriptFees}" type="number" /></span>P 리워드
							</c:otherwise>
						</c:choose>
					</div>
					<div
						class="dateInfo d-flex justify-content-between align-items-center">
						<div class="font-weight-bold ml-3">진행기간</div>
						<fmt:formatDate var="startDate"
							value="${cardView.sellPost.startDate}" pattern="yyyy-MM-dd" />
						<fmt:formatDate var="endDate" value="${cardView.sellPost.endDate}"
							pattern="yyyy-MM-dd" />
						<div class="mr-2">${startDate}~ ${endDate}</div>
					</div>
					<div class="applicantsInfo1">현재신청인원</div>
					<div class="applicantsInfo2 d-flex justify-content-center">
						<div class="d-flex align-items-center">
							<span class="">${cardView.nowApplicants} /
								${cardView.sellPost.numberOfApplicants} </span><span
								class="h2 applicantsSideText"> 명</span>
							<span class="approval-applicants">(승인: ${cardView.approvedApplicants})</span>	
						</div>
					</div>
					<div class="applyBtnDiv">
						<c:choose>
							<c:when test="${cardView.sellPost.numberOfApplicants <= cardView.approvedApplicants}">
								<c:choose>
									<c:when test="${cardView.checkedApply == true}">
										<input type="button" value="취소하기" class="applyBtn"
										data-toggle="modal" data-target="#modal"
										data-postid="${cardView.sellPost.id}">
									</c:when>
									<c:when test="${cardView.checkedApply == false}">
										<input type="button" value="마감" class="closedBtn" >
									</c:when>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${cardView.checkedApply == true}">
										<input type="button" value="취소하기" class="applyBtn"
										data-toggle="modal" data-target="#modal"
										data-postid="${cardView.sellPost.id}">
									</c:when>
									<c:when test="${cardView.checkedApply == false}">
										<input type="button" value="지금신청하기" class="applyBtn"
										data-toggle="modal" data-target="#modal"
										data-postid="${cardView.sellPost.id}">
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="likeAndShareBtnDiv d-flex justify-content-between">
						<!-- <input type="button" value="찜하기" class="checkLikeBtn"> -->
						<button class="checkLikeBtn" data-like="${cardView.sellPost.id}">
							<c:if test="${cardView.checkedLike == true}">
								<i class="xi-heart active i-on"></i>
							</c:if>
							<c:if test="${cardView.checkedLike == false}">
								<i class="xi-heart-o i-off"></i>
							</c:if>
						</button>
						<input type="button" value="공유하기" class="shareBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="productDetail-child-url">
			<div class="product-top-detail-url">
				<div class="d-flex">
					<c:choose>
						<c:when test="${cardView.sellPost.serviceCategory1 == 'offlineStore'}">
							<div class="child2MainText">매장주소</div>
							<span class="ml-3 mt-2">
							(${fn:split(cardView.sellPost.storeAddress,',')[0]})
							${fn:split(cardView.sellPost.storeAddress,',')[1]}
							${fn:split(cardView.sellPost.storeAddress,',')[2]}
							${fn:split(cardView.sellPost.storeAddress,',')[3]}
							</span>
						</c:when>
						<c:when test="${cardView.sellPost.serviceCategory1 == 'pressCorps'}">
							<div class="child2MainText">참고 사이트</div>
							<input type="text" value="${cardView.sellPost.productURL}" class="form-control url-input" readonly />
							<a href="#" id="copyUrlBtn"><i class="xi-documents-o ml-2"></i></a>
						</c:when>
						<c:otherwise>
							<div class="child2MainText">상품 구매URL</div>
							<input type="text" value="${cardView.sellPost.productURL}" class="form-control url-input" readonly />
							<a href="#" id="copyUrlBtn"><i class="xi-documents-o ml-2"></i></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="productDetail-child3">
			<div class="product-top-detail3">
				<div>
					<div class="child2MainText">상품설명</div>
					<div class="requestedTermText">
						${cardView.sellPost.productDescriptions}</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">

				<c:if test="${cardView.checkedApply == false}">
					<h5 class="modal-title" id="exampleModalLabel">신청하기</h5>
				</c:if>

				<c:if test="${cardView.checkedApply == true}">
					<h5 class="modal-title" id="exampleModalLabel">취소하기</h5>
				</c:if>

				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<c:if test="${cardView.checkedApply == false}">
				<div class="modal-body">해당 체험단에 지원하시겠습니까?</div>
			</c:if>
			<c:if test="${cardView.checkedApply == true}">
				<div class="modal-body">해당 체험단 신청을 취소하시겠습니까?</div>
			</c:if>
			<div class="modal-footer">
				<c:if test="${cardView.checkedApply == false}">
					<button type="button" id="modalApplyBtn" class="btn btn-primary">신청하기</button>
					<button type="button" class="modalCancelBtn btn btn-secondary"
						data-dismiss="modal">돌아가기</button>
				</c:if>
				<c:if test="${cardView.checkedApply == true}">
					<button type="button" id="modalApplyBtn" class="btn btn-primary">신청취소</button>
					<button type="button" class="modalCancelBtn btn btn-secondary"
						data-dismiss="modal">돌아가기</button>
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
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				,error:function(request, status, error) {
					alert("좋아요에 실패하였습니다 관리자에게 문의해주세요")
				}
			}); 
		});
	
	$('#copyUrlBtn').on('click',function(e){
		e.preventDefault();
		let copyUrl = $('.url-input').val();
	      window.navigator.clipboard.writeText($('.url-input').val()).then(() => {
	          // 복사가 완료되면 호출된다.
	          alert("주소를 복사하였습니다.");
	       });
	});
	
	$('.shareBtn').on('click', function(){
		let shareUrl = window.location.href;
		window.navigator.clipboard.writeText(window.location.href).then(() => {alert("현재 링크를 복사하였습니다.")});
	});
	
	$('.closedBtn').on("click", function() {
		alert("마감되었습니다.");
	});
	
	$('#modalApplyBtn').on("click",function(){
		let sellPostId = "/application/apply_product/" + $('.applyBtn').data("postid");
		
		var status = null
		if($(this).text() == "신청하기") {
			status = "application"
		} else if ($(this).text() == "신청취소") {
			status = "cancellation"
		}
		
		// 사업자 회원일 경우 신청불가 
		if (${member.memberType == 'businessMember'}) {
			alert("사업자회원은 신청이 불가능합니다.");
			$('.modalCancelBtn').click();
			return;
		}    
		
	 	$.ajax({
			url: sellPostId
	 		, data: {"status" : status}
			,success:function(data) {
				if(data.code == 1) {
					alert(data.result);
					location.reload();
				} else {
					// 비 로그인시 신청 불가
					alert(data.errorMessage);
					$('.modalCancelBtn').click();
				}
			}
			,error:function(request, status, error) {
				alert("신청 실패하였습니다 관리자에게 문의해주세요")
			}
		}); 
	});
});


</script>
