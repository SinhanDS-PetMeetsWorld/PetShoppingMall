<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
    
    <style>
    	.product_preview{
    		float : left;
    		margin-right : 40px;
    	}
	    .product_preview_name{
			width        : 160px;
			text-overflow: ellipsis;
			word-wrap : break-word;
			overflow     : hidden;
			display      : inline-block;
			max-height: 44px;
			line-height: 21px;
			white-space : nowrap;
		}
		.product_preview_info{
			width : 160px;
			height : 28px;
		}
		.product_preview_price{
			width : 70%;
			float : left;
			font-size : 120%
		}
		.product_preview_rating{
			width : 30%;
			float: right;
			text-align: right;
		}
    </style>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_product_category.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<c:forEach var="product" items="${list}" varStatus="status">
						<div class="product_preview">
							<div><img src="${product.image_url }" width="160px" height="190px"></div>
							<div class="product_preview_name">${product.name}</div>
							<div class="product_preview_info">
								<div class="product_preview_price"><strong>${product.price}</strong>원</div>
								<div class="product_preview_rating">
									<img src="/resources/img/common/star.jpg" width="15px" height="15px">
									${product.rating}
								</div>
							</div>
							<p style=clear:both;></p>
						</div>
						
						<c:if test="${status.index%5 == 4}"><p style=clear:both;></p><br></c:if> 
					</c:forEach>
				</div>
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>