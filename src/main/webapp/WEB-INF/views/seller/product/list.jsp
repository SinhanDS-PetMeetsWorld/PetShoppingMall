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