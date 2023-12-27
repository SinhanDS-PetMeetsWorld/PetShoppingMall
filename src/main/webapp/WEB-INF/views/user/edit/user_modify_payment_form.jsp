<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제수단 수정</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    
    
	<script>
	$(function(){
		$('#accountnum').click(function(){
            //$('#accountnum').attr("class", "title_on");
            //$('#card').attr("class", "title");
            $('#card_contents').css("display", "none");
            $('#accountnum_contents').css("display", "block");
        });

        $('#card').click(function(){
//            $('#card').attr("class", "title_on");
//            $('#accountnum').attr("class", "title");
            $('#accountnum_contents').css("display", "none");
            $('#card_contents').css("display", "block");
        });
    });
	</script>
		
	<script>
	
	function doCheck(){
		if($("#account").val() == ''){
			alert('카드번호를 입력하세요!')
			return;	
		}
		if($("#valid_date").val() == ''){
			alert('유효기간을 입력해주세요!')
			return;
		}
		if($("#name").val() == ''){
			alert('별칭을 입력해주세요!')
			return;
		}
		if($("#cvc").val() == ''){
			alert('cvc를 입력해주세요!')
			return;
		}
		
		$("#modify_payment").submit();
		
	}
	
	function doCheck2(){
		if($("#account2").val() == ''){
			alert('계좌번호를 입력하세요!')
			return;	
		}
		if($("#name2").val() == ''){
			alert('별칭을 입력해주세요!')
			return;
		}
		
		$("#modify_payment2").submit();
		
	}
    </script>
<style>

.aaa{
	   background-color: #fff;
    height: 30px;
    width: 130px;
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

.aaa_cardselect{
    background-color: #fff;
    height: 38px;
    width: 130px;
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

.info_tag_container{
width : 416px;
height : 60px;
display : flex;
}

.info_tag_container a {
font-size : 14px;
color : #9CA3AF;
margin-top :10px;
}

.info_tag{
 height : 30px;
 width : 120px;
 float : left;
 text-align : left;
 margin-top : 7px;
}

.info_space {
width : 10px;
height : 30px;
}

 .modifyConfirm {
  display: inline-block;
  outline: 0;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  border: none;
  width: 150px;
  height: 40px;
  font-size: 16px;
  background-color: #fd0;
  font-weight: 800;
  color: #222;
  margin-top:15px;
  margin-left: 130px;
 }

</style>    
    
    
</head>
<body>
    <div>
        
        
        <c:choose>
       	<c:when test="${vo.type eq 0 }">
       	<h2><span class="title_on" id="card">결제 카드</span></h2>
       	<div class="contents" id="card_contents">
	        <form action="modify_payment.do" id="modify_payment" method="POST">
	            <input type="hidden" name="type" id="type" value="0">
	            <input type="hidden" name="no" value="${vo.no }">
	           
	           
	            <div class = "info_tag_container">
	            	 <div class = "info_tag">
	           		 <span>카드정보 입력</span>
	            	 </div>
	            
	            	 <div class ="info_space"></div>
	            	 <select class ="aaa_cardselect" name="company" id="company">
						<c:forEach var="card" items="${vo.company_list[0]}" varStatus="status">
							<option value="${status.index}" <c:if test="${status.index eq vo.company}">selected="selected"</c:if>>${card}</option>
						</c:forEach>
					</select>
					<div class ="info_space"></div>
					<input class = "aaa" type="text" placeholder="- 를 포함해서 입력하세요" name="account" id="account" value="${vo.account }">
	            </div>
	            
	            
	            <div class = "info_tag_container">
	            	<div class = "info_tag">
	            		<span>유효기간 입력 </span>
	            	</div>
	            	
	            	<div class ="info_space"></div>
	            	
	            	<input class="aaa" type="text" placeholder="MM / YYYY" name="valid_date" id="valid_date" value="${vo.valid_date }">
	            </div>
	            
	            
	            <div class = "info_tag_container">
	            	<div class = "info_tag">
	            		<span>별칭 입력 </span>
	            	</div>
	            	
	            	<div class = "info_space"></div>
	            	
	            	<input class= "aaa" type="text" placeholder="(ex: 엄마카드)" name="name" id="name" value="${vo.name }">
	            </div>
	            
	            
	            <div class ="info_tag_container">
	            	<div class = "info_tag">
	            	<span>카드 CVC 입력</span>
	                </div>
	                
	                <div class = "info_space"></div>
	                <input class ="aaa" type="text" placeholder="CVC" name="cvc" id="cvc" value="${vo.cvc }"><a>&nbsp카드 뒷면 숫자 3자리</a>
	            </div>
	            
	            <div>
	                 <input class="modifyConfirm" type="button" onclick="doCheck();" value="입력 완료">
	            </div>
	            
	        </form>
        </div>
       	</c:when>
        
        <c:when test="${vo.type eq 1 }">
        <h2><span class="title" id="accountnum">계좌</span></h2>
         <div class="contents" id="accountnum_contents">
        	<form action="modify_payment.do" id="modify_payment2" method="POST">
	            <input type="hidden" name="type" id="type" value="1">
	            <input type="hidden" name="no" value="${vo.no }">
	            
	            
	            
	            <div class = "info_tag_container">
	            	<div class = "info_tag">
						<span>계좌번호 입력</span>	            	
	            	</div>
	            	
	            	<select class="aaa_cardselect" name="company" id="company">
						<c:forEach var="bank" items="${vo.company_list[1]}" varStatus="status">
							<option value="${status.index}" <c:if test="${status.index eq vo.company}">selected="selected"</c:if>>${bank}</option>
						</c:forEach>
            		</select>
            		<div class = "info_space"></div>
	            	<input class = "aaa" type="text" placeholder="- 를 포함해서 입력하세요" name="account" id="account2" value="${vo.account}" >
	            	 
	            </div>
	            
	            <div class = "info_tag_container">
	                <div class = "info_tag">
	                별칭 입력
	                </div>
	                
	                <input class = "aaa" type="text" placeholder="(ex: 비상금 계좌)" name="name" id="name2" value="${vo.name }">
	            </div>
	            
	                <input class = "modifyConfirm" type="button" onclick="doCheck2();" value="입력 완료">
	            
	        </form>
        </div>
        </c:when>
        </c:choose>
        
    </div>
</body>
</html>