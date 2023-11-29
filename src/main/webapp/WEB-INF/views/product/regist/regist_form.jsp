<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
<META name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</div>



		<div class="contents">
			<div class="quickmenu">
				<%@ include file="/WEB-INF/views/common/quickmenu.jsp"%>
			</div>
			<div class="contentsright">
				<div>
					<h2>상품 등록</h2>
					<form action="regist.do" method="post">
						<div>
							상품명*<br> <input type="text" name="product_name">
						</div>
						<div>
							가격*<br> <input type="text" name="price">
						</div>
						<div>
							재고*<br> <input type="text" name="stock">
						</div>
						<div>
							<div>
								카테고리 *<br> <select name="category1" id="">
									<option value="0">강아지</option>
									<option value="1">고양이</option>
									<option value="2">그외</option>
								</select>
							</div>
							<div>
								세부 카테고리 *<br> <select name="category2" id="">
									<option value="temp">temp1</option>
									<option value="temp">temp2</option>
									<option value="temp">temp3</option>
								</select>
							</div>
						</div>
						<div>카테고리 추가 버튼 넣고</div>
						<div>
							제조사 <input type="text" name="company">
						</div>
						<div>
							브랜드명 <input type="text" name="brand">
						</div>
						<div>옵션추가넣고</div>
						<div>상품 이미지 넣고</div>
						<div>
							할인 가격 <input type="text" name="discount">
						</div>

						<div>상품 설명</div>

						<div>
							상세 설명
							<textarea name="description" rows="10" cols="40"></textarea>
						</div>

						<input type="submit" value="등록">
					</form>
				</div>
			</div>

		</div>


		<div class="footer">
			<div class="footer-color"></div>
		</div>
	</div>
</body>
</html>