<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
<META name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</div>

		<div class="contents">
			<div class="quickmenu">
				<%@ include file="/WEB-INF/views/common/quickmenu.jsp"%>
			</div>
			<div class="contentsright">
				<div>
					<div class="goods-container">

						<div class="goods-photo">
							<img
								src="https://i.namu.wiki/i/guH7wBKc-HUuTjbCy8jbSkofYyRJCnRA6F-6j4r4uCfC3iuRrYpUJm8AV6vlAoGqMdQloDpUowBmA6oUgz1tnoat7aoPEJHF_2WctibFipJeTUcIKBhcAqDw3gDuPnVQk86aMhunl-g57uBjMYuPMQ.webp"
								alt="Product Image">
						</div>

						<div class="goods-details">
							<div id="goods_category"
								style="width: 720px; height: 100px; border: 1px solid black">
								화살표 이미지<br> 강아지 > 사료
							</div>

							<div id="goods_menu">
								<div class="goods-name"
									style="width: 720px; height: 100px; border: 1px solid black;">
									<h1>스테이씨</h1>
									대충 평점 이미지
								</div>

								<div class="goods-price"
									style="width: 720px; height: 100px; border: 1px solid black;">
									<h2>20000 KRW</h2>
								</div>

								<div class="goods-explain"
									style="width: 720px; height: 100px; border: 1px solid black;">
									세상에서 가장 이쁜 스테이씨</div>

								<div class="goods-option"
									style="width: 720px; height: 100px; border: 1px solid black;">
									<form action="다음페이지" method="get" id="select_option">
										옵션 : <select name="order" form="myForm">
											<option value="leg">관절영양(+ 0원)</option>
											<option value="stance">발목(+ 1000원)</option>
											<option value="head">머리(+ 1000원)</option>
										</select> "하트" add to WishList
									</form>

									수량 조절 이미지 <input type="button" style="background-color: grey;"
										value="장바구니 담기"> <input type="button"
										style="background-color: yellow" value="바로 구매"><br>
									100,000원 이상 구매시 무료배송 (배송조건 이런거 없나요?)
								</div>
							</div>
						</div>
					</div>

					<div class="goods_Q&A">
				   		 <c:forEach var="item" items="${qna_list}">
				       		 
				       		 <div class="Q" onclick="toggleAnswer(this)" >
				             	<p> ${item.question_content} (질문 작성일 : ${item.question_write_date}) </p>
				        	 </div>
				        
				        	 <div class="A" style="display:none;">
				             	<p style="color : pink;"> ${item.answer_content} (답변 작성일 : ${item.answer_write_date})</p>
				        	 </div>
				    	
				    	</c:forEach>
					</div>
					
					---------------------"절취선"------------------
					
					<div class="goods_review">
				   		 <c:forEach var="item" items="${review_list}">
				       		 <div class="review">
				             <img src=" ${item.image_url}">
				             <p>평점 : ${item.rating} </p>
				             <p>내용 : ${item.content} </p>
				             <p>작성일 : ${item.write_date} </p>
				        	 </div>
				    	</c:forEach>
					</div>
					
					
					</div>
				</div>
			</div>

			<div class="footer">
				<div class="footer-color"></div>
			</div>
		</div>
		
</div>
				
<script>

$(".Q").click(function() {
    $(this).next(".A").stop().slideToggle(300);
	$(this).toggleClass('on').siblings().removeClass('on');
	$(this).next(".A").siblings(".A").slideUp(300); // 1개씩 펼치기
});

</script>		
</body>
</html>