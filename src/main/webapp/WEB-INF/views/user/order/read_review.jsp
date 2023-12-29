<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매자:: 리뷰 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>
#starForm fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#starForm fieldset legend{
    text-align: right;
}
#starForm input[type=radio]{
    display: none;
}
#starForm label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#starForm input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents{
	   background-color: #fff;
       height: 180px;
       width: 315px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       resize :none;
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }
 }

#closeWindow {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 330px;
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
	<input type="hidden" name="product_no" value="${dvo.product_no }">
	<input type="hidden" name="order_no" value="${dvo.order_no }">
	<input type="hidden" name="order_dno" value="${dvo.no }">
	<div>
		<h2>작성한 리뷰</h2>
	</div>
	<div id="starForm">
		<div>별점
			<fieldset>
				<%--https://velog.io/@hellocdpa/220305-%EB%A6%AC%EB%B7%B0-%EB%B3%84%EC%A0%90-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0 --%>
				<input type="radio" name="rating" value="5" id="rate1" <c:if test="${rvo.rating == 5.0 }">checked</c:if> onclick="return(false);"><label for="rate1">★</label>
				<input type="radio" name="rating" value="4" id="rate2" <c:if test="${rvo.rating == 4.0 }">checked</c:if> onclick="return(false);"><label for="rate2">★</label> 
				<input type="radio" name="rating" value="3" id="rate3" <c:if test="${rvo.rating == 3.0 }">checked</c:if> onclick="return(false);"><label for="rate3">★</label> 
				<input type="radio" name="rating" value="2" id="rate4" <c:if test="${rvo.rating == 2.0 }">checked</c:if> onclick="return(false);"><label for="rate4">★</label> 
				<input type="radio" name="rating" value="1" id="rate5" <c:if test="${rvo.rating == 1.0 }">checked</c:if> onclick="return(false);"><label for="rate5">★</label>
			</fieldset>
		<div>
	</div>	
			<c:if test="${empty rvo.image_url }">
				<img src="/resources/img/product/no_image.jpg" width="100" height="100">
			</c:if>
			<c:if test="${!empty rvo.image_url}">
				<img src="/resources/img/product/review_img/${rvo.image_url }" width="100" height="100">
			</c:if>
		</div>
		<div>
			<textarea class="col-auto form-control" type="text" name="content"
				id="reviewContents"
				placeholder="${rvo.content }" readonly></textarea>
		</div>
		<input type="button" id="closeWindow" value="확인">
	</div>
<script>
	$('#closeWindow').on('click', closeWindow);
	function closeWindow(){
		window.close();
	}
</script>
</body>
</html>