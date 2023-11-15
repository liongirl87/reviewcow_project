<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view" class="d-flex justify-content-center withdraw-point">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>출금하기</div>
		<div class="d-flex justify-content-center point-button-parentDiv">
			<div class="semi-title">출금가능 포인트</div>
		</div>
		<div class="mp-bottom-text-line"></div>
		<div class="now-point-div d-flex align-items-center justify-content-center">
			<div class="now-point-text"><span class="font-weight-bold"><fmt:formatNumber value="${nowPoint}" type="number" /></span><span>P</span></div>
		</div>
		<div class="mp-header-top-text-line"></div>
		<div class="withdraw-content-div">
			<div class="d-flex align-items-center withdraw-content-child">
				<div>
					출금금액
				</div>
				<div class="withdraw-input-div-location">
					<input type="text" class="withdraw-input-box text-right form-control" id="withdrawal" onkeyup="doComma(this)">
				</div>
			</div>
			<div>
				<span class="help-text-small">*최소 출금 금액은 10,000원 부터 가능합니다.</span>
			</div>
			<div class="d-flex align-items-center withdraw-content-child">
				<div>
					은행선택
				</div>
				<div class="select-div">
					<select id ="serviceCategory1"  class="custom-select" name="bank">
						<option value="" disabled selected>은행선택</option>
						<option value="국민은행">국민은행</option>
						<option value="기업은행">기업은행</option>
						<option value="농협은행">농협은행</option>
						<option value="신한은행">신한은행</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="산업은행">산업은행</option>
						<option value="우리은행">우리은행</option>
						<option value="한국씨티은행">한국씨티은행</option>
						<option value="하나은행">하나은행</option>
						<option value="SC제일은행">SC제일은행</option>
						<option value="경남은행">경남은행</option>
						<option value="광주은행">광주은행</option>
						<option value="대구은행">대구은행</option>
						<option value="도이치은행">도이치은행</option>
						<option value="부산은행">부산은행</option>
						<option value="저축은행">저축은행</option>
						<option value="새마을금고">새마을금고</option>
						<option value="수협은행">수협은행</option>
						<option value="신협중앙회">신협중앙회</option>
						<option value="우체국">우체국</option>
						<option value="케이뱅크">케이뱅크</option>
						<option value="토스뱅크">토스뱅크</option>
					</select>
				</div>
			</div>
			<div class="d-flex align-items-center withdraw-content-child">
				<div>
					예금주
				</div>
				<div class="withdraw-input-div-location">
					<input type="text" class="withdraw-input-box text-right form-control" id="depositor">	
				</div>
			</div>
			<div class="d-flex align-items-center withdraw-content-child">
				<div>
					계좌번호
				</div>
				<div class="withdraw-input-div-location">
					<input type="text" class="withdraw-input-box text-right form-control" id="accountNumber" onkeyup="onlyNumber(this)">	
				</div>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<div>
					<input type="button" class="withdrawBtn"value="신청하기">
				</div>
			</div>
		</div>
	</div>	
</div>
<script>
	$(document).ready(function(){
		
		doComma = function(str) {
	        if (str != null && str != '') {
		        /* 문자를 숫자로 변환 => 숫자외 문자입력시 빈공간으로 교체 false시 0 */
		        var tmps = parseInt(str.value.replace(/[^0-9]/g, '')) || '0';
		        /* 콤마찍기 정규식*/
		        var tmps2 = tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
		        str.value = tmps2;
		    }
		};
		
		onlyNumber = function(str) {
			if (str != null && str != '') {
				
				/* 문자를 숫자로 변환 => 숫자외 문자입력시 빈공간으로 교체 false시 0 */
				var tmps = parseInt(str.value.replace(/[^0-9]/g, '')) || '0';
				str.value = tmps;
			}
			
		};
		$('.withdrawBtn').on('click',function(){
			
			if($('#withdrawal').val().replaceAll(",", "") > ${nowPoint}) {
				alert("출금 신청 금액이 현재 보유 포인트보다 많습니다");
				return;
			}
			
			var bank = $('select[name=bank] option:selected').val();
			// *-1 음수로 변환
			var withdrawal = $('#withdrawal').val().replaceAll(",", "") * -1;
			var depositor = $('#depositor').val();
			var accountNumber = $('#accountNumber').val();
			
			if(!bank) {
				alert("거래 은행을 선택해주세요.");
				return;
			}
			
			if(!withdrawal) {
				alert("출금 금액을 입력해주세요.");
				return;
			} else if (withdrawal * -1 <= 9999) {
				alert("만원 이상부터 출금 가능합니다");
				return;
			}
			
			if(!depositor) {
				alert("예금주를 입력해주세요.");
				return;
			}
			
			if(!accountNumber) {
				alert("계좌번호를 입력해주세요.");
				return;
			}
			
			$.ajax({
				type: 'PUT'
				, url: '/point/withdraw'
				, data: {'bank': bank, 'withdrawal': withdrawal, 'depositor':depositor, 'accountNumber':accountNumber}
				
				, success:function(data) {
					if(data.code == 1) {
						alert("인출 신청이 완료되었습니다.")
					} else {
						alert("인출 신청이 실패하였습니다.")
					}
				}
				, error:function(request, status, error) {
					alert("인출 신청이 실패하였습니다 관리자에게 문의해주세요.")
				}
			});
			
		});
	});

</script>