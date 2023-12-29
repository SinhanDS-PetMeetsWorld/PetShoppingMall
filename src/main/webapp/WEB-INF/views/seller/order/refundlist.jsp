<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>판매자:: 환불 목록</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
    <style>
    	
    	.refund_table{
    		width:920px;
    		height:100px;
    		text-align: center;
    		border-collapse : collapse;
    		margin-bottom:20px;
    		
    	}
    
    	.refund_table tr{
    		height:40px;
    	}
    	
    	.refund_table tr th{
    		background: linear-gradient(to left, #FFDE30, #ffe76b);
    		border:1px solid black;
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
    	.pro_refund_status{
    		width:120px;
    	}
    	
    	
    	.delivery_table tr td{
    		padding:20px;
    	}
    	
		.refunder_info{
			
			line-height: 30px;
		}
		.refunder_bold{
			font-weight:bold;
		}
		
		.acceptbutton {
			 outline: 0;
			 border: none;
			 cursor: pointer;
			 padding: 0 24px;
			 border-radius: 50px;
			 width: 150px;
			 height: 40px;
			 font-size: 15px;
			 background-color: #fd0;
			 font-weight: 500;
			 color: #222;
			 margin:20px 0 20px 0;
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
    </style>
    <style>
	    .messagebody{
			margin-top : 50px;
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
				<h1 class = "menu_name">환불 목록</h1>
					<button class="selected_tab_button" type="button" onclick="location.href='/seller/order/refundlist.do'">환불요청</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/order/refundendlist.do'">환불완료</button>
					<hr class = "start_line"><br>
					<c:if test="${empty orderMainList}">
						<div class="messagebody">
							<div class="messagebox">
									<img src="/resources/img/common/emptybox.png">
									<h2>환불 요청이 없습니다</h2>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty orderMainList}">
						<c:forEach var="orders" items="${orderMainList}" varStatus="mainstatus">
							<c:set var="deliverStatus" value="배송시작"/>
							
							<c:if test="${not empty orderDetailList}">
								<c:forEach var="orderdetails" items="${orderDetailList[mainstatus.index]}" varStatus="status">
									<c:if test="${orderdetails.delivery_status == 2}"><c:set var="deliverStatus" value="배송완료"/></c:if>
									<table border="1" class="refund_table">
										<thead><tr> <th class="pro_name">제품명</th><th class="pro_opt">옵션</th><th class="pro_price">판매가</th><th class="pro_discount">할인가</th><th class="pro_quantity">수량</th> </tr></thead>
										<tr <c:if test="${orderdetails.refound_status == 1}">style="color:red"</c:if>>
											<td>${orderdetails.product_name}</td>
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
									환불 사유: ${orderdetails.reason}<br>
									<c:if test="${orderdetails.cancle_status == 0}">
										<button type="button" value="${orderdetails.no}" class="acceptbutton">환불승인</button>
									</c:if>
								</c:forEach>
								<div class="refunder_info">
								<span class="refunder_bold">환불자정보</span><br>
								이름: ${orders.user_name } 연락처: ${orders.user_phone } <br>
								주문일시: ${orders.order_date } 배송상태: ${deliverStatus}<br>
								
								<c:if test='${deliverNo != null && deliverNo != ""}'>
									운송장 번호: ${orderdetails.delivery_no}
									<c:if test='${deliverStatus == "배송시작"}'>도착예정일: ${deliveryList[mainstatus.index].due_date}</c:if>
									<c:if test='${deliverStatus == "배송완료"}'>도착일: ${deliveryList[mainstatus.index].arrival_date}</c:if>
								</c:if>
								</div>
								<br><hr><br>
							</c:if>
						</c:forEach>
					</c:if>
					
				</div>
			</div>

        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
    <script>
		$('.acceptbutton').click(function() {
			var order_detail_no = $(this).val();
			$.ajax({
				type: "GET",
				url:'refund_accept.do',
				data: {"order_detail_no" : order_detail_no},
				async: false,
				success:function(res) {
					if (res == 'true') {
						alert('환불을 완료했습니다.');
						location.href="/seller/order/refundlist.do";
					} else {
						alert('환불에 실패했습니다.');
					}
				}
			})
		})
	</script>
	
</body>
</html>