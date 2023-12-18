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
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_seller.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_seller.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<ul>
						<c:forEach items="${productList }" var="vo" varStatus="status">
							<li>
								<table border="1px">
									<tr>
										<td rowspan="2">
											<c:if test="${empty vo.image_url }">
												<img src="/resources/img/product/no_image.jpg" width="100" height="100">
											</c:if>
											<c:if test="${!empty vo.image_url && fn:substring(vo.image_url, 0, 1) == 'h' }">
												<img src="${vo.image_url }" width="100" height="100">
											</c:if>
											<c:if test="${!empty vo.image_url && !(fn:substring(vo.image_url, 0, 1) == 'h') }">
												<img src="/resources/img/product/registed_img/${vo.image_url }" width="100" height="100">
											</c:if>
											
										</td>
										<td>
											제품명	
										</td>
										<td>
											카테고리	
										</td>
										<td>
											옵션	
										</td>
										<td>
											판매가	
										</td>
										<td>
											재고	
										</td>
									</tr>
									<tr>
										<td>
											${vo.name }
										</td>
										<td>
											<c:forEach items="${categoryList }" var="cvoList" varStatus="cList_status">
												<c:if test="${status.index == cList_status.index }">
													<c:forEach items="${cvoList }" var="cvo" varStatus="c_status">
														${cvo.category_name[cvo.category1] } ${cvo.category[cvo.category1][cvo.category2] } <br>
													</c:forEach>
												</c:if>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${optionList }" var="ovoList" varStatus="oList_status">
												<c:if test="${status.index == oList_status.index }">
													<c:forEach items="${ovoList }" var="ovo" varStatus="o_status">
														${ovo.title } ${ovo.content } ${ovo.price } <br>
													</c:forEach>
												</c:if>
											</c:forEach>
										</td>
										<td>
											${vo.price }
										</td>
										<td>
											${vo.stock }
										</td>
									</tr>
								</table>
								<br>
									<form action="/seller/product/edit.do" method="get">
										<input type="hidden" name="no" value="${vo.no }">
										<input type="submit" value="수정하기">
									</form>
									
									<form action="/seller/product/remove.do" method="post" onsubmit="return remove();">
										<input type="hidden" name="no" value="${vo.no }">
										<input type="hidden" name="image_url" value="${vo.image_url }">
										<input type="submit" value="삭제하기">
									</form>
								<br>
								<br>
								<hr>
								<br>
							</li>						
						</c:forEach>
					</ul>
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
				
                <div class="bbsSearch">
                    <form method="get" name="searchForm" id="searchForm" action="/seller/product/list.do">
                    	<span class="sortSelect">
                            <select name="sorttype">
                                <option value="regist" <c:if test="${productSearchVO.sorttype == 'regist'}">selected</c:if>>등록일 순</option>
                                <option value="maxprice" <c:if test="${productSearchVO.sorttype == 'maxprice'}">selected</c:if>>최고 가격 순</option>
                                <option value="minprice" <c:if test="${productSearchVO.sorttype == 'minprice'}">selected</c:if>>최저 가격 순</option>
                                <option value="maxstock" <c:if test="${productSearchVO.sorttype == 'maxstock'}">selected</c:if>>재고 많은 순</option>
                                <option value="minstock" <c:if test="${productSearchVO.sorttype == 'minstock'}">selected</c:if>>재고 적은 순</option>
                            </select>
                    	</span>
                        <span class="srchSelect">
                            <select name="searchType">
                                <option value="all">전체</option>
                                <option value="name" <c:if test="${productSearchVO.searchType == 'name'}">selected</c:if>>상품명</option>
                                <option value="brand" <c:if test="${productSearchVO.searchType == 'brand'}">selected</c:if>>브랜드</option>
                                <option value="company" <c:if test="${productSearchVO.searchType == 'company'}">selected</c:if>>제조사</option>
                            </select>
                        </span>
                        <span class="searchWord">
                            <input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
                            <input type="submit" value="검색">
                        </span>
                    </form>
                    
                </div>				
				
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    <script>
		function remove(){
			if(confirm("해당 제품을 정말 삭제하시겠습니까?") == true) return true;
			else return false;
		}
    </script>
</body>
</html>