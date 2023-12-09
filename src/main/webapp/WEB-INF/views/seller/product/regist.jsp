<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<script>
	console.log("${sellerLoginInfo.no}");
</script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<%@ include file="/WEB-INF/views/common/header_seller.jsp"%>
		</div>

		<div class="contents">
			<div class="quickmenu">
				<%@ include file="/WEB-INF/views/common/quickmenu_seller.jsp"%>
			</div>
			<div class="contentsright">
				<div>
					<h2>상품 등록</h2>
					<form action="regist.do" method="post" onsubmit="return regist();" enctype="multipart/form-data">
						<input type="hidden" name="seller_no"
							value="${sellerLoginInfo.no}">
						<div>
							상품명*<br> <input type="text" name="name" required>
						</div>
						<div>
							가격*<br> <input type="number" name="price" value="0" required>
						</div>
						<div>
							재고*<br> <input type="number" name="stock" value="0" required>
						</div>
						<div class="category_body">
							<div class="category">
								<hr>
								<div>
									카테고리 *<br> <select name="category1_list"
										class="category1_list">
										<c:forEach var="category_name" items="${category.category_name }" varStatus="status">
											<option value="${status.index}">${category_name }</option>
										</c:forEach>
									</select>

									<div>
										세부 카테고리 *<br> <select name="category2_list"
											class="category2_list" data-no="${status.index }">
											<c:forEach var="category" items="${category.category[0] }"
												varStatus="status">
												<option value="${status.index}">${category }</option>
											</c:forEach>
										</select>
									</div>

								</div>
								<a href="javascript:;" class="remove_btn_category"><img
									src="/resources/img/product/option_content_remove.png" width="25" height="25" /></a><br>
							</div>
							<div class ="category_add_button">
								<a href="javascript:;" class="add_btn_category"><img
													src="/resources/img/product/add.png" width="25" height="25" /> 카테고리 추가</a>
							</div>
						</div>
						<div>
							제조사 <input type="text" name="company">
						</div>
						<div>
							브랜드명 <input type="text" name="brand">
						</div>
						
						<div class="option_body">
							<div>
								<a href="javascript:;" class="add_btn_option"><img
									src="/resources/img/product/add.png" width="25" height="25" />옵션 추가</a>
							</div>
						</div>
						

						<div>
							<img class="displayed_image" width="100" height="100">
							<br>
							상품 이미지 <input class="add_file_button" type="file" name="filename" onchange="readURL(this);"> 
						</div>
						<div>
							할인 가격 <input type="number" name="discount" value="0" required>
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
		
		<div class="need">
			<%@ include file="/WEB-INF/views/seller/product/category_template.jsp"%>
			<%@ include file="/WEB-INF/views/seller/product/option_template.jsp"%>
		</div>
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
	<script src="/resources/js/seller/product/category.js"></script>
	<script src="/resources/js/seller/product/option.js"></script>
	<script src="/resources/js/seller/product/regist.js"></script>
	<script src="/resources/js/seller/product/displayImage.js"></script>
</body>
</html>