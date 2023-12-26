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
            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        </div>
        <div>
        	<%@ include file="/WEB-INF/views/common/admin_menu.jsp" %>
        </div>
        <div class="contents">
        	<h3>탈퇴 후 1년 이상</h3>
        	<div class="afterYear">
        		<table border="1">
        			<tr>
        				<td>판매자 번호</td>
        				<td>아이디</td>
        				<td>이메일</td>
        				<td>사업자번호</td>
        				<td>탈퇴일</td>
        				<td>삭제</td>
        			</tr>
	        		<c:forEach items="${afterYear }" var="vo">
	        			<tr>
		        			<td>${vo.no }</td>
	        				<td>${vo.id }</td>
	        				<td>${vo.email }</td>
	        				<td>${vo.business_number }</td>
	        				<td>${vo.withdrawal_date }</td>
	        				<td><button class="removeButton" data-no="${vo.no }">삭제</button></td>
	        			</tr>
	        		</c:forEach>
        		</table>
        	</div>
        	<br>
        	<h3> 탈퇴 후 1년 이하 </h3>
        	<div class="beforeYear">
        		<table border="1">
        			<tr>
        				<td>판매자 번호</td>
        				<td>아이디</td>
        				<td>이메일</td>
        				<td>사업자번호</td>
        				<td>탈퇴일</td>
        				<td>복구</td>
        			</tr>
	        		<c:forEach items="${beforeYear }" var="vo">
	        			<tr>
		        			<td>${vo.no }</td>
	        				<td>${vo.id }</td>
	        				<td>${vo.email }</td>
	        				<td>${vo.business_number }</td>
	        				<td>${vo.withdrawal_date }</td>
	        				<td><button class="restoreButton" data-no="${vo.no }">복구</button></td>
	        			</tr>
	        		</c:forEach>
        		</table>
        	</div>
        
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>

<script>
	$('.removeButton').on('click', function(){
		confirm("해당 판매자를 정말 삭제하시겠습니까?")
		location.href="/admin/removeSeller.do?no=" + $(this).data('no');
	})
	$('.restoreButton').on('click', function(){
		confirm("해당 판매자를 정말 복구시키겠습니까?")
		location.href="/admin/restoreSeller.do?no=" + $(this).data('no');
	})
</script>
</body>
</html>