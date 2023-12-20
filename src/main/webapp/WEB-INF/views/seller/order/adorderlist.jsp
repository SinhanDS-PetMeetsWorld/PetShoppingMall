<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_seller.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_seller.jsp"%>
            </div>
			<div class="contentsright">
				<div>
				배송중 목록
					<c:if test="${not empty orderMainList}">
						<c:forEach var="orders" items="${orderMainList}" varStatus="mainstatus">
							주문번호: ${orders.no }<br>
							<c:if test="${not empty orderDetailList}">
								<c:forEach var="orderdetails" items="${orderDetailList[mainstatus.index]}" varStatus="status">									
									<table border="1">
										<thead><tr> <th>제품명</th><th>옵션</th><th>판매가</th><th>수량</th> </tr></thead>
										<tr <c:if test="${orderdetails.cancle_status != 0 || orderdetails.refound_status != 0}">style="color:red"</c:if>>
											<td><c:if test="${orderdetails.cancle_status != 0}">(취소)</c:if>
												<c:if test="${orderdetails.refound_status != 0}">(환불)</c:if>
											${orderdetails.product_name}</td>
											<td>
												<c:if test="${not empty orderdetails.options}">
													<c:forEach var="orderoptions" items="${orderdetails.options}" varStatus="status">
														${orderoptions.title} : ${orderoptions.content} <br>
													</c:forEach>
												</c:if>
												<c:if test="${empty orderdetails.options}">옵션없음</c:if>
											
											<td>${orderdetails.product_price}</td><td>${orderdetails.quantity}</td>
										</tr>
									</table><br>
									<c:if test='${orderdetails.delivery_no != null && orderdetails.delivery_no != ""}'>
										<c:set var="deliverNo" value="${orderdetails.delivery_no}"/></c:if>
								</c:forEach>
							</c:if>
								수취인정보<br>
								이름: ${orders.user_name } 연락처: ${orders.user_phone } <br>
								우편번호: ${orders.zipcode } 주소: ${orders.addr1 } 상세주소: ${orders.addr2 } <br><br>
								주문일시: ${orders.order_date } 배송상태: 배송완료<br>
								배송 번호: ${deliverNo} 도착일: ${deliveryList[mainstatus.index].due_date}
								<br><br><hr><br>
						</c:forEach>
					</c:if>
					
				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    
</body>
</html>