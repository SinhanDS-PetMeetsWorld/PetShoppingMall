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
				<div>
					<h1>구매 이력</h1>
					<c:if test="${empty orderList }"><br><h2>구매이력이 존재하지 않습니다.</h2></c:if>

					<c:forEach items="${orderList }" var="vo">
						<div>
							<div>
								<div>
									주문번호 : <span id="orderNo">${vo.no }</span> <input type="button" class="removeThisOrder" value="구매이력 삭제" data-no="${vo.no }">
								</div>
								<div>
									${vo.name } 총 결제금액: ${vo.total_price }원
								</div>
							</div>
							
							<div>
								<div>주문 상태:</div> 
								<div><input type="button" class="seeOrderDetailButton" value="상세 보기" data-no="${vo.no }"></div>
							</div>
							<hr><br>
						</div>
					</c:forEach>
				</div>
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
        <div class="footer">
			<div class="footer-color"></div>
        </div>
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

</script>
</html>