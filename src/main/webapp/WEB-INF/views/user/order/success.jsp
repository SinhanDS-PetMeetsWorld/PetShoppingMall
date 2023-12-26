<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>결제 완료</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
    
    <style>
	    .messagebody{
			margin-top : 100px;
		}
	    .messagebox{
			margin : 0 auto;
			width : 700px;
			height : 300px;
			text-align : center;
		}
		.homebtn {
			margin : 40px;
		}
    </style>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>
        
        <div class="contents">
			<div class="contentsright">
				<div class="messagebody">
					<div class="messagebox">
						<div>
							<img src="/resources/img/common/yellow_checkmark.png">
							<h1>결제가 완료되었습니다</h1>
						</div>
						<div>
							<br>마이페이지 > 구매이력 > 상세보기에서 주문하신 상품 목록을 확인할 수 있습니다.
						</div>
						<div class="homebtn">
							<a href="/"><img src="/resources/img/common/returnhomebtn.png"></a>
						</div>
					</div>
				</div>
			</div>
        </div>
        
    </div>
	<div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>