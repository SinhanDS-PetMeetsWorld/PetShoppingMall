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
				<div id="cart_content" width='50%'>
					<h1>장바구니</h1>
					
					    <table style="border: 1px solid #FFDE30; border-collapse: collapse;" width="800" >
					        <!--카트에 상품이 존재하는만큼 td를 생성-->
						    <c:forEach var="vo" items="${productvolist }" varStatus="status">
						    	
						    	
						        <tr width="800">
						            <td>
						                <br>
						                
						                <div id="product_info">
							                <input type='checkbox' class="check_product" id='chekbox[${status.index }]' name='check_cart' >
							               
					        				<input type="hidden" class="cart_user_no" name="cart_user_no" value="${cartvolist[status.index].user_no }">
							                <input type="hidden" class="cart_no" name="cart_no" value="${cartvolist[status.index].no }">
							                
							               
							                <input type="hidden" class="seller_no" value="${vo.seller_no }">
							                <div class='option_area'>
								                <c:if test="${empty vo.image_url }">
													<img src="/resources/img/product/no_image.jpg" width="100" height="100">
												</c:if>
												<c:if test="${!empty vo.image_url && fn:substring(vo.image_url, 0, 1) == 'h' }">
													<img src="${vo.image_url }" width="100" height="100">
												</c:if>
												<c:if test="${!empty vo.image_url && !(fn:substring(vo.image_url, 0, 1) == 'h') }">
													<img src="/resources/img/product/registed_img/${vo.image_url }" width="100" height="100">
												</c:if>
								                <div><a href="/user/product/goods.do?no=${vo.no }"> ${vo.name }</a> </div>
								                <!-- 옵션이 존재한다면 보여주고 아니면 안보임 -->
								                <c:forEach var="vo2" items="${optionlist[status.index] }" varStatus="tt">
								                	<input type="hidden" class="option_cart_no" name="option_cart_no" value="${cartoptionvolist[status.index][tt.index].cart_no}">
								                	<input type="hidden" class="option_no" name="option_no" value="${cartoptionvolist[status.index][tt.index].option_no}">
								                	<div></div>
								                	<input type="hidden" class="option_price" name="option_price[${status.index }]" value="${vo2.price }">
									                <span>${vo2.title}</span>
									                <span>${vo2.content}</span>
									                <span>${vo2.price}원</span>
									                <br>
								                </c:forEach> 
								                <div>${vo.price }원 <input type="hidden" class="price_list" name="price_list" value="${vo.price }"></div>
								                <div><input type="hidden" class="discount_list" name="discount_list" value="${vo.discount }"></div>
											</div>
										</div>
						                <br>
						            </td>
						            <td>
						                <button type="button" class="delete_cart" name="cart_delete">장바구니에서 삭제</button>
						                <input type="number" class="quantity_list" name="quantity_list" id="quantity_list[${status.index }]" value="${cartvolist[status.index].quantity}" data-cart_table_no="${cartvolist[status.index].no }">
						                
						               
						                
						                <br>
						            </td>
						        </tr>
						        <tr>
						        	<td colspan="2">
						        		<hr>
						        	</td>
						       	</tr>
						        
						    </c:forEach>
						    
					        
					    </table>
					    
					    
     				</div>
     				<div>
     					
     					<div>결제 금액</div>
     					<div>
	     					<span>총 주문 가격 : </span>
	     					<span id="totalprice">0</span>원
	     					<input type="hidden" id="total_price" name="total_price" value="" >
     					</div>
						<div>
							<span>할인 금액 : </span>
							<span id="discountprice">0</span>원
							<input type="hidden" id="discount_price" name="discount_price" value="" >
						</div>     					
							<span>총 배송비 : </span>
							<span id="deliveryprice">0</span>원
							<input type="hidden" id="delivery_price" name="delivery_price" value="" >
						<div>
							<span>최종 결제액 : </span>
							<span id="finalprice">0</span>원
							<input type="hidden" id="final_price" name="final_price" value="" >
						</div>
						
						<input type="submit" value="결제하러 가기" onclick="beforeSubmit()">
     				</div>
     			</div>
     			
     			</form>
     			
			</div>

        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    <script>
    	/*
    	$('.temp_temp').on('change', change);
    	function change(){
    		console.log(this);
    		console.log(this.parentNode);
    		console.log(this.parentNode.querySelector('input'));
    		*/
    		
    		/*
    		
    		//판매자 no를 받아올 배열 선언
    		var sellers = new Array();
    		//각 상품의 판매자가 누구인지 받아오는 부분, 중복을 제거해야 배송비 계산시 쓸 수 있다.
    		for(var i=0; i < $('.seller_no').length; i++){	// 판매자 no를 받아올 배열 초기화
				sellers[i] = $('.seller_no')[i].value;
    		}	
    		
    		// 각 상품의 판매자 no가 담겨있는 배열에서 중복 제거하는 코드 new Set
    		const sellers_no = Array.from(new Set(sellers));
    		console.log(sellers_no);
    		
    		*/
    		
    		// 가격 계산 부분
    		$('.check_product').on('click', function(){		// 체크박스 클릭시 이벤트 추가
    			var sellers = new Array();
    			var totalPrice = 0;
    			var discountPrice = 0;
    			var deliveryPrice = 0;
    			var finalPrice = 0;
    			
    			$('.check_product').each(function(i,e) {		// 클래스가 check_product인 태그들을 배열로 가져오고, each로 반복문 / e는 각 체크박스 요소들임.(즉, 각 상품)
	                if($('.check_product').eq(i).prop('checked')){	// check_product로 가져온 태그 중 i번째인 태그의 checked 속성을 검사
	                	
	                	var totalOptionPrice = 0;
	                	$('.option_area').eq(i).children('.option_price').each(function(j,e){
	                		console.log(e);
	             			totalOptionPrice += Number($(e).val());
	                	})
	             
	                	totalPrice += (Number($(".price_list").eq(i).val()) + totalOptionPrice/*Number($(".option_price").eq(i).val())*/ - Number($(".discount_list").eq(i).val()) ) * Number($(".quantity_list").eq(i).val())
	                	discountPrice += Number($(".discount_list").eq(i).val()) * Number($(".quantity_list").eq(i).val())
	                	
	                	
	                	// 판매자 no를 받아와 배열에 저장, 이후 중복제거 할 것임
	                	sellers.push($(".seller_no").eq(i).val())
	                } 
	                /*else{
	                	$('.cart_user_no').eq(i).attr("disabled", true);
	                	$('.cart_no_list').eq(i).attr("disabled", true);
	                	$('.seller_no').eq(i).attr("disabled", true);
	                	$('.option_cart_no').eq(i).attr("disabled", true);
	                	$('.option_no').eq(i).attr("disabled", true);
	                	$('.option_price').eq(i).attr("disabled", true);
	                	$('.price_list').eq(i).attr("disabled", true);
	                	$('.discount_list').eq(i).attr("disabled", true);
	                	$('.quantity_list').eq(i).attr("disabled", true);
	                }*/
	                
    			});
    			// 중복제거한 판매자 no 리스트 sellers_no, 이 배열의 길이를 사용해 배송비를 계산한다.
    			const sellers_no = Array.from(new Set(sellers));
    			deliveryPrice = sellers_no.length * 2500;
    			finalPrice = totalPrice + deliveryPrice;
    			
    			
    			console.log('총주문가격:'+totalPrice);
    			console.log('할인금액:'+discountPrice);
    			console.log('배송비:'+deliveryPrice);
    			console.log('최종결제액(배송비포함):'+finalPrice);
    			
    			
    			document.getElementById('totalprice').innerHTML=totalPrice;
    			document.getElementById('discountprice').innerHTML=discountPrice;
    			document.getElementById('deliveryprice').innerHTML=deliveryPrice;
    			document.getElementById('finalprice').innerHTML=finalPrice;

    			$('#total_price').val(totalPrice);
    			$('#discount_price').val(discountPrice);
    			$('#delivery_price').val(deliveryPrice);
    			$('#final_price').val(finalPrice);
    		});	
   			
    		
    		$('.quantity_list').on('change', function(){	// 무조건 처음부터 다 다시 검사해야 하므로 totalPrice를 0으로 초기화해도 괜찮음
    			
    			//var full_url = '/user/order/modify_quantity.do?cartno=' + $(this).data("cartno") + '&quantity=' + $(this).val();
    			//console.log(full_url);
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
    			
    			
    			document.getElementById('totalprice').innerHTML=totalPrice;
    			document.getElementById('discountprice').innerHTML=discountPrice;
    			document.getElementById('deliveryprice').innerHTML=deliveryPrice;
    			document.getElementById('finalprice').innerHTML=finalPrice;
    			
    			$('#total_price').val(totalPrice);
    			$('#discount_price').val(discountPrice);
    			$('#delivery_price').val(deliveryPrice);
    			$('#final_price').val(finalPrice);
            });	
    		
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