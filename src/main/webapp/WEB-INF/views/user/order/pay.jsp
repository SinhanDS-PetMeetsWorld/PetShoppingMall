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
    
    
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- 포트원 결제 -->
    

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
margin-top:10px;
}

#other_payment{
	margin-top:22px;
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
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 160px;
  height: 60px;
  font-size: 25px;
  background-color:#FFDE30;
  font-weight: 800;
  color: #222;
  
  margin-left : 160px;
  margin-top : 20px;
 } 
 
 #paypay{
  display: none;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 240px;
  height: 60px;
  font-size: 25px;
  background-color:#FFDE30;
  font-weight: 800;
  color: #222;
  
  margin-left : 160px;
  margin-top : 20px;
 }
 
</style>


<script>


// 결제창 함수 넣어주기
$(document).ready(function(){
		$("#paypay").click(function(){
			iniPay();
		});
})

var IMP = window.IMP;
IMP.init("imp85807434"); // 가맹점 식별코드

var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var newtime = hours.toString() + minutes.toString() + seconds.toString() + milliseconds.toString();
var buyer_name = "${username}";
var buyer_email = "${useremail}";
var buyer_phone = "${userphone}";

function iniPay() {
		
       IMP.request_pay({
           pg: 'html5_inicis', // PG사 코드표에서 선택
           pay_method: 'card', // 결제 방식
           merchant_uid: "IMP" + newtime, // 결제 고유 번호
           name: '상품', // 제품명
           amount: 1, // 가격
           //구매자 정보 ↓
           buyer_email: buyer_email,
           buyer_name: buyer_name,
           buyer_tel : buyer_phone
           //buyer_addr : '서울특별시 강남구 삼성동',
           //buyer_postcode : '12631'
       }, async function (rsp) { // callback
           if (rsp.success) { //결제 성공시
               console.log(rsp);
               var msg = '결제가 완료되었습니다.';
		       msg += '고유ID : ' + rsp.imp_uid;
		       msg += '상점 거래ID : ' + rsp.merchant_uid;
		       msg += '결제 금액 : ' + rsp.paid_amount;
		       msg += '카드 승인번호 : ' + rsp.apply_num;
		       alert(msg)
		       result ='0';
		
				
               	/*if (response.status == 200) { // DB저장 성공시
                   alert('결제 완료!')
                   window.location.reload();
               	} else { // 결제완료 후 DB저장 실패시
                   alert(`error:[${response.status}]\n결제요청이 승인된 경우 관리자에게 문의바랍니다.`);
                   // DB저장 실패시 status에 따라 추가적인 작업 가능성
	         	}*/
		     } else if (rsp.success == false) { // 결제 실패시
		        alert(rsp.error_msg)
		     	result = '1';
	     	}
	     });
}
</script>


</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>
        
        <div class="contents">
			<div class="contentsright">
				<div>
					<h1 class = "menu_name">${username }님의 결제 페이지</h1>
					
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
							
							<div id = "addr">
								<div id="check_box">
									<input type="radio" class="payment_selector" name="payment_selector" value="999">
								</div>
								
								<div id= "other_payment">
									<h2>다른 카드로 결제하기</h2>
								</div>
							</div>
							
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
						
						<input class ="purchaseConfirm" type="submit" id="buy_btn" value="구매">
						
						<button type="button" id="paypay">다른 카드로 구매</button>
						
						
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
    		var check_val = $('input[name=payment_selector]:checked').val();
    		console.log(check_val);
    		
    		if(check_val != 999){
    			document.getElementById('buy_btn').style.display = 'inline-block';
				document.getElementById('paypay').style.display = 'none';
				
				var payment_value_list = document.querySelector('.payment_value_list');
				var type = payment_value_list.querySelector('.payment_type');
				var company = payment_value_list.querySelector('.payment_company');
				var account = payment_value_list.querySelector('.payment_account');
				type.value = payment[this.value][0];
				company.value = payment[this.value][1];
				account.value = payment[this.value][2];    			
    		} else{
				document.getElementById('buy_btn').style.display = 'none';
				document.getElementById('paypay').style.display = 'inline-block';
    		}
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