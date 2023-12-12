<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
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
    		margin : 20px;
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
        	
			<div class="contentsright">
				
				<div>
					<h2>${catekor.category_name[0]} (총 ${product_count0}건)</h2> 보러가기<br>
					<c:if test="${empty list0 }">
						<br>
                    	<h2>해당 카테고리로 등록된 상품이 없습니다.</h2>
					</c:if>
					
					<c:if test="${not empty list0 }">
					<c:forEach var="product" items="${list0}" varStatus="status">
						<div class="product_preview">
							<div>
								<a href="goods.do?no=${product.no }">
								<c:if test="${empty product.image_url }">
									<img src="/resources/img/product/no_image.jpg" width="160" height="180">
								</c:if>
								<c:if test="${!empty product.image_url && fn:substring(product.image_url, 0, 1) == 'h' }">
									<img src="${product.image_url }" width="160" height="180">
								</c:if>
								<c:if test="${!empty product.image_url && !(fn:substring(product.image_url, 0, 1) == 'h') }">
									<img src="/resources/img/product/registed_img/${product.image_url }" width="160" height="180">
								</c:if>
								</a>
							</div>
							<div class="product_preview_name">
								<a href="goods.do?no=${product.no }">
								${product.name}</a>
							</div>
							<div class="product_preview_info">
								<div class="product_preview_price"><strong>${product.price}</strong>원</div>
								<div class="product_preview_rating">
									<img src="/resources/img/common/star.jpg" width="15px" height="15px">
									${product.rating}
								</div>
							</div>
						</div> 
					</c:forEach><p style=clear:both;></p>
					</c:if>
				</div><br>
				
				<div>
					<h2>${catekor.category_name[1]} (총 ${product_count1}건)</h2> 보러가기<br>
					<c:if test="${empty list1 }">
						<br>
                    	<h2>해당 카테고리로 등록된 상품이 없습니다.</h2>
					</c:if>
					
					<c:if test="${not empty list1 }">
					<c:forEach var="product" items="${list1}" varStatus="status">
						<div class="product_preview">
							<div>
								<a href="goods.do?no=${product.no }">
								<c:if test="${empty product.image_url }">
									<img src="/resources/img/product/no_image.jpg" width="160" height="180">
								</c:if>
								<c:if test="${!empty product.image_url && fn:substring(product.image_url, 0, 1) == 'h' }">
									<img src="${product.image_url }" width="160" height="180">
								</c:if>
								<c:if test="${!empty product.image_url && !(fn:substring(product.image_url, 0, 1) == 'h') }">
									<img src="/resources/img/product/registed_img/${product.image_url }" width="160" height="180">
								</c:if>
								</a>
							</div>
							<div class="product_preview_name">
								<a href="goods.do?no=${product.no }">
								${product.name}</a>
							</div>
							<div class="product_preview_info">
								<div class="product_preview_price"><strong>${product.price}</strong>원</div>
								<div class="product_preview_rating">
									<img src="/resources/img/common/star.jpg" width="15px" height="15px">
									${product.rating}
								</div>
							</div>
						</div> 
					</c:forEach><p style=clear:both;></p>
					</c:if>
				</div><br>
				
				<div>
					<h2>${catekor.category_name[2]} (총 ${product_count2}건)</h2> 보러가기<br>
					<c:if test="${empty list2 }">
						<br>
                    	<h2>해당 카테고리로 등록된 상품이 없습니다.</h2>
					</c:if>
					
					<c:if test="${not empty list2 }">
					<c:forEach var="product" items="${list2}" varStatus="status">
						<div class="product_preview">
							<div>
								<a href="goods.do?no=${product.no }">
								<c:if test="${empty product.image_url }">
									<img src="/resources/img/product/no_image.jpg" width="160" height="180">
								</c:if>
								<c:if test="${!empty product.image_url && fn:substring(product.image_url, 0, 1) == 'h' }">
									<img src="${product.image_url }" width="160" height="180">
								</c:if>
								<c:if test="${!empty product.image_url && !(fn:substring(product.image_url, 0, 1) == 'h') }">
									<img src="/resources/img/product/registed_img/${product.image_url }" width="160" height="180">
								</c:if>
								</a>
							</div>
							<div class="product_preview_name">
								<a href="goods.do?no=${product.no }">
								${product.name}</a>
							</div>
							<div class="product_preview_info">
								<div class="product_preview_price"><strong>${product.price}</strong>원</div>
								<div class="product_preview_rating">
									<img src="/resources/img/common/star.jpg" width="15px" height="15px">
									${product.rating}
								</div>
							</div>
						</div> 
					</c:forEach><p style=clear:both;></p>
					</c:if>
				</div>
				
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    
</body>
</html>