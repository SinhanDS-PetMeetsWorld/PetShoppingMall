<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.menu_name{
	margin-bottom : 15px;
}

#product_info{
display :flex;
width: 1000px;
height : 100px;
}


#goods_image {
width : 100px;
height : 100px;
float : left;

}

#goods_name {
margin-left : 20px;
margin-top : 5px;
width: 300px;
height: 30px;
}

#goods_name a {
    display: block;
    width: 700px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}


#goods_option{
display : flex;
width : 700px;
height : 100px;
float : left;
margin-top: 30px;
}

#option2{
width : 400px;
height : 100px;
float:left;

}

#price{
width : 200px;
height : 100px;
float:left;
}


#check_box{
width : 75px;
height : 100px;
}

.address_selector {
	margin-left : 35px;
	margin-top : 35px;
}

.payment_selector {
	margin-left : 35px;
	margin-top : 35px;
}

#addr_info{
width : 700px;
height : 100px;
float : left;
}

#info2{
width : 600px;
height : 100px;
float:left;

}

#addr{
display:flex;
width: 1000px;
height : 100px;
}
.line {
 		margin-top : 20px;
 		margin-bottom : 20px;
 		width : 1000px;
        border: 1px solid #ccc;
     }
     
.pay_line {

 		margin-bottom : 10px;
 		width : 1000px;
        border: 1px solid #ccc;
    }

.final_line {

 		width : 1000px;
        border: 1px solid #111;
     }
     
#fin {
display: flex;
margin-top : 25px;
}
 
#final_total {
width: 300px;
height: 100px;
text-align : left;
color : #9CA3AF;
font-size : 20px;
}


#final_money {

width : 400px;
height : 100px;
text-align :left;
float:left;
font-size : 25px;
}


#go_purchase {
width : 300px;
height : 100px;
float : left;
} 

.purchaseConfirm {
  display: inline-block;
  outline: 0;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 200px;
  height: 60px;
  font-size: 30px;
  background-color: #fd0;
  font-weight: 500;
  color: #222;
  
  margin-left : 160px;
  margin-top : 20px;
 }
</style>



