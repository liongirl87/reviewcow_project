<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="login-top-div" class="d-flex justify-content-center">
	<div id="login" class="mt-3">
		<div class="login-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>로그인</div>
		<form id="loginForm" action="/member/login" method="post">
			<div id="login-form-div" class="d-flex justify-content-center">
				<div>
					<input type="text" id="loginId" name="loginId" class="form-control login-input-box mb-1" placeholder="아이디">
					<input type="password" id="password" name="password" class="form-control login-input-box" placeholder="비밀번호">
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<input type="submit" id="loginBtn" value="로그인" class="login-btn mt-3">
			</div>
			<div class="d-flex justify-content-center mt-1">
				<input type="button" id="idSearch" class="btn small-btn-style" value="아이디찾기">
				<input type="button" id="passwordget" class="btn small-btn-style small-btn-margin" value="비밀번호찾기">
			</div>
		</form>
	</div>
</div>
<script>
	$(document).ready(function(){
		$("#loginForm").on('submit', function(e){
			e.preventDefault();
			
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val();
			
			let url = $('#loginForm').attr("action");	// "/user/sign_in"
			let params = $('#loginForm').serialize();
			console.log(params);
			
			if (loginId.length <3) {
				alert("아이디를 입력해주세요");
				return;
			}
			if (password.length < 5) {
				alert("비밀번호는 5자이상입니다")
				return;
			}
			
			$.post(url,params)
			.done(function(data){
				if(data.code == 1) {	// 성공
					location.href= '/main/main_view';
				} else {	// 실패
					alert(data.result);
					location.reload();
				}
			});
		});
		
	});

</script>
	