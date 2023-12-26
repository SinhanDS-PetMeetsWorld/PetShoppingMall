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
<link rel="stylesheet" href="/resources/css/common/header.css">


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
					<a href="/seller/index.do"><b> Pet Meets World 판매자</b></a>
				</h1>
				<div class="header_menu">
					
				</div>
				
				<c:if test="${empty sellerLoginInfo }">
					<div class="header_unlogin">
						<a href="/user/login.do">로그인</a> | <a href="/seller/join.do">회원가입</a>
					</div>
				</c:if>
				<c:if test="${!empty sellerLoginInfo }">
					<div class="header_login">
						<div class="header_logout">
							<a href="/seller/logout.do">로그아웃</a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>