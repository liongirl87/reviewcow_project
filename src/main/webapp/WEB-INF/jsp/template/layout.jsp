<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>layout</title>
<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<!-- 부트스트랩  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<!-- 부트스트랩CSS  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Fontawesome CDN Link -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />


<!-- 내가 만든 스타일시트  -->
<link rel="stylesheet" type="text/css" href="/static/css/layout_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/main_bnr_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/main_category_box_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/deadline_product_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/join_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/login_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/side_menu_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/helpdesk_write_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/helpdesk_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/manage_point_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/list_review_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/write_review_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/product_detail_style.css">
<!-- 내정보 2분할 화면 오른쪽view 공통 css -->
<link rel="stylesheet" type="text/css" href="/static/css/side_right_common_style.css">

<link rel="stylesheet" type="text/css" href="/static/css/modify_myinfo_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/upload_product_style.css">
<!-- XEICON CDN -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- ckeditor -->
<script src="/static/ckeditor/build/ckeditor.js"></script>
</head>
<body>
	<div>
		<header>
			<jsp:include page="../include/header.jsp" />
		</header>
		<c:forEach items="${viewList}" var="view">
			<section>
			<jsp:include page="../${view}.jsp" />
			</section>
		</c:forEach>
		<footer>
			<jsp:include page="../include/footer.jsp" />
		</footer>
	</div>
</body>

</html>
