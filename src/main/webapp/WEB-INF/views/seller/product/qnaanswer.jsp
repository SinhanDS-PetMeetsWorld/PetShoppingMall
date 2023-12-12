<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <%@ include file="/WEB-INF/views/common/header_seller.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_seller.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					
			            <c:forEach var="item" items="${qna_list}">
				            질문 번호 : ${item.no} 답변 상태 : ${item.status } <br> 
				            제품명: ${item.name} , 질문 등록일 : ${item.question_write_date} <br> 질문 내용 : ${item.question_content }  <br>
				            <input type= text name="question_content" id="${item.no}"  style="width:400px; height:50px">
				            <input type="submit" value="등록" onclick="javascript:qnaanswer();"><br><br>
			            </c:forEach>
				

				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
<script>
	function qnaanswer() {
		
		var question_content = $("#question_content").val();
		var question_no = $("#item.no").val();
		
		$.ajax({
			type:'post',
			url:'/seller/product/qnaanswer.do',
			async: true,
			data: {
				question_content : document.querySelector('#${item.no}').value,
				question_no : "no" 
			},
			success : function(response){
				alert.log("너가 이걸 한다고?")
			}
			
			
		})
	}

</script>
</body>
</html>