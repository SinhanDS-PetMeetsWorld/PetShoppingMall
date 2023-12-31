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
			clear:both;
			line-height: 30px;
		}
		.refunder_bold{
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
		
		.paging_div{
			height:30px;	
			text-align:center;
			width:1000px;
			clear:both;
			margin-bottom:15px;
		}
		
		
		.paging li{
			list-style: none;
			margin-right:8px;
			margin-top:15px;
			
			text-align:center;
			display:inline-block;
		}
		
		.paging li a{
			width:20px;
			height:20px;
			background: white;
			border-radius: 4px;
			border: 1px solid black;
			text-decoration: none;
			font-size:13px;
			color:black;
			display:block;
			line-height:18px;
		}
		
		
		
		.paging li a:hover{
			width:20px;
			height:20px;
			background: black;
			color:white;
			
		}
		
		.bbsSearch{
			width:1000px;
			text-align:center;
		}
		
		.search_keyword_btn{
			background-color:#FFDE30;
			border:1px solid gray;
			width:40px;
		}
		
		.aaa4{
			background-color: #fff;
			height: 30px;
			width: 80px;
			padding: 3px 7px;
			line-height: normal;
			border: 1px solid #a6a6a6;
			border-top-color: #949494;
			border-radius: 3px;
			box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
			outline: 0;
			color: #111;
			font-size: 13px;
			
			:focus{
				border-color: #e77600;
				box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
			}
		}
		
		.searchWord input{
			height:30px;
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
					<button class="tab_button" type="button" onclick="location.href='/seller/order/refundlist.do'">환불요청</button>
					<button class="selected_tab_button" type="button" onclick="location.href='/seller/order/refundendlist.do'">환불완료</button>
					<hr class = "start_line"><br>
					<c:if test="${empty orderMainList}">
						<div class="messagebody">
							<div class="messagebox">
									<img src="/resources/img/common/emptybox.png">
									<h2>환불 완료된 목록이 없습니다</h2>
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
									<br>
								</c:forEach>
								<div class="refunder_info">
								<br>
								<span class="refunder_bold">환불자정보</span>
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
				
				<div class="paging_div">
					<ul class='paging'>
                        <c:if test="${paging.prev }">
                        	<li><a href="/seller/order/refundendlist.do?page=${paging.startPage-1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                        	<c:if test="${p == productSearchVO.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != productSearchVO.page}">
                            <li><a href='/seller/order/refundendlist.do?page=${p}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${paging.next }">
                        	<li><a href="/seller/order/refundendlist.do?page=${paging.endPage+1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}"> >> </a></li>
                        </c:if>
					</ul> 
				</div>
				
                <div class="bbsSearch">
                    <form method="get" name="searchForm" id="searchForm" action="/seller/order/refundendlist.do">
                        <span class="srchSelect">
                            <select class="aaa4" name="searchType">
                                <option value="product_name" <c:if test="${productSearchVO.searchType == 'product_name'}">selected</c:if>>상품명</option>
                            </select>
                        </span>
                        <span class="searchWord">
                            <input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
                            <input type="submit" class="search_keyword_btn" value="검색">
                        </span>
                    </form>
                    
                </div>			
			</div>

        </div>
    </div>
   	<div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>