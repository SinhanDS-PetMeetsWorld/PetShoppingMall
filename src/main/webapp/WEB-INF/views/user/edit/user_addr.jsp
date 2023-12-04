<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <%@ include file="/WEB-INF/views/common/quickmenu.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<h1>회원정보</h1>
					    <button type="button">기본정보 변경</button>
					    <button type="button">주소 변경</button>
					    <button type="button">결제 수단</button>
					
					    <table style="border: 1px solid #FFDE30; border-collapse: collapse;" width="800" >
					        
					        <!--주소가 존재하는만큼 td를 생성-->
						    <c:forEach var="vo" items="${addressvo }">
						        <tr width="800">
						            <td>
						                <br>
						                <div>${vo.addr1 }</div>
						                <div>${vo.addr2 }</div>
						                <div>
						                    <span>Contact - </span>
						                    <span>${vo.phone}</span>
						                </div>
						                <div></div>
						                <br>
						            </td>
						            <td>
						                <button type="button" name="modify" onclick="location.href=/*수정.jsp*/''">수정</button> |
						                <button type="button" name="delete" onclick="location.href=/*삭제.jsp*/''">삭제</button>
						                <br>
						            </td>
						        </tr>
						    </c:forEach>
					        <tr>
					            <td colspan="2">
					                <div></div>
					                <hr>
					                <button onclick="window.open('/user/add_addr_form.do','user_add_addr_form', 'width=430,height=500,location=no,status=no,scrollbars=yes');">+ 배송지 추가</button>
					            </td>
					        </tr>
					    </table>
     				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>