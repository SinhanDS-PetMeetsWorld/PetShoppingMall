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
	
	<input type="text" id="reason" name="reason" value="${reason }" style="width:400px;height:300px;" readonly>
	<input type="button" id="closeButton" value="확인">

	<script>
	$('#closeButton').on('click', doCheck);
	function doCheck(){
		window.close();
	}
	</script>
</body>
</html>