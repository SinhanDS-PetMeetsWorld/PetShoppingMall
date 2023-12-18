<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>환불 사유</h2>
	판매자 주소<br>
	${svo.zipcode }
	${svo.addr1 }
	${svo.addr2 }
	<form method="post" action="request_refound.do" id="submit_form">
		<input type="hidden" name="no" value="${orderDetailVO.no }">
		<input type="hidden" name="order_no" value="${orderDetailVO.order_no}">
		<input type="text" id="reason" name="reason" placeholder="환불 사유를 입력하세요" style="width:400px;height:300px;">
		
		<input type="button" id="submitButton" value="제출">
	</form>


	<script>
	$('#submitButton').on('click', doCheck);
	function doCheck(){
		console.log("gg");
		console.log($('#reason').val());
		if($("#reason").val() == ''){
			alert('환불 사유를 입력해주세요!')
			return;	
		}
		
		$("#submit_form").submit();
	}
	</script>
</body>
</html>