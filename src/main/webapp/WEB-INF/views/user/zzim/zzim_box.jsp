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
 
 .zzim_container {
display : flex;
}

.zzim_Off {
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
  
  margin-top:15px;
  
 }
 
 .menu_name {
margin-bottom: 10px;	
}

.goods_image {
width : 100px;
hegiht : 100px;
}
 

.goods_name_container{
height : 20px;
width : 600px;
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

.goods_price_container{
display:flex;
width : 200px;
height : 100px;
}

 .price{
    float: left;
    width:120px;
    text-align: right;
    margin-top: 15px;
    margin-left: 2.08px;
    font-size: 25px;
 }

.description {
margin-top:10px;
}

.go_more {
width :150px;
height : 100px;
margin-top: 20px;
margin-left: 20px;	
}

.review_info {
    float: left;
    font-size: 13px;
    margin-top: 40px;
 }
 
.button{
float:left;
width:300px;
height:100px;

}

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 930px;
   }
   
.line {
	margin-top : 10px;
	margin-bottom : 10px;
	width : 930px;
    border: 1px solid #ccc;
 }
 

a:visited {
    color: purple; 
}
a:active {
    color: red; 
}

</style>  
<style>
	    .messagebody{
			margin-top : 50px;
		}
	    .messagebox{
			margin : 0 auto;
			width : 600px;
			height : 300px;
			text-align : center;
		}
		.messagebox > img {
			margin-bottom : 20px;
		}
</style>

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
			
			<input type ="hidden"  value = "${userLoginInfo.no }">
				<h1 class= "menu_name">찜 박스</h1>
				
				<hr class = "start_line">
					<c:if test="${empty save_list2 }">
						<div class="messagebody">
							<div class="messagebox">
									<img src="/resources/img/common/emptybox.png">
									<h2>찜한 상품이 없습니다</h2>
							</div>
						</div>
					</c:if>
				<c:forEach items="${save_list2}" varStatus = "zzim_quant" >
				
				<div>	
					<c:if test="${!empty save_list2[zzim_quant.index] }">
					
							<div class = "zzim_container"> 
									<div class="goods_image">	
										<c:if test="${empty save_list2[zzim_quant.index][0] }">
											<a href="/user/product/goods.do?no=${save_list2[zzim_quant.index][4]}"><img src="/resources/img/product/no_image.jpg" width="100" height="100"></a>
										</c:if>
										
										<c:if test="${!empty save_list2[zzim_quant.index][0] && fn:substring(save_list2[zzim_quant.index][0], 0, 1) == 'h' }">
											<a href="/user/product/goods.do?no=${save_list2[zzim_quant.index][4]}"><img src="${save_list2[zzim_quant.index][0] }" width="100" height="100"></a>
										</c:if>
										
										<c:if test="${!empty save_list2[zzim_quant.index][0] && !(fn:substring(save_list2[zzim_quant.index][0], 0, 1) == 'h') }">
											<a href="/user/product/goods.do?no=${save_list2[zzim_quant.index][4]}"><img src="/resources/img/product/registed_img/${save_list2[zzim_quant.index][0]}" width="100" height="100"></a>
										</c:if>
									</div>	
									
									<div class="goods_name_container">
										<div class = "goods_name">
											<c:if test = "${not empty save_list2[zzim_quant.index][1]}">
									   			<h4> <a href="/user/product/goods.do?no=${save_list2[zzim_quant.index][4]}">${save_list2[zzim_quant.index][1]}</a></h4>
									   		</c:if>
									   	</div>
									   	<div class = "description">	
									   		<c:if test = "${not empty save_list2[zzim_quant.index][2]}">
											상품 설명 : ${save_list2[zzim_quant.index][2]} <br>
											</c:if>
										</div>
									</div>
			
									<div class="goods_price_container">	
										<c:if test = "${not empty save_list2[zzim_quant.index][3]}">
											<a class = "price">${save_list2[zzim_quant.index][3]}원 </a><br>
										</c:if>
									</div>
										
									<div class = "review_info">
											<c:if test = "${not empty save_list2[zzim_quant.index][4]}">
													<input type = "hidden" value ="${save_list2[zzim_quant.index][4]}"> <br>
											</c:if>
											
											<c:if test = "${not empty save_list2[zzim_quant.index][5]}">
													<input type="hidden" value="${save_list2[zzim_quant.index][5]}">	
											</c:if>
									</div>
									<div class = "button">
										<c:if test = "${not empty save_list2[zzim_quant.index][4]}">
										<button class="zzim_Off" data-no="${save_list2[zzim_quant.index][4]}"> 찜 목록 해제 </button> <br>
										</c:if>
									</div>
										
								 </div>
					</c:if>
				</div>	 
				<hr class = "line">
			</c:forEach>			
			<div class="paging_div">
				<ul class='paging'>
                       <c:if test="${paging.prev }">
                       	<li><a href="/user/list_user_zzim.do?page=${paging.startPage-1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> << </a></li>
                       </c:if>
                       <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                       	<c:if test="${p == productSearchVO.page}">
                           <li><a href='#;' class='current'>${p}</a></li>
                           </c:if>
                           <c:if test="${p != productSearchVO.page}">
                           <li><a href='/user/list_user_zzim.do?page=${p}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }'>${p}</a></li>
                           </c:if>
                       </c:forEach>
                       <c:if test="${paging.next }">
                       	<li><a href="/user/list_user_zzim.do?page=${paging.endPage+1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> >> </a></li>
                       </c:if>
				</ul> 
			</div>
			</div>
        </div>
    </div>    
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
<script>

$(".zzim_Off").on('click', zzim);

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