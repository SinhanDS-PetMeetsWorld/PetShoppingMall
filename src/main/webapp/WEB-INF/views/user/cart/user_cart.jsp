<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

#product_info{
display:flex;
}

#menu_name {
margin-bottom : 15px;

}

#check_box{
width : 50px;
height : 100px;
}

.check_product {

 margin-top: 40px;
 margin-left : 7px;
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
    width: 300px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#goods_option{
width : 200px;
height : 100px;
float : left;
}

#option2{
width : 300px;
height : 100px;
text-align :right;
float:left;

}

#button{
width : 300px;
height : 100px;
float : left;
margin-left : 180px;
}

.quantity_list{
	   background-color: #fff;
       height: 30px;
       width: 60px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       margin-right : 30px;
       margin-top : 15px;
    
 }
 
.delete_cart {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 15px;
  border-radius: 50px;
  width: 70px;
  height: 35px;
  font-size: 16px;
  background-color: #ff4742;
  font-weight: 800;
  color: #F9FAFB;

 }
 

 #purchaseConfirm {
  display: inline-block;
  outline: 0;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  border : none;
  width: 150px;
  height: 40px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 800;
  color: #222;
  
  margin-left : 130px;
 }

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 1000px;
   }
 .line {
 		margin-top : 10px;
 		margin-bottom : 10px;
 		width : 1000px;
        border: 1px solid #ccc;
 } 
 
  .final_line {
 		margin-top : 25px;
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
text-align :right;
float:left;
font-size : 25px;
}


