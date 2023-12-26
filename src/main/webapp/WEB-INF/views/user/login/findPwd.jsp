<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
    <title>회원가입</title>
    <script>
    	function findPwd() {
    		if ($("#id").val() == '') {
    			alert('ID는 필수 입력사항입니다.');
    			$("#id").focus();
    			return;
    		}

    		if ($("#name").val() == '') {
    			alert('이름은 필수 입력사항입니다.');
    			$("#name").focus();
    			return;
    		}
    		
    		if ($("#email").val() == '') {
    			alert('이메일은 필수 입력사항입니다.');
    			$("#email").focus();
    			return;
    		}
    		$("#frm").submit();
    	}
    </script>
    
</head>


<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	
			<div class="contentsright">
				<div class="login_all">
				
				    <h1>비밀번호 찾기</h1>
				    사이트의 개인정보보호 정책으로 인해 비밀번호를 알려드릴 수 없습니다.<br>
				    가입할 때 사용하신 성함, id, 이메일을 입력하시면 해당 이메일 주소로 임시 비밀번호를 전송해 드립니다.
				    <form name="find_form" id="frm" action="findPwd.do" method="post">
				        <div>
				            아이디*<br>
				            <input type="text" name="id" id="id">
				        </div>
				        <hr>
				        <div>
				            성명*<br>
				            <input type="text" name="name" id="name">
				        </div>
				        <hr>
				        <div>
				            이메일*<br>
				            <input type="text" name="email" id="email">
				        </div>
				        <hr>
				        <input type="button" value="비밀번호 찾기" onclick="findPwd();">
				    </form>
				
				</div>
			</div>
        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>