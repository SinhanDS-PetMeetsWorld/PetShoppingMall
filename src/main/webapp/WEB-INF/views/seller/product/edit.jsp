<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
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

<style>

	.contentsright h2{
		margin-bottom:20px;
	}

	.pro_name{
		margin-right:50px;
	}

	.pro_name_css{
		width:300px;
		height:25px;
	}
	
	.regist_price{
		margin-top:20px;
		display:inline-block;
		height:50px;
		
	}
	
	.regist_price input{
		width:200px;
		
		height:25px;
		margin-left:60px;	
	}
	
	.regist_quantity{
	
		margin-left:100px;
		margin-top:20px;
	}
	
	.regist_quantity input{
		width:200px;
		height:25px;
		margin-left:60px;	
	}
	
	.price_discount{
		margin-bottom:20px;
	}
	
	.price_discount input{
		width:200px;
		height:25px;
		margin-left:29px;
	}
	
	
	
	.category{
		height:50px;
	}
	
	.category_all{
		float:left;
		margin-top:20px;
	}
	.category1{
		float:left;
	}
	
	.category2{
		float:left;
		display:inline-block;
		margin-left:60px;
	}
	
	.category_remove{
		float:left;
		margin-left: 20px;
		
		margin-top:20px;
	}
	.category_add_button{
		clear:both;
		margin:20px 0;
	}
	
	.category1_list{
		margin-left:28px;
	}
	.category2_list{
		margin-left:28px;
	}
	
	.com_brand{
		clear:both;
	}
	
	.company{
		
		padding:20px 0;
		float: left;
	}
	
	.brand{
		padding:20px 0;
		float: left;
		margin-left: 100px;
	}
	
	.option_body{
		clear:both;
	}
	
	.company input{
		width:200px;
		height:25px;	
		margin-left:50px;
	}
	
	.brand input{
		width:200px;
		height:25px;	
		margin-left:40px;
	}
	
	.remove_btn_option_title img{
		margin-top:10px;
		margin-bottom:10px;
	}
	
	.add_btn_option_content img{
		margin-top:10px;
	}
	
	.input_price{
		float:left;
		margin-top:10px;
	}
	.btn_price{
		margin-left:20px;
		float:left;
	}
	.options{
		clear:both;
	}
	
	
	.image_top{
		margin-top:20px;
		height:100px;
	}
	
	.image_fileinput{
		float:left;
		margin-bottom:10px;
		line-height:100px;
	}
	.add_file_button{
		width: 200px;
	}
	
	
	
	.image_section_detail{
		height:150px;
		clear:both;
	}
	
	.image_detail_detail{
		line-height:149px;
		float:left;
		margin-right:20px;
	}
	
	
	a{
		text-decoration:none;
		color:black;
	}
	
