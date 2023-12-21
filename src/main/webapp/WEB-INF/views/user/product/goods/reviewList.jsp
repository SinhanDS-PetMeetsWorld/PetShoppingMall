<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	

</style>
</head>
<body>
	
  	<c:forEach var="item" items="${review_list}">
      	<div class="review">
       		<c:if test="${!empty item.image_url }">
	        	<img src="/resources/img/product/review_img/${item.image_url}" width="100" height="100">
       		</c:if>
			<c:if test="${empty item.image_url}">
				<img src="/resources/img/product/no_image.jpg" width="100" height="100">
			</c:if>
            <p>평점 : ${item.rating} </p>
            <p>내용 : ${item.content} </p>
            <p>작성일 : ${item.write_date} </p>
    	</div>
   	</c:forEach>
   	<div>
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
</body>
</html>