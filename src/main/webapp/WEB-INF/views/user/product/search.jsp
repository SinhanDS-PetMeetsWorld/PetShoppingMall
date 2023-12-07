<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
    
    <style>
	    .product_preview_name{
		  width        : 100px;     /* 너비는 변경될수 있습니다. */
		  text-overflow: ellipsis;  /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
		  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
		  overflow     : hidden;    /* 내용이 길면 감춤니다 */
		  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
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
                <%@ include file="/WEB-INF/views/common/quickmenu_product_category.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<c:forEach var="product" items="${list}" varStatus="status">
						<div class="product_preview">
							<div><img src="${product.image_url }" width="120" height="150"></div>
							<div class="product_preview_name">${product.name}</div>
							<div class="product_preview_info">
								<span>${product.price}</span>
								<span>${product.rating}</span>
							</div>
						</div>
						<c:if test="${status.index%4 == 3}"><br></c:if> 
					</c:forEach>
				</div>
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>