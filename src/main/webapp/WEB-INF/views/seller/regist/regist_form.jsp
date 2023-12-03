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
					<form action="regist.do" method="post">
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
										<option value="0">강아지</option>
										<option value="1">고양이</option>
										<option value="2">기타</option>
									</select>

									<div>
										세부 카테고리 *<br> <select name="category2_list"
											class="category2_list" data-no="${status.index }">
											<c:forEach var="category" items="${vo.category[0] }"
												varStatus="status">
												<option value="${status.index}">${category }</option>
											</c:forEach>
										</select>
									</div>

								</div>
								<a href="javascript:;" class="add_btn_category"><img
									src="/resources/img/product/add.png" width="25" height="25" /></a>
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
						

						<div>상품 이미지 넣고</div>
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
			<div class="category_original" style="display: none;">
				<hr>
				<div>
					카테고리 *<br> <select name="category1_list"
						class="category1_list">
						<option value="0">강아지</option>
						<option value="1">고양이</option>
						<option value="2">기타</option>
					</select>

					<div>
						세부 카테고리 *<br> <select name="category2_list"
							class="category2_list" data-no="${status.index }">
							<c:forEach var="category" items="${vo.category[0] }"
								varStatus="status">
								<option value="${status.index}">${category }</option>
							</c:forEach>
						</select>
					</div>

				</div>
				<a href="javascript:;" class="add_btn_category"><img
					src="/resources/img/product/add.png" width="25" height="25" /></a>
			</div>
			
			<div class="option_original" style="display: none;">
				<div class="option_title">
					<a href="javascript:;" class="remove_btn_option_title">
						<img src="/resources/img/product/option_content_remove.png" width="25" height="25" />
					</a><br>
					<div class="option_content">
						<hr>
						옵션1(제목) <input type="text" class="option_title_list" name="title_list" required><br>
						옵션1(내용) <input type="text" class="option_content_list" name="content_list" required><br>
						가격 <input type="number" class="option_price_list" name="price_list" value=0 required> 	
						<a href="javascript:;" class="add_btn_option_content"><img
											src="/resources/img/product/option_content_add.png" width="25" height="25" /></a>
						<a href="javascript:;" class="remove_btn_option_content"><img
											src="/resources/img/product/option_content_remove.png" width="25" height="25" /></a>
					</div>
				</div>
				
			</div>
			<div class="option_add_button"  style="display: none;">
				<a href="javascript:;" class="add_btn_option"><img
									src="/resources/img/product/add.png" width="25" height="25" />옵션 추가</a>
			</div>
		</div>
	</div>

	<script>
		$('.add_btn_category').on('click', add_category);
		$('.category1_list').on('change', change_category2)
		function add_category() {
			let newCategory = $('.category_original').clone();
			$(newCategory).css('display', 'inline');
			$(newCategory).removeClass('category_original');
			$(newCategory).addClass('category');
			console.log(newCategory);
			$(newCategory).find('a').on('click', add_category);
			$(newCategory).find('.category1_list').on('change', change_category2)
			$(this).remove();
			newCategory.appendTo($('.category_body'));
		}

		function change_category2() {
			let target = this.parentNode.querySelector('.category2_list');
			$(target).empty();
			
			<c:forEach items="${vo.category}" var="list" varStatus="status">
				if(this.value == ${status.index}){
					
					<c:forEach items="${list}" var="item" varStatus="status">
						var newObj = $('<option value="${status.index}">${item }</option>');
						newObj.appendTo(target);
					</c:forEach>
				}
			</c:forEach>
		}
	</script>
	<script>
		$('.add_btn_option').on('click', add_option);
		$('.add_btn_option_content').on('click', add_option_content);
		$('.remove_btn_option_content').on('click', remove_option_content);
		
		function add_option(){
			console.log("gg1");
			let optionAddButton = $('.option_add_button').eq(-1).clone();
			let newOption = $('.option_original').clone();
			
			
			$(newOption).css('display', 'inline');
			$(newOption).removeClass('option_original');
			$(newOption).addClass('option');
			console.log(newOption);
			$(newOption).find('.add_btn_option').on('click', add_option);
			$(newOption).find('.add_btn_option_content').on('click', add_option_content);
			$(newOption).find('.remove_btn_option_content').on('click', remove_option_content);
			$(newOption).find('.remove_btn_option_title').on('click', remove_option_title);
			$(this).remove();
			newOption.appendTo($('.option_body'));
			
			$(optionAddButton).css('display', 'inline');
			$(optionAddButton).on('click', add_option);
			optionAddButton.appendTo($('.option_body'));
		}
		
		function add_option_content(){
			let option_content = this.parentNode;
			let option_title = option_content.parentNode;
			/* let option_content_index = $('.option_content').index(option_content);
			console.log(option_content_index); */
			let newOptionContent = $(option_content).clone();
			$(newOptionContent).find('.option_content_list').val('');
			$(newOptionContent).find('.option_price_list').val(0);
			$(newOptionContent).find('.add_btn_option_content').on('click', add_option_content);
			$(newOptionContent).find('.remove_btn_option_content').on('click', remove_option_content);
			newOptionContent.appendTo(option_title);
		}
		
		function remove_option_title(){

			let option_content = this.parentNode;
			let option_title = option_content.parentNode;
			let option_body = option_title.parentNode;
			option_body.removeChild(option_title);
		}
		
		function remove_option_content(){
			let option_content = this.parentNode;
			let option_title = option_content.parentNode;
			option_title.removeChild(option_content);
		}
	</script>
</body>
</html>