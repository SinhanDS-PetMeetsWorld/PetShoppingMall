<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>

<script>
	$('.admin_menu_button').on('click', function(){
		location.href=$(this).data('href');
	})
</script>
</html>