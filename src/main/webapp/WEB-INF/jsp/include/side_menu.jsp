<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center" id="side-menu-top-div">
	<!-- side-menu ��ġ�� ���� position: relative ��� ���� �θ� div -->
	<div id="side-menu-div">	
		<div class="side-menu">
			<div class="side-menu-location">
				<div class="mt-3">	
					<c:choose>
						<c:when test="${member.memberType eq 'businessMember'}">
							<a href="#"><button type="button" class="side-button button-color1 button-margin">ü��� ����</button></a>
							<a href="#"><button type="button" class="side-button button-color2 button-margin border-bot">ü��� ����</button></a>
						</c:when>
						<c:otherwise>
							<a href="#"><button type="button" class="side-button button-color1 button-margin">��û�� ü���</button></a>
							<a href="#"><button type="button" class="side-button button-color2 button-margin border-bot">�������</button></a>
						</c:otherwise>
					</c:choose>
					<div class="border-div border-bot"></div>
				</div>
				<ul>
					<li class="mt-3"><a href="#">ȸ������ ����</a></li>
					<li class="text-margin"><a href="#">����Ʈ����</a></li>
					<li><a href="#">�����ϱ�</a></li>
					<li class="text-margin"><a href="#">��������</a></li>
					<li><a href="#">�˸�</a></li>
					<li class="text-margin"><a href="#">����</a></li>
					<li><a href="#">�α׾ƿ�</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>