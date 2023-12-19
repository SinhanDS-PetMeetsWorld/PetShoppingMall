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
        </div>/div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<div>
						<h2>구매내역 상세보기</h2>
						<a href="list.do">구매이력 목록으로 돌아가기</a>
					</div>
					<div>
						<ul>
							<c:forEach items="${dvo_list }" var="dvo" varStatus="status">
								<form >
									<li>
										<div>
											<c:if test="${empty img_list[status.index] }">
												<br><h3>삭제된 상품입니다</h3>
											</c:if>

											
											<c:if test="${!empty img_list[status.index] && fn:substring(img_list[status.index], 0, 1) == 'h' }">
												<img src="${img_list[status.index] }" width="100" height="100">
											</c:if>
											<c:if test="${!empty img_list[status.index] && !(fn:substring(img_list[status.index], 0, 1) == 'h') }">
												<img src="/resources/img/product/registed_img/${img_list[status.index] }" width="100" height="100">
											</c:if>
										</div>
										<div>
											${dvo.product_name } <br>
											<c:forEach items="${ovo_list[status.index] }" var="ovo">
												${ovo.title } ${ovo.content }<br>
											</c:forEach>
											
										</div>
										<div>
											${dvo.product_price }원  / ${dvo.quantity }개<br>
											
											<c:if test="${dvo.purchase_confirmation_date == null && dvo.cancle_status == 0 && dvo.refound_status == false}">
												<input type="button" class="purchase_confirm" value="구매확정" data-no="${dvo.no }">
												<c:if test="${dvo.delivery_status == 0 }">
													<input type="button" class="request_cancle" value="취소신청" data-no="${dvo.no }">
												</c:if>
												<c:if test="${dvo.delivery_status != 0 }">
													<input type="button" class="request_refound" value="반품신청" data-no="${dvo.no }">
												</c:if>
											</c:if>
											<c:if test="${dvo.cancle_status != 0 }">
												주문 취소됨
											</c:if>
											<c:if test="${dvo.refound_status != false }">
												<input type="button" class="refound_info" value="반품정보" data-no="${dvo.no }">
											</c:if>
											<c:if test="${!empty img_list[status.index] }">
												<c:if test="${dvo.purchase_confirmation_date != null }">
													<c:if test="${review_list[status.index] == 0 }">
														<input type="button" class="write_review" value="리뷰작성" data-no="${dvo.no }">
													</c:if>
													<c:if test="${review_list[status.index] != 0 }">
														<input type="button" class="read_review" value="리뷰보기" data-no="${dvo.no }">
													</c:if>
												</c:if>
											</c:if>
										</div>
										<hr>
									</li>
								</form>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
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
    		window.open('/user/order/request_cancle.do?no=' + no + "&order_no=" + ${dvo_list[0].order_no},'request_cancle', 'width=430,height=500,location=no,status=no,scrollbars=yes');
    	}
    	function request_refound(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/request_refound.do?no=' + no + "&order_no=" + ${dvo_list[0].order_no} + "&seller_no=" + ${dvo_list[0].seller_no},'request_refound', 'width=430,height=500,location=no,status=no,scrollbars=yes');
    	}
    	function refound_info(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/refound_info.do?no=' + no + "&order_no=" + ${dvo_list[0].order_no} + "&seller_no=" + ${dvo_list[0].seller_no},'request_refound', 'width=430,height=500,location=no,status=no,scrollbars=yes');
    	}
    	function write_review(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/write_review.do?no=' + no,'write_review', 'width=430,height=500,location=no,status=no,scrollbars=yes');
    	}
    	function read_review(e){
    		e.preventDefault();
    		let no = $(this).data('no');
    		window.open('/user/order/read_review.do?no=' + no,'write_review', 'width=430,height=500,location=no,status=no,scrollbars=yes');
    	}
    </script>
</body>
</html>