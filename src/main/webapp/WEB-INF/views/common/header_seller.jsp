<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pet Meets World</title>
<!-- 헤더스타일로 이름 -->
<link rel="stylesheet" href="/resources/css/common/header.css">
<style>
	.header_unlogin2{
		width: 150px;
    	height: 30px;
    	margin: 25px 0 0 285px;
    	display: inline-block;
    	position: absolute;
   	 	border: 1px;
    	cursor: pointer;
	}
	.shopname_seller{
		float:right;
		font-size:35px;
		margin-left:10px;
		margin-top:10px;
		
	}
	
</style>

</head>
<body>
	<div class="header_wrap">
		<div id="header_frame">
			<div class="shape1"></div>
		</div>
		<div class="header_wrapbar">
			<div class="header_title">
				<!-- 헤더타이틀로 다바꾸기 -->
				<div id="header_shopname";>
					<a href="/seller/index.do"><img class="header_name" src="/resources/img/common/name_img.png"><b class="shopname_seller">판매자</b></a>
					
				</div>
				<div class="header_menu">
					
				</div>
				
				<c:if test="${empty sellerLoginInfo }">
					<div class="header_unlogin2">
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