</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>
        
        <div class="contents">
			<div class="contentsright">
				<div>
					<h1 class = "menu_name">구매자 ${userno }의 Pay 페이지 입니다.</h1>
					
					<form method="post" action="buy.do" onsubmit='return checkAddress();'>
					
					<h2 class ="menu_name">상품 정보 출력</h2>
						<c:forEach items="${product_list }" var="vo" varStatus="status">
							<input type="hidden" name="product_no" value="${vo.no }">
							<input type="hidden" name="cart_no" value="${cno_list[status.index] }">
							<input type="hidden" name="quantity" value="${quantity_list[status.index] }">
							
							<div id = "product_info">
							
								<div id = "goods_image">    
							                  <c:if test="${empty vo.image_url }">
													<img src="/resources/img/product/no_image.jpg" width="100" height="100">
												</c:if>
												<c:if test="${!empty vo.image_url && fn:substring(vo.image_url, 0, 1) == 'h' }">
													<img src="${vo.image_url }" width="100" height="100">
												</c:if>
												<c:if test="${!empty vo.image_url && !(fn:substring(vo.image_url, 0, 1) == 'h') }">
													<img src="/resources/img/product/registed_img/${vo.image_url }" width="100" height="100">
												</c:if>
							  	</div>	
							
								
								<div id = "goods_name" class='option_area' >
							                <div>
							                <h3><a href="/user/product/goods.do?no=${vo.no }"> ${vo.name }</a></h3>
							                </div>
							                
							                <div><br>
							                	<c:if test="${!empty vo.company }">
													제조사: ${vo.company }<br>
							                	</c:if>
							                	<c:if test="${!empty vo.brand }">
													브랜드: ${vo.brand }<br>
							                	</c:if>
							                </div>
							                
							    </div>   
						
								<div id ="goods_option">
									<div id ="option2">
											<c:forEach items="${option_list }" var="ovo" varStatus="ovoStatus">
												<c:if test="${cart_no[status.index] == option_cart_no[ovoStatus.index] }">
													<input type="hidden" name="option_no" value="${ovo.no }">
													<input type="hidden" name="option_cart_no" value="${cno_list[status.index] }">
													옵션 - ${ovo.title } ${ovo.content } 추가 금액 : ${ovo.price }<br>
												</c:if>
											</c:forEach>
									</div>
									
									<div id ="price">
											상품 수량: ${quantity_list[status.index]}<br>
											가격: ${vo.price }<br>
											할인가격: ${vo.discount }<br>
									</div>											
							   </div>
											
						</div>
						<hr class = "line">	
					</c:forEach>
					
					
					
					<input type="hidden" class="user_no" name="user_no" value="${userno }">
					
					<h2 class ="menu_name">주소 선택</h2>
					<ol>
						<c:forEach items="${ userAddressList}" var="vo" varStatus="status">
							
							<div id = "addr">
							
								<div id ="check_box">
									<input type="radio" class="address_selector" name="address_selector" value="${status.index }" <c:if test="${status.index == 0}">checked</c:if>>  
								</div>
									
								
								<div id = "addr_info">
							            <div id = "info2">
								            <h3> 배송지 : ${vo.name }  ${vo.comment }</h3><br>
											주소 : ${vo.addr1 } ${vo.addr2 } (${vo.zipcode })<br>
											연락처: ${vo.phone }<br>
									
							            </div>	
						       </div>   
							</div>
							<hr class = "line">		
						</c:forEach>
							
						<div class="address_value_list">
							<input type="hidden" class="zipcode" name="zipcode" value="${userAddressList[0].zipcode }">
							<input type="hidden" class="addr1" name="addr1" value="${userAddressList[0].addr1 }">
							<input type="hidden" class="addr2" name="addr2" value="${userAddressList[0].addr2 }">
							<input type="hidden" class="" name="user_name" value="${userAddressList[0].name }">
							<input type="hidden" class="" name="user_phone" value="${userAddressList[0].phone }">
						</div>
					</ol>
						
						<h2 class ="menu_name">결제 수단 선택</h2>
						<ol>
							<c:forEach items="${ userPaymentList}" var="vo"	varStatus="status">
								
								<div id = "addr">
								
									<div id ="check_box">
										<input type="radio" class="payment_selector" name="payment_selector" value="${status.index }" <c:if test="${status.index == 0}">checked</c:if>>
									</div>	
										
										
									
									<div id = "addr_info">
								            <div id = "info2">
									          <h3>${paymentVO.company_list[vo.type][vo.company]}</h3><br>
												${paymentVO.account_list[vo.type] } : ${vo.account }
								            </div>	
							       </div>   
								</div>
								<hr class = "pay_line">		
							</c:forEach>
																											<div class="payment_value_list">
																												<input type="hidden" class="payment_type" name="payment_type" value="${userPaymentList[0].type }">
																												<input type="hidden" class="payment_company" name="payment_company" value="${userPaymentList[0].company }">
																												<input type="hidden" class="payment_account" name="payment_account" value="${userPaymentList[0].account }">
																											</div>	
						</ol>
						
						
						<h2 class = "menu_name">결제</h2>
						<div id ="final_money">
							<h2> 총 가격: ${orderVO.total_price }</h2>
							<h2>총 배송비: ${orderVO.total_delivery_fee }</h2>
						</div>
																											<input type="hidden" name="total_price" value="${orderVO.total_price }">
																											<input type="hidden" name="total_delivery_fee" value="${orderVO.total_delivery_fee }">
						
						<input class ="purchaseConfirm" type="submit" value="구매">
						
						<hr class = "final_line">
					</form>
				</div>
			</div>
        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
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
    
    <script>
    	/* 주소 없으면 구매하지 못하도록 */
    	function checkAddress(){
    		if($('.address_selector').length == 0){
        		alert("주소가 존재하지 않습니다.");
        		return false;
        	}
    		if($('.payment_selector').length == 0){
        		alert("결제 수단이 존재하지 않습니다.");
        		return false;
        	}
    		return true;
    	}
    	
    </script>
</body>
</html>