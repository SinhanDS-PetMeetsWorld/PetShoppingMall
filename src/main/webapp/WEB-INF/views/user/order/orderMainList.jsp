<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<form>
						<h1>구매 이력</h1>
						<c:forEach items="${orderList }" var="vo">
							<div>
								<div>
									<div>
										주문번호 : <span id="orderNo">${vo.no }</span> <input type="button" class="removeThisOrder" value="구매이력 삭제">
									</div>
									<div>
										${vo.name } 총 결제금액: ${vo.total_price }원
									</div>
								</div>
								
								<div>
									<div>주문 상태:</div> 
									<div><input type="button" class="seeOrderDetailButton" value="상세 보기"></div>
									<%-- <div><input type="button" class="purchaseConfirm" value="일괄 구매 확정"></div>--%>
								</div>
								<hr><br>
							</div>
						</c:forEach>
					
					</form>
				</div>
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
<script>
	$('.removeThisOrder').on('click', removeThisOrder);
	$('.seeOrderDetailButton').on('click', seeOrderDetailButton);
	$('.purchaseConfirm').on('click', purchaseConfirm);
	
	//<input type="hidden" name="no" value="${vo.no }">
	function removeThisOrder(){
		let form = document.querySelector('form');
		console.log();
		var no = this.parentNode.parentNode.parentNode.querySelector('#orderNo').innerText
		$(form).attr('action', "removeThisOrder.do");
		
		let newObj = $('<input type="hidden" name="no">');
		console.log(newObj);
		
		$(newObj).attr('value', no);
		newObj.appendTo(form);
		form.submit();
	}
	function purchaseConfirm(){
		let form = document.querySelector('form');
		var no = this.parentNode.parentNode.parentNode.querySelector('#orderNo').innerText
		console.log(no);
		$(form).attr('action', "purchaseConfirmByOrderMainNo.do");
		
		let newObj = $('<input type="hidden" name="no">');
		console.log(newObj);
		
		$(newObj).attr('value', no);
		newObj.appendTo(form);
		form.submit();
	}
	function seeOrderDetailButton(){
		let form = document.querySelector('form');
		var no = this.parentNode.parentNode.parentNode.querySelector('#orderNo').innerText
		console.log(no);
		$(form).attr('action', "seeOrderDetail.do");
		
		let newObj = $('<input type="hidden" name="no">');
		console.log(newObj);
		
		$(newObj).attr('value', no);
		newObj.appendTo(form);
		form.submit();
	}
</script>
</html>