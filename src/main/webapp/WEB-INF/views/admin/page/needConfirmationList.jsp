<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>관리자:: 구매 확정 목록</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<style>
	.contents{
			text-align:center;
		}
		
		.contents table{
		    margin-left:auto; 
	    	margin-right:auto;
		}
</style>

<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        </div>
        <div>
        	<%@ include file="/WEB-INF/views/common/admin_menu.jsp" %>
        </div>
        <div class="contents">
        	<h1>구매 확정될 목록 조회</h1>
        	<h3>총 ${count }개 상품이 자동 구매 확정 대상입니다.</h3>
        	<c:if test="${count != 0 }">
	        	<form method="post" action="/admin/confirmOrderDetail.do">
		        	<button id="purchase_confirm_button">일괄 구매 확정</button>
		        	<table border='1'>
		        		<tr>
							<td>주문 번호</td>
							<td>주문 상세 번호</td>
							<td>구매자 번호</td>
							<td>판매자 번호</td>
							<td>상품 번호</td>
							<td>결제 금액</td>
		        		</tr>
		        	
			        	<c:forEach items="${list }" var="vo">
							<tr>
								<td>${vo.order_no }</td>
								<td>${vo.no }</td>
								<td>${vo.user_no }</td>
								<td>${vo.seller_no }</td>
								<td>${vo.product_no }</td>
								<td class="payment_price_td" data-no="${status.index }"></td>
			        		</tr>
			        		<input type="hidden" name="no" value="${vo.no }">
			        	</c:forEach>
		        	</table>
	        	</form>
        	</c:if>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
<script>
<c:forEach items="${list }" var="vo" varStatus="status">
	var product_price = Number("${vo.product_price}");
	var discount = Number("${vo.discount}");
	var quantity = Number("${vo.quantity}");
	
	var payment_price = (product_price - discount) * quantity; 
	$('.payment_price_td').eq("${status.index}").text(payment_price);
</c:forEach>
</script>
</body>
</html>