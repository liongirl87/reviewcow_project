<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="manage-applicants" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>체험단 관리</div>
		<div class="manage-div">
			<div class="manage-div-box1 mt-3">
				<div class="manage-sub-title">내 체험단</div>
				<div class="manage-content-parent d-flex justify-content-between align-items-center">
					<div class="manage-content-div manage-right-line">
						<div>승인대기</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=0">${manageList.waiting}</a></div>
					</div>
					<div class="manage-content-div manage-right-line">
						<div>진행중</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=1">${manageList.onSale}</a></div>
					</div>
					<div class="manage-content-div manage-right-line">
						<div>마감</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=0">${manageList.finish}</a></div>
					</div>
					<div class="manage-content-div manage-right-line f-red">
						<div>반려</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=2">${manageList.reject}</a></div>
					</div>
					<div class="manage-content-div">
						<div>취소</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=3">${manageList.cancelProduct}</a></div>
					</div>
				</div>
			</div>
			<div class="manage-div-box1 mt-3">
				<div class="manage-sub-title">지원자 관리</div>
				<div class="manage-content-parent d-flex justify-content-between align-items-center">
					<div class="manage-content-div manage-right-line">
						<div>신청인원</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=0">${manageList.applicants}</a></div>
					</div>
					<div class="manage-content-div manage-right-line">
						<div>승인인원</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=1">${manageList.approval}</a></div>
					</div>
					<div class="manage-content-div manage-right-line">
						<div>지급완료</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=0">${manageList.paid}</a></div>
					</div>
					<div class="manage-content-div manage-right-line f-red">
						<div>검토요청</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=2">${manageList.complain}</a></div>
					</div>
					<div class="manage-content-div">
						<div>취소</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=3">${manageList.cancelPayment}</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>