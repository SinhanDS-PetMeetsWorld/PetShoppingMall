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
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
				<div id="cart_content" width='50%'>
					<h1>장바구니</h1>
					<form name="cart_list" action="#" method="get">
					    <table style="border: 1px solid #FFDE30; border-collapse: collapse;" width="800" >
					        
					        <!--주소가 존재하는만큼 td를 생성-->
						    <c:forEach var="vo" items="${productvolist }" varStatus="status">
						    	
						        <tr width="800">
						            <td>
						                <br>
						                <input type="hidden" name="product_no_list" value="${vo.no }">
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
						                <div>${vo.name } <input type="hidden" name="name_list" value="${vo.name }"></div>
						                <!-- 옵션이 존재한다면 보여주고 아니면 안보임 -->
						                <c:forEach var="vo2" items="${optionlist[status.index] }">
							                <span>${vo2.title} <input type="hidden" name="option_title" value="${vo2.title }"></span>
							                <span>${vo2.content} <input type="hidden" name="option_content" value="${vo2.content }"></span>
							                <br>
						                </c:forEach> 
						                <c:forEach var="cart_option" items="${cartoptionvolist }">
							             	<c:forEach var="cart_option2" items="${cart_option }">
							                	<c:if test="${vo.no eq cart_option2.cart_no }">
							                		<div>${cart_option2.option_no }</div>
							                	</c:if>
						             		</c:forEach>
						                </c:forEach>
						                <div>${vo.price } <input type="hidden" name="price_list" value="${vo.price }"></div>
						                <div><input type="hidden" name="discount_list" value="${vo.discount }"></div>
					
						                <input type="hidden" name="company_list" value="${vo.company }">
						                <input type="hidden" name="brand_list" value="${vo.brand }">
						                <br>
						            </td>
						            <td>
						                <button type="button" name="cart_delete" onclick="#">장바구니에서 삭제</button>
						                <input type="number" name="quantity_list" id="quantity_list[${status.index }]" value=1>
						                
						               
						                
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
					    </form>
     				</div>
     				<div>
     					<div>결제 금액</div>
     					<div>
	     					<span>총 주문 가격</span>
	     					<span>[총금액계산식] 각 상품에서 수량 곱하기 가격 더하기 </span>
     					</div>
						<div>
							<span>할인 금액</span>
							<span>[총 할인 금액] 각 상품에서 디스카운터 다 더하기</span>
						</div>     					
							<span>총 배송비</span>
							<span>[총 배송비] 각 상품에 배송비 다 더하기</span>
						<div> 
						<div>
							<div>최종 결제액</div>
							<div>[총 결제액] span 태그에 아이디를 줘서 총금액에서 -할인 + 배송비</div>
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