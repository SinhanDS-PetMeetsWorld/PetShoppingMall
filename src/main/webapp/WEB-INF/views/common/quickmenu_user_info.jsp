<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/resources/css/common/quick_menu.css">
</head>
  <div class="quick_menu">
    Category
      <div class = "quick_menu_category">
        <a href="/user/edit.do">회원 정보 수정</a><br>
        <a href="/user/list_user_zzim.do">찜 박스</a><br>
        <a href="/user/list_user_cart.do">장바구니</a><br>
        <a href="/user/order/list.do?searchWord=&searchType=">구매 이력</a><br>
        <a href="/user/list_user_review.do">작성한 리뷰</a><br>
        <a href="/user/possible_write_review.do">작성 가능한 리뷰</a><br>
        <a href="#">로그아웃</a><br>
      </div>
  </div>
</html>

