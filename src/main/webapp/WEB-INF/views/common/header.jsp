<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pet Meets world</title>
<!-- 헤더스타일로 이름 -->
<link rel="stylesheet" href="/resources/css/common/header.css">


</head>
<body>
	<div class="header_wrap">
		<div id="header_frame"></div>
		<div class="header_wrapbar">
			<div class="header_title">
				<!-- 헤더타이틀로 다바꾸기 -->
				<h1 id="header_shopname";>
					<a href="/"><b> Pet Meets World </b></a>
				</h1>
				<div class="header_menu">
					<ul>
						<li>
							<a href="/user/product/list.do?category1=0">강아지</a>
							<ul>
								<c:forEach var="category2" items="${ProductCategoryVO.category[0]}" varStatus="status">
									<li class="temptemp"><a href="/user/product/list.do?category1=0&category2=${status.index }">${category2 }</a></li>
								</c:forEach>
							</ul></li>
						<li>
							<a href="/user/product/list.do?category1=1">고양이</a>
							<ul>
								<c:forEach var="category2" items="${ProductCategoryVO.category[1]}" varStatus="status">
									<li><a href="/user/product/list.do?category1=1&category2=${status.index }">${category2 }</a></li>
								</c:forEach>
							</ul></li>
						<li>
							<a href="/user/product/list.do?category1=2">기타</a>
							<ul>
								<c:forEach var="category2" items="${ProductCategoryVO.category[2]}" varStatus="status">
									<li><a href="/user/product/list.do?category1=2&category2=${status.index }">${category2 }</a></li>
								</c:forEach>
							</ul></li>
					</ul>
				</div>
				<div class="header_search">
					<input type="text" placeholder="     검색어 입력" name="totalSearchWord" class="totalSearchWord" value="${ProductSearchVO.totalSearchWord}"
						style="width: 300px; height: 30px; font-size: 10px; border: none; text-align: right" onkeyup="totalsearch()">
				</div>
				<c:if test="${empty userLoginInfo }">
					<div class="header_unlogin">
						<a href="/user/login.do">로그인</a> | <a href="/user/join.do">회원가입</a>
					</div>
				</c:if>
				<c:if test="${!empty userLoginInfo }">
					<div class="header_login">
						
						<div class="header_user">
							<a href="/user/edit.do"><img src="/resources/img/common/user.png" align="right"></a>
						</div>

						<div class="header_cart">
							<a href="/user/list_user_cart.do"><img src="/resources/img/common/cart.png" align="right"></a>
						</div>
						
						<div class="header_logout">
							<a href="/user/logout.do">로그아웃</a>
						</div>
					
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<script>
	
	function totalsearch() {
		var totalSearchWord = document.querySelector(".totalSearchWord").value; 
			if(window.event.keyCode == 13){//엔터키 눌렀을 때
				location.href=("/user/product/search.do?totalSearchWord="+totalSearchWord);
			}
	};
	</script>
</body>
</html>