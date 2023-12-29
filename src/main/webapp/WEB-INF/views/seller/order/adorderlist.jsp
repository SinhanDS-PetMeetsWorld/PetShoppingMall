<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>판매자:: 주문 목록</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
    <style>
    	.delivery_table{
    		width:800px;
    		height:100px;
    		text-align: center;
    		border-collapse : collapse;
    		margin-bottom:20px;
    		
    		
    	}
    	.delivery_table tr{
    		height:40px;
    	}
    	
    	.delivery_table tr th{
    		background: linear-gradient(to left, #FFDE30, #ffe76b);
    		border:1px solid black;
    	}
    	
    	.delivery_table tr td{
    		padding:20px;
    	}
    	
    	.pro_name{
    		width:400px;
    	}
    	
    	.pro_opt{
    		width:120px;
    	}
    	.pro_price{
    		width:100px;
    	}
    	.pro_discount{
    		width:100px;
    	}
    	
    	.buyer_info{
			clear:both;
			line-height: 30px;
		}
		.buyer_bold{
			font-weight:bold;
		}
		 .menu_name {
			margin-bottom: 10px;	
		}		
		.selected_tab_button {
			 display: inline-block;
			 outline: 0;
			 cursor: pointer;
			 border-radius: 7px;
			 background: #FFDE30;
			 border:2px solid #FFDE30;
			 font-size: 18px;
			 height: 40px;
			 padding: 0 11px;
			 text-align: center;
			 width: 20%;
			 min-width: 200px;
			 font-weight: 500;
			 color: #0F1111;
			 margin-right: -4px;
			 border-bottom-left-radius: 0%;
			 border-bottom-right-radius: 0%;
			 :hover{
			     background: #F7CA00;
			     border-color: #F2C200;
			     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
			 	}
			 }
			
			 .tab_button {
			 display: inline-block;
			 outline: 0;
			 cursor: pointer;
			 border-radius: 7px;
			 background: #F9FAFB;
			 border:1px solid #FFDE30;
			 font-size: 18px;
			 height: 40px;
			 padding: 0 11px;
			 text-align: center;
			 width: 20%;
			 min-width: 200px;
			 font-weight: 500;
			 color: #0F1111;
			 margin-right: -4px;
			 margin-top: -1px;
			 border-bottom-left-radius: 0%;
			 border-bottom-right-radius: 0%;
			 border-bottom : none;
			 :hover{
			     background: #F7CA00;
			     border-color: #F2C200;
			     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
			 }
 	
 	.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 800px;
	 }
	 }
    </style>
    <style>
	    .messagebody{
			margin-top : 80px;
		}
	    .messagebox{
			margin : 0 auto;
			width : 700px;
			height : 300px;
			text-align : center;
		}
		.messagebox > img {
			margin-bottom : 20px;
		}
    </style>
    
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
				<h1 class = "menu_name">주문 목록</h1>
					<button class="tab_button" type="button" onclick="location.href='/seller/order/bd_orderlist.do'">배송전</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/order/od_orderlist.do'">배송중</button>
					<button class="selected_tab_button" type="button" onclick="location.href='/seller/order/ad_orderlist.do'">배송완료</button>
					<hr class = "start_line">
					
					<c:if test="${empty orderMainList}">
						<div class="messagebody">
							<div class="messagebox">
									<img src="/resources/img/common/emptybox.png">
									<h2>배송 완료된 주문이 없습니다</h2>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty orderMainList}">
					<br>
						<c:forEach var="orders" items="${orderMainList}" varStatus="mainstatus">
							
							<c:if test="${not empty orderDetailList}">
								<c:forEach var="orderdetails" items="${orderDetailList[mainstatus.index]}" varStatus="status">									
									<table border="1" class="delivery_table">
										<thead><tr> <th class="pro_name">제품명</th><th class="pro_opt">옵션</th><th class="pro_price">판매가</th><th class="pro_discount">할인가</th><th class="pro_quantity">수량</th> </tr></thead>
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
											
											<td>${orderdetails.product_price}</td><td>${orderdetails.discount}</td><td>${orderdetails.quantity}</td>
										</tr>
									</table>
									<c:if test="${orderdetails.refound_status != 0}">환불 사유: ${orderdetails.reason}<br></c:if>
									<c:if test='${orderdetails.delivery_no != null && orderdetails.delivery_no != ""}'>
										<c:set var="deliverNo" value="${orderdetails.delivery_no}"/></c:if><br>
								</c:forEach>
							</c:if>
							<div class="buyer_info">
								<span class="buyer_bold">수취인정보</span><br>
								이름: ${orders.user_name } 연락처: ${orders.user_phone } <br>
								우편번호: ${orders.zipcode } 주소: ${orders.addr1 } 상세주소: ${orders.addr2 } <br><br>
								주문일시: ${orders.order_date } 배송상태: 배송완료<br>
								배송 번호: ${deliverNo} <br> 도착일: ${deliveryList[mainstatus.index].due_date}
							</div>
								<br><br><hr><br>
						</c:forEach>
					</c:if>
					
				</div>
			</div>

        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>