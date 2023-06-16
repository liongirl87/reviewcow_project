<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="manage-applicants" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>ü��� ����</div>
		<div class="manage-div">
			<div class="manage-div-box1 mt-3">
				<div class="manage-sub-title">�� ü���</div>
				<div class="manage-content-parent d-flex justify-content-between align-items-center">
					<div class="manage-content-div manage-right-line">
						<div>���δ��</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=0">${manageList.waiting}</a></div>
					</div>
					<div class="manage-content-div manage-right-line">
						<div>������</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=1">${manageList.onSale}</a></div>
					</div>
					<div class="manage-content-div manage-right-line">
						<div>����</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=0">${manageList.finish}</a></div>
					</div>
					<div class="manage-content-div manage-right-line f-red">
						<div>�ݷ�</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=2">${manageList.reject}</a></div>
					</div>
					<div class="manage-content-div">
						<div>���</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_product_view?aprovalCondition=3">${manageList.cancelProduct}</a></div>
					</div>
				</div>
			</div>
			<div class="manage-div-box1 mt-3">
				<div class="manage-sub-title">������ ����</div>
				<div class="manage-content-parent d-flex justify-content-between align-items-center">
					<div class="manage-content-div manage-right-line">
						<div>��û�ο�</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=0">${manageList.applicants}</a></div>
					</div>
					<div class="manage-content-div manage-right-line">
						<div>�����ο�</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=1">${manageList.approval}</a></div>
					</div>
					<div class="manage-content-div manage-right-line">
						<div>���޿Ϸ�</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=0">${manageList.paid}</a></div>
					</div>
					<div class="manage-content-div manage-right-line f-red">
						<div>�����û</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=2">${manageList.complain}</a></div>
					</div>
					<div class="manage-content-div">
						<div>���</div>
						<div class="manage-content-div-text-number"><a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=3">${manageList.cancelPayment}</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>