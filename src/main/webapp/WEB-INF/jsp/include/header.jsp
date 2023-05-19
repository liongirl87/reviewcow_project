<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center header01 w-100 z-index">
		<div id="header" class="d-flex justify-content-between align-items-end">
		<div class="d-flex align-items-center">
			<div class="top-logo ml-3">
			<img src="/static/img/review-cow-top-logo.png" class="w-100 mt-3">
			</div>
			<div class="top-search ml-3">
				<form method="post" action="#">
					<input type="text" class="top-search-input">
					<input type="image" src="/static/img/search_btn2.png" class="top-search-img" alt="�˻�">
					<input type="submit" style="display:none">
				</form>
			</div>
		</div>
		<div class="d-flex align-items-end">
			<ul class="nav rc-topMenu-right">
				<c:choose>
					<c:when test="${empty member}">
						<li class="nav-item"><a href="/member/login_view" class="nav-link mt-1">�α���</a></li>
					</c:when>
					<c:when test="${not empty member}">
						<li class="nav-item"><a href="#" class="nav-link mt-1">${member.name}��</a></li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${empty member}">
						<li class="nav-item"><a href="/member/join_view" class="nav-link mt-1">ȸ������</a></li>
					</c:when>
					<c:when test="${not empty member}">
						<li class="nav-item"><a href="/member/sign_out" class="nav-link mt-1">�α׾ƿ�</a></li>
					</c:when>
				</c:choose>
				<li class="nav-item"><a href="#" class="nav-link mt-1">�̿�ȳ�</a></li>
				<li class="nav-item"><a href="#" class="nav-link"><i class="xi-search xi-2x"></i></a></li>
				<li class="nav-item"><a href="#" class="nav-link"><i class="xi-user-o xi-2x"></i></a></li>
				<li class="nav-item"><a href="#" class="nav-link"><i class="xi-heart-o xi-2x"></i></a></li>
				<li class="nav-item arrow"><a href="#" class="nav-link top-nav mr-3"><i class="xi-align-justify xi-2x"></i></a>
					<ul class="sub-category01 sub-01 li-style-none parent-position" style="display:none ">
						<li><a href="#" class="">������</a></li>
						<li><a href="#" class="">����Ʈ����</a></li>
						<li><a href="#" class="">�����ϱ�</a></li>
						<li><a href="#" class="">��������</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
<script>
	$(".top-nav").click('on', function(e){
		e.preventDefault();
		if($(".sub-01").is(":visible")) {
			$(".sub-01").slideUp();
		} else {
			$(".sub-01").slideDown();
		}
	});

</script>
