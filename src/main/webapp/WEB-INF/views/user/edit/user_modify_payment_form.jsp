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
    
    
    
</head>
<body>
    <div>
        
        
        <c:choose>
       	<c:when test="${vo.type eq 0 }">
       	<span class="title_on" id="card">카드</span>
       	<div class="contents" id="card_contents">
	        <form action="modify_payment.do" id="modify_payment" method="POST">
	            <input type="hidden" name="type" id="type" value="0">
	            <input type="hidden" name="no" value="${vo.no }">
	            <span>카드정보 입력 </span>
	            
	            <select name="company" id="company">
					<c:forEach var="card" items="${vo.company_list[1]}" varStatus="status">
						<option value="${status.index}" <c:if test="${status.index eq vo.company}">selected="selected"</c:if>>${card}</option>
					</c:forEach>
            	</select>
	            <div>
	                <input type="text" placeholder="- 를 포함해서 입력하세요" name="account" id="account" value="${vo.account }">
	            </div>
	            <div>
	            	카드 유효기간 입력
	            </div>
	            <div>
	                <input type="text" placeholder="MM / YYYY" name="valid_date" id="valid_date" value="${vo.valid_date }">
	            </div>
	            <div>
	                별칭 입력
	                <div><input type="text" placeholder="(ex: 엄마카드)" name="name" id="name" value="${vo.name }"></div>
	            </div>
	            <div>
	            	카드 CVC코드(카드뒷면 숫자3자리) 입력
	                <div><input type="text" placeholder="CVC" name="cvc" id="cvc" value="${vo.cvc }"></div>
	            </div>
	            <div>
	                 <input type="button" onclick="doCheck();" value="입력 완료">
	            </div>
	            
	        </form>
        </div>
       	</c:when>
        
        <c:when test="${vo.type eq 1 }">
        <span class="title" id="accountnum">계좌</span>
         <div class="contents" id="accountnum_contents">
        	<form action="modify_payment.do" id="modify_payment2" method="POST">
	            <input type="hidden" name="type" id="type" value="1">
	            <input type="hidden" name="no" value="${vo.no }">
	            <span>계좌이체 입력</span>
	            <select name="company" id="company">
					<c:forEach var="bank" items="${vo.company_list[0]}" varStatus="status">
						<option value="${status.index}" <c:if test="${status.index eq vo.company}">selected="selected"</c:if>>${bank}</option>
					</c:forEach>
            	</select>
	            <div>
	                <input type="text" placeholder="- 를 포함해서 입력하세요" name="account" id="account2" value="${vo.account}" >
	            </div>
	            <div>
	                별칭 입력
	                <div><input type="text" placeholder="(ex: 비상금 계좌)" name="name" id="name2" value="${vo.name }"></div>
	            </div>
	            <div>
	                 <input type="button" onclick="doCheck2();" value="입력 완료">
	            </div>
	            
	        </form>
        </div>
        </c:when>
        </c:choose>
        
    </div>
</body>
</html>