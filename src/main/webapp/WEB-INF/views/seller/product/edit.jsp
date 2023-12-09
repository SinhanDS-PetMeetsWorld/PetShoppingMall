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
					<h2>상품 수정</h2>
					<form action="/seller/product/edit.do" method="post" onsubmit="return regist();">
						<input type="hidden" name="no" value="${map.pvo.no }">
						<input type="hidden" name="seller_no" value="${map.pvo.seller_no }">
						<div>
							상품명*<br> <input type="text" name="name" required value="${map.pvo.name }">
						</div>
						<div>
							가격*<br> <input type="number" name="price" value="${map.pvo.price }" required>
						</div>
						<div>
							재고*<br> <input type="number" name="stock" value="${map.pvo.stock }" required>
						</div>
						<div class="category_body">
							<c:forEach items="${map.categoryList }" var="cvo">
								<div class="category">
									<hr>
									<div>
										카테고리 *<br> <select name="category1_list" class="category1_list">
											<c:forEach var="category_name" items="${category.category_name }" varStatus="status_outer">
												<option value="${status_outer.index}" <c:if test="${cvo.category1 == status_outer.index }">selected</c:if> >${category_name }</option>
											</c:forEach>
										</select>
	
										<div>
											세부 카테고리 *<br> <select name="category2_list"
												class="category2_list" data-no="${status_outer.index }">
												<c:forEach var="category" items="${category.category[cvo.category1] }"
													varStatus="status_inner">
													<option value="${status_inner.index}" <c:if test="${cvo.category2 == status_inner.index }">selected</c:if>>${category }</option>
												</c:forEach>
											</select>
										</div>
	
									</div>
									<a href="javascript:;" class="remove_btn_category"><img
										src="/resources/img/product/option_content_remove.png" width="25" height="25" /></a>
								</div>
							</c:forEach>
							<div class ="category_add_button">
								<a href="javascript:;" class="add_btn_category"><img
													src="/resources/img/product/add.png" width="25" height="25" /> 카테고리 추가</a>
							</div>
						</div>
						<div>
							제조사 <input type="text" name="company" value="${map.pvo.company }">
						</div>
						<div>
							브랜드명 <input type="text" name="brand" value="${map.pvo.brand }">
						</div>
						
						<div class="option_body">
							<c:forEach items="${map.optionList }" var="outer_ovo" varStatus="status">
								<!-- 이거 이렇게하면 option_content만 추가되야하는애들은 아예 추가가 안되는구나 -->
								<c:if test="${(status.index == 0) || (map.optionList[status.index - 1].title != outer_ovo.title)}">
									<div class="option">
										<div class="option_title">
											<a href="javascript:;" class="remove_btn_option_title">
												<img src="/resources/img/product/option_content_remove.png" width="25" height="25" />
											</a><br>
								</c:if>
											<c:forEach items="${map.optionList }" var="ovo" varStatus="innerStatus">
												<c:if test="${status.index == innerStatus.index }">
													<div class="option_content">
														<hr>
														옵션1(제목) <input type="text" class="option_title_list" name="title_list" value="${ovo.title }"  required><br>
														옵션1(내용) <input type="text" class="option_content_list" name="content_list" value="${ovo.content }" required><br>
														가격 <input type="number" class="option_price_list" name="price_list" value="${ovo.price }" required> 	
														<a href="javascript:;" class="add_btn_option_content"><img
																			src="/resources/img/product/option_content_add.png" width="25" height="25" /></a>
														<a href="javascript:;" class="remove_btn_option_content"><img
																			src="/resources/img/product/option_content_remove.png" width="25" height="25" /></a>
													</div>
												</c:if>
											</c:forEach>
								<%-- <c:if test="${(status.index == 0) || (map.optionList[status.index - 1].title != outer_ovo.title)}"> --%>
								<c:if test="${(map.optionList[status.index + 1].title != outer_ovo.title)}">
										</div>
									</div>
								</c:if>
							</c:forEach>
							<div>
								<a href="javascript:;" class="add_btn_option"><img
									src="/resources/img/product/add.png" width="25" height="25" />옵션 추가</a>
							</div>
						</div>
						

						<div>상품 이미지 넣고</div>
						<div>
							할인 가격 <input type="number" name="discount" value="${map.pvo.discount }" required>
						</div>

						<div>상품 설명</div>

						<div>
							상세 설명
							<textarea name="description" rows="10" cols="40">${map.pvo.description }</textarea>
						</div>

						<input type="submit" value="수정">
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
					카테고리 *<br> <select name="category1_list" class="category1_list">
						<c:forEach var="category_name" items="${category.category_name }" varStatus="status">
							<option value="${status.index}">${category_name }</option>
						</c:forEach>
					</select>

					<div>
						세부 카테고리 *<br> <select name="category2_list"
							class="category2_list" data-no="${status.index }">
							<c:forEach var="category" items="${category.category[0] }" varStatus="status">
								<option value="${status.index}">${category }</option>
							</c:forEach>
						</select>
					</div>

				</div>
				<a href="javascript:;" class="remove_btn_category"><img
									src="/resources/img/product/option_content_remove.png" width="25" height="25" /></a><br>
			</div>
			<div class ="category_add_button" style="display: none;">
				<a href="javascript:;" class="add_btn_category"><img
									src="/resources/img/product/add.png" width="25" height="25" /> 카테고리 추가</a>
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
		$('.remove_btn_category').on('click', remove_category);
		$('.category1_list').on('change', change_category2);
		
		function remove_category(){
			let categoryBody = this.parentNode.parentNode;
			let category_target = this.parentNode;
			console.log(category_target);
			categoryBody.removeChild(category_target);
			
		}

		function add_category() {
			let newCategory = $('.category_original').clone();
			let categoryAddButton = $('.category_add_button').eq(-1).clone();
			
			$(newCategory).css('display', 'inline');
			$(newCategory).removeClass('category_original');
			$(newCategory).addClass('category');
			console.log(newCategory);
			$(newCategory).find('.add_btn_category').on('click', add_category);
			$(newCategory).find('.remove_btn_category').on('click', remove_category);
			$(newCategory).find('.category1_list').on('change', change_category2)
			$(this).remove();
			newCategory.appendTo($('.category_body'));
			
			$(categoryAddButton).css('display', 'inline');
			$(categoryAddButton).on('click', add_category);
			categoryAddButton.appendTo($('.category_body'));
		}
		function change_category2() {
			let target = this.parentNode.querySelector('.category2_list');
			$(target).empty();
			
			<c:forEach items="${category.category}" var="list" varStatus="status">
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
		$('.remove_btn_option_title').on('click', remove_option_title);
		
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
			if(option_title.querySelector('.option_content') == null){
				let option_temp = option_title.parentNode;
				let option_body = option_temp.parentNode;
				option_body.removeChild(option_temp);
			}
		}
	</script>
	
	<script>
		function regist(){
			let categories = document.querySelectorAll('.category');
			if(categories.length == 0){
				alert("하나 이상의 카테고리를 선택해주세요");
				return false;
			}
			
			
			let cat1List = document.querySelectorAll('.category1_list');
			let cat2List = document.querySelectorAll('.category2_list');
			for(var i = 0; i < cat1List.length - 1; i++){
				for(var j = i + 1; j < cat1List.length - 1; j++){
					if((cat1List[i].value == cat1List[j].value) && (cat2List[i].value == cat2List[j].value)){
						alert("중복 선택 된 카테고리가 존재합니다! 카테고리를 확인해주세요!");
						return false;
					}
					//console.log("본래: " + cat1List[i].value + " "  + cat2List[i].value);
					//console.log("비교: " + cat1List[j].value + " "  + cat2List[j].value);
										
				}
			}
			
			return true;
		}
		
	</script>
</body>
</html>