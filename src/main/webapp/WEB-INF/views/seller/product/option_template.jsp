<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="option_original" style="display: none;">
	<div class="option_title">
		<hr class = "option_line">
		<a href="javascript:;" class="remove_btn_option_title"> <img
			src="/resources/img/product/option_content_remove.png" width="30"
			height="30" />
		</a><br>
		<div class="option_content">
			<div class="options">
			옵션(제목) <input type="text" class="option_title_list" name="title_list" required><br><br>
			옵션(내용) <input type="text" class="option_content_list" name="content_list" required><br><br>
			</div>
			<div class="option_price">
				<div class="input_price">
					가격 <input type="number" class="option_price_list" name="price_list"	 value=0 required> 
				</div>
				<div class="btn_price">
					<a href="javascript:;" class="add_btn_option_content" ><img src="/resources/img/product/option_content_add.png" width ="30" height ="30" /></a>
					<a href="javascript:;" class="remove_btn_option_content"><img src="/resources/img/product/option_content_remove.png" width ="30" height ="30"  /></a>
				</div>
			</div>		
		</div>
	</div>
</div>
<div class="option_add_button" style="display: none;">
	<a href="javascript:;" class="add_btn_option"><img
		src="/resources/img/product/add.png" width="15" height="15" /> 옵션 추가</a>
		<hr class ="option_line">
</div>
