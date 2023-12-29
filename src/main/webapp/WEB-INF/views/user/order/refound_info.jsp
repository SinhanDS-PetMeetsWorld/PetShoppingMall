<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

#reason{
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
 
#closeButton {
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   
<meta charset="UTF-8">
<title>환불 요청</title>
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