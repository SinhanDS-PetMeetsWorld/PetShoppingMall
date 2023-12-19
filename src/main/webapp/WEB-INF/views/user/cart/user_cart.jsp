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
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu.jsp"%>
            </div>
			<div class="contentsright">
				<div id="cart_content" width='50%'>
					<h1>장바구니</h1>
					<form name="cart_list" action="#" method="get">
					    <table style="border: 1px solid #FFDE30; border-collapse: collapse;" width="800" >
					        
					        <!--카트에 상품이 존재하는만큼 td를 생성-->
						    <c:forEach var="vo" items="${productvolist }" varStatus="status">
						    	
						    	${catrvolist[status.index].no }
						        <tr width="800">
						            <td>
						                <br>
						                
						                <div id="product_info">
						                	${status.index }
							                <input type='checkbox' class="check_product" id='chekbox[${status.index }]' name='check_cart' checked>
							                <input type="hidden" value="${cartoptionvolist[status.index][tt.index].cart_no}" checked>
							                <div>
								                <c:if test="${empty vo.image_url }">
													<img src="/resources/img/product/no_image.jpg" width="100" height="100">
												</c:if>
												<c:if test="${!empty vo.image_url && fn:substring(vo.image_url, 0, 1) == 'h' }">
													<img src="${vo.image_url }" width="100" height="100">
												</c:if>
												<c:if test="${!empty vo.image_url && !(fn:substring(vo.image_url, 0, 1) == 'h') }">
													<img src="/resources/img/product/registed_img/${vo.image_url }" width="100" height="100">
												</c:if>
								                <div>${vo.name } </div>
								                <!-- 옵션이 존재한다면 보여주고 아니면 안보임 -->
								                <c:forEach var="vo2" items="${optionlist[status.index] }" varStatus="tt">
								                	<input type="hidden" class="checkbox" value="${cartoptionvolist[status.index][tt.index].cart_no}" checked>
								                	<input type="hidden" class="checkbox" value="${cartoptionvolist[status.index][tt.index].option_no}" checked>
								                	<input type="hidden" class="option_price" name="option_price[${status.index }]" value="${vo2.price }">
									                <span>${vo2.title}</span>
									                <span>${vo2.content}</span>
									                <br>
								                </c:forEach> 
								                <div>${vo.price } <input type="hidden" class="checkbox" name="price_list" value="${vo.price }" checked></div>
								                <div><input type="hidden" class="checkbox" name="discount_list" value="${vo.discount }" checked></div>
											</div>
										</div>
						                <br>
						            </td>
						            <td>
						                <button type="button" name="cart_delete" onclick="#" >장바구니에서 삭제</button>
						                <input type="number" name="quantity_list" id="quantity_list[${status.index }]" value=1>
						                
						               
						                
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
					    </form>
     				</div>
     				<div>
     					<div>결제 금액</div>
     					<div>
	     					<span>총 주문 가격</span>
	     					<span>[총금액계산식] 각 상품에서 수량 곱하기 가격 더하기 </span>
     					</div>
						<div>
							<span>할인 금액</span>
							<span>[총 할인 금액] 각 상품에서 디스카운터 다 더하기</span>
						</div>     					
							<span>총 배송비</span>
							<span>[총 배송비] 각 상품에 배송비 다 더하기</span>
						<div> 
						<div>
							<div>최종 결제액</div>
							<div>[총 결제액] span 태그에 아이디를 줘서 총금액에서 -할인 + 배송비</div>
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
    	/*
    	$('.temp_temp').on('change', change);
    	function change(){
    		console.log(this);
    		console.log(this.parentNode);
    		console.log(this.parentNode.querySelector('input'));
    		*/
    		window.onload = function(){
    		
    			
    			console.log(document.getElementsByName('option_price[0]')[1].value);
    			console.log(document.getElementsByName('option_price[0]')[1]);
    			console.log(document.getElementsByName('option_price[0]').length);
    			console.log(document.getElementsByName('option_price[0]'));
    			var sum = 0;
    			
    			
    			
    			
    				
       		}
    		
    		
    		// 체크박스 JS
    		$('.check_product').on('click', function(){
                if($(this).prop('checked')){
/*
					console.log(this.parentNode.querySelector('div').querySelectorAll('input'));
                    var aa = this.parentNode.querySelector('div').getElementsByClassName('checkbox');	//getElementsByClassName은 HTMLCollection으로 리턴됨
                    console.log(aa);
*/
					// 체크 시 넘겨줄 값들에 checked 설정하는 부분
	                var bb = this.parentNode.querySelector('div').querySelectorAll(".checkbox");
                	console.log(bb);

                    bb.forEach(function(bbs){
                    	bbs.setAttribute("checked", "true");		// 체크했을 때 그 체크박스에 연관된 input 태그들에 checked=true 속성 추가
                    	console.log(bbs);
                   	});
                    
                    // 체크 된 상품의 가격 가져오자
                    
                    
                    
                    
                }
                else{
               		 	
                	// 체크해제 시 값들에 checked=false 설정하는 부분
                	 var bb = this.parentNode.querySelector('div').querySelectorAll(".checkbox");

                     bb.forEach(function(bbs){
                     	bbs.setAttribute("checked", "false");		// 체크했을 때 그 체크박스에 연관된 input 태그들에 checked=true 속성 추가
                     	console.log(bbs);
                	 });
                }
                
                
            });	
    		
    		console.log(document.querySelectorAll('input[name="price_list"]')[0].value);
    		console.log(document.querySelectorAll('input[name="price_list"]')[0].checked);
    		
    		
    		
    </script>
</body>
</html>