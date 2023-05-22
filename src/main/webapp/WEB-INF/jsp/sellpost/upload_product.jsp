<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="upload-product" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>체험단모집</div>
		<div class="product-div-line-box">
			<div class="product-semi-title">서비스종류<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div">
					<select name="order" form="myForm" class="product-select-design ml-3">
					 	<option value="" disabled selected>서비스종류</option>
					    <option value="americano">온라인상품</option>
					    <option value="caffe latte">오프라인상품</option>
					    <option value="cafe au lait">체험단</option>
					</select>
					<select name="order" form="myForm" class="product-select-design ml-2">
					 	<option value="" disabled selected>서비스종류</option>
					    <option value="americano">온라인상품</option>
					    <option value="caffe latte">오프라인상품</option>
					    <option value="cafe au lait">체험단</option>
					</select>
					<select name="order" form="myForm" class="product-select-design ml-2">
					 	<option value="" disabled selected>서비스종류</option>
					    <option value="americano">온라인상품</option>
					    <option value="caffe latte">오프라인상품</option>
					    <option value="cafe au lait">체험단</option>
					</select>
				</div>
			</div>
		</div>
		<div class="product-div-line-box">
		<div class="product-semi-title">상품명(서비스명)<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-center product-text-wrap-div">
					<input type="text" class="form-control produc-input-box" placeholder="최대 50자까지 입력 가능합니다.">
				</div>
			</div>
		</div>
		<div class="product-div-line-box">
		<div class="product-semi-title">판매상품 URL<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-center product-text-wrap-div">
					<input type="text" class="form-control produc-input-box" placeholder="판매 할 상품 URL링크를 입력해주세요.">
				</div>
			</div>
		</div>
		<div class="product-div-line-box">
		<div class="product-semi-title">모집인원<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">모집인원</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" class="form-control" placeholder="최대 99명까지 모집가능">
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2">명</span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div">
					<div class="product-text-margin">
						<span class="radio-side-text">모집방식</span>
					</div>
					<div class="sell-type-div">
						<label><input type="radio" name="member-type" value="member" class="radio-btn" checked="checked" onclick="member()">선착순모집</label>
						<label><input type="radio" name="member-type" value="influencerMember" class="radio-btn ml-2" onclick="influencerMember()">판매자선정</label>
					</div>
				</div>
			</div>
		</div>
		<div class="product-div-line-box">
		<div class="product-semi-title">모집기간<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">시작일</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" class="form-control" placeholder="시작일을 선택하세요.">
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2"><i class="xi-caret-down"></i></span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">종료일</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" class="form-control" placeholder="종료일을 선택하세요.">
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2"><i class="xi-caret-down"></i></span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start align-items-end product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">2023-05-01</span>
					</div>
					<div class="product-text-margin">
						<span class="input-side-text">~</span>
					</div>
					<div class="product-text-margin">
						<span class="input-side-text">2023-05-10</span>
					</div>
					<div class="product-text-margin-date-total">
						<span class="input-side-text progress-of-period-text">총 <span class="progress-of-period-text-stress">10</span>일</span>
					</div>
				</div>
			</div>
		</div>
		<div class="product-div-line-box">
		<div class="product-semi-title">판매가격<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">판매가격</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" class="form-control" placeholder="시작일을 선택하세요.">
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2">원</span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">할인</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" class="form-control" placeholder="종료일을 선택하세요.">
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2"><i class="xi-caret-down"></i></span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start align-items-end product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text progress-of-period-text">할인가</span>
					</div>
					<div class="product-text-margin-price-total">
						<span class="input-side-text progress-of-period-text">총 
						<span class="progress-of-period-text-stress">14,400</span>원 <span>(9,600 포인트 지급)</span></span>
					</div>
				</div>
			</div>
		</div>
		<div class="product-div-line-box2">
		<div class="product-semi-title">상품이미지<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">대표이미지</span>
					</div>
					<div class="mb-3 input-location d-flex">
						<input type="text" class="form-control product-not-append-div">
						<input type="button" class="product-file-upload ml-2" value="파일찾기">
					</div>
				</div>
				<div class="product-text-wrap-div-rows">
					<div class="product-text-margin product-file-size">
						<span>권장크기: 520x380</span>
					</div>
				</div>
			</div>
		</div>
		<div class="product-div-line-box">
		<div class="product-semi-title">상품설명<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-center product-text-wrap-div-rows">
					<div class="mt-2">
						<textarea class="product-detail-textarea" placeholder="내용을 입력해주세요." id="editor"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
   ClassicEditor
   	.create( document.querySelector( '#editor' ),{
   		language: 'ko'	//언어설정
   	})
   	.catch( error => {
   		console.error(error );
   	});

</script>