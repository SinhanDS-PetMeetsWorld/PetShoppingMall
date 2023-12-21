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
				<h2>배송전 목록</h2><br>
					<c:if test="${not empty orderMainList}">
						<c:forEach var="orders" items="${orderMainList}" varStatus="mainstatus">
							주문번호: ${orders.no }<br>
							<c:set var="allcanclecheck" value="true"/>
							
							<c:if test="${not empty orderDetailList}">
								<c:forEach var="orderdetails" items="${orderDetailList[mainstatus.index]}" varStatus="status">
									${orderdetails.no}
									<table border="1">
										<thead><tr> <th>제품명</th><th>옵션</th><th>판매가</th><th>할인가</th><th>수량</th> </tr></thead>
										<tr <c:if test="${orderdetails.cancle_status != 0}">style="color:red"</c:if>>
											<td><c:if test="${orderdetails.cancle_status != 0}">(취소)</c:if>${orderdetails.product_name}</td>
											<td>
												<c:if test="${not empty orderdetails.options}">
													<c:forEach var="orderoptions" items="${orderdetails.options}" varStatus="status">
														${orderoptions.title} : ${orderoptions.content} <br>
													</c:forEach>
												</c:if>
												<c:if test="${empty orderdetails.options}">옵션없음</c:if>
												<td>${orderdetails.product_price}</td><td>${orderdetails.discount}</td><td>${orderdetails.quantity}</td>
											
											<c:if test='${orderdetails.cancle_status == 0}'><c:set var="allcanclecheck" value="false"/></c:if>
										</tr>
									</table>
									<c:if test="${orderdetails.cancle_status != 0}">취소 사유: ${orderdetails.reason}</c:if>
									<c:if test="${orderdetails.cancle_status == 0}">
										<button type="button" value="${orderdetails.no}" class="canclebutton">주문취소</button>
									</c:if>
									<br><br>
								</c:forEach>
								
								수취인정보<br>
								이름: ${orders.user_name } 연락처: ${orders.user_phone } <br>
								우편번호: ${orders.zipcode } 주소: ${orders.addr1 } 상세주소: ${orders.addr2 } <br><br>
								주문일시: ${orders.order_date } 배송상태: 배송준비<br>
									<form method="post" name="deliveryForm"  id="deliveryForm" action="regist_deliver.do">
									
									<input type="submit" id="regist_del" value="배송시작" <c:if test='${allcanclecheck == "true"}'> disabled="disabled" </c:if>>
									
									<input type="hidden" name="receiver_name" value="${orders.user_name}">
									<input type="hidden" name="receiver_phone" value="${orders.user_phone}">
									<input type="hidden" name="receiver_zipcode" value="${orders.zipcode}">
									<input type="hidden" name="receiver_addr1" value="${orders.addr1}">
									<input type="hidden" name="receiver_addr2" value="${orders.addr2}">
									<input type="hidden" name="sender_name" value="${svo.name}">
									<input type="hidden" name="sender_phone" value="${svo.phone}">
									<input type="hidden" name="sender_zipcode" value="${svo.zipcode}">
									<input type="hidden" name="sender_addr1" value="${svo.addr1}">
									<input type="hidden" name="sender_addr2" value="${svo.addr2}">
									<input type="hidden" name="order_no" value="${orders.no}">
									<input type="hidden" name="seller_no" value="${svo.no}">
									</form>	
								
								<br><br><hr><br>
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
    
	<script>
		$('.canclebutton').click(function() {
			var order_detail_no = $(this).val();
			$.ajax({
				type: "GET",
				url:'order_cancle.do',
				data: {"order_detail_no" : order_detail_no},
				async: false,
				success:function(res) {
					if (res == 'true') {
						alert('주문을 취소했습니다.');
						location.href="/seller/order/bd_orderlist.do";
					} else {
						alert('주문 취소에 실패했습니다.');
					}
				}
			})
		})
	</script>	
	
</body>
</html>