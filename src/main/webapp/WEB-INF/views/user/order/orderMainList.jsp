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
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<form>
						<h1>구매 이력</h1>
						<c:forEach items="${orderList }" var="vo">
							<div>
								<div>
									<div>
										주문번호 : <span id="orderNo">${vo.no }</span> <input type="button" class="removeThisOrder" value="구매이력 삭제">
									</div>
									<div>
										${vo.name } 총 결제금액: ${vo.total_price }원
									</div>
								</div>
								
								<div>
									<div>주문 상태:</div> 
									<div><input type="button" class="seeOrderDetailButton" value="상세 보기"></div>
									<%-- <div><input type="button" class="purchaseConfirm" value="일괄 구매 확정"></div>--%>
								</div>
								<hr><br>
							</div>
						</c:forEach>
					
					</form>
				</div>
			</div>
			
			
			<div>
				<ul class='paging'>
					<c:if test="${paging.prev }">
                        <li><a href="list.do?page=${paging.startPage-1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> << </a></li>
                    </c:if>
                    <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                     	<c:if test="${p == replyVO.page}">
                    	    <li><a href='#;' class='current'>${p}</a></li>
                        </c:if>
                        <c:if test="${p != replyVO.page}">
                            <li><a href='list.do?page=${p}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }'>${p}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${paging.next }">
                    	<li><a href="list.do?page=${paging.endPage+1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> >> </a></li>
                    </c:if>
				</ul> 
			</div>
        </div>
        
        <div class="bbsSearch">
            <form method="get" name="searchForm" id="searchForm" action="list.do">
            	<%--
            	<span class="sortSelect">
	                <select name="sorttype">
			            <option value="regist" <c:if test="${productSearchVO.sorttype == 'regist'}">selected</c:if>>등록일 순</option>
						<option value="maxprice" <c:if test="${productSearchVO.sorttype == 'maxprice'}">selected</c:if>>최고 가격 순</option>
				        <option value="minprice" <c:if test="${productSearchVO.sorttype == 'minprice'}">selected</c:if>>최저 가격 순</option>
		                <option value="maxstock" <c:if test="${productSearchVO.sorttype == 'maxstock'}">selected</c:if>>재고 많은 순</option>
                        <option value="minstock" <c:if test="${productSearchVO.sorttype == 'minstock'}">selected</c:if>>재고 적은 순</option>
					</select>
				</span>
				 --%>
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
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
<script>
	$('.removeThisOrder').on('click', removeThisOrder);
	$('.seeOrderDetailButton').on('click', seeOrderDetailButton);
	$('.purchaseConfirm').on('click', purchaseConfirm);
	
	//<input type="hidden" name="no" value="${vo.no }">
	function removeThisOrder(){
		let form = document.querySelector('form');
		console.log();
		var no = this.parentNode.parentNode.parentNode.querySelector('#orderNo').innerText
		$(form).attr('action', "removeThisOrder.do");
		
		let newObj = $('<input type="hidden" name="no">');
		console.log(newObj);
		
		$(newObj).attr('value', no);
		newObj.appendTo(form);
		form.submit();
	}
	function purchaseConfirm(){
		let form = document.querySelector('form');
		var no = this.parentNode.parentNode.parentNode.querySelector('#orderNo').innerText
		console.log(no);
		$(form).attr('action', "purchaseConfirmByOrderMainNo.do");
		
		let newObj = $('<input type="hidden" name="no">');
		console.log(newObj);
		
		$(newObj).attr('value', no);
		newObj.appendTo(form);
		form.submit();
	}
	function seeOrderDetailButton(){
		let form = document.querySelector('form');
		var no = this.parentNode.parentNode.parentNode.querySelector('#orderNo').innerText
		console.log(no);
		$(form).attr('action', "seeOrderDetail.do");
		
		let newObj = $('<input type="hidden" name="no">');
		console.log(newObj);
		
		$(newObj).attr('value', no);
		newObj.appendTo(form);
		form.submit();
	}
</script>
</html>