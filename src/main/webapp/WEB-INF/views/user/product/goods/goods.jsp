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
		.contentsright{
			width: 100%;
			height: 1000px;
		}
		
		.left_side{
			width: 50%;
			height: 650px;
			float:left;
		}
		
		.right_side{
			width:50%;
			height:650px;
			float:right;
			display:flex;
			justify-content: center;
			align-items:center;	
		}
		
		
		#goods_category{
			margin: 50px 0 50px 0;
		}
		.big_category{
			color: gray;
		}
		.small_category{
			color: black;
			font-weight: bold;
		}
		
		.goods-name{
			margin-bottom:30px;
		}
		.goods-score{
			font-size:20px;
			margin-bottom:10px;
		}
		.goods-score img{
			width:19px;
			height:19px;
		}
		.goods-price{
			margin-bottom:10px;
			font-weight: bold;
		}
		.before_price{
			text-decoration:line-through;
			font-weight: normal;
			color:gray;
		}
		.goods-made{
			margin-bottom:10px;
		}
		.goods-explain{
			margin-bottom:20px;
		}
		.goods-option{
			margin-bottom:20px;
		}
		.quantity{
			width:110px;
			margin-bottom:30px;
			margin-right: 10px;
		}
		.push_cart{
			width: 150px;
			height: 50px;
			border: none;
			background: grey;
			color: white;
			font-size: 17px;
			font-weight: bolder;
		}
		.now_get{
			margin-left: 10px;
			width: 150px;
			height: 50px;
			border: none;
			background: linear-gradient(to left, #FFDE30, #ffe76b);
			color: black;
			font-size: 17px;
			font-weight: bolder;
		}
		
		
		
		.goods_review_QNA{
			width:100%;
			height:300px;
			clear:both;
		}
		
		
		


        .board_title {
            padding: 10px;
            background-color: #f0f0f0;
            display: inline-block;
            margin-right: 10px;
            display: inline-block;
			outline: 0;
			cursor: pointer;
			border-radius: 7px;
			border:1px solid grey;
			font-size: 18px;
			height: 40px;
			padding: 0 11px;
			text-align: center;
			width: 20%;
			min-width: 200px;
			font-weight: 500;
			color: #0F1111;
			margin-right: -4px;
			margin-top: -1px;
			line-height:40px;
			margin: 0 10px 0 0;
			:hover{
			     background: #F7CA00;
			     border-color: #F2C200;
			     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
 			}
 			
        }

        .board_title.on {
            background-color: #ddd;
            display: inline-block;
		 	outline: 0;
			cursor: pointer;
			border-radius: 7px;
			border:2px solid grey;
			font-size: 18px;
			height: 40px;
			padding: 0 11px;
			text-align: center;
			width: 20%;
			min-width: 200px;
			font-weight: 500;
			color: #0F1111;
			margin-right: -4px;
			line-height:40px;
			margin: 0 10px 0 0;
			:hover{
			    background: #F7CA00;
			    border-color: #F2C200;
			    box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
	 		}
	    }



        .board_contents {
            display: none;
        }

        .board_contents.active {
            display: block;
        }
        
        .qna_write_button button{
        	margin-top:20px;
        	
        	width: 150px;
			height: 30px;
			border: 1px solid black;
			background: linear-gradient(to left, #FFDE30, #ffe76b);
			color: black;
			font-size: 11px;
			font-weight: bolder;
        	
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
				<div class="left_side">
					<div id="goods_category">
						<c:forEach var="item" items="${product_more_category}">
							<span class="big_category">${catekor.category_name[item.category1]} > </span> 
							<span class="small_category">${catekor.category[item.category1][item.category2] }</span> <br>
						</c:forEach>
					</div>
					<c:forEach var="item" items="${product_more}">
							
							<div class="goods-details">
								
								<div id="goods_menu">
								
									<div class="goods-name">
										<h2>${item.name}</h2>
									</div>
								
									<div class="goods-score">
										<img src="/resources/img/common/star.jpg"> ${item.rating} / 5.0  	
									</div>
								
									<c:if test="${item.discount eq 0 }">
										<div class="goods-price">
											가격 : ${item.price} 원
										</div>
									</c:if>
									<c:if test="${item.discount ne 0 }">
										<div class="goods-price">
										
											<c:set var="after_price" value="${item.price - item.discount }"></c:set>
											가격 : <span class="before_price">${item.price} 원</span>
											<span class="after_price"><c:out value="${after_price }"/> 원 </span>
											<span>(${item.discount }원 할인)</span>
										</div>
									</c:if>
									
									
									<div class="goods-made">
										제조사: ${item.company} <br> 
										브랜드: ${item.brand } <br>
										재 고: ${item.stock } <br>
						
									</div>
									
									<div class="goods-explain">
										설명: <c:if test="${item.description eq ''}"> 없음 </c:if>${item.description} <br>
									
									</div>	
								</div>
							</div>	
						</c:forEach>									
						<div class="goods-option"> 
							<form name="option_form" id="option_form">
							<c:forEach var="ovo" items="${product_more_option }" varStatus="status">
								<c:if test="${(status.index == 0) || (product_more_option[status.index - 1].title != ovo.title)}">
									${ovo.title } : <select name="option_no" id="option_no">
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
						<div>
							수량 : <input class="quantity" type="number" name="choose_number" value=0>
								
								<c:if test ="${empty zzim_check}">	
									찜: <img id="zzim_Off" onclick="zzim();" src="${pageContext.request.contextPath}/resources/img/product/empty_heart.png"/>
								</c:if>
								<c:if test ="${!empty zzim_check}">	
									찜: <img id="zzim_On" onclick="zzim();" src="${pageContext.request.contextPath}/resources/img/product/fill_heart.png"/>
								</c:if>
						</div>
						<div>
							<input type="button" class="push_cart" style="background-color: grey;" value="장바구니 담기" onclick="addcart()"> 
							<input type="button" class="now_get" style="background-color: yellow" value="바로 구매">
						</div>	
					</div>
					
					<div class="right_side">
					<c:forEach var="item" items="${product_more}">
						<div class="goods-photo">
							<c:if test="${empty item.image_url }">
								<img src="/resources/img/product/no_image.jpg" width="100" height="100">
							</c:if>
							<c:if test="${!empty item.image_url && fn:substring(item.image_url, 0, 1) == 'h' }">
								<img src="${item.image_url }"  width="590">
							</c:if>
							<c:if test="${!empty item.image_url && !(fn:substring(item.image_url, 0, 1) == 'h') }">
								<img src="/resources/img/product/registed_img/${item.image_url }" width="590">
							</c:if>
						</div>
					</c:forEach>
					</div>
					
					
					
					
					
					<div class = "goods_review_QNA">
						<div class="board_title on" onclick="showBoard('review')" data-board="review">리뷰</div>
						<div class="board_title" onclick="showBoard('qna')" data-board="qna">Q&A</div>
						
						<div class="board_contents active" id ='review'>
							
						</div>
						<div class="board_contents" id = "qna">
							<div class="qna_write_button">
								<button type="button" name="go_qnawrite" onclick="goQnawrite_popup()">질문 작성하기</button>
							</div>
							<div id="qna_container">
								
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

function goQnawrite_popup(){
	var product_no = ${product_no};
	var qnaWrite = 'qnawrite.do?no='+ product_no;
	window.open(qnaWrite , 'Q&A등록', 'width=500, height=600');
}

// 질문 ,해답 하나씩 켜고 끄기


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
				alert("찜 등록이 되었습니다.");
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

<script>
//페이지 로딩시 리뷰 가져오는 ajax
	var htmlData;
	$.ajax({
		type: "GET",
		url:'getReview.do?no=${product_no}',
		async: false,
		dataType: "HTML",
		success:function(data) {
			htmlData = data;
		}
	})
	
	let target = $(htmlData);
	$('#review').append(htmlData);
	
	$.each($('.reviewPageButton'), function(i, e){
		$(e).on('click', getReview);
	});
	
	function getReview(){
		var htmlData;
		console.log($(this).data('page'));
		var page = $(this).data('page');
		$.ajax({
			type: "GET",
			url:'getReview.do?no=${product_no}&page=' + page,
			async: false,
			dataType: "HTML",
			success:function(data) {
				htmlData = data;
			}
		})
		$('#review').empty();
		$('#review').append(htmlData);
		$.each($('.reviewPageButton'), function(i, e){
			$(e).on('click', getReview);
		});
	}
</script>
<script>
//페이지 로딩시 qna 가져오는 ajax
	var htmlData;
	$.ajax({
		type: "GET",
		url:'getQnA.do?no=${product_no}',
		async: false,
		dataType: "HTML",
		success:function(data) {
			htmlData = data;
		}
	})
	$('#qna_container').append(htmlData);
	
	$.each($('.qnaPageButton'), function(i, e){
		$(e).on('click', getQnA);
	});
	//답변 보이는 이벤트리스너 추가 
	$(".Q").click(function() {
	    $(this).next(".A").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".A").siblings(".A").slideUp(300); // 1개씩 펼치기
	});
	
	function getQnA(){
		var htmlData;
		var page = $(this).data('page');
		$.ajax({
			type: "GET",
			url:'getQnA.do?no=${product_no}&page=' + page,
			async: false,
			dataType: "HTML",
			success:function(data) {
				htmlData = data;
			}
		})
		$('#qna_container').empty();
		$('#qna_container').append(htmlData);
		$.each($('.qnaPageButton'), function(i, e){
			$(e).on('click', getQnA);
		});
		//답변 보이는 이벤트리스너 추가 
		$(".Q").click(function() {
		    $(this).next(".A").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".A").siblings(".A").slideUp(300); // 1개씩 펼치기
		});
	}
</script>
</body>
</html>