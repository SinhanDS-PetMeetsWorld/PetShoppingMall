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
    
<style>

.review_container {
display : flex;
}
 
.Review_more {
  display: inline-block;
  outline: 0;
  border: 2px solid #222;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 150px;
  height: 35px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 500;
  color: #222;
  
  margin-left: 28px;
 }
 
.menu_name {
margin-bottom: 10px;	
}

.goods_image {
width : 100px;
hegiht : 100px;
}

.goods_name_container{
height : 20px;
width : 500px;

}

.goods_name {
margin-left : 20px;
margin-top : 5px;
width: 400px;
height: 30px;
}

.goods_name a {
    display: block;
    width: 400px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.goods_price_container{
display:flex;
width : 200px;
height : 100px;
}

.price {
    float: left;
    width:180px;
    text-align:right;
    margin-top: 15px;
    margin-right:26px;
    font-size: 25px;
}

.review_info {
    float: left;
    font-size: 15px;
    margin-left : 20px;
 }



.button {
float:left;
font-size:13px;
width:300px;
margin-top: -8px;
}

.rating{
margin-left: 50px;
font-size : 30px;
}

.star{
	color : gold;
	font-size : 40px;

}

.line {
	margin-top : 10px;
	margin-bottom : 10px;
	width : 930px;
    border: 1px solid #ccc;
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
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
			<input type ="hidden" value = "${userLoginInfo.no } ">
						
				<h1 class="menu_name" >작성한 리뷰</h1>
				<c:if test="${empty review_list2 }"><br><h2>리뷰 내역이 존재하지 않습니다.</h2>
				</c:if>
				
				<c:forEach items="${review_list2}" varStatus = "review_quant" >
					<div class= "review_container">
						<div class = "goods_image">	
							<c:if test="${review_list2[review_quant.index][0] != 'null' && !(fn:substring(review_list2[review_quant.index][0], 0, 1) == 'h') }">
								<a href="/user/product/goods.do?no=${review_list2[review_quant.index][5] }" ><img src="/resources/img/product/review_img/${review_list2[review_quant.index][0] }" width="100" height="100"></a>
							</c:if>
							<c:if test="${review_list2[review_quant.index][0] == 'null'}">
								<a href="/user/product/goods.do?no=${review_list2[review_quant.index][5] }" ><img src="/resources/img/product/no_image.jpg" width="100" height="100"></a>
							</c:if>
						</div>	
							<c:if test="${!empty review_list2[review_quant.index][1] }">
							<input type="hidden" value= "${review_list2[review_quant.index][1] }">
							</c:if>
						
						
						<div class = "goods_name_container">
								<div class = "goods_name">
									<h4><a href="/user/product/goods.do?no=${review_list2[review_quant.index][8]}"> ${review_list2[review_quant.index][2] }</a></h4> 
								</div>	
							
								<div class = "review_info">
									<c:if test="${!empty review_list2[review_quant.index][4] }">
									내용:	 ${review_list2[review_quant.index][4] } <br>
									</c:if>
									<c:if test="${!empty review_list2[review_quant.index][6] }">
									작성일: ${review_list2[review_quant.index][6] } <br>
									</c:if>
									<c:if test="${!empty review_list2[review_quant.index][5] }">
								    <input type="hidden" value="${review_list2[review_quant.index][5] }">
									</c:if>
								</div>	
							
						</div>
						<div class = "goods_price_container">			
							
									<div class = "price">
									<c:if test="${!empty review_list2[review_quant.index][3] }">
										<a> ${review_list2[review_quant.index][3] }원</a><br>
									</c:if>
								</div>	
						</div>
						
						<div class = "button">
							<div class = "rating">
								<c:if test="${!empty review_list2[review_quant.index][7] }">
									<a class = star>★</a> ${review_list2[review_quant.index][7] } <br>
								</c:if>
							</div>
							<c:if test="${!empty review_list2[review_quant.index][1] }">
							<button class ="Review_more" data-dno="${review_list2[review_quant.index][1]}"> 리뷰 상세 </button>	<br>
							</c:if>
						</div>
							
					</div>
				<hr class = "line">	
			   </c:forEach>	
			   		
				<div class="paging_div">
					<ul class='paging'>
                        <c:if test="${paging.prev }">
                        	<li><a href="/user/list_user_review.do?page=${paging.startPage-1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                        	<c:if test="${p == productSearchVO.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != productSearchVO.page}">
                            <li><a href='/user/list_user_review.do?page=${p}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${paging.next }">
                        	<li><a href="/user/list_user_review.do?page=${paging.endPage+1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> >> </a></li>
                        </c:if>
					</ul> 
				</div>
				
                <div class="bbsSearch">
                    <form method="get" name="searchForm" id="searchForm" action="/user/list_user_review.do">
                    	<span class="sortSelect">
                            <select name="sorttype">
                                <option value="regist" <c:if test="${productSearchVO.sorttype == 'regist'}">selected</c:if>>등록일 순</option>
                                <option value="maxrating" <c:if test="${productSearchVO.sorttype == 'maxstock'}">selected</c:if>>평점 높은 순</option>
                                <option value="minrating" <c:if test="${productSearchVO.sorttype == 'minstock'}">selected</c:if>>평점 낮은 순</option>
                            </select>
                    	</span>
                        <span class="srchSelect">
                            <select name="searchType">
                                <option value="name">상품명</option>
                            </select>
                        </span>
                        <span class="searchWord">
                            <input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
                            <input type="submit" class="search_keyword_btn" value="검색">
                        </span>
                    </form>
                </div>
			</div>
        </div>
    </div> 
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
     
 <script>
$(".Review_more").on('click', goReviewmore_popup);

function goReviewmore_popup(){
	
	console.log($(this).data('dno'));
	
	var dno = $(this).data('dno');
	var url = '/user/order/read_review.do?no='+ dno;
	window.open(url, '리뷰 상세 보기', 'width=300px, height=355px');
}

</script> 
</body>
</html>