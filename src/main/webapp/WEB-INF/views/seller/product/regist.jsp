<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>판매자:: 상품 등록</title>
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

 .menu_name {
margin-bottom: 10px;	
}
	.contentsright h2{
		margin-bottom:20px;
	}

	.pro_name{
		margin-right:50px;
	}

	.pro_name_css{
	   background-color: #fff;
       height: 30px;
       width: 185px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }
	}
		
	#input_tag {
	   background-color: #fff;
       height: 30px;
       width: 100px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }
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
		margin-left:30px;
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
		margin-left:35px;
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
	   background-color: #fff;
       height: 30px;
       width: 100px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       margin-left:28px;
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }
		
	}
	.category2_list{
	
	   background-color: #fff;
       height: 30px;
       width: 120px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       margin-left:28px;
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }
		
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
		margin-left:65px;
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
	.option{
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
		margin-left : 85px;
		
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

.start_line {
 		margin-top : 10px;
 		margin-bottom : 20px;
 		width : 580px;
        border: 1px solid #FFDE30;
} 

.line {
		margin-top :10px;
 		margin-bottom : 10px;
 		width : 580px;
        border: 1px solid #ccc
}

.category_line{

width : 580px;
border: 1px solid #ccc;

}

.option_line{

width : 580px;
border: 1px solid #ccc;
margin-top : 10px;
}

.remove_btn_category{
       
       height: 30px;
       width: 50px;
      

}
#company{
       background-color: #fff;
       height: 30px;
       width: 100px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       margin-left:50px;
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }

}
	
#brand {
	   background-color: #fff;
       height: 30px;
       width: 100px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }

}	

.displayed_image{
	   background-color: #fff;
       height: 100px;
       width: 100px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       
       
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }



}

#description_insert{
       background-color: #fff;
       height: 150px;
       width: 449.5px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       resize :none;
       margin-left: 14px;
       
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }


}


#registConfirm{

  display: inline-block;
  outline: 0;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  border: none;
  width: 150px;
  height: 40px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 800;
  color: #222;
  margin-top:30px;
  margin-left: 225px;


}

.option_title_list{

       background-color: #fff;
       height: 30px;
       width: 170px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       margin-left: 25px;
       
       
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }

}


.option_content_list{

       background-color: #fff;
       height: 30px;
       width: 170px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       margin-left: 25px;
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }

}

.option_price_list {

       background-color: #fff;
       height: 30px;
       width: 170px;
       padding: 3px 7px;
       line-height: normal;
       border: 1px solid #a6a6a6;
       border-top-color: #949494;
       border-radius: 3px;
       box-shadow: 0 1px 0 rgb(255 255 255 / 50%), 0 1px 0 rgb(0 0 0 / 7%) inset;
       outline: 0;
       color: #111;
       font-size: 13px;
       margin-left: 65px;
       :focus{
           border-color: #e77600;
           box-shadow: 0 0 3px 2px rgb(228 121 17 / 50%);
       }


}
</style>
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
					<h1 class ="menu_name">상품 등록</h1>
					<hr class = "start_line">
					<form action="regist.do" method="post" onsubmit="return regist();" enctype="multipart/form-data">
						<input type="hidden" name="seller_no"
							value="${sellerLoginInfo.no}">
						<div>
							<span class="pro_name">상품명*</span><input type="text" class="pro_name_css" name="name" required>
						</div>
						<br>
						<hr class = "line">
						<span class="regist_price">
							가격* <input id = "input_tag" type="number" name="price" value="0" required>
						</span>
						<span class="regist_quantity">
							재고* <input id ="input_tag" type="number" name="stock" value="0" required>
						</span>
						<div class="price_discount">
								할인 가격 <input id ="input_tag" type="number" name="discount" value="0" required>
						</div>
						
						
						<div class="category_body">
							<div class="category">
								<hr class = "line">
								<div class="category_all">
									<div class="category1">
										카테고리*  <select name="category1_list" class="category1_list">
											<c:forEach var="category_name" items="${category.category_name }" varStatus="status">
												<option value="${status.index}">${category_name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="category2">
										세부 카테고리* <select name="category2_list"
											class="category2_list" data-no="${status.index }">
											<c:forEach var="category" items="${category.category[0] }"
												varStatus="status">
												<option value="${status.index}">${category }</option>
											</c:forEach>
										</select>
									</div>

								</div>
								<div class="category_remove">
								<a href="javascript:;" class="remove_btn_category"><img
									src="/resources/img/product/option_content_remove.png" width="30" height="30" /></a><br>
								</div>
							</div>
							<div class ="category_add_button" data-ori="9999">
								<a href="javascript:;" class="add_btn_category"><img
													src="/resources/img/product/add.png" width="15" height="15" /> 카테고리 추가</a>
							</div>
						</div>
						<div class="com_brand">
							<hr class ="line">
							<div class="company">
								제조사 <input type="text" id="company" name="company">
							</div>
							<div class="brand">
								브랜드명 <input type="text" id="brand" name="brand">
							</div>
							
						</div>
						
						
						<div class="option_body">
							
							<div class="option_add_button">
								<a href="javascript:;" class="add_btn_option"><img
									src="/resources/img/product/add.png" width="15" height="15" /> 옵션 추가</a>
							</div>
						</div>
						

						<div class="image_section">
							<br>
							<hr class ="line">
							<div class="image_top">
								<div class="image_fileinput">
									상품 이미지	 <input class="add_file_button" type="file" name="filename" onchange="readURL(this);" required> 
								</div>
								<div class="displayed_image_section">
									<img class="displayed_image">
									<br>
								</div>
							</div>
						
							<hr class = "line">
	
							<div class="image_section_detail">
								<div class="image_detail_detail">
								상품 설명
								</div>
								<textarea id ="description_insert" name="description" rows="10" cols="40"></textarea>
								
							</div>
						</div>
						<input id ="registConfirm" type="submit" value="등록">
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