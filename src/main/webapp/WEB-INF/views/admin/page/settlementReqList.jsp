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
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        </div>
        <div>
        	<%@ include file="/WEB-INF/views/common/admin_menu.jsp" %>
        </div>
        <div class="contents">
        	<h1>정산 요청 목록</h1>
        	<div>
				<c:if test="${empty settlementReqList}">정산 내역이 없습니다</c:if><br>
				<c:if test="${not empty settlementReqList}">
				<form name="settlement_form" id="settlement_form">
					<table border="1">
						<thead><tr> <th>정산번호</th><th>판매자번호</th><th>정산요청일</th><th>매출액</th>
									<th>수수료</th><th>정산액</th><th>은행명</th><th>정산계좌</th><th>승인하기</th> </tr></thead>
						<c:forEach var="settlementReqList" items="${settlementReqList}" varStatus="status">									
							<tr>
								<td>${settlementReqList.no}</td>
								<td>${settlementReqList.seller_no}</td>
								<td>${settlementReqList.request_date}</td>
								<td>${settlementReqList.total_sales}</td>
								<td>${settlementReqList.total_charge}</td>
								<td>${settlementReqList.total_settlement}</td>
								<td>${paymentVO.company_list[1][settlementReqList.bank] }</td>
								<td>${settlementReqList.account}</td>
								<td><button type="button" value="${settlementReqList.no}" class="acceptbutton">정산승인</button></td>
							</tr>
							<input type="hidden" name="settlement_no" class="settleno" value="${settlementReqList.no}">
						</c:forEach>
				</table><br>
					<button type="button" id="acceptAllbutton">전체 일괄 정산하기</button>
				</form>
				</c:if>
			</div>
        </div>
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    
    <script>
		$('.acceptbutton').click(function() {
			var settlement_no = $(this).val();
			$.ajax({
				type: "GET",
				url:'updateSettlement.do',
				data: {"settlement_no" : settlement_no},
				async: false,
				success:function(res) {
					if (res == 'true') {
						alert('정산을 완료했습니다.');
						location.href="/admin/getSettlementReqList.do";
					} else {
						alert('정산에 실패했습니다.');
					}
				}
			})
		})
	</script>
	
	<script>
		$('#acceptAllbutton').click(function() {
			var settlement_list = $('#settlement_form').serialize();
			console.log(settlement_list);
			
			$.ajax({
				type: "GET",
				url:'updateAllSettlement.do',
				data: settlement_list,
				async: false,
				success:function(res) {
					if (res == 'true') {
						alert('전체 정산을 완료했습니다.');
						location.href="/admin/getSettlementReqList.do";
					} else {
						alert('전체 정산에 실패했습니다.');
					}
				}
			})
		})
	</script>
	
</body>
</html>