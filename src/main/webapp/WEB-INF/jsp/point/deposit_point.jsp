<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<div class="d-flex justify-content-center deposit-point">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>����Ʈ����</div>
		<div class="d-flex justify-content-center mt-3 sub-title-grey">�����Ͻ� �ݾ��� �����ϼ���</div>
		<div class="mt-2 price-button-div d-flex justify-content-center">
			<input type="button" name="5000" class="price-button" value="5,000">			
			<input type="button" class="button-price price-button" value="10,000">			
			<input type="button" class="button-price price-button" value="30,000">			
			<input type="button" class="button-price price-button" value="50,000">			
			<input type="button" class="button-price price-button" value="100,000">			
			<input type="button" class="button-price price-button" value="300,000">			
			<input type="button" class="button-price price-button" value="1,000,000">			
			<input type="button" class="button-price price-button direct-input-btn" value="�����Է�">			
		</div>
		<div class="mt-3 ml-2 direct-input-div" style="display:none">
			<div class="direct-input-text d-flex justify-content-center ">
			<div>���� �Է�</div>
			<input type="text" class="input-price text-right" onkeyup="doComma(this);totalpriceComma(this)">
			<div>��</div>
			</div>
		</div>
		<div>
			<div class="ml-3 mt-5 font-weight-bold">��������</div>
			<div class="payment-div">
				<div class="payment-botline payment-child payment-transfer d-flex align-items-center p-2">
					<input type="radio" name="transfer" id="transfer"><label for="transfer" class="ml-2 payment-method-text">������ü</label>
				</div>
				<div class="payment-child payment-cardpayment d-flex align-items-center p-2">
					<input type="radio" name="cardpayment" id="cardpayment"><label for="cardpayment" class="ml-2 payment-method-text">ī�����</label>
				</div>
			</div>
		</div>
		<div class="mt-3 d-flex justify-content-between">
			<div class="ml-3 mt-2 font-weight-bold payment-title-text">�����ݾ�</div>
			<div class="ml-3 mt-2 font-weight-bold payment-title-text"><span class="payment-total">5,500</span>��(vat����)</div>
			
		</div>
		<div class="button-div d-flex justify-content-end mt-3">
			<input type="button" class="confirm-depositBtn" value="�����ϱ�">
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$('.input-price').val('0');
	$('input:button[name=5000]').addClass('active');
	
	$('.price-button').on('click', function(){
		$('.price-button').removeClass('active');
		$(this).toggleClass('active');
		$('.direct-input-div').hide();
		
		var price = Math.floor($(this).val().replaceAll(",","") * 1.1);
		var inputPrice = $('.input-price').val();
		
		if ($(this).val() != '�����Է�') {
			var tmps3 = price.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
			$('.payment-total').text(tmps3);
		} else if ($(this).val() == '�����Է�') {
			$('.payment-total').text(inputPrice);
		}
	});
	
	totalpriceComma = function(number) {
		var tmps = Math.floor($(number).val().replaceAll(",","")*1.1);
		$('.payment-total').text(tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
	};
	
	
	$('.direct-input-btn').on('click', function(){
		$('.direct-input-div').show();
	});
	
	// ������ü
	$('input:radio[name=transfer]').on('click', function(){
		
		$('.payment-cardpayment').removeClass('after');		
		$('.payment-transfer').addClass('after');
			
		$("input:radio[name=cardpayment]").prop('checked', false);
	});
	
	// ī�����
	$('input:radio[name=cardpayment]').on('click', function(){
		
		$('.payment-transfer').removeClass('after');
		$('.payment-cardpayment').addClass('after');
		
		
		$("input:radio[name=transfer]").prop('checked', false);
	});
	
	doComma = function(str) {
        if (str != null && str != '') {
	        /* ���ڸ� ���ڷ� ��ȯ => ���ڿ� �����Է½� ��������� ��ü false�� 0 */
	        var tmps = parseInt(str.value.replace(/[^0-9]/g, '')) || '0';
	        /* �޸���� ���Խ�*/
	        var tmps2 = tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
	        str.value = tmps2;
	    }
	};
	
	$('.confirm-depositBtn').on('click', function(){
		let point = $('.payment-total').text().replaceAll(",", "");
		
		if ($('input:radio[name=transfer]').is(':checked')) {
			var methodsOfPayment = 'transfer';
		} else if ($('input:radio[name=cardpayment]').is(':checked')) {
			var methodsOfPayment = 'cardpayment';
		}
		
		if (!methodsOfPayment) {
			alert("���������� �������ּ���")
			return;
		}
		
		$.ajax({
			// post
			type: 'PUT'
			, url: '/point/deposit'
			, data: {'point': point, "methodsOfPayment": methodsOfPayment}
		
			, success:function(data) {
				if(data.code == 1) {
					alert(data.result);
					location.href= '/point/manage_point_view';
				} else {
					alert('������ �����Ͽ����ϴ�.');
				}
			}
			, error:function(request, status, error) {
				alert('������ �����߽��ϴ� �����ڿ��� �������ּ���');
			}
			
		});
		
	});
});


</script>