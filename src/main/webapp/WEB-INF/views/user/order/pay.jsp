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
			<div class="contentsright">
				<div>
					<h1>구매자 ${userno }의 Pay 페이지 입니다.</h1>
					<form method="post" action="buy.do">
						<input type="hidden" name="user_no" value="${userno }">
						<h2>주소 선택</h2>
						<ol>
							<c:forEach items="${ userAddressList}" var="vo" varStatus="status">
								<li>
									<input type="radio" class="address_selector" name="address_selector" value=${status.index }  
										<c:if test="${status.index == 0}">checked</c:if>>
								 
									별명: ${vo.name }  ${vo.comment }<br>
									우편번호: ${vo.zipcode }<br>
									주소 : ${vo.addr1 }<br>
									상세 주소: ${vo.addr2 }<br>
									연락처: ${vo.phone }<br>
									<br><hr>		
									
								</li>
							</c:forEach>
							
							<div class="address_value_list">
								<h2>다음 요청으로 보낼 애들임. 나중에 hidden으로 바꿔주세용</h2>
								<input type="text" class="zipcode" name="zipcode" value="${userAddressList[0].zipcode }"><br>
								<input type="text" class="addr1" name="addr1" value="${userAddressList[0].addr1 }"><br>
								<input type="text" class="addr2" name="addr2" value="${userAddressList[0].addr2 }"><br>
							</div>
						</ol>
						<hr>
						
						
						<h2>결제 수단 선택</h2>
						<ol>
							<c:forEach items="${ userPaymentList}" var="vo"	varStatus="status">
								<li>
									<input type="radio" class="payment_selector" name="payment_selector" value=${status.index }  
										<c:if test="${status.index == 0}">checked</c:if>>
									타입: ${vo.type }<br>
									회사: ${vo.company }<br>
									계좌 : ${vo.account }<br>
									<br><hr>
								</li>
							</c:forEach>
							<div class="payment_value_list">
								<h2>다음 요청으로 보낼 애들임. 나중에 hidden으로 바꿔주세용</h2>
								<input type="text" class="payment_type" name="payment_type" value="${userPaymentList[0].type }"><br>
								<input type="text" class="payment_company" name="payment_company" value="${userPaymentList[0].company }"><br>
								<input type="text" class="payment_account" name="payment_account" value="${userPaymentList[0].account }"><br>
							</div>	
						</ol>
						<hr>

						
						
						<h2>상품 정보 출력</h2>
						<c:forEach items="${product_list }" var="vo" varStatus="status">
							<input type="hidden" name="cart_no_list" value="${cno_list[status.index]}">
							장바구니 번호: ${cno_list[status.index]}<br>
							<input type="hidden" name="order_detail_product_no_list" value="${vo.no}">
							상품 번호: ${vo.no}<br>
							<input type="hidden" name="order_detail_seller_no_list" value="${vo.seller_no}">
							판매자 번호: ${vo.seller_no }<br>
							<input type="hidden" name="order_detail_product_name_list" value="${vo.name}">
							상품명: ${vo.name }<br>
							<input type="hidden" name="order_detail_product_price_list" value="${vo.price}">
							가격: ${vo.price }<br>
							<input type="hidden" name="order_detail_product_discount_list" value="${vo.discount}">
							할인가격: ${vo.discount }<br>
							<input type="hidden" name="order_detail_quantity_list" value="${quantity_list[status.index]}">
							상품 수량: ${quantity_list[status.index]}<br>
							<input type="hidden" name="order_detail_company_list" value="${vo.company}">
							제조사: ${vo.company }<br>
							<input type="hidden" name="order_detail_brand_list" value="${vo.brand}">
							브랜드: ${vo.brand }<br>
							<input type="hidden" name="order_detail_cart_no_list" value="${cno_list[status.index]}">
							
							옵션 리스트<br>
							<c:forEach items="${option_list }" var="ovo">
								<c:if test="${ovo.product_no == vo.no }">
									<input type="hidden" name="order_detail_option_product_no_list" value="${vo.no }">
									<input type="hidden" name="order_detail_option_title_list" value="${ovo.title }">
									<input type="hidden" name="order_detail_option_content_list" value="${ovo.content }">
									<input type="hidden" name="order_detail_option_product_price_list" value="${ovo.price }">
									<input type="hidden" name="order_detail_option_cart_no_list" value="${cno_list[status.index]}">
									 <pre> 옵션 - ${ovo.title } ${ovo.content } ${ovo.price }<br> </pre>
								</c:if>
							</c:forEach>
							<hr>
						</c:forEach>
						
						<h2>가격</h2>
						<h5>다음 요청으로 보낼 애들임. 나중에 hidden으로 바꿔주세용</h5>
						총 가격
						<input type="text" name="total_price" value="${orderVO.total_price }"> <br>
						총 배송비
						<input type="text" name="total_delivery_fee" value="${orderVO.total_delivery_fee }"> <br>
						<input type="submit" value="구매">
					</form>
				</div>
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    
    <script>
		var category2 = new Array();
		
		<c:forEach items="${category.category}" var="list">
			var tempArray = new Array();
			<c:forEach items="${list}" var="item">
				tempArray.push("${item}");
			</c:forEach>
			category2.push(tempArray);
		</c:forEach>
	</script>
    <script>
    	$('.address_selector').on('change', changeAddress);
    	var address = new Array();
    	<c:forEach items="${userAddressList}" var="address">
    		var temp = new Array();
    		temp.push("${address.zipcode}");
    		temp.push("${address.addr1}");
    		temp.push("${address.addr2}");
    		address.push(temp);
    	</c:forEach>
    	function changeAddress(){
			var address_value_list = document.querySelector('.address_value_list');
			var zipcode = address_value_list.querySelector('.zipcode');
			var addr1 = address_value_list.querySelector('.addr1');
			var addr2 = address_value_list.querySelector('.addr2');
			zipcode.value = address[this.value][0];
			addr1.value = address[this.value][1];
			addr2.value = address[this.value][2];
    	}
    </script>
    <script>
    	$('.payment_selector').on('change', changePayment);
    	var payment = new Array();
    	<c:forEach items="${userPaymentList}" var="payment">
    		var temp = new Array();
    		temp.push("${payment.type}");
    		temp.push("${payment.company}");
    		temp.push("${payment.account}");
    		payment.push(temp);
    	</c:forEach>
    	function changePayment(){
			var payment_value_list = document.querySelector('.payment_value_list');
			var type = payment_value_list.querySelector('.payment_type');
			var company = payment_value_list.querySelector('.payment_company');
			var account = payment_value_list.querySelector('.payment_account');
			type.value = payment[this.value][0];
			company.value = payment[this.value][1];
			account.value = payment[this.value][2];
    	}
    </script>
</body>
</html>