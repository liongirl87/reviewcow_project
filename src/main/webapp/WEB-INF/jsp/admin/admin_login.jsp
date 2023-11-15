<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<header>
	<div class="top-logo-div d-flex justify-content-end">
	 	<div class="text-logo mr-3">
	 		admin
	 	</div>
	</div>
</header>
<section class="d-flex justify-content-center align-items-center">
	<div class="d-flex justify-content-center align-items-center">
		<div class="login-box">
			<form id="loginForm" action="/admin/login" method="post">
				<div class="d-flex justify-content-center login-top-text">
					<span class="text-center">LOGIN</span>
				</div>
				<div class="d-flex justify-content-center align-items-center mt-5">
					<div>
						<div class="d-flex align-items-center">
							<span>ID</span>
							<input type="text" id="loginId" name="loginId" class="form-control id-box">
						</div>
						<div class="d-flex align-items-center mt-2">
							<span>PW</span>
							<input type="password" id="password" name="password" class="form-control pw-box">
						</div>
						<div class="d-flex justify-content-end">
							<input type="submit" id="loginBtn" class="confirm-btn" value="È®ÀÎ">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<script>
	$(document).ready(function(){
		$("#loginForm").on('submit', function(e){
			e.preventDefault();
			
			let loginId = $('#loginId').val().trim();
			let password =$('#password').val();
			
			let url = $('#loginForm').attr('action');
			let params = $('#loginForm').serialize();
			console.log(params);
			
			$.post(url,params)
			.done(function(data){
				if(data.code == 1) {
					alert(data.result);
					location.href = '/admin/member_list';
				} else {
					alert(data.result);
					location.reload();
				}
			});
		});
		
	});


</script>