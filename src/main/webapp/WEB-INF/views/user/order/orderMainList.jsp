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

.orderList_container {
display : flex;
}

#more_purchase {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 150px;
  height: 35px;
  font-size: 15px;
  background-color:#FFDE30;
  font-weight: 800;
  color: #222;
  
  margin-top : 14px;
 }
 
 
#delete_purchase {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 150px;
  height: 35px;
  font-size: 15px;
  background-color: #ff4742;
  font-weight: 800;
  color: #F9FAFB;

 }
 
.menu_name {
margin-bottom: 10px;	
}


.order_list{
width : 600px;
height : 70px;
float : left;
}

.button {
float :left;
fontsize : 13px;
width : 400px;
height : 70px;
}

.order_list #cut {
    display: block;
    width: 400px;
    overflow:hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 910px;
   }

.line {
	margin-top : 10px;
	margin-bottom : 10px;
	width : 910px;
    border: 1px solid #ccc;
 }
 
 .final_line {
 		margin-bottom : 10px;
 		margin-top : 10px;
 		width : 910px;
        border: 1px solid #FFDE30;
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
        	<c:if test="${empty adminLoginInfo}">
	            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        	</c:if>
        	<c:if test="${!empty adminLoginInfo}">
	            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        	</c:if>
        </div>

        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
					<h1 class = "menu_name">구매 이력</h1>
					<hr class = "start_line">
					<c:if test="${empty orderList }">
						<div class="messagebody">
							<div class="messagebox">
									<img src="/resources/img/common/emptybox.png">
									<h2>구매 이력이 없습니다</h2>
							</div>
						</div>
					</c:if>

							<c:forEach items="${orderList }" var="vo">
							
								 <div class = "orderList_container">
									
									<div class = "order_list">
										주문 번호 : <span id="orderNo" >${vo.no }</span> 
									 	<h3><a id ="cut"class="seeOrderDetailButton" data-no="${vo.no }">  ${vo.name }</a></h3>
										총 결제금액: ${vo.total_price }원 <br>
									</div>	
									
									<div class = "button">
										
									<input id = "more_purchase" type="button" class="seeOrderDetailButton" value="상세 보기" data-no="${vo.no }">
									<input id = "delete_purchase" type="button" class="removeThisOrder" value="구매이력 삭제" data-no="${vo.no }">
						
									</div>	
								
								 </div>
						    <hr class = "line">	
						    
							</c:forEach>
				
			</div>
		
			
			<div>
				<ul class='paging'>
					<c:if test="${paging.prev }">
                        <li><a href="list.do?page=${paging.startPage-1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> << </a></li>
                    </c:if>
                    <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                     	<c:if test="${p == productSearchVO.page}">
                    	    <li><a href='#;' class='current'>${p}</a></li>
                        </c:if>
                        <c:if test="${p != productSearchVO.page}">
                            <li><a href='list.do?page=${p}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }'>${p}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${paging.next }">
                    	<li><a href="list.do?page=${paging.endPage+1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> >> </a></li>
                    </c:if>
				</ul> 
			</div>
	        <c:if test="${!empty orderList }">
		        <div class="bbsSearch">
		            <form method="get" name="searchForm" id="searchForm" action="list.do">
			            <span class="srchSelect">
							<select name="searchType">
								<option value="all">전체</option>
						        <option value="name" <c:if test="${productSearchVO.searchType == 'name'}">selected</c:if>>상품명</option>
							</select>
						</span>
				        <span class="searchWord">
				            <input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
		                    <input type="submit" value="검색">
						</span>
		        	</form>
		        </div>		
			</c:if>
        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
<script>
	$('.removeThisOrder').on('click', removeThisOrder);
	$('.seeOrderDetailButton').on('click', seeOrderDetailButton);
	function removeThisOrder(e){
		e.preventDefault();
		let no = $(this).data('no');
		location.href='removeThisOrder.do?no='+no;
	}
	function seeOrderDetailButton(e){
		e.preventDefault();
		let no = $(this).data('no');
		location.href='seeOrderDetail.do?no='+no;
	}
	
	
	 // JavaScript로 텍스트를 가공하여 앞부분을 자르고 ellipsis를 추가
    var textContainer = document.getElementById('cut');
    var originalText = textContainer.textContent;

    // 원하는 길이만큼 텍스트를 앞부분에서 자르고 ellipsis를 추가
    var maxLength = 50;
    var truncatedText = originalText.length > maxLength ? '...' + originalText.slice(-maxLength) : originalText;

    // 결과를 화면에 표시
    textContainer.textContent = truncatedText;
	
	
	
	
	
	
	
	
	

</script>
</html>