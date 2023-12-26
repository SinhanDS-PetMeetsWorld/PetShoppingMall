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
 
.goWriteReview {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 150px;
  height: 35px;
  font-size: 15px;
  background-color: #FFDE30;
  font-weight: 800;
  color: #222;
  
  margin-top:15px;
  
 }
 
.menu_name {
margin-bottom: 10px;	
}

.goods_image {
width : 100px;
hegiht : 100px;

}
 
.goods_name_container{
height : 100px;
width : 600px;
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
    width:120px;
    text-align:right;
    margin-top: 15px;
    font-size: 25px;
}

.buy_date {
margin-top:10px;
}

.review_info {
    float: left;
    font-size: 13px;
    margin-top: 40px;
 }

.button{
float:left;
width:300px;
height:100px;

}

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 930px;
   }

 .line {
 		margin-top : 10px;
 		margin-bottom : 10px;
 		width : 930px;
        border: 1px solid #ccc;
 }
 
</style>      
<style>
	    .messagebody{
			margin-top : 50px;
		}
	    .messagebox{
			margin : 0 auto;
			width : 600px;
			height : 300px;
			text-align : center;
		}
		.messagebox > img {
			margin-bottom : 20px;
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
				
						<input type = "hidden"  value = "${userLoginInfo.no }"> 
						
				<h1 class= "menu_name">작성 가능한 리뷰</h1>	
				<hr class ="start_line">
						<c:if test="${empty possible_write_review2}">
							<div class="messagebody">
								<div class="messagebox">
										<img src="/resources/img/common/emptybox.png">
										<h2>작성 가능한 리뷰가 없습니다</h2>
								</div>
							</div>
						</c:if>
				<c:forEach items="${possible_write_review2}" varStatus = "possible_write_review" >
					<div>
						<c:if test="${!empty possible_write_review2[possible_write_review.index] }">
							<div class = "review_container" data-no="${possible_write_review2[possible_write_review.index][1]}">
								<div class="goods_image">
									<c:if test="${possible_write_review2[possible_write_review.index][0] }">
										<a href="/user/product/goods.do?no=${possible_write_review2[possible_write_review.index][5]}"><img src="/resources/img/product/no_image.jpg" width="100" height="100"></a>
									</c:if>
									<c:if test="${!empty possible_write_review2[possible_write_review.index][0] && fn:substring(possible_write_review2[possible_write_review.index][0], 0, 1) == 'h' }">
										<a href="/user/product/goods.do?no=${possible_write_review2[possible_write_review.index][5]}"><img src="${possible_write_review2[possible_write_review.index][0] }" width="100" height="100"></a>
									</c:if>
									<c:if test="${!empty possible_write_review2[possible_write_review.index][0] && !(fn:substring(possible_write_review2[possible_write_review.index][0], 0, 1) == 'h') }">
										<a href="/user/product/goods.do?no=${possible_write_review2[possible_write_review.index][5]}"><img src="/resources/img/product/registed_img/${possible_write_review2[possible_write_review.index][0] }" width="100" height="100"></a>
									</c:if>
								</div>
								
								<div class = "goods_name_container">
									<div class = "goods_name">
										<c:if test="${!empty possible_write_review2[possible_write_review.index][2] }">
										<h4><a>${possible_write_review2[possible_write_review.index][2]}</a></h4>
										</c:if>
										<div class = "buy_date">	
										<c:if test="${!empty possible_write_review2[possible_write_review.index][4] }">
											구매일자:	${possible_write_review2[possible_write_review.index][4]} <br>
										</c:if>
									</div>
										
									</div>
									<br>
								</div>	
								
								<div class = "goods_price_container">
									<div class = "price">
										<c:if test="${!empty possible_write_review2[possible_write_review.index][3] }">
												${possible_write_review2[possible_write_review.index][3]}원 <br>
										</c:if>
									</div>
								</div>			

								
								<div class= "review_info">
									
									<c:if test="${!empty possible_write_review2[possible_write_review.index][5] }">
									<input type = "hidden" value = "${possible_write_review2[possible_write_review.index][5]}">
									</c:if>
									
										
									<c:if test="${!empty possible_write_review2[possible_write_review.index][1] }">
									<input type = "hidden" value ="${possible_write_review2[possible_write_review.index][1]}">
									</c:if>
						
								</div>
													
								<div class = "button">	
									<c:if test="${!empty possible_write_review2[possible_write_review.index][1] }">
									<button class ="goWriteReview" data-dno="${possible_write_review2[possible_write_review.index][1]}">리뷰 작성 </button>	<br>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
					<hr class = "line"> 	
			   </c:forEach>			
			   
				<div class="paging_div">
					<ul class='paging'>
                        <c:if test="${paging.prev }">
                        	<li><a href="/user/possible_write_review.do?page=${paging.startPage-1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                        	<c:if test="${p == productSearchVO.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != productSearchVO.page}">
                            <li><a href='/user/possible_write_review.do?page=${p}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${paging.next }">
                        	<li><a href="/user/possible_write_review.do?page=${paging.endPage+1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> >> </a></li>
                        </c:if>
					</ul> 
				</div>
				
                <div class="bbsSearch">
                    <form method="get" name="searchForm" id="searchForm" action="/user/possible_write_review.do">
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
$(".goWriteReview").on('click', goReviewwrite_popup);

function goReviewwrite_popup(){
	
	console.log($(this).data('dno'));
	
	var dno = $(this).data('dno');
	var url = '/user/order/write_review.do?no='+ dno;
	window.open(url, '리뷰 작성', 'width=315px, height=400px');
}

</script>      
</body>
</html>