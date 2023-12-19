<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
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
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
					<div>	
						회원 번호 : ${userLoginInfo.no } <br>
						
					<h1>작성 가능한 리뷰</h1>
					
					
				<c:forEach items="${possible_write_review2}" varStatus = "possible_write_review" >
					<c:if test="${!empty possible_write_review2[possible_write_review.index] }">
						<div>
							<div class="goods-photo">
								<c:if test="${empty possible_write_review2[possible_write_review.index][0]}">
									<img src="/resources/img/product/no_image.jpg" width="100" height="100">
								</c:if>
								<c:if test="${!empty possible_write_review2[possible_write_review.index][0] && fn:substring(possible_write_review2[possible_write_review.index][0], 0, 1) == 'h' }">
									<img src="${possible_write_review2[possible_write_review.index][0] }" width="100" height="100">
								</c:if>
								<div>	
									<c:if test="${!empty possible_write_review2[possible_write_review.index][0] && !(fn:substring(possible_write_review2[possible_write_review.index][0], 0, 1) == 'h') }">
										<img src="/resources/img/product/review_img/${possible_write_review2[possible_write_review.index][0]}" width="100" height="100"><br>
									</c:if>
								</div>		
							</div>
								
							<div>	
								<c:if test="${!empty possible_write_review2[possible_write_review.index][1] }">
									상품명: ${possible_write_review2[possible_write_review.index][1]} <br>
								</c:if>
								
								<c:if test="${!empty possible_write_review2[possible_write_review.index][2] }">
									가격:	${possible_write_review2[possible_write_review.index][2]} <br>
								</c:if>
								
								<c:if test="${!empty possible_write_review2[possible_write_review.index][3] }">
									구매 확정 일자:	${possible_write_review2[possible_write_review.index][3]} <br>
								</c:if>
							
							
							</div>
								
							<div>
								
								<c:if test="${!empty possible_write_review2[possible_write_review.index][4] }">
									상품 번호:	${possible_write_review2[possible_write_review.index][4]} <br>
								</c:if>
								<button type ="button" name="go_review_write" onclick="goReviewWrtie_popup()">리뷰 작성 </button>
								<br>
							</div>	
								
							
						</div>
					</c:if>
			   </c:forEach>			
				</div>
			</div>
        </div>
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>    
<script>

function goQnawrite_popup(){
	var product_no = ${product_no};
	var qnaWrite = 'qnawrite.do?no='+ product_no;
	window.open(qnaWrite , 'Q&A등록', 'width=500, height=600');
}

</script>
</body>
</html>