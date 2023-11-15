<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view" class="d-flex justify-content-center withdraw-point">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>����ϱ�</div>
		<div class="d-flex justify-content-center point-button-parentDiv">
			<div class="semi-title">��ݰ��� ����Ʈ</div>
		</div>
		<div class="mp-bottom-text-line"></div>
		<div class="now-point-div d-flex align-items-center justify-content-center">
			<div class="now-point-text"><span class="font-weight-bold"><fmt:formatNumber value="${nowPoint}" type="number" /></span><span>P</span></div>
		</div>
		<div class="mp-header-top-text-line"></div>
		<div class="withdraw-content-div">
			<div class="d-flex align-items-center withdraw-content-child">
				<div>
					��ݱݾ�
				</div>
				<div class="withdraw-input-div-location">
					<input type="text" class="withdraw-input-box text-right form-control" id="withdrawal" onkeyup="doComma(this)">
				</div>
			</div>
			<div>
				<span class="help-text-small">*�ּ� ��� �ݾ��� 10,000�� ���� �����մϴ�.</span>
			</div>
			<div class="d-flex align-items-center withdraw-content-child">
				<div>
					���༱��
				</div>
				<div class="select-div">
					<select id ="serviceCategory1"  class="custom-select" name="bank">
						<option value="" disabled selected>���༱��</option>
						<option value="��������">��������</option>
						<option value="�������">�������</option>
						<option value="��������">��������</option>
						<option value="��������">��������</option>
						<option value="īī����ũ">īī����ũ</option>
						<option value="�������">�������</option>
						<option value="�츮����">�츮����</option>
						<option value="�ѱ���Ƽ����">�ѱ���Ƽ����</option>
						<option value="�ϳ�����">�ϳ�����</option>
						<option value="SC��������">SC��������</option>
						<option value="�泲����">�泲����</option>
						<option value="��������">��������</option>
						<option value="�뱸����">�뱸����</option>
						<option value="����ġ����">����ġ����</option>
						<option value="�λ�����">�λ�����</option>
						<option value="��������">��������</option>
						<option value="�������ݰ�">�������ݰ�</option>
						<option value="��������">��������</option>
						<option value="�����߾�ȸ">�����߾�ȸ</option>
						<option value="��ü��">��ü��</option>
						<option value="���̹�ũ">���̹�ũ</option>
						<option value="�佺��ũ">�佺��ũ</option>
					</select>
				</div>
			</div>
			<div class="d-flex align-items-center withdraw-content-child">
				<div>
					������
				</div>
				<div class="withdraw-input-div-location">
					<input type="text" class="withdraw-input-box text-right form-control" id="depositor">	
				</div>
			</div>
			<div class="d-flex align-items-center withdraw-content-child">
				<div>
					���¹�ȣ
				</div>
				<div class="withdraw-input-div-location">
					<input type="text" class="withdraw-input-box text-right form-control" id="accountNumber" onkeyup="onlyNumber(this)">	
				</div>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<div>
					<input type="button" class="withdrawBtn"value="��û�ϱ�">
				</div>
			</div>
		</div>
	</div>	
</div>
<script>
	$(document).ready(function(){
		
		doComma = function(str) {
	        if (str != null && str != '') {
		        /* ���ڸ� ���ڷ� ��ȯ => ���ڿ� �����Է½� ��������� ��ü false�� 0 */
		        var tmps = parseInt(str.value.replace(/[^0-9]/g, '')) || '0';
		        /* �޸���� ���Խ�*/
		        var tmps2 = tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
		        str.value = tmps2;
		    }
		};
		
		onlyNumber = function(str) {
			if (str != null && str != '') {
				
				/* ���ڸ� ���ڷ� ��ȯ => ���ڿ� �����Է½� ��������� ��ü false�� 0 */
				var tmps = parseInt(str.value.replace(/[^0-9]/g, '')) || '0';
				str.value = tmps;
			}
			
		};
		$('.withdrawBtn').on('click',function(){
			
			if($('#withdrawal').val().replaceAll(",", "") > ${nowPoint}) {
				alert("��� ��û �ݾ��� ���� ���� ����Ʈ���� �����ϴ�");
				return;
			}
			
			var bank = $('select[name=bank] option:selected').val();
			// *-1 ������ ��ȯ
			var withdrawal = $('#withdrawal').val().replaceAll(",", "") * -1;
			var depositor = $('#depositor').val();
			var accountNumber = $('#accountNumber').val();
			
			if(!bank) {
				alert("�ŷ� ������ �������ּ���.");
				return;
			}
			
			if(!withdrawal) {
				alert("��� �ݾ��� �Է����ּ���.");
				return;
			} else if (withdrawal * -1 <= 9999) {
				alert("���� �̻���� ��� �����մϴ�");
				return;
			}
			
			if(!depositor) {
				alert("�����ָ� �Է����ּ���.");
				return;
			}
			
			if(!accountNumber) {
				alert("���¹�ȣ�� �Է����ּ���.");
				return;
			}
			
			$.ajax({
				type: 'PUT'
				, url: '/point/withdraw'
				, data: {'bank': bank, 'withdrawal': withdrawal, 'depositor':depositor, 'accountNumber':accountNumber}
				
				, success:function(data) {
					if(data.code == 1) {
						alert("���� ��û�� �Ϸ�Ǿ����ϴ�.")
					} else {
						alert("���� ��û�� �����Ͽ����ϴ�.")
					}
				}
				, error:function(request, status, error) {
					alert("���� ��û�� �����Ͽ����ϴ� �����ڿ��� �������ּ���.")
				}
			});
			
		});
	});

</script>