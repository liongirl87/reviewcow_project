<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="manage-applicants" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>체험단 관리</div>
		<div class="manage-div">
			<div class="manage-div-box1 mt-3">
				<div class="manage-sub-title">내 체험단</div>
				<div class="manage-content-parent d-flex justify-content-between align-items-center">
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=0'">
						<div class="manage-content-top-text">승인대기</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=0">${manageList.waiting}</a></div>
					</div>
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=1'">
						<div class="manage-content-top-text">진행중</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=1">${manageList.onSale}</a></div>
					</div>
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=4'">
						<div class="manage-content-top-text">마감</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=4">${manageList.finish}</a></div>
					</div>
					<div class="manage-content-div manage-right-line f-red" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=2'">
						<div class="manage-content-top-text">반려</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=2">${manageList.reject}</a></div>
					</div>
					<div class="manage-content-div" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=3'">
						<div class="manage-content-top-text">취소</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=3">${manageList.cancelProduct}</a></div>
					</div>
				</div>
			</div>
			<div class="manage-div-box1 mt-3">
				<div class="manage-sub-title">지원자 관리</div>
				<div class="manage-content-parent d-flex justify-content-between align-items-center">
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=0'">
						<div class="manage-content-top-text">신청인원</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=0">${manageList.applicants}</a></div>
					</div>
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=1'">
						<div class="manage-content-top-text">승인인원</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=1">${manageList.approval}</a></div>
					</div>
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=4'">
						<div class="manage-content-top-text">지급완료</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=4">${manageList.paid}</a></div>
					</div>
					<div class="manage-content-div manage-right-line f-red" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=2'">
						<div class="manage-content-top-text">검토요청</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=2">${manageList.complain}</a></div>
					</div>
					<div class="manage-content-div" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=3'">
						<div class="manage-content-top-text">취소</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=3">${manageList.cancelPayment}</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		$('.manage-content-div').mouseover(function(){$(this).children('.manage-content-top-text').addClass('mouse-over-uderline');});
		$('.manage-content-div').mouseleave(function(){$(this).children('.manage-content-top-text').removeClass("mouse-over-uderline");});
		
		
	});

</script>