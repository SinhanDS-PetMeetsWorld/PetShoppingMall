<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	.wrap{
		margin-top:30px;
		width:1200px;
	}
	
	.review_content{
		width:100%;
		height:250px;
		
	}
	.review{
		width:30%;
		float:left;
		border:1px solid grey;
		text-align:center;
		height:250px;
		margin: 0 10px 0 0;
	}
	.review img{
		margin-top: 40px;
		width:120px;
		height:120px;
	}
	
	.pages{
		height:30px;	
		text-align:center;
		width:1200px;
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
		
	}
	
	.paging li button:hover{
		width:20px;
		height:20px;
		background: black;
		color:white;
		
	}

</style>
</head>
<body>
	
	<div class="wrap">
		<div class="review_content">
		  	<c:forEach var="item" items="${review_list}">
		      	<div class="review">
		       		<c:if test="${!empty item.image_url }">
			        	<img src="/resources/img/product/review_img/${item.image_url}">
		       		</c:if>
		       		<c:if test="${empty item.image_url}">
						<img src="/resources/img/product/no_image.jpg">
					</c:if>
		            <p>평점 : ${item.rating} </p>
		            <p>내용 : ${item.content} </p>
		            <p>작성일 : ${item.write_date} </p>
		    	</div>
		   	</c:forEach>
	   	</div>
	   	<div class="pages">
	   		<ul class='paging'>
	            <c:if test="${reviewPaging.prev }">
	            	<li><button class="reviewPageButton" data-page="${reviewPaging.startPage-1 }"> << </button></li>
	            </c:if>
	            <c:forEach var="p" begin="${reviewPaging.startPage}" end="${reviewPaging.endPage}">
	            	<c:if test="${p == review_svo.page}">
		            	<li> <button data-page=${p }>${p }</button></li>
	                </c:if>
	                <c:if test="${p != review_svo.page}">
	                	<li> <button class="reviewPageButton" data-page=${p }>${p }</button></li>
	                </c:if>
	            </c:forEach>
	            <c:if test="${reviewPaging.next }">
	            	<li><button class="reviewPageButton" data-page="${reviewPaging.endPage+1 }"> >> </button></li>
	            </c:if>
			</ul> 
			
	   	</div>
	</div>	   	
</body>
</html>