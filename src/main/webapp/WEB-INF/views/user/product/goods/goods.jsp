<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Pet Meets World</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
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
			<div class="contentsright">
				<div>
					<div id="goods_category" style="width: 720px; height: 100px; border: 1px solid black">
						<c:forEach var="item" items="${product_more_category}">
							${catekor.category_name[item.category1]} > 
							${catekor.category[item.category1][item.category2] } <br>
						</c:forEach>
					</div>
					유저 ID : ${userLoginInfo.id} <br>
					유저 번호 : ${userLoginInfo.no } 
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
										제품번호: ${product_no} 
									</div>
									
									<div class="goods-name"
										style="width: 720px; height: 100px; border: 1px solid black;">
										<h2>${item.name}</h2>
									</div>
								
									<div class="goods-price"
										style="width: 720px; height: 100px; border: 1px solid black;">
										가격 : ${item.price}
									</div>
									
									<div class="goods-made"
										style="width: 720px; height: 100px; border: 1px solid black;">
										제조사: ${item.company} <br> 
										브랜드: ${item.brand } <br>
										재 고: ${item.stock } <br>
						
									</div>
									
									<div class="goods-explain"
										style="width: 720px; height: 100px; border: 1px solid black;">
										설명: ${item.description} <br>
									
									</div>	
								</div>		
							</div>
					</c:forEach>									
					<div class="goods-option" style="width: 720px; height: 100px; border: 1px solid black;"> 
						<form name="option_form" id="option_form">
						<c:forEach var="ovo" items="${product_more_option }" varStatus="status">
							<c:if test="${(status.index == 0) || (product_more_option[status.index - 1].title != ovo.title)}">
								${ovo.title } 
								<select name="option_no" id="option_no">
									</c:if>
											<option value="${ovo.no}"> ${ovo.content } :  ${ovo.price }원</option>
									<c:if test="${(product_more_option[status.index + 1].title != ovo.title)}">
								</select><br>
							</c:if>
						</c:forEach>
						<input type="hidden" name="user_no" value="${userLoginInfo.no}">
						<input type="hidden" name="product_no" value="${product_no}">
						</form>
					</div>
					
					수량 <input type="number" name="choose_number" value=0>
					
					<input type="button" style="background-color: grey;" value="장바구니 담기" onclick="addcart()"> 
					<input type="button" style="background-color: yellow" value="바로 구매" >
						
					<c:if test ="${empty zzim_list}">	
						찜: <img id="zzim_Off" onclick="zzim();" src="${pageContext.request.contextPath}/resources/img/product/empty_heart.png"/>
					</c:if>
					<c:if test ="${!empty zzim_list}">	
						찜: <img id="zzim_On" onclick="zzim();" src="${pageContext.request.contextPath}/resources/img/product/fill_heart.png"/>
					</c:if>
								
					<br>	

					<div class = "goods_review_QNA">
						<div class="board_title on" onclick="showBoard('review')" data-board="review">리뷰</div>
						<div class="board_title" onclick="showBoard('qna')" data-board="qna">Q&A</div>
						<div class="board_contents active" id ='review'>
					   		 <c:forEach var="item" items="${review_list}">
					       		 <div class="review">
						       		 <c:if test="${!empty item.image_url }">
							             <img src="/resources/img/product/review_img/${item.image_url}" width="100" height="100">
						       		 </c:if>
						             <p>평점 : ${item.rating} </p>
						             <p>내용 : ${item.content} </p>
						             <p>작성일 : ${item.write_date} </p>
					        	 </div>
					    	</c:forEach>
					    	<div>
					    		<ul class='paging'>
			                        <c:if test="${reviewPaging.prev }">
			                        	<li><a href="list.do?page=${reviewPaging.startPage-1 }"> << </a></li>
			                        </c:if>
			                        <c:forEach var="p" begin="${reviewPaging.startPage}" end="${reviewPaging.endPage}">
			                        	<c:if test="${p == review_svo.page}">
			                            <li><a href='#'>${p}</a></li>
			                            </c:if>
			                            <c:if test="${p != review_svo.page}">
			                            	<li><a href='goods.do?no=${product_no }&page=${p}'>${p}</a></li>
			                            </c:if>
			                        </c:forEach>
			                        <c:if test="${reviewPaging.next }">
			                        	<li><a href="list.do?page=${reviewPaging.endPage+1 }"> >> </a></li>
			                        </c:if>
								</ul> 
					    	</div>
						</div>
						
						<div class="board_contents" id = "qna">
					 		<div class="qna_write_button">
								<button type="button" name="go_qnawrite" onclick="goQnawrite_popup()">qna 작성하기</button>
							</div>
					 
					   		 <c:forEach var="item" items="${qna_list}">
					       		 <div class="Q" onclick="toggleAnswer(this)" >
					             	<p> ${item.question_content} (질문 작성일 : ${item.question_write_date}) </p>
					        	 </div>
					        
					        	 <div class="A" style="display:none;">
					             	<p style="color : red;"> ${item.answer_content} (답변 작성일 : ${item.answer_write_date})</p>
					        	 </div>
					    	</c:forEach>
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

function goQnawrite_popup(){
	var product_no = ${product_no};
	var qnaWrite = 'qnawrite.do?no='+ product_no;
	window.open(qnaWrite , 'Q&A등록', 'width=500, height=600');
}

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

function zzim(){
	
	var login = "${userLoginInfo}";
	
	if(login == null || login == ""){
		alert("로그인 후 사용 가능합니다");
		return;
	}
	
    var product_no = "${product_no}";
	console.log(product_no);
	
    var user_no = "${userLoginInfo.no}";
	console.log(user_no);
	
	var zzim_Off = $('#zzim_Off').attr('src');
	var zzim_On = $('#zzim_On').attr('src');
	
	console.log($('#zzim_Off').attr('src'));
	console.log($('#zzim_On').attr('src'));
	
	if (zzim_Off == '/resources/img/product/empty_heart.png'){
		console.log(zzim_Off);
		
		$.ajax({
			method: "POST",
			url:'zziminsert.do',
			async: true,
			type:'HTML',
			data: {
				product_no : product_no,
				   user_no : user_no
			},
			success : function(response){
				alert("찜등록이 되었습니다.");
				$('#zzim_off').attr('src' ,'/resources/img/product/fill_heart.png');
				history.go(0);
			},
			error: function (error) {
				alert("오류가 발생했습니다. 잠시 후 다시 이용해주세요");
	        }
		});
	}else if(zzim_On == '/resources/img/product/fill_heart.png'){
		console.log(zzim_On);
		
		$.ajax({
			method: "POST",
			url:'zzimcancel.do',
			async: true,
			type:'HTML',
			data: {
				product_no : product_no,
				   user_no : user_no
			},
			success : function(response){
				alert("찜등록이 삭제 되었습니다.");
				$('#zzim_On').attr('src' ,'/resources/img/product/empty_heart.png');
				history.go(0);
			},
			error: function (error) {
				alert("오류가 발생했습니다. 잠시 후 다시 이용해주세요");
	        }
		});
	}
	
	
}
	

</script>
<script>
	function addcart(){
		var cart_form = $('#option_form').serialize();
		var login = "${userLoginInfo}";
		
		if(login == null || login == ""){
			alert("로그인 후 사용 가능합니다");
			return;
		}
		
		$.ajax({
			type: "POST",
			url:'addcart.do',
			data: cart_form,
			async: false,
			success:function(res) {
				if (res == 'true') {
					alert('장바구니에 추가되었습니다');
				} else {
					alert('장바구니 추가에 실패했습니다.');
				}
			}
		})
	}
</script>	
</body>
</html>