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
<style>
.contentsright {
	margin-left : 200px;

}
.menu_name {
margin-bottom: 10px;	
}

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 750px;
   }
 
.line {
 		margin-top : 10px;
 		margin-bottom : 10px;
 		width : 750px;
        border: 1px solid #ccc;
} 

 .final_line {
 		margin-bottom : 10px;
 		margin-top : 10px;
 		width : 750px;
        border: 1px solid #FFDE30;
   }

.info_tag_container {
 	height : 30px;
 	width : 1000px;
 	display: flex;
}

.info_tag{
 height : 30px;
 width : 130px;
 float : left;
 text-align : left;
 margin-top : 5px;
}

.insert_tag{
 height : 30px;
 width : 900px;
 float : left;

}
.aaa{
	   background-color: #fff;
       height: 30px;
       width: 185px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }
 }

.findPWD {
  display: inline-block;
  outline: 0;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  border: none;
  width: 150px;
  height: 40px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 800;
  color: #222;
  margin-top:5px;
  margin-left: 290px;
 }

</style>    
</head>


<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	
			<div class="contentsright">
				<div class="login_all">
				
				    <h1 class ="menu_name">비밀번호 찾기</h1>
				    사이트의 개인정보보호 정책으로 인해 비밀번호를 알려드릴 수 없습니다.<br>
				    가입시 등록하신 성함, ID, 이메일을 입력하시면 해당 이메일 주소로 임시 비밀번호를 전송해 드립니다.
				    
				    <hr class = "start_line">
				    <form name="find_form" id="frm" action="findPwd.do" method="post">
				        <div class ="info_tag_container">
				        	 <div class = "info_tag"><span>아이디*</span></div>
				          	
				          	<div class ="insert_tag">
				          		<input class ="aaa" type="text" name="id" id="id">
				          	</div>
				             
				        </div>
				        <hr class = "line">
				        
				        <div class = "info_tag_container">
				            
				            <div class = "info_tag"><span>성명*</span></div>
				            
				            <div class = "insert_tag">
				           		<input class ="aaa" type="text" name="name" id="name">
				            </div>
				            
				        </div>
				       
				       
				        <hr class = "line">
				       
				        <div class = "info_tag_container">
				            <div class = "info_tag"><span>이메일*</span></div>
				            
				           	<div class = "insert_tag">
				           		<input class ="aaa" type="text" name="email" id="email">
				           	</div>
				            
				        </div>
				        <hr class = "final_line">
				        <input class = "findPWD" type="button" value="비밀번호 찾기" onclick="findPwd();">
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