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
					        
					        <!--결제수단이 존재하는만큼 td를 생성-->
					        <c:if test="${empty paymentvo }">
					        	<tr width="800">
						            <td>
						                <br>
						                <div>아직 등록된 결제 수단(주소)이 없습니다.</div>
						                <div>새 결제 수단(주소)을 추가해주세요.</div>
						                <br>
						            </td>
						        </tr>
						        <tr>
						        	<td colspan="2">
					        		<hr>
						        	</td>
						    	</tr>
					        </c:if>
					        
					        <c:forEach var="vo" items="${paymentvo }">
					        	
					        	
						        <tr width="800">
						            <td>
						                <br>
						                <div>
						                    <span>결제 수단 : </span>
						                    <span>${vo.type }</span>
						                </div>
						                <div>
						                    <span>카드 별명 : </span>
						                    <span>${vo.name }</span>
						                </div>
						                <div>
						                    <span>카드 번호 : </span>
						                    <span>${vo.account }</span>
						                </div>
						                <div>
						                    <span>유효 기간 : </span>
						                    <span>${vo.valid_date}</span>
						                </div>
						                
						                <br>
						            </td>
						            <td>
						                <button type="button" name="modify" onclick="location.href=/*수정.jsp*/''">수정</button> |
						                <button type="button" name="delete" onclick="location.href=/*삭제.jsp*/''">삭제</button>
						                <br>
						            </td>
						        </tr>
						        <tr>
						        	<td colspan="2">
						        		<hr>
						        	</td>
						       	</tr>
						        
						    </c:forEach>
					        <tr>
					            <td colspan="2">
					                <div></div>

					                <button type="button" name="add_new_address">+ 결제 수단 추가</button>
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