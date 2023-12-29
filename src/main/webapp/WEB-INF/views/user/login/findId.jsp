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
    <title>구매자:: ID 찾기</title>
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

<style>

.menu_name {
margin-bottom: 10px;	
}

.contentsright {
 margin-left : 200px;

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

.findID {
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

</style>
</head>

<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

        <div class="contents">
        	
			<div class="contentsright">
				<div class="find_id">
				
				    <h1 class = "menu_name">ID 찾기</h1>
					
					<hr class = "start_line">
				    <form name="findId_form" id="frm" action="findId.do" method="post">
				    	<div class = "space"></div>
				    	
				        <div class = "info_tag_container">
					          <div class = "info_tag"><span>성명</span></div>
					       
					       
					         <div class = "insert_tag">
					        	 <input class="aaa" type="text" name="name" id="name">
					        	 가입하실 때 사용한 성함과 동일하게 입력해주세요.
					         </div> 
				            
				        </div>
				        <hr class = "line">
				       
				        <div class = "info_tag_container">
				            
				            <div class ="info_tag"><span>이메일*</span></div>
				            
				            <div class = "insert_tag">
				            <input class ="aaa" type="text" name="email" id="email">
				            가입하실 때 사용한 이메일과 동일한 주소로 입력해주세요.
				        	</div>
				            
				       </div>   
				       
				       <hr class = "final_line">
				       <button class = "findID" type="button" id="findbtn" onclick="findID();">ID 찾기</button>
				            
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