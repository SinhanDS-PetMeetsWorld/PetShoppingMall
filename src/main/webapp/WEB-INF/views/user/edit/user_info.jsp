<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.String.*" %>
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
    <script>
    window.onload = function(){
		var phone = document.getElementById("phone").innerHTML;
		var phone_arr = phone.split('-');
		
		for(var i=0; i<phone_arr.length; i++){
			document.getElementById("phone" + i).setAttribute('value', phone_arr[i]);
		}
		
		var birth = document.getElementById("birth").innerHTML;
		var birth_arr = birth.split('-');
		
		for(var i=0; i<birth_arr.length; i++){
			document.getElementById("birth" + i).setAttribute('value', birth_arr[i]);
		}
		
	};
	
	
    </script>

   
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

    <form name="user_info_modify" action="user_info_edit" method="POST">
        <div type="hidden" name="temp" id="phone">${vo.phone }</div>
        <div type="hidden" name="birth" id="birth">${vo.birth_date }</div>
        <span>이름</span>
        <input type="text" name="name" placeholder="홍길동" value="${vo.name }">
        <span>아이디</span>
        <!-- <input type="text" name="id" placeholder="hong" disabled>  -->
        ${vo.id }
        <br>
        <span>기존 비밀번호</span>
        <input type="password" name="password" placeholder="비밀번호 변경 시에만 입력하시면 됩니다">
        <br>
        <span>새 비밀번호</span>
        <input type="password" name="new_password">
        <span>새 비밀번호 확인</span>
        <input type="password" name="check_password">
        <br>
        <span>이메일</span>
        <input type="email" name="email" placeholder="hong@email.com" value="${vo.email }">
        <br>
        <span>연락처</span>
        <span>
            <input type="tel" id="phone0" name="phone_first" maxlength="3"/> -
            <input type="tel" id="phone1" name="phone_middle" maxlength="4"/> -
            <input type="tel" id="phone2" name="phone_last" maxlength="4"/>
        </span>
        <span>성별</span>
        <input type="radio" name="gender" value="0" <c:if test="${vo.gender == 0}">checked</c:if>> 남성
        <input type="radio" name="gender" value="1" <c:if test="${vo.gender == 1}">checked</c:if>> 여성
        <br>
        <span>생년월일</span>
        <input type="text" id="birth0" name="birth_year" placeholder="YYYY" maxlength="4"/> -
        <input type="text" id="birth1" name="birth_month" placeholder="MM" maxlength="2"/> -
        <input type="text" id="birth2" name="birth_day" placeholder="DD" maxlength="2"/>
        <br>
        <input type="radio" name="agreement" value="agreement" <c:if test="${vo.advertisement == true}">checked</c:if>> 광고성 마케팅 수신에 동의(선택사항)
        <span>동의 시 등록된 이메일로 할인 정보를 전달해 드립니다.</span>
    
        <button type="button">회원 탈퇴</button>
        <br>
        <input type="submit" value="수정" >
    </form> </div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>