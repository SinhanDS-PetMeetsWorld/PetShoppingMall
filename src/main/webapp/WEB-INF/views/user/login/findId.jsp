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
    <link rel="stylesheet" href="/resources/css/common/template.css">
    <title>회원가입</title>
    <script>
    	function findID() {
    		if ($("#name").val() == '') {
    			alert('ID를 찾으려면 회원가입 시 등록한 성함을 입력해주세요.');
    			$("#name").focus();
    			return;
    		}
    		if ($("#email").val() == '') {
    			alert('ID를 전송받을 이메일을 입력해주세요.');
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
				<div class="find_id">
				
				    <h1>ID 찾기</h1>
			
				    <form name="findId_form" id="frm" action="findId.do" method="post">
				        <div>
				            성명*(가입하실 때 사용한 성함과 동일하게 입력해주세요.)<br>
				            <input type="text" name="name" id="name">
				        </div>
				        <hr>
				        <div>
				            이메일*(가입하실 때 사용한 이메일과 동일한 주소로 입력해주세요. 입력하신 이메일 주소로 ID가 전송됩니다.)<br>
				            <input type="text" name="email" id="email">
				        </div>
				            <button type="button" id="findbtn" onclick="findID();">ID 찾기</button>
				        <hr>
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