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
        </div>
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
					<div>	
						회원 번호 : ${userLoginInfo.no } <br>
						
					<h1>찜 박스</h1>
				<c:forEach items="${save_list2}" varStatus = "zzim_quant" >
					<div>
						<div>	
							<c:if test="${empty save_list2[zzim_quant.index][0] }">
								<img src="/resources/img/product/no_image.jpg" width="100" height="100">
							</c:if>
							
							<c:if test="${!empty save_list2[zzim_quant.index][0] && fn:substring(save_list2[zzim_quant.index][0], 0, 1) == 'h' }">
								<img src="${save_list2[zzim_quant.index][0] }" width="100" height="100">
							</c:if>
							
							<c:if test="${!empty save_list2[zzim_quant.index][0] && !(fn:substring(save_list2[zzim_quant.index][0], 0, 1) == 'h') }">
								<img src="/resources/img/product/registed_img/${save_list2[zzim_quant.index][0]}" width="100" height="100"><br>
							</c:if>
						</div>	
							
						<div>
							<a href= "/user/product/goods.do?no=${save_list2[zzim_quant.index][4]}">
										<button type ="button">상세 보기 </button></a>
							
							<c:if test = "${not empty save_list2[zzim_quant.index][4]}">
							<button class="zzim_On" data-no="${save_list2[zzim_quant.index][4]}"> 찜 목록 해제 </button> <br>
							
							제품 번호 : ${save_list2[zzim_quant.index][4]} <br>
							</c:if>
							<c:if test = "${not empty save_list2[zzim_quant.index][1]}">
						   	상품명 : ${save_list2[zzim_quant.index][1]} <br>
							</c:if>
							<c:if test = "${not empty save_list2[zzim_quant.index][2]}">
							설명 : ${save_list2[zzim_quant.index][2]} <br>
							</c:if>
							<c:if test = "${not empty save_list2[zzim_quant.index][3]}">
							가격 : ${save_list2[zzim_quant.index][3]} <br>
							</c:if>
							<c:if test = "${not empty save_list2[zzim_quant.index][5]}">
							유저 번호 : ${save_list2[zzim_quant.index][5]} <br>
							</c:if>
						</div>
					 </div>  
				   </c:forEach>			
				</div>
			</div>
        </div>
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>    
<script>

$(".zzim_On").on('click', zzim);

function zzim(){
	console.log($(this).data('no'));
	
	var user_no = ${userLoginInfo.no };
	var product_no = $(this).data('no');
	
	var result = confirm("찜 목록에서 삭제 하시겠습니까?");
	 if(result){
			$.ajax({
				method: "POST",
				url:'/user/product/zzimcancel.do',
				async: true,
				type:'HTML',
				data: {
					product_no : product_no,
					   user_no : user_no
				},
				success : function(response){
					alert("찜 등록이 삭제 되었습니다.");
					history.go(0);
				},
				error: function (error) {
					alert("오류가 발생했습니다. 잠시 후 다시 이용해주세요");
		        }
			});
		}else{
			return;
		}
	
}

</script>
</body>
</html>