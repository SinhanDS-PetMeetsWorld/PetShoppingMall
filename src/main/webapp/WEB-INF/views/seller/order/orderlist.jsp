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
					
					<c:if test="${not empty orderMainList}">
						<c:forEach var="orders" items="${orderMainList}" varStatus="status">
							주문번호: ${orders.no }<br>
							<c:if test="${not empty orderDetailList}">
								<c:forEach var="orderdetails" items="${orderDetailList[status.index]}" varStatus="status">
									<table border="1">
										<thead><tr> <th>제품명</th><th>옵션</th><th>판매가</th><th>수량</th> </tr></thead>
										<tr <c:if test="${orderdetails.cancle_status != 0}">style="color:red"</c:if>>
											<td>${orderdetails.product_name} <c:if test="${orderdetails.cancle_status != 0}">(취소)</c:if></td>
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
									
								</c:forEach>
								수취인정보<br>
								이름: ${orders.user_name } 연락처: ${orders.user_phone } <br>
								우편번호: ${orders.zipcode } 주소: ${orders.addr1 } ${orders.addr2 } <br><br>
								주문일시: ${orders.order_date } 배송상태:(주문상세마다 있는데 어떡하죠)<br>
								운송장 번호:판매자입력 도착예정일:배송 시작한 뒤에만<br><br><hr><br>
							</c:if>
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