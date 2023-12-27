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
    
<style>

.menu_name {
			margin-bottom: 10px;	
		}	

.info_tag_container {
	
 	height : 40px;
 	width : 1000px;
 	display: flex;
}

.info_tag{
 height : 30px;
 width : 300px;
 float : left;
 text-align : left;
 margin-top : 10px;
}

.info_tag_Range{
 height : 30px;
 width : 230px;
 float : left;
 text-align : left;
 margin-top : 10px;
}

.info_tag_money{
 height : 30px;
 width : 260px;
 float : left;
 text-align : center;
 font-weight : 700;
 font-size: 25px;
 margin-top : 5px;

}

.info_space {
 height : 30px;
 width : 70px;
}

.insert_tag{
 height : 30px;
 width : 400px;
 float : left;
 
 margin-top : 5px;

}

.aaa{
	   background-color: #fff;
       height: 30px;
       width: 185px;
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

.settlementType{
	background-color: #fff;
       height: 30px;
       width: 185px;
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

#searchForm{
padding-top :5px;
}

.info_space {
 height : 30px;
 width : 50px;
}
 
.moneyConfirm {
  display: inline-block;
  outline: 0;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  border: none;
  width: 150px;
  height: 40px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 800;
  text-align:center;
  color: #222;

  margin-top : -5px;
  margin-left : 150px;
 } 

#check {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 6px;
 border: 2px solid #FFDE30;
 color: #0F1111;
 background-color: white;
 padding-left : 10px;
 padding-right : 10px;
 box-shadow: rgba(0, 0, 0, 0.07) 0px 2px 4px 0px, rgba(0, 0, 0, 0.05) 0px 1px 1.5px 0px;
 font-weight: 800;
 font-size: 11px;
 height: 30px;
}

 
.a {
color : red;
font-weight : 800;
} 