#go_purchase {
width : 300px;
height : 100px;
float : left;
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
            
            <form name="cart_list" action="/user/order/pay.do" method="post" onsubmit="return emptyCheck();">
			<div class="contentsright">
				<div id="cart_content">
					<h1 id = "menu_name">장바구니</h1>
						<hr class ="start_line">
					    
						    <c:forEach var="vo" items="${productvolist }" varStatus="status">
						    	
						    	<div id="product_info">

						                <div id = "check_box">
						                	<input type='checkbox' class="check_product" id='chekbox[${status.index }]' name='check_cart' >
						                </div>	
																					        				<input type="hidden" class="cart_user_no" name="cart_user_no" value="${cartvolist[status.index].user_no }">
																							                <input type="hidden" class="cart_no" name="cart_no" value="${cartvolist[status.index].no }">
																				               				 <input type="hidden" class="seller_no" value="${vo.seller_no }">
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
							                <a href="/user/product/goods.do?no=${vo.no }"> ${vo.name }</a> 
							                </div>
							            </div>   
							                
							                
							            <div id = "goods_option">
							            
								            <div id = "option2">
								            
								            		<c:if test="${vo.discount != 0 }">(${vo.price}원 - ${vo.discount }원)</c:if> ${vo.price - vo.discount }원<br>
								            		<c:forEach var="vo2" items="${optionlist[status.index] }" varStatus="tt">
																						                	<input type="hidden" class="option_cart_no" name="option_cart_no" value="${cartoptionvolist[status.index][tt.index].cart_no}">
																						                	<input type="hidden" class="option_no" name="option_no" value="${cartoptionvolist[status.index][tt.index].option_no}">
																						                	<input type="hidden" class="option_price" name="option_price[${status.index }]" value="${vo2.price }">
										                ${vo2.title} : ${vo2.content} ${vo2.price}원<br>
								                	</c:forEach> 
								            </div>	
							            
							            </div>    
																							                <input type="hidden" class="price_list" name="price_list" value="${vo.price }">
																							                <input type="hidden" class="discount_list" name="discount_list" value="${vo.discount }">
										
										<div id ="button">
						   					<input type="number" class="quantity_list" name="quantity_list" id="quantity_list[${status.index }]" value="${cartvolist[status.index].quantity}" data-cart_table_no="${cartvolist[status.index].no }" min="0">
						               	 	<button type="button" class="delete_cart" name="cart_delete">삭제</button>
						   				</div>  
								 
								</div>
							        <hr class = "line">      
						    </c:forEach>
					    
     				</div>
     				<div>
     					<c:if test="${empty productvolist }"><h2>장바구니에 상품이 존재하지 않습니다.</h2></c:if>
     					<c:if test="${!empty productvolist }">
	     					<h2>결제 금액</h2>
	     					<hr class = "final_line">
	     					
	     					<div id = "fin">
	     						<div id = "final_total">
			     					총 주문 가격 : <span id="totalprice">0</span>원 <br>
			     					
			     																			<input type="hidden" id="total_price" name="total_price" value="" >
		     				
									할인 금액 : <span id="discountprice">0</span>원 <br>
									
																							<input type="hidden" id="discount_price" name="discount_price" value="" >
								  					
									총 배송비 : <span id="deliveryprice">0</span>원
									
																							<input type="hidden" id="delivery_price" name="delivery_price" value="" >
																							<input type="hidden" id="final_price" name="final_price" value="" >
								</div>
								
								
								<div id ="final_money">
									총 금액: <span id="finalprice">0</span>원
								</div>
								
								<div id = "go_purchase">
										<input type="submit" id ="purchaseConfirm" value="결제하러 가기" onclick="beforeSubmit()">
								</div>
	     					
	     					</div>
     					
     					</c:if>
     				</div>
     			</div>
     			
     			</form>
     			
			</div>
        
    </div>
	<div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
    <script>
		$('.check_product').each(function(i, e){
			$(e).prop('checked',true);
		})
	    calculatePrice();
		
    	// 가격 계산 부분
    	$('.check_product').on('click', calculatePrice);	
    		
    	$('.quantity_list').on('change', saveQuantity);	
    	$('.quantity_list').on('change', calculatePrice);	
		
    	function saveQuantity(){
    		var cart_table_no = $(this).data("cart_table_no");
			console.log(cart_table_no);
			var quantity = $(this).val();
			console.log(quantity);
			   
			$.ajax({
				type:"GET",
				url: '/user/order/modify_quantity.do',
				data: {  
					cart_no_table : cart_table_no,
					quantity : quantity
				},
				
				async: false,
				//dataType:'HTML',
				
	  			success: function(res){
					console.log("ㅎㅎㅎ");
	  			}
			});
    	}
    	function calculatePrice(){
			var sellers = new Array();
			var totalPrice = 0;
			var discountPrice = 0;
			var deliveryPrice = 0;
			var finalPrice = 0;
			$('.check_product').each(function(i,e) {		// 클래스가 check_product인 태그들을 배열로 가져오고, each로 반복문 / e는 각 체크박스 요소들임.(즉, 각 상품)
                if($('.check_product').eq(i).prop('checked')){	// check_product로 가져온 태그 중 i번째인 태그의 checked 속성을 검사
                	var totalOptionPrice = 0;
                	$('.option_area').eq(i).children('.option_price').each(function(j,e){
             			totalOptionPrice += Number($(e).val());
                	})
             
                	totalPrice += (Number($(".price_list").eq(i).val()) + totalOptionPrice - Number($(".discount_list").eq(i).val()) ) * Number($(".quantity_list").eq(i).val())
                	discountPrice += Number($(".discount_list").eq(i).val()) * Number($(".quantity_list").eq(i).val())
                	
                	// 판매자 no를 받아와 배열에 저장, 이후 중복제거 할 것임
                	sellers.push($(".seller_no").eq(i).val())
                }
                
			});
			// 중복제거한 판매자 no 리스트 sellers_no, 이 배열의 길이를 사용해 배송비를 계산한다.
			const sellers_no = Array.from(new Set(sellers));
			deliveryPrice = sellers_no.length * 2500;
			finalPrice = totalPrice + deliveryPrice;
			
			
			//console.log('총주문가격:'+totalPrice);
			//console.log('할인금액:'+discountPrice);
			//console.log('배송비:'+deliveryPrice);
			//console.log('최종결제액(배송비포함):'+finalPrice);
			
			
			document.getElementById('totalprice').innerHTML=totalPrice + discountPrice;
			document.getElementById('discountprice').innerHTML=discountPrice;
			document.getElementById('deliveryprice').innerHTML=deliveryPrice;
			document.getElementById('finalprice').innerHTML=finalPrice;
			
			$('#total_price').val(totalPrice);
			$('#discount_price').val(discountPrice);
			$('#delivery_price').val(deliveryPrice);
			$('#final_price').val(finalPrice);
        }
    		
    	function emptyCheck(){
    		if($("#total_price").val() == 0){
    			alert('상품을 하나 이상 선택해주세요!')
    			return false;
    		}
    	}
    		
    		
    		
    		
    	function beforeSubmit(){
    		
    		$('.check_product').each(function(i,e) {		
                if(!($('.check_product').eq(i).prop('checked'))){	
                	$('.cart_user_no').eq(i).attr("disabled", true);
                	$('.cart_no').eq(i).attr("disabled", true);
                	$('.seller_no').eq(i).attr("disabled", true);
                	$('.option_area').eq(i).children('.option_price').each(function(j,e){
                		$('.option_area').eq(i).children('.option_cart_no').eq(j).attr("disabled", true);
                		$('.option_area').eq(i).children('.option_no').eq(j).attr("disabled", true);
                		$('.option_area').eq(i).children('.option_price').eq(j).attr("disabled", true);
                	});
                	$('.price_list').eq(i).attr("disabled", true);
                	$('.discount_list').eq(i).attr("disabled", true);
                	$('.quantity_list').eq(i).attr("disabled", true);
                }
                
			});
    	}
    	
    	// 사용자가 뒤로가기했을 경우 대비
    	$('.check_product').on('change', function(){
    		
    		
    		$('.check_product').each(function(i,e) {		
               	$('.cart_user_no').eq(i).attr("disabled", false);
               	$('.cart_no').eq(i).attr("disabled", false);
               	$('.seller_no').eq(i).attr("disabled", false);
               	$('.option_area').eq(i).children('.option_price').each(function(j,e){
               		$('.option_area').eq(i).children('.option_cart_no').eq(j).attr("disabled", false);
               		$('.option_area').eq(i).children('.option_no').eq(j).attr("disabled", false);
               		$('.option_area').eq(i).children('.option_price').eq(j).attr("disabled", false);
               	});
               	$('.price_list').eq(i).attr("disabled", false);
               	$('.discount_list').eq(i).attr("disabled", false);
               	$('.quantity_list').eq(i).attr("disabled", false);
			});
    	});
    
    	$('.delete_cart').click( function(){
    		
//    		var num = $(this).index();
	  		var num = $('.delete_cart').index(this);
			var no = $('.cart_no').eq(num).val();
    		
			console.log(num);
			console.log(no);
			
    		location.href="/user/order/delete_cart.do?no=" + no ;    	
    	});
  
    		
    </script>
</body>
</html>