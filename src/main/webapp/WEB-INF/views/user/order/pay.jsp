<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>
        
        <div class="contents">
			<div class="contentsright">
				<div>
					Pay 페이지 입니다.
					
					주소 선택<br>
					<c:forEach items="${ userAddressList}" var="vo">
						별명: ${vo.name }  ${vo.comment }<br>
						우편번호: ${vo.zipcode }<br>
						주소 : ${vo.addr1 }<br>
						상세 주소: ${vo.addr2 }<br>
						연락처: ${vo.phone }<br>
						<br><hr>		
					</c:forEach>
				
					<hr>
					
					결제 수단 선택<br>
					<c:forEach items="${ userPaymentList}" var="vo"	>
						타입: ${vo.type }<br>
						회사: ${vo.company }<br>
						계좌 : ${vo.account }<br>
						<br><hr>
					</c:forEach>	
				
				</div>
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>