<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   
<meta charset="UTF-8">
<title>취소 신청</title>
<style>

.reviewContents{
	   background-color: #fff;
       height: 180px;
       width: 320px;
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
 
#submitButton {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 415px;
  height: 35px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 500;
  color: #222;
  margin-top:5px;
 }
 
</style>
</head>


<body>
	
	<h2>취소 사유</h2><br>
	<form method="post" action="request_cancle.do" id="submit_form">
		<input type="hidden" name="no" value="${orderDetailVO.no }">
		<input type="hidden" name="order_no" value="${orderDetailVO.order_no}">
		<input class ="reviewContents" type="text" id="reason" name="reason" placeholder="취소 사유를 입력하세요" style="width:400px;height:300px;">
		<div>
			<input type="button" id="submitButton" value="제출">
		</div>
		
	</form>


	<script>
	$('#submitButton').on('click', doCheck);
	function doCheck(){
		console.log("gg");
		console.log($('#reason').val());
		if($("#reason").val() == ''){
			alert('취소 사유를 입력해주세요!')
			return;	
		}
		
		
		$("#submit_form").submit();
	}
	</script>
</body>
</html>