#range_contents{
display :none;
}
.money{
    		width:900px;
    		height:100px;
    		text-align: center;
    		border-collapse : collapse;
    		margin-bottom:20px;
    		float:left;
    		
    	}
    
    	.money tr{
    		height:40px;
    	}
    	
    	.money tr th{
    		background: linear-gradient(to left, #FFDE30, #ffe76b);
    		border:1px solid black;
    	}
    	
    	.money tr td{
    		padding:20px;
    	}

.title { 
width : 350px;

}
 .start_line {
 		margin-top : 10px;
 		margin-bottom : 10px;
 		width : 900px;
        border: 1px solid #FFDE30;
} 
 .line {
 		margin-top : 10px;
 		margin-bottom : 10px;
 		width : 900px;
        border: 1px solid #ccc;
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
						<h1 class = "menu_name">정산 관리</h1>
						<hr class ="start_line">
						<div class ="info_tag_container">
							<div class ="info_tag">
								<span>정산 계좌</span>
							</div>
							
							<div class ="insert_tag">
								<input class ="aaa" type="text" placeholder="${bank_name}" disabled>
								<input class ="aaa" type="text" placeholder="${svo.account}" disabled>
							</div>
							
							
						</div>
						
						<hr class ="line">
						
						<div class = "info_tag_container">
							<div class ="info_tag">
								<span>정산 예정액 (구매 확정 미완료)</span>
							</div>
							
							<div class = "info_tag_money">
									<span>${unsettlement_price}원</span>
							</div>
						
						</div>
						
						<hr class ="line">
						
						<div class = "info_tag_container">
							<div class = "info_tag">
									<span> 정산 가능액 (구매 확정 완료)</span>
							</div>
							
							<div class = "info_tag_money">
									<span>${settlement_price - total_charge}원</span>
							</div>
						
							<div class ="insert_tag">
							  		<form method="post" name="deliveryForm"  id="deliveryForm" onsubmit="return get_set();" action="settlement_get.do">
										<input class ="moneyConfirm" "type="submit" id="settlement_btn" value="정산 요청" 
											<c:if test='${settlement_list_count == 0}'> disabled="disabled" </c:if>>
												<input type="hidden" name="seller_no" value="${svo.no}">
						                        <input type="hidden" name="total_settlement" value="${settlement_price}">
	                       						<input type="hidden" name="total_charge" value="${total_charge}">
	                        					<input type="hidden" name="account" value="${svo.account}">
	                        					<input type="hidden" name="bank" value="${svo.bank}">
									</form>	
							</div>
						
						</div>
								
						<hr class = "line">
						*구매 확정된 주문에 대한 정산은 <a class ="a">구매 확정일 기준 익월 1일</a>부터 정산 받기가 가능합니다.<br>
						구매자가 구매 확정하지 않은 주문 건은 중간에 <a class ="a">취소, 환불이 없는 경우 주문일 기준 2주 후 자동으로 구매 확정 처리</a>됩니다.					
						<div class ="info_tag_container"></div>
						<div class ="info_tag_container"></div>
						<div class ="info_tag_container"></div>
						<h1>기간 검색</h1>
						
						
						
						<div class ="info_tag_container">
								<form method="get" name="searchForm"  id="searchForm" onsubmit="return searchlist();" action="settlement_search.do">
										<input class ="aaa" type="text" id="startDate" name="startDate" placeholder="검색 시작 날짜" 
										<c:if test='${startDate != "0"}'>value="${startDate}"</c:if> readonly> ~ 
										<input class ="aaa" type="text" id="endDate" name="endDate" placeholder="검색 끝 날짜" 
										<c:if test='${endDate != "9999"}'>value="${endDate}"</c:if> readonly>
								
		                        	<select class="settlementType" name="settlementType">
		                        		<option value="all">전체</option>
		                            	<option value="completed" <c:if test='${settlementType == "comleted"}'>selected</c:if>>정산 완료</option>
		                                <option value="requseted" <c:if test='${settlementType == "requseted"}'>selected</c:if>>정산 신청</option>
		                                <option value="none" <c:if test='${settlementType == "none"}'>selected</c:if>>정산 미신청</option>
		                            </select>
		                            <input type="hidden" name="settlement_list_count" value="${settlement_list_count}">
		                            <input type="hidden" name="settlement_price" value="${settlement_price}">
		                            <input type="hidden" name="unsettlement_price" value="${unsettlement_price}">
		                            <input type="hidden" name="total_charge" value="${total_charge}">
		                            <input type="submit" id="check" value="목록 보기">
								</form>
								
						</div>
						*<a class ="a">최대 3개월 이내에서 조회</a>하실 수 있습니다
					<hr class ="line">
				</div>
						
									<div>
										<c:if test="${not empty settlement_search_list}">
											<div style="font-weight:bold; font-size:20px;" >
												결제내역 합계 : ${settlement_search_price}<br>
												결제수수료 : ${charge_search_price}<br>
												정산액 : ${settlement_search_price - charge_search_price}
											</div><br>
											<table border="1" class ="money">
												<thead><tr> <th>제품명</th><th>주문일</th><th>구매확정일</th><th>결제금액</th>
															<th>수수료</th><th>정산여부</th> </tr></thead>
												<c:forEach var="orderdetails" items="${settlement_search_list}" varStatus="status">									
													<tr>
														<td class = 'title'>${orderdetails.product_name}</td>
														<td>${orderdetails.order_date}</td>
														<td>${orderdetails.purchase_confirmation_date}</td>
														<td>${(orderdetails.product_price - orderdetails.discount) * orderdetails.quantity}</td>
														<td>${orderdetails.charge}</td>
														<td>
															<c:if test='${orderdetails.settlement_status == 0}'>정산 미신청</c:if>
															<c:if test='${orderdetails.settlement_status == 1}'>정산 요청</c:if>
															<c:if test='${orderdetails.settlement_status == 2}'>정산 완료</c:if>
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
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
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
    
    <script>
    	function get_set(){
    		var total_charge = document.getElementById("total_charge");
    		
    		if( total_charge.value=="" || total_charge.value==null){
    			total_charge.value = 0;
    		}
    		return true;
    	}
    </script>
    
</body>
</html>