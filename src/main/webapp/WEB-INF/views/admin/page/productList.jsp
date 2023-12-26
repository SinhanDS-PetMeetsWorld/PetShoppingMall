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

<style>
	.paging_div{
		height:30px;	
		text-align:center;
		width:1200px;
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
	
	.paging li button{
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
	
	
	
	.paging li button:hover{
		width:20px;
		height:20px;
		background: black;
		color:white;
		cursor:pointer;
		
	}
	
	.bbsSearch{
		width:1200px;
		text-align:center;
	}
	
	.search_keyword_btn{
		background-color:#FFDE30;
		border:1px solid gray;
		width:40px;
	}
	
	.bbb7{
		background-color: #fff;
		height: 30px;
		width: 140px;
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
	
	.bbb8{
		background-color: #fff;
		height: 30px;
		width: 110px;
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
	.contents{
		text-align:center;
	}
	
	.contents table{
	    margin-left:auto; 
    	margin-right:auto;
	}
</style>


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
        	<h1>상품 목록 조회</h1>
        	<table border='1'>
        		<tr>
					<td>상품번호</td>
					<td>판매자 번호</td>
					<td>상품 명</td>
					<td>가격</td>
					<td>재고</td>
					<td>제조사</td>
					<td>브랜드</td>
					<td>평점</td>
					<td>리뷰 건수</td>
        		</tr>
        	
	        	<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.no }</td>
						<td>${vo.seller_no }</td>
						<td>${vo.name }</td>
						<td>${vo.price }</td>
						<td>${vo.stock }</td>
						<td>${vo.company }</td>
						<td>${vo.brand }</td>
						<td>${vo.rating }</td>
						<td>${vo.review_cnt }</td>
	        		</tr>
	        	</c:forEach>
        	</table>
        	
        	<div class="paging_div">
		   		<ul class='paging'>
		            <c:if test="${paging.prev }">
		            	<li><button class="pageButton" data-page="${paging.startPage-1 }"> << </button></li>
		            </c:if>
		            <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
		            	<c:if test="${p == svo.page}">
			            	<li> <button data-page=${p }>${p }</button></li>
		                </c:if>
		                <c:if test="${p != svo.page}">
		                	<li> <button class="pageButton" data-page=${p }>${p }</button></li>
		                </c:if>
		            </c:forEach>
		            <c:if test="${paging.next }">
		            	<li><button class="pageButton" data-page="${paging.endPage+1 }"> >> </button></li>
		            </c:if>
				</ul> 
		   	</div>
			<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="/admin/productList.do">
	            	<span class="sortSelect">
						<select class="bbb7" name="sorttype">
							<option value="maxprice" <c:if test="${productSearchVO.sorttype == 'maxprice'}">selected</c:if>>높은 가격 순</option>
							<option value="minprice" <c:if test="${productSearchVO.sorttype == 'minprice'}">selected</c:if>>낮은 가격 순</option>
							<option value="maxrating" <c:if test="${productSearchVO.sorttype == 'maxrating'}">selected</c:if>>높은 평점 순</option>
							<option value="minrating" <c:if test="${productSearchVO.sorttype == 'minrating'}">selected</c:if>>낮은 평점 순</option>
							<option value="review_cnt" <c:if test="${productSearchVO.sorttype == 'review_cnt'}">selected</c:if>>리뷰 개수 순</option>
						</select>	
	            	</span>
					<span class="srchSelect">
						<select class="bbb8" name="searchType">
							<option value="all">전체</option>
							<option value="name" <c:if test="${productSearchVO.searchType == 'name'}">selected</c:if>>상품명</option>
							<option value="seller_no" <c:if test="${productSearchVO.searchType == 'seller_no'}">selected</c:if>>판매자 번호</option>
							<option value="company" <c:if test="${productSearchVO.searchType == 'company'}">selected</c:if>>제조사</option>
							<option value="brand" <c:if test="${productSearchVO.searchType == 'brand'}">selected</c:if>>브랜드</option>
						</select>
					</span>
					<span class="searchWord">
						<input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
						<input type="submit" class="search_keyword_btn" value="검색">
					</span>
				</form>
			</div>	
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
<script>
	$('.pageButton').on('click', function(){
		location.href="/admin/productList.do?page=" + $(this).data('page') + "&sorttype=${productSearchVO.sorttype}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}";
	})
</script>
</body>
</html>