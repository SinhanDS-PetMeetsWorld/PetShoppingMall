<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>관리자: 정산 완료 목록</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<style>
	.contents{
		text-align:center;
	}
	
	.contents table{
	    margin-left:auto; 
    	margin-right:auto;
	}
</style>

<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        </div>
        <div>
        	<%@ include file="/WEB-INF/views/common/admin_menu.jsp" %>
        </div>
        <div class="contents">
        	<h1>정산 완료 목록</h1>
        	<c:if test="${empty settlementComList}">정산 내역이 없습니다</c:if><br>
			<c:if test="${not empty settlementComList}">
				<table border="1">
					<thead><tr> <th>정산번호</th><th>판매자번호</th><th>정산요청일</th><th>정산완료일</th><th>매출액</th>
								<th>수수료</th><th>정산액</th><th>은행명</th><th>정산계좌</th> </tr></thead>
					<c:forEach var="settlementComList" items="${settlementComList}" varStatus="status">									
						<tr>
							<td>${settlementComList.no}</td>
							<td>${settlementComList.seller_no}</td>
							<td>${settlementComList.request_date}</td>
							<td>${settlementComList.settlement_date}</td>
							<td>${settlementComList.total_sales}</td>
							<td>${settlementComList.total_charge}</td>
							<td>${settlementComList.total_settlement}</td>
							<td>${paymentVO.company_list[1][settlementComList.bank] }</td>
							<td>${settlementComList.account}</td>
						</tr>
					</c:forEach>
				</table><br>
			</c:if>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>