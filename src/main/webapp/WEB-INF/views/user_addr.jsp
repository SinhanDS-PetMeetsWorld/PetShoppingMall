<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    

    <style>
    	.header{
    		width: 1200px;
    		height: 120px;
    	}
    
	    .wrap {
            width: 100%;
            margin: 0 auto;
            /* 가운데 정렬 */
        }
        
    	.contents{
    		
    		height: 1200px;
    		width: 1200px;
    	}
    	
    	.quickmenu{
    		width:12%;
    		height:100%;
    		float:left;
    	}
    	
    	.contentsright{
    		width:88%;
    		height:100%;
    		float:left;
    		padding-left:40px;
    	}
    	.footer-color {
    		position:absolute;
		 	width:1200px;
		 	background-color: #FFDE30;
		 	height:20px;
		}
    </style>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="./common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="./common/quickmenu.jsp"%>
            </div>
			<div class="contentsright">
				<div>
<h1>회원정보</h1>
    <button type="button">기본정보 변경</button>
    <button type="button">주소 변경</button>
    <button type="button">결제 수단</button>

    <form name="user_info_modify" action="" method="POST">
        <span>이름</span>
        <input type="text" name="name" placeholder="홍길동">
        <span>아이디</span>
        <input type="text" name="id" placeholder="hong" disabled>
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
        <input type="email" name="email" placeholder="hong@email.com">
        <br>
        <span>연락처</span>
        <span>
            <input type="tel" name="phone_first" maxlength="3"/> -
            <input type="tel" name="phone_middle" maxlength="4"/> -
            <input type="tel" name="phone_last" maxlength="4"/>
        </span>
        <span>성별</span>
        <input type="radio" name="gender" value="male"> 남성
        <input type="radio" name="gender" value="female"> 여성
        <br>
        <span>생년월일</span>
        <input type="text" name="birth_year" placeholder="YYYY" maxlength="4"/> -
        <input type="text" name="birth_month" placeholder="MM" maxlength="2"/> -
        <input type="text" name="birth_day" placeholder="DD" maxlength="2"/>
        <br>
        <input type="radio" name="agreement" value="agreement"> 광고성 마케팅 수신에 동의(선택사항)
        <span>동의 시 등록된 이메일로 할인 정보를 전달해 드립니다.</span>
    
        <button type="button">회원 탈퇴</button>
        <br>
        <input type="submit" value="수정">
    </form> </div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>