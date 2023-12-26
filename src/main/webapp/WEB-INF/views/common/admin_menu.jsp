<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.buttons{
		margin-left:40px;
	}
	
	.admin_menu_button{
	
		height:20px;
		background: white;
		border-radius: 2px;
		border: 1px solid black;
		text-decoration: none;
		font-size:13px;
		color:black;
		display:inline;
		line-height:18px;
		
	}
	.admin_menu_button_selected{
		height:20px;
		background: black;
		color:white;
	}
	
	.admin_menu_button:hover{
		height:20px;
		background: black;
		color:white;
		cursor:pointer;
	}
	

</style>

</head>
<body>
<div class="buttons">
	<button class="admin_menu_button" data-href="/admin/userList.do">구매자 목록 조회</button>
	<button class="admin_menu_button" data-href="/admin/sellerList.do">판매자 목록 조회</button>
	<button class="admin_menu_button" data-href="/admin/productList.do">상품 목록 조회</button>
	<button class="admin_menu_button" data-href="/admin/orderMainList.do">주문 목록 조회</button>
	<button class="admin_menu_button" data-href="/admin/orderDetailList.do">주문 상세 목록 조회</button>
	<button class="admin_menu_button" data-href="/admin/cancleAndRefoundList.do">취소/환불 목록 조회</button>
	<br>
	<button class="admin_menu_button" data-href="/admin/needConfirmationList.do">구매 확정될 목록 조회</button>
	
	<button class="admin_menu_button" data-href="/admin/getSettlementReqList.do">정산 요청 목록 조회</button>
	<button class="admin_menu_button" data-href="/admin/getSettlementComList.do">정산 완료 목록 조회</button>
	
	<br>
	<button class="admin_menu_button" data-href="/admin/getWithdrawaledSellerList.do">탈퇴한 판매자 조회</button>
</div>
</body>

<script>
	$('.admin_menu_button').on('click', function(){
		location.href=$(this).data('href');
	})
</script>


</html>