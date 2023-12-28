<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common/quick_menu.css">
<style>
    .quick_menu {
      position:fixed;
    }
  	
  	.contentsright{
  	 margin-left: 130px;
  	}
</style>

<script>




</script>
</head>
<div class="quick_menu">
	<h2>상품</h2>
	<div class="quick_menu_category">
		<c:forEach var="category" items="${ProductCategoryVO.category}" varStatus="status">
			<c:if test="${status.index == category1 }">
				<c:forEach var="ct2" items="${category }" varStatus="ct2Status">
					<li><a href="/user/product/list.do?category1=${category1 }&category2=${ct2Status.index}
						&totalSearchWord=${ProductSearchVO.totalSearchWord}&searchWord=${ProductSearchVO.searchWord}
						&searchType=${ProductSearchVO.searchType}&minprice=${ProductSearchVO.minprice}
						&maxprice=${ProductSearchVO.maxprice}&sorttype=${ProductSearchVO.sorttype}">
					${ct2 } </a></li>
				</c:forEach>
			</c:if>
		</c:forEach>
	</div>
</div>


</html>

