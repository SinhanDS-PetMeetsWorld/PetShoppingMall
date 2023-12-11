<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
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
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu.jsp"%>
            </div>
			<div class="contentsright">
				<div id="cart_content" width='50%'>
					<h1>장바구니</h1>
					    <table style="border: 1px solid #FFDE30; border-collapse: collapse;" width="800" >
					        
					        <!--주소가 존재하는만큼 td를 생성-->
						    <c:forEach var="vo" items="${productvolist }">
						    	
						        <tr width="800">
						            <td>
						                <br>
						                <input type="hidden" name="no_list" value="${vo.no }">
						                <input type="hidden" name="seller_no_list" value="${vo.seller_no }">
						                <c:if test="${empty vo.image_url }">
											<img src="/resources/img/product/no_image.jpg" width="100" height="100">
										</c:if>
										<c:if test="${!empty vo.image_url && fn:substring(vo.image_url, 0, 1) == 'h' }">
											<img src="${vo.image_url }" width="100" height="100">
										</c:if>
										<c:if test="${!empty vo.image_url && !(fn:substring(vo.image_url, 0, 1) == 'h') }">
											<img src="/resources/img/product/registed_img/${vo.image_url }" width="100" height="100">
										</c:if>
						                <div>${vo.name }</div>
						                <!-- 옵션이 존재한다면 보여주고 아니면 안보임 -->
						                <div>옵션1</div>
						                <div>옵션2</div>
						                <div>${vo.price } <input type="hidden" name="price_list" value="${vo.price }"></div>
						                <div><input type="hidden" name="discount_list" value="${vo.discount }"></div>
						                <br>
						            </td>
						            <td>
						                <button type="button" name="cart_delete" onclick="#">장바구니에서 삭제</button>
						                <input type="number" name="choose_number_list">
						                <br>
						            </td>
						        </tr>
						        <tr>
						        	<td colspan="2">
						        		<hr>
						        	</td>
						       	</tr>
						        
						    </c:forEach>
					        
					    </table>
     				</div>
     				<div>
     					<div>결제 금액</div>
     					<div>
	     					<span>총 주문 가격</span>
	     					<span>[총금액계산식]</span>
     					</div>
						<div>
							<span>할인 금액</span>
							<span>[총 할인 금액]</span>
						</div>     					
							<span>총 배송비</span>
							<span>[총 배송비]</span>
						<div> 
						<div>
							<div>최종 결제액</div>
							<div>[총 결제액]</div>
						</div>

     					
     					
     				</div>
     			</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>