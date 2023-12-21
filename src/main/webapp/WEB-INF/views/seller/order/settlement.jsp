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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" type="text/css">
    
    <script>
    	$(function(){
    		$("#startDate").datepicker({
    			dayNamesMin : ['월', '화', '수', '목', '금', '토', '일'],
    			dayNames : ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    			monthNamesShort : ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
    			monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    			dateFormat : "yy-mm-dd",
    			minDate : "-90D",
    			maxDate : "+oD"
    		});
    	});
    </script>
    <script>
    	$(function(){
    		$("#endDate").datepicker({
    			dayNamesMin : ['월', '화', '수', '목', '금', '토', '일'],
    			dayNames : ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    			monthNamesShort : ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
    			monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    			dateFormat : "yy-mm-dd",
    			minDate : "-90D",
    			maxDate : "+oD"
    		});
    	});
    </script>
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
					
					정산 계좌 <input type="text" placeholder="${svo.bank}" disabled>
							<input type="text" placeholder="${svo.account}" disabled><br><br><hr><br>
					정산 가능액 ${settlement_price - charge}원
					<form method="post" name="deliveryForm"  id="deliveryForm" action="settlement_get.do">
						<input type="submit" id="settlement_btn" value="정산받기" 
							<c:if test='${settlement_list == 0}'> disabled="disabled" </c:if>>
                        <input type="hidden" name="settlement_price" value="${settlement_price}">
                        <input type="hidden" name="charge" value="${charge}">
					</form>	
					<br><hr><br>
					정산 예정액 ${unsettlement_price}원<br><br><hr><br>
					*구매 확정된 주문에 대한 정산은 구매 확정일 기준 익월 1일부터 정산 받기가 가능합니다.<br>
					구매자가 구매 확정하지 않은 주문 건은 중간에 취소, 환불이 없는 경우 주문일 기준 2주 후 자동으로 구매 확정 처리됩니다.<br><br>
					<form method="get" name="searchForm"  id="searchForm" onsubmit="return searchlist();" action="settlement_search.do">
						조회 기간
							<input type="text" id="startDate" name="startDate" placeholder="검색 시작 날짜" 
							<c:if test='${startDate != "0"}'>value="${startDate}"</c:if> readonly> ~ 
							<input type="text" id="endDate" name="endDate" placeholder="검색 끝 날짜" 
							<c:if test='${endDate != "9999"}'>value="${endDate}"</c:if> readonly>
							*최대 3개월 이내에서 조회하실 수 있습니다<br>
						정산 상태
                        	<select class="settlementType" name="settlementType">
                        		<option value="all">전체</option>
                            	<option value="yes" <c:if test='${settlementType == "yes"}'>selected</c:if>>정산 받음</option>
                                <option value="no" <c:if test='${settlementType == "no"}'>selected</c:if>>정산 안받음</option>
                            </select>
                            <input type="hidden" name="settlement_list" value="${settlement_list}">
                            <input type="hidden" name="settlement_price" value="${settlement_price}">
                            <input type="hidden" name="unsettlement_price" value="${unsettlement_price}">
                            <input type="submit" id="" value="목록 보기">
					</form><br>
					
					<div>
						<c:if test="${empty settlement_search_list}">정산 내역이 없습니다</c:if><br>
						<c:if test="${not empty settlement_search_list}">
							결제내역 합계 : ${settlement_search_price}<br>
							결제수수료 : ${charge_search_price}<br>
							결제금액 - 수수료 : ${settlement_search_price - charge_search_price}<br>
							<table border="1">
								<thead><tr> <th>제품명</th><th>주문일</th><th>구매확정일</th><th>결제금액</th>
											<th>수수료</th><th>정산여부</th> </tr></thead>
								<c:forEach var="orderdetails" items="${settlement_search_list}" varStatus="status">									
									<tr>
										<td>${orderdetails.product_name}</td>
										<td>${orderdetails.order_date}</td>
										<td>${orderdetails.purchase_confirmation_date}</td>
										<td>${orderdetails.product_price - orderdetails.discount}</td>
										<td>${orderdetails.charge}</td>
										<td>
											<c:if test='${orderdetails.settlement_no != null && orderdetails.settlement_no != ""}'>정산받음</c:if>
											<c:if test='${orderdetails.settlement_no == null || orderdetails.settlement_no == ""}'>정산안받음</c:if>
										</td>
									</tr>
								</c:forEach>
							</table><br>
						</c:if>
					</div>
				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    
    <script>
    	function searchlist(){
    		var startDate = document.getElementById("startDate");
    		var endDate = document.getElementById("endDate");
    		
    		if( startDate.value=="" || startDate.value==null){
    			startDate.value = "0";
    		}
    		
    		if( endDate.value=="" || endDate.value==null) {
    			endDate.value = "9999";
    		}
    		console.log(startDate.value);
    		console.log(endDate.value);
    		return true;
    	}
    </script>
    
</body>
</html>