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
        	<h1>주문 상세 목록 조회</h1>
        	<table border='1'>
        		<tr>
					<td>주문 상세 번호</td>
					<td>주문 번호</td>
					<td>구매자 번호</td>
					<td>판매자 번호</td>
					<td>상품 번호</td>
					<td>제조사</td>
					<td>브랜드</td>
					<td>가격</td>
					<td>할인 가격</td>
					<td>옵션 가격</td>
					<td>수량</td>
					<td>결제 가격</td>
        		</tr>
        	
	        	<c:forEach items="${list }" var="vo" varStatus="status">
					<tr>
						<td>${vo.no }</td>
						<td>${vo.order_no }</td>
						<td>${vo.user_no}</td>
						<td>${vo.seller_no}</td>
						<td>${vo.product_no}</td>
						<td>${vo.company}</td>
						<td>${vo.brand}</td>
						<td class="price_td" data-no="${status.index }">${vo.product_price}</td>
						<td class="discount_td" data-no="${status.index }">${vo.discount}</td>
						<td class="option_price_td" data-no="${status.index }"></td>
						<td class="quantity_td">${vo.quantity}</td>
						<td class="payment_price_td" data-no="${status.index }"></td>
	        		</tr>
	        	</c:forEach>
        	</table>
        	
        	<div>
		   		<ul class='paging'>
		            <c:if test="${paging.prev }">
		            	<li><button class="pageButton" data-page="${paging.startPage-1 }"> << </button></li>
		            </c:if>
		            <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
		            	<c:if test="${p == svo.page}">
			            	<li> <button data-page=${p }>${p }</button></li>
		                </c:if>
		                <c:if test="${p != svo.page}">
		                	<li> <button class="pageButton" data-page=${p }>${p }</button></li>
		                </c:if>
		            </c:forEach>
		            <c:if test="${paging.next }">
		            	<li><button class="pageButton" data-page="${paging.endPage+1 }"> >> </button></li>
		            </c:if>
				</ul> 
		   	</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
<script>
	$('.pageButton').on('click', function(){
		location.href="/admin/orderDetailList.do?page=" + $(this).data('page');
	})
</script>
<script>
	<c:forEach items="${list }" var="vo" varStatus="status">
		var total = 0;
		<c:forEach items="${ovo_list[status.index] }" var="ovo" varStatus="ovoStatus">
			total += ${ovo.price}
		</c:forEach>
		var target = $('.option_price_td').eq(${status.index});
		$(target).text(total);
	</c:forEach>
</script>
<script>
	$('.payment_price_td').each(function(i, e){
		var index = i;
		var value = Number(0);
		value += Number($('.price_td').eq(i).text());
		value -= Number($('.discount_td').eq(i).text());
		value *= Number($('.quantity_td').eq(i).text());
		$('.payment_price_td').eq(i).text(value);
	})
</script>
</body>
</html>