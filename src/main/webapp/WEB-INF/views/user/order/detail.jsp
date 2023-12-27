<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">

<style>

.order_container {
display : flex;
}

.menu_name {
margin-bottom: 10px;	
}

.goods_name_container{
height : 20px;
width : 500px;

}

.goods_name {
margin-left : 20px;
margin-top : 5px;
width: 400px;
height: 30px;
}

.goods_name a {
    display: block;
    width: 400px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.goods_option {
    float: left;
    font-size: 15px;
    margin-left : 20px;
 }


.goods_price_container{
display:flex;
width : 200px;
height : 100px;
}

.price {
    float: left;
    width:180px;
    text-align:right;
    margin-top: 15px;
    margin-right:26px;
    font-size: 25px;
}

.button {
float:left;
font-size:13px;
width:300px;
margin-top : 12px;
}

#confirmPurchase {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 12px;
  border-radius: 50px;
  width: 90px;
  height: 35px;
  font-size: 15px;
  background-color: #FFDE30;
  font-weight: 800;
  color: #222;
  
 }

#confirmCancel {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 12px;
  border-radius: 50px;
  width: 90px;
  height: 35px;
  font-size: 15px;
  background-color: #ff4742;
  font-weight: 800;
  color: #fff;
  
 }
#refoundInfo {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 12px;
  border-radius: 50px;
  margin: 0 0 0 60px;
  width: 90px;
  height: 35px;
  font-size: 15px;
  background-color: gray;
  font-weight: 800;
  color: #fff;
 }
 
#cancledOrder {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 12px;
  border-radius: 50px;
   margin: 0 0 0 50px;
  width: 110px;
  height: 35px;
  font-size: 15px;
  background-color: gray;
  font-weight: 800;
  color: #fff;
 }
 
#cancledOrder:hover{
	cursor:default;
}
#goWriteReview {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 150px;
  height: 35px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 800;
  color: #222;
  
  margin-left: 28px;
 }

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 930px;
   }
   
.line {
 		margin-bottom : 10px;
 		width : 930px;
        border: 1px solid #ccc;
     }


.go_back{
width : 930px;
text-align : right;
}

</style>
</head>
<body>
	<div class="wrap">
        <div class="header">
        	<c:if test="${empty adminLoginInfo}">
	            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        	</c:if>
        	<c:if test="${!empty adminLoginInfo}">
	            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        	</c:if>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<div>
						<h1 class ="menu_name">구매내역 상세보기</h1>
						<hr class = "start_line">
					</div>
					<div>
						<ul>
							<c:forEach items="${dvo_list }" var="dvo" varStatus="status">
							
								<form>
										<div>
											<c:if test="${empty img_list[status.index] }">
												<br><h3>삭제된 상품입니다</h3>
											</c:if>

											<div class ="order_container">
												<div class ="goods_image">
													<c:if test="${!empty img_list[status.index] && fn:substring(img_list[status.index], 0, 1) == 'h' }">
														<img src="${img_list[status.index] }" width="100" height="100">
													</c:if>
													<c:if test="${!empty img_list[status.index] && !(fn:substring(img_list[status.index], 0, 1) == 'h') }">
														<img src="/resources/img/product/registed_img/${img_list[status.index] }" width="100" height="100">
													</c:if>
												</div>
											
										
												
												<div class = "goods_name_container">
													
													<div class ="goods_name">
														<h4><a href="/user/product/goods.do?no=${dvo.product_no }"> ${dvo.product_name }</a></h4> 
													</div>
													
													<div class = "goods_option">
														<c:forEach items="${ovo_list[status.index] }" var="ovo">
															${ovo.title } ${ovo.content }<br>
														</c:forEach>
													</div>
													
													
												</div>
												
												<div class = "goods_price_container">
													<div class = "price">
													${dvo.product_price }원  / ${dvo.quantity }개
													</div>
												</div>
										
										<div class ="button">
											
											<c:if test="${dvo.purchase_confirmation_date == null && dvo.cancle_status == 0 && dvo.refound_status == 0}">
												
												
												<input id ="confirmPurchase" type="button" class="purchase_confirm" value="구매 확정" data-no="${dvo.no }">
												<c:if test="${dvo.delivery_status == 0 }">
													<input id ="confirmCancel" type="button" class="request_cancle" value="취소 신청" data-no="${dvo.no }">
												</c:if>
												<c:if test="${dvo.delivery_status != 0 }">
													<input id ="confirmCancel" type="button" class="request_refound" value="환불 신청" data-no="${dvo.no }">
												</c:if>
											</c:if>
											<c:if test="${dvo.cancle_status != 0 }">
												<input type="button" id="cancledOrder" value="취소된 주문">
											</c:if>
											<c:if test="${dvo.refound_status != 0 }">
												<input  id ="refoundInfo" type="button" class="refound_info" value="반품 정보" data-no="${dvo.no }">
											</c:if>
											<c:if test="${!empty img_list[status.index] }">
												<c:if test="${dvo.purchase_confirmation_date != null }">
													<c:if test="${review_list[status.index] == 0 }">
														<input id ="goWriteReview" type="button" class="write_review" value="리뷰작성" data-no="${dvo.no }">
													</c:if>
													<c:if test="${review_list[status.index] != 0 }">
														<input id ="goWriteReview" type="button" class="read_review" value="리뷰보기" data-no="${dvo.no }">
													</c:if>
												</c:if>
											</c:if>
										</div>
									</div>
								
								</div>
									
								</form>
								
								<hr class ="line">
							
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
    <script>
    	$('.purchase_confirm').on('click', purchase_confirm);
    	$('.request_cancle').on('click', request_cancle);
    	$('.request_refound').on('click', request_refound);
    	$('.refound_info').on('click', refound_info);
    	$('.write_review').on('click', write_review);
    	$('.read_review').on('click', read_review);
    	
    	function purchase_confirm(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		location.href="purchase_confirm.do?no=" + no + "&order_no=" + ${dvo_list[0].order_no};
    	}
    	
    	function request_cancle(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/request_cancle.do?no=' + no + "&order_no=" + ${dvo_list[0].order_no},'request_cancle', 'width=425px,height=470px,location=no,status=no,scrollbars=yes');
    	}
    	function request_refound(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/request_refound.do?no=' + no + "&order_no=" + ${dvo_list[0].order_no} + "&seller_no=" + ${dvo_list[0].seller_no},'request_refound', 'width=425px,height=470px,location=no,status=no,scrollbars=yes');
    	}
    	function refound_info(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/refound_info.do?no=' + no + "&order_no=" + ${dvo_list[0].order_no} + "&seller_no=" + ${dvo_list[0].seller_no},'request_refound', 'width=425px,height=470px,location=no,status=no,scrollbars=yes');
    	}
    	function write_review(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/write_review.do?no=' + no,'write_review', 'width=345px, height=440px,location=no,status=no,scrollbars=yes');
    	}
    	function read_review(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/read_review.do?no=' + no,'write_review', 'width=340px, height=460px,location=no,status=no,scrollbars=yes');
    	}
    </script>
</body>
</html>