</style>

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
					<form action="/seller/product/edit.do" method="post" onsubmit="return regist();" enctype="multipart/form-data">
						<input type="hidden" name="no" value="${pvo.no }">
						<input type="hidden" name="seller_no" value="${pvo.seller_no }">
						<div>
							<span class="pro_name">상품명*</span><input type="text" class="pro_name_css" name="name" required value="${pvo.name }">
						</div><br><hr>
						<span class="regist_price">
							가격* <input type="number" name="price" value="${pvo.price }" required>
						</span>
						<span class="regist_quantity">
							재고* <input type="number" name="stock" value="${pvo.stock }" required>
						</span><br>
						<div class="price_discount">
								할인 가격 <input type="number" name="discount" value="0" required>
						</div>
						
						
						<div class="category_body">
							<c:forEach items="${categoryList }" var="cvo">
								<div class="category">
									<hr>
									<div class="category_all">
										<div  class="category1">
											카테고리* <select name="category1_list" class="category1_list">
												<c:forEach var="category_name" items="${category.category_name }" varStatus="status_outer">
													<option value="${status_outer.index}" <c:if test="${cvo.category1 == status_outer.index }">selected</c:if> >${category_name }</option>
												</c:forEach>
											</select>
										</div>
										<div  class="category2">
											세부 카테고리* <select name="category2_list"
												class="category2_list" data-no="${status_outer.index }">
												<c:forEach var="category" items="${category.category[cvo.category1] }"
													varStatus="status_inner">
													<option value="${status_inner.index}" <c:if test="${cvo.category2 == status_inner.index }">selected</c:if>>${category }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="category_remove">
									<a href="javascript:;" class="remove_btn_category"><img
										src="/resources/img/product/option_content_remove.png" width="25" height="25" /></a>
									</div>
								</div>
							</c:forEach>
							<div class ="category_add_button" data-ori="9999">
								<a href="javascript:;" class="add_btn_category"><img
													src="/resources/img/product/add.png" width="15" height="15" /> 카테고리 추가</a>
							</div>
						</div>
						<div class="com_brand">
							<hr>
							<div class="company">
								제조사 <input type="text" name="company" value="${pvo.company }">
							</div>
							<div class="brand">
								브랜드명 <input type="text" name="brand" value="${pvo.brand }">
							</div>
						
						</div>
						
						<div class="option_body">
							<c:forEach items="${optionList }" var="outer_ovo" varStatus="status">
								<!-- 이거 이렇게하면 option_content만 추가되야하는애들은 아예 추가가 안되는구나 -->
								<c:if test="${(status.index == 0) || (optionList[status.index - 1].title != outer_ovo.title)}">
									<div class="option">
										<div class="option_title">
										<hr>
											<a href="javascript:;" class="remove_btn_option_title">
												<img src="/resources/img/product/option_content_remove.png" width="25" height="25" />
											</a><br>
								</c:if>
											<c:forEach items="${optionList }" var="ovo" varStatus="innerStatus">
												<c:if test="${status.index == innerStatus.index }">
													<div class="option_content">
														<div class="options">
														옵션(제목) <input type="text" class="option_title_list" name="title_list" value="${ovo.title }"  required><br>
														옵션(내용) <input type="text" class="option_content_list" name="content_list" value="${ovo.content }" required><br>
														</div>
														<div class="option_price">
															<div class="input_price">
																가격 <input type="number" class="option_price_list" name="price_list" value="${ovo.price }" required> 	
															</div>
															<div class="btn_price">
																<a href="javascript:;" class="add_btn_option_content"><img
																					src="/resources/img/product/option_content_add.png" width="25" height="25" /></a>
																<a href="javascript:;" class="remove_btn_option_content"><img
																						src="/resources/img/product/option_content_remove.png" width="25" height="25" /></a>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
								<%-- <c:if test="${(status.index == 0) || (optionList[status.index - 1].title != outer_ovo.title)}"> --%>
								<c:if test="${(optionList[status.index + 1].title != outer_ovo.title)}">
										</div>
									</div>
								</c:if>
							</c:forEach>
							<div class="option_add_button" >
								<a href="javascript:;" class="add_btn_option"><img
									src="/resources/img/product/add.png" width="15" height="15" />옵션 추가</a>
							</div>
						</div>
						

						<div class="image_section">
							<br>
							<hr>
							<div class="image_top">
								<div class="image_fileinput">
									상품 이미지 수정<input class="add_file_button" type="file" name="filename" onchange="readURL(this);"> 
								</div>
						
							<div class="displayed_image_section">
								<c:if test="${empty pvo.image_url }">
									<img class="displayed_image" src="/resources/img/product/no_image.jpg" width="100" height="100">
								</c:if>
								<c:if test="${!empty pvo.image_url && fn:substring(pvo.image_url, 0, 1) == 'h' }">
									<img class="displayed_image" src="${pvo.image_url }" width="100" height="100">
								</c:if>
								<c:if test="${!empty pvo.image_url && !(fn:substring(pvo.image_url, 0, 1) == 'h') }">
									<img class="displayed_image" src="/resources/img/product/registed_img/${pvo.image_url }" width="100" height="100">
								</c:if>
								<input type="hidden" name="image_url" value="${pvo.image_url }">
								<br	>
							</div>
						</div>

						<div class="image_section_detail">
							<div class="image_detail_detail">
							상품 설명
							</div>
							<textarea name="description" rows="10" cols="40">${pvo.description }</textarea>
						</div>

						<input type="submit" value="수정">
					</form>
				</div>
			</div>

		</div>
		<div class="need">
			<%@ include file="/WEB-INF/views/seller/product/category_template.jsp"%>
			<%@ include file="/WEB-INF/views/seller/product/option_template.jsp"%>
		</div>
	</div>
	<div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
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