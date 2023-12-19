<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pet Makes the world</title>
<!-- 헤더스타일로 이름 -->
<link rel="stylesheet" href="/resources/css/common/header_admin.css">


</head>
<body>
	<div class="header_wrap">
		<div id="header_frame">
			<div class="shape1"></div>
		</div>
		<div class="header_wrapbar">
			<div class="header_title">
				<!-- 헤더타이틀로 다바꾸기 -->
				<h1 id="header_shopname";>
					<a href="#"><b> Pet Meets World </b></a>
				</h1>
				<div class="header_menu">
					<ul>
						<li>
							<a href="/admin/userList.do">구매자 회원 관리</a>
						</li>
						<li>
							<a href="/admin/sellerList.do">판매자 회원 관리</a>
						</li>
						<li>
							<a href="#">통계</a>
						</li>
					</ul>
				</div>
				<c:if test="${!empty adminLoginInfo }">
					<div class="header_login">
						<div class="header_logout">
							<a href="/admin/logout.do">로그아웃</a>
						</div>
					
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>