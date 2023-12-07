<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
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


    <style>

        .board_area {
            max-width: 600px;
            margin: 0 auto;
        }

        .board_title {
            cursor: pointer;
            padding: 10px;
            background-color: #f0f0f0;
            display: inline-block;
            margin-right: 10px;
        }

        .board_title.on {
            background-color: #ddd;
        }

        .board_contents {
            display: none;
        }

        .board_contents.active {
            display: block;
        }



    </style>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</div>

		<div class="contents">
			<div class="quickmenu">
				<%@ include file="/WEB-INF/views/common/quickmenu_seller.jsp"%>
			</div>
			<div class="contentsright">
				<div>
					
						<div id="goods_category" style="width: 720px; height: 100px; border: 1px solid black">
									
									    <c:forEach var="item" items="${product_more_category}">
									        ${catekor.category_name[item.category1]} > 
									        ${catekor.category[item.category1][item.category2] } <br>
									       
									    </c:forEach>
									
						</div>
						
						
						<c:forEach var="item" items="${product_more}">
							
								<div class="goods-photo">
										<c:if test="${empty item.image_url }">
											<img src="/resources/img/product/no_image.jpg" width="100" height="100">
										</c:if>
										<c:if test="${!empty item.image_url && fn:substring(item.image_url, 0, 1) == 'h' }">
											<img src="${item.image_url }">
										</c:if>
										<c:if test="${!empty item.image_url && !(fn:substring(item.image_url, 0, 1) == 'h') }">
											<img src="/resources/img/product/registed_img/${item.image_url }">
										</c:if>
								</div>
								<div class="goods-details">
									
									<div id="goods_menu">
									
										<div class ="goods_no" style="width: 720px; height: 100px; border: 1px solid black;">
											${product_no} 제품번호
										</div>
										
										<div class="goods-name"
											style="width: 720px; height: 100px; border: 1px solid black;">
											<h2>${item.name}</h2>
										</div>
									
										<div class="goods-price"
											style="width: 720px; height: 100px; border: 1px solid black;">
											<h2>${item.price} </h2>
										</div>
		
										<div class="goods-explain"
											style="width: 720px; height: 100px; border: 1px solid black;">
											${item.description}
										</div>
		
									</div>	
								</div>		
						</c:forEach>
									
										<div class="goods-option"
												style="width: 720px; height: 100px; border: 1px solid black;"> 
																							
											<select name="category">															
												<c:forEach var="item" items="${product_more_option}">
													<option value="${item.content} ${item.price}"> ${item.title} : ${item.content} 추가금액 : ${item.price}</option>
												</c:forEach>													
											</select>
										
										</div>
									
											수량 조절 이미지 <input type="button" style="background-color: grey;"
												value="장바구니 담기"> <input type="button"
												style="background-color: yellow" value="바로 구매"><br>
											100,000원 이상 구매시 무료배송 (배송조건 이런거 없나요?)
								
						<div class = "goods_review_QNA">
								<div class="board_title on" onclick="showBoard('review')" data-board="review">리뷰</div>
								<div class="board_title" onclick="showBoard('qna')" data-board="qna">Q&A</div>
								<div class="board_contents active" id ='review'>
							   		 <c:forEach var="item" items="${review_list}">
							       		 <div class="review">
							             <img src=" ${item.image_url}">
							             <p>평점 : ${item.rating} </p>
							             <p>내용 : ${item.content} </p>
							             <p>작성일 : ${item.write_date} </p>
							        	 </div>
							    	</c:forEach>
								</div>
							
								<div class="board_contents" id = "qna">
						
						 		<div class="qna_write_button">
									<button type="button" name="go_qnawrite" onclick="location.href='/product/qnawrite.do?no=${product_no}'">qna 작성하기</button>
								</div>
						 
						   		 <c:forEach var="item" items="${qna_list}">
						       		 
						       		 <div class="Q" onclick="toggleAnswer(this)" >
						             	<p> ${item.question_content} (질문 작성일 : ${item.question_write_date}) </p>
						        	 </div>
						        
						        	 <div class="A" style="display:none;">
						             	<p style="color : pink;"> ${item.answer_content} (답변 작성일 : ${item.answer_write_date})</p>
						        	 </div>
						    	
						    	</c:forEach>
							</div>
					</div>
									</div>
								</div>
							</div>
						</div>
				

			
					
					</div>
				</div>
			</div>

			<div class="footer">
				<div class="footer-color"></div>
			</div>
		</div>
		
<script>






// 질문 ,해답 하나씩 켜고 끄기
$(".Q").click(function() {
    $(this).next(".A").stop().slideToggle(300);
	$(this).toggleClass('on').siblings().removeClass('on');
	$(this).next(".A").siblings(".A").slideUp(300); // 1개씩 펼치기
});

// 탭 구현
function showBoard(boardId) {
    const boards = document.querySelectorAll('.board_contents');
    const titles = document.querySelectorAll('.board_title');

    boards.forEach(board => board.classList.remove('active'));
    titles.forEach(title => title.classList.remove('on'));

    const selectedBoard = document.getElementById(boardId);
    const selectedTitle = Array.from(titles).find(title => title.dataset.board === boardId);

    if (selectedBoard && selectedTitle) {
        selectedBoard.classList.add('active');
        selectedTitle.classList.add('on');
    }
}




</script>		
</body>
</html>