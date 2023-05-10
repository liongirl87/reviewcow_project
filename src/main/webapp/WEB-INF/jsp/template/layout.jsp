<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>layout</title>
<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<!-- ��Ʈ��Ʈ��  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<!-- ��Ʈ��Ʈ��CSS  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- ���� ���� ��Ÿ�Ͻ�Ʈ  -->
<link rel="stylesheet" type="text/css" href="/static/css/layout_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/main_bnr_style.css">
<link rel="stylesheet" type="text/css" href="/static/css/main_category_box_style.css">
<!-- XEICON CDN -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<div>
		<header>
			<jsp:include page="../include/header.jsp" />
		</header>
		<section>
			<jsp:include page="../include/main_bnr.jsp" />
		</section>
		<section>
			<jsp:include page="../include/main_category_box.jsp" />
		</section>
		<section>
			<jsp:include page="../${view}.jsp" />
		</section>
		<footer>
			<jsp:include page="../include/footer.jsp" />
		</footer>
	</div>
</body>

</html>
