<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="manage-applicants" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>ü��� ����</div>
		<div class="manage-div">
			<div class="manage-div-box1 mt-3">
				<div class="manage-sub-title">�� ü���</div>
				<div class="manage-content-parent d-flex justify-content-between align-items-center">
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=0'">
						<div class="manage-content-top-text">���δ��</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=0">${manageList.waiting}</a></div>
					</div>
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=1'">
						<div class="manage-content-top-text">������</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=1">${manageList.onSale}</a></div>
					</div>
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=4'">
						<div class="manage-content-top-text">����</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=4">${manageList.finish}</a></div>
					</div>
					<div class="manage-content-div manage-right-line f-red" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=2'">
						<div class="manage-content-top-text">�ݷ�</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=2">${manageList.reject}</a></div>
					</div>
					<div class="manage-content-div" onClick="location.href='/application/manage_applicants_view/status_product_view?approvalCondition=3'">
						<div class="manage-content-top-text">���</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?approvalCondition=3">${manageList.cancelProduct}</a></div>
					</div>
				</div>
			</div>
			<div class="manage-div-box1 mt-3">
				<div class="manage-sub-title">������ ����</div>
				<div class="manage-content-parent d-flex justify-content-between align-items-center">
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=0'">
						<div class="manage-content-top-text">��û�ο�</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=0">${manageList.applicants}</a></div>
					</div>
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=1'">
						<div class="manage-content-top-text">�����ο�</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=1">${manageList.approval}</a></div>
					</div>
					<div class="manage-content-div manage-right-line" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=4'">
						<div class="manage-content-top-text">���޿Ϸ�</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=4">${manageList.paid}</a></div>
					</div>
					<div class="manage-content-div manage-right-line f-red" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=2'">
						<div class="manage-content-top-text">�����û</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=2">${manageList.complain}</a></div>
					</div>
					<div class="manage-content-div" onClick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=3'">
						<div class="manage-content-top-text">���</div>
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