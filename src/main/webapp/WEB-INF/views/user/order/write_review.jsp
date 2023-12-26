<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>

#confirmWrite {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 100%;
  height: 35px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 500;
  color: #222;
  margin-top:5px;
 }

.aaa{
	   background-color: #fff;
       height: 30px;
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
       
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }
 }

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
#starForm label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#starForm label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
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


</style>
</head>
<body>
	<form id="starForm" action="write_review.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="product_no" value="${dvo.product_no }">
		<input type="hidden" name="order_no" value="${dvo.order_no }">
		<input type="hidden" name="order_dno" value="${dvo.no }">
		<div>
			<h2>리뷰 작성</h2>
			<input class ="aaa" type="file" name="filename"> 
		</div>
		<br>
		<span class="text-bold">별점을 선택해주세요</span>
		<fieldset>
			<%--https://velog.io/@hellocdpa/220305-%EB%A6%AC%EB%B7%B0-%EB%B3%84%EC%A0%90-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0 --%>
			<input type="radio" name="rating" value="5" id="rate1"><label for="rate1">★</label>
			<input type="radio" name="rating" value="4" id="rate2"><label for="rate2">★</label> 
			<input type="radio" name="rating" value="3" id="rate3"><label for="rate3">★</label> 
			<input type="radio" name="rating" value="2" id="rate4"><label for="rate4">★</label> 
			<input type="radio" name="rating" value="1" id="rate5"><label for="rate5">★</label>
		</fieldset>
		<div>
			<textarea class="col-auto form-control" type="text" name="content"
				id="reviewContents"
				placeholder="리뷰를 남겨주세요!"></textarea>
		</div>
		<input id="confirmWrite" type="submit" value="제출">
	</form>
</body>
</html>