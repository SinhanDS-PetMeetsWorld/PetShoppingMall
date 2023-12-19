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
					<h1>회원정보</h1>
					    <button type="button" onclick="location.href='/user/edit.do'">기본정보 변경</button>
					    <button type="button" onclick="location.href='/user/edit_addr.do'">주소 변경</button>
					    <button type="button" onclick="location.href='/user/edit_payment.do'">결제 수단</button>
					
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
					        	
					        	<c:if test="${vo.type eq 0 }">
					        		<tr width="800">
							            <td>
							                <br>
							                <div>
							                    <span>결제 수단 : </span>
							                    <span>카드</span>
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
							                <button type="button" name="modify" onclick="window.open('/user/modify_payment_form.do?no=${vo.no}&type=${vo.type }&name=${vo.name }&account=${vo.account }&cvc=${vo.cvc }&company=${vo.company }&valid_date=${vo.valid_date }','user_modify_addr_form', 'width=430,height=500,location=no,status=no,scrollbars=yes');">수정</button>  |
							                <button type="button" name="delete" onclick="location.href='/user/delete_payment.do?no=${vo.no}'">삭제</button>
							                <br>
							            </td>
						        	</tr>
					        	</c:if>
					        	<c:if test="${vo.type eq 1 }">
					        		<tr width="800">
							            <td>
							                <br>
							                <div>
							                    <span>결제 수단 : </span>
							                    <span>계좌이체</span>
							                </div>
							                <div>
							                    <span>계좌 별명 : </span>
							                    <span>${vo.name }</span>
							                </div>
							                <div>
							                    <span>계좌 번호 : </span>
							                    <span>${vo.account }</span>
							                </div>
							                
							                <br>
							            </td>
							            <td>
							                <button type="button" name="modify" onclick="window.open('/user/modify_payment_form.do?no=${vo.no}&type=${vo.type }&name=${vo.name }&account=${vo.account }&company=${vo.company }','user_modify_addr_form', 'width=430,height=500,location=no,status=no,scrollbars=yes');">수정</button>  |
							                <button type="button" name="delete" onclick="location.href='/user/delete_payment.do?no=${vo.no}'">삭제</button>
							                <br>
							            </td>
						        	</tr>
					        	</c:if>
						        
						        <tr>
						        	<td colspan="2">
						        		<hr>
						        	</td>
						       	</tr>
						        
						    </c:forEach>
					        <tr>
					            <td colspan="2">
					                <div></div>
									
									<button onclick="window.open('/user/add_payment_form.do','user_add_payment_form', 'width=500,height=700,location=no,status=no,scrollbars=yes');">+ 결제 수단 추가</button>
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