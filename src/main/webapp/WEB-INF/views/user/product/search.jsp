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
		.detail_search input {
				height : 25px;
                padding: 3px 10px;
                font-size: 13px;
                line-height: 20px;
                color: #24292e;
                vertical-align: middle;
                background-color: #ffffff;
                background-repeat: no-repeat;
                background-position: right 8px center;
                border: 1px solid #9CA3AF;
                border-radius: 6px;
                outline: none;
                box-shadow: rgba(225, 228, 232, 0.2) 0px 1px 0px 0px inset;
                :focus{
                    border-color: #0366d6;
                    outline: none;
                    box-shadow: rgba(3, 102, 214, 0.3) 0px 0px 0px 3px;
                }
		}
		.search_type {
			
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
				<div class="category_names">
					<h2>${catekor.category_name[category1]} 
					<c:if test="${category2 != '' && category2 != null}">
						> ${catekor.category[category1][category2] }       
					</c:if></h2><br>
				</div>
				
				<div class="detail_search">
                    <form method="get" name="searchForm"  id="searchForm" onsubmit="return detailsearch();" action="list.do">
                    	<input type="hidden" name="category1" value="${category1}">
                    	<input type="hidden" id="category2" name="category2" value="${category2}">
                    	<input type="hidden" name="totalSearchWord" value="${ProductSearchVO.totalSearchWord}">
                    	<div>
                    	상세검색
                    	<span>
                        	<select class="searchType" name="searchType">
                        		<option value="all">전체</option>
                            	<option value="name" <c:if test="${ProductSearchVO.searchType == 'name'}">selected</c:if>>상품명</option>
                                <option value="company" <c:if test="${ProductSearchVO.searchType == 'company'}">selected</c:if>>제조사명</option>
                                <option value="brand" <c:if test="${ProductSearchVO.searchType == 'brand'}">selected</c:if>>브랜드명</option>
                            </select>
                        </span>
                        <span>
                            <input type="text" name="searchWord" value="${ProductSearchVO.searchWord}" placeholder="카테고리 내 검색">
                            <span class="searchPrice">
                            	가격
	                            <input type="number" id="minprice" name="minprice" placeholder="0" value="${ProductSearchVO.minprice}">~
	                            <input type="number" id="maxprice" name="maxprice" placeholder="999,999,999" value="${ProductSearchVO.maxprice}">
	                            <input type="submit" id="" value="검색">
	                        </span>
                        </span>
                        <br>
                    	</div>
                        정렬
		                <span class="sorttype">
		                	<select name="sorttype" id="sorttype" onchange="changeSorttype();">
		                   		<option value="sortrating">평점순</option>
		                        <option value="sortname" <c:if test="${ProductSearchVO.sorttype == 'sortname'}">selected</c:if>>제품명순</option>
		                        <option value="sortminprice" <c:if test="${ProductSearchVO.sorttype == 'sortminprice'}">selected</c:if>>최저가순</option>
		                        <option value="sortmaxprice" <c:if test="${ProductSearchVO.sorttype == 'sortmaxprice'}">selected</c:if>>최고가순</option>
		           	        </select>
		                </span>
		                <span class="sortnum">
		                  	<select name="numberOfProductInPage" onchange="changeSorttype();">
		                      	<option value="15"  <c:if test="${ProductSearchVO.numberOfProductInPage==15 }">selected</c:if>>15개씩</option>
		                        <option value="25"  <c:if test="${ProductSearchVO.numberOfProductInPage==25 }">selected</c:if>>25개씩</option>
		                        <option value="40"  <c:if test="${ProductSearchVO.numberOfProductInPage==40 }">selected</c:if>>40개씩</option>
		                    </select>
		                </span>
                    </form>
				</div>
				
				<div>
					<c:if test="${empty list }">
						<br>
                    	<h2>등록된 상품이 없습니다.</h2>
					</c:if>
					
					<c:if test="${not empty list }">
					<c:forEach var="product" items="${list}" varStatus="status">
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
							<p style=clear:both;></p>
						</div>
						<c:if test="${status.index%5 == 4}"><p style=clear:both;></p><br></c:if> 
					</c:forEach>
					</c:if>
				</div>
				<div>
																																																													
					<ul class='paging'>
                        <c:if test="${paging.prev }">
                        	<li><a href="list.do?category1=${category1}&category2=${category2 }&page=${paging.startPage-1 }&totalSearchWord=${ProductSearchVO.totalSearchWord}&searchType=${ProductSearchVO.searchType}&searchWord=${ProductSearchVO.searchWord}&sorttype=${ProductSearchVO.sorttype }&minprice=${ProductSearchVO.minprice}&maxprice=${ProductSearchVO.maxprice}&numberOfProductInPage=${ProductSearchVO.numberOfProductInPage}"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                        	<c:if test="${p == ProductSearchVO.page}">
                            	<li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                        	<c:if test="${p != ProductSearchVO.page}">
	                            <c:if test="${empty category2}"><li><a href='list.do?category1=${category1}&category2=9999&page=${p}&totalSearchWord=${ProductSearchVO.totalSearchWord}&searchType=${ProductSearchVO.searchType}&searchWord=${ProductSearchVO.searchWord}&sorttype=${ProductSearchVO.sorttype}&minprice=${ProductSearchVO.minprice}&maxprice=${ProductSearchVO.maxprice}&numberOfProductInPage=${ProductSearchVO.numberOfProductInPage}'>${p}</a></li></c:if>
	                            <c:if test="${!empty category2}"><li><a href='list.do?category1=${category1}&category2=${category2 }&page=${p}&totalSearchWord=${ProductSearchVO.totalSearchWord}&searchType=${ProductSearchVO.searchType}&searchWord=${ProductSearchVO.searchWord}&sorttype=${ProductSearchVO.sorttype}&minprice=${ProductSearchVO.minprice}&maxprice=${ProductSearchVO.maxprice}&numberOfProductInPage=${ProductSearchVO.numberOfProductInPage}'>${p}</a></li></c:if>
                            </c:if>
                         
                            
                        </c:forEach>
                        <c:if test="${paging.next }">
                        	<li><a href="list.do?category1=${category1}&category2=${category2 }&page=${paging.endPage+1 }&totalSearchWord=${ProductSearchVO.totalSearchWord}&searchType=${ProductSearchVO.searchType}&searchWord=${ProductSearchVO.searchWord}&sorttype=${ProductSearchVO.sorttype }&minprice=${ProductSearchVO.minprice}&maxprice=${ProductSearchVO.maxprice}&numberOfProductInPage=${ProductSearchVO.numberOfProductInPage}"> >> </a></li>
                        </c:if>
					</ul> 
				</div>
			</div>
        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
    
    <script>
    	function detailsearch(){
    		var min = document.getElementById("minprice");
    		var max = document.getElementById("maxprice");
    		var category2 = document.getElementById("category2");
    		
    		if( category2.value<0 || category2.value=="" || category2.value==null){
    			category2.value = 9999;
    		}
    		
    		if( min.value<0 || min.value=="" || min.value==null) {
    			min.value = 0;
    		}
    		else if(max.value>999999999 || max.value=="" || max.value==null){
    			max.value = 999999999;
    		}
    		
    		return true;
    	}
    </script>
    <script>
    	function changeSorttype(){
    		var min = document.getElementById("minprice");
    		var max = document.getElementById("maxprice");
			var category2 = document.getElementById("category2");
    		
    		if( category2.value<0 || category2.value=="" || category2.value==null){
    			category2.value = 9999;
    		}
    		if( min.value<0 || min.value=="" || min.value==null) {
    			min.value = 0;
    		}
    		else if(max.value>999999999 || max.value=="" || max.value==null){
    			max.value = 999999999;
    		}
			$('#searchForm').submit();
    	}
    	
    </script>
</body>
</html>