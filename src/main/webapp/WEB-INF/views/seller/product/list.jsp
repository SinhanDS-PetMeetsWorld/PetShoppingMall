<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>판매자:: 판매중인 상품</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
    
    <style>
    	.nowsale_table{
    		width:800px;
    		height:140px;
    		text-align: center;
    		border-collapse : collapse;
    		margin-bottom:20px;
    		float:left;
    		
    	}
    
    	.nowsale_table tr{
    		height:20px;
    	}
    	
    	.nowsale_table_title td{
    		background: linear-gradient(to left, #FFDE30, #ffe76b);
    		border:1px solid black;
    	}
    	
    	.nowsale_table_title td:first-child{
    		background: white;
    	}
    	
    	.pro_image{
    		width:100px;
    	}
    	
    	.pro_name{
    		width:340px;
    	}
    	.pro_category{
    		width:120px;
    	}
    	.pro_opt{
    		width:150px;
    	}
    	.pro_price{
    		width:80px;
    	}
    	.pro_quantity{
    		width:50px;
    	}
    	
    	.one_line{
    		height:150px;
    	}
    	
    	
	   	.modify_button {
			 outline: 0;
			 border: none;
			 cursor: pointer;
			 border-radius: 50px;
			 width: 150px;
			 height: 40px;
			 font-size: 15px;
			 background-color: #fd0;
			 font-weight: 500;
			 color: #222;
			 margin-left:20px;
			 margin-bottom:10px;
		}
	   	.delete_button {
			 outline: 0;
			 border: none;
			 cursor: pointer;
			 border-radius: 50px;
			 width: 150px;
			 height: 40px;
			 font-size: 15px;
			 background-color: #ff4742;
			 font-weight: 500;
			 color: #fff;
			margin-left:20px;
			 margin-bottom:20px;
		}
		
		.btn_wrap{
			float:left;
			margin-right:30px;
			margin-bottom:20px;
		}
		
		.buyer_info{
			clear:both;
			line-height: 30px;
		}
		.buyer_bold{
			font-weight:bold;
		}
		
		#regist_del{
			outline: 0;
			border: none;
			cursor: pointer;
			padding: 0 24px;
			border-radius: 50px;
			width: 150px;
			height: 40px;
			font-size: 15px;
			background-color: #fd0;
			font-weight: 500;
			color: #222;
		}
		
		
		
		
		.paging_div{
			height:30px;	
			text-align:center;
			width:1000px;
			clear:both;
			margin-bottom:15px;
		}
	
		
		.paging li{
			list-style: none;
			margin-right:8px;
			margin-top:15px;
			
			text-align:center;
			display:inline-block;
		}
		
		.paging li a{
			width:20px;
			height:20px;
			background: white;
			border-radius: 4px;
			border: 1px solid black;
			text-decoration: none;
			font-size:13px;
			color:black;
			display:block;
			line-height:18px;
		}
		
		
		
		.paging li a:hover{
			width:20px;
			height:20px;
			background: black;
			color:white;
			
		}
    
    	.bbsSearch{
    		width:1000px;
    		text-align:center;
    	}
    	
    	.search_keyword_btn{
    		background-color:#FFDE30;
    		border:1px solid gray;
    		width:40px;
    	}
    	
    	.aaa2{
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
		
    	.aaa3{
			background-color: #fff;
			height: 30px;
			width: 70px;
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
		
		.searchWord input{
			height:30px;
		}

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 100%;
     }

 .menu_name {
margin-bottom: 10px;	
}

    </style>
    <style>
	    .messagebody{
			margin-top : 80px;
		}
	    .messagebox{
			margin : 0 auto;
			width : 700px;
			height : 300px;
			text-align : center;
		}
		.messagebox > img {
			margin-bottom : 20px;
		}
    </style>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_seller.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_seller.jsp"%>
            </div>
			<div class="contentsright">
				<div>
				<h1 class ="menu_name">판매중인 상품</h1>
					<hr class = "start_line">
					<c:if test="${empty productList}">
						<div class="messagebody">
							<div class="messagebox">
									<img src="/resources/img/common/emptybox.png">
									<h2>판매 중인 상품이 없습니다</h2>
							</div>
						</div>
					</c:if>
					<ul>
						<c:forEach items="${productList }" var="vo" varStatus="status">
							<li class="one_line">
							
								<table border="1px" class="nowsale_table">
										<tr class="nowsale_table_title">
											<td rowspan="2" class="pro_image">
												<c:if test="${empty vo.image_url }">
													<img src="/resources/img/product/no_image.jpg" width="100" height="100">
												</c:if>
												<c:if test="${!empty vo.image_url && fn:substring(vo.image_url, 0, 1) == 'h' }">
													<img src="${vo.image_url }" width="100" height="100">
												</c:if>
												<c:if test="${!empty vo.image_url && !(fn:substring(vo.image_url, 0, 1) == 'h') }">
													<img src="/resources/img/product/registed_img/${vo.image_url }" width="100" height="100">
												</c:if>
												
											</td>
											<td class="pro_name">제품명</td><td class="pro_category">카테고리</td> <td class="pro_opt">옵션</td><td class="pro_price">판매가</td><td class="pro_quantity">재고</td>
											
										</tr>
									<tr>
										<td>
											${vo.name }
										</td>
										<td>
											<c:forEach items="${categoryList }" var="cvoList" varStatus="cList_status">
												<c:if test="${status.index == cList_status.index }">
													<c:forEach items="${cvoList }" var="cvo" varStatus="c_status">
														${cvo.category_name[cvo.category1] } ${cvo.category[cvo.category1][cvo.category2] } <br>
													</c:forEach>
												</c:if>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${optionList }" var="ovoList" varStatus="oList_status">
												<c:if test="${status.index == oList_status.index }">
													<c:forEach items="${ovoList }" var="ovo" varStatus="o_status">
														${ovo.title }:${ovo.content } <br>
													</c:forEach>
												</c:if>
											</c:forEach>
										</td>
										<td>
											${vo.price }
										</td>
										<td>
											${vo.stock }
										</td>
									</tr>
								</table>
								<br>
								<div class="btn_wrap">
									<form action="/seller/product/edit.do" method="get">
										<input type="hidden" name="no" value="${vo.no }">
										<input type="submit" class="modify_button" value="수정하기">
									</form>
									
									<form action="/seller/product/remove.do" method="post" onsubmit="return remove();">
										<input type="hidden" name="no" value="${vo.no }">
										<input type="hidden" name="image_url" value="${vo.image_url }">
										<input type="submit" class="delete_button" value="삭제하기">
									</form>
								</div>
								
								
							</li>	
								<br>
								<hr>
								<br>					
						</c:forEach>
					</ul>
				</div>
				
				
				<div class="paging_div">
					<ul class='paging'>
                        <c:if test="${paging.prev }">
                        	<li><a href="list.do?page=${paging.startPage-1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
                        	<c:if test="${p == productSearchVO.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != productSearchVO.page}">
                            <li><a href='list.do?page=${p}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${paging.next }">
                        	<li><a href="list.do?page=${paging.endPage+1 }&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}&sorttype=${productSearchVO.sorttype }"> >> </a></li>
                        </c:if>
					</ul> 
				</div>
				
                <div class="bbsSearch">
                    <form method="get" name="searchForm" id="searchForm" action="/seller/product/list.do">
                    	<span class="sortSelect">
                            <select class="aaa2" name="sorttype">
                                <option value="regist" <c:if test="${productSearchVO.sorttype == 'regist'}">selected</c:if>>등록일 순</option>
                                <option value="maxprice" <c:if test="${productSearchVO.sorttype == 'maxprice'}">selected</c:if>>최고 가격 순</option>
                                <option value="minprice" <c:if test="${productSearchVO.sorttype == 'minprice'}">selected</c:if>>최저 가격 순</option>
                                <option value="maxstock" <c:if test="${productSearchVO.sorttype == 'maxstock'}">selected</c:if>>재고 많은 순</option>
                                <option value="minstock" <c:if test="${productSearchVO.sorttype == 'minstock'}">selected</c:if>>재고 적은 순</option>
                            </select>
                    	</span>
                        <span class="srchSelect">
                            <select class="aaa3" name="searchType">
                                <option value="all">전체</option>
                                <option value="name" <c:if test="${productSearchVO.searchType == 'name'}">selected</c:if>>상품명</option>
                                <option value="brand" <c:if test="${productSearchVO.searchType == 'brand'}">selected</c:if>>브랜드</option>
                                <option value="company" <c:if test="${productSearchVO.searchType == 'company'}">selected</c:if>>제조사</option>
                            </select>
                        </span>
                        <span class="searchWord">
                            <input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
                            <input type="submit" class="search_keyword_btn" value="검색">
                        </span>
                    </form>
                    
                </div>				
				
			</div>

        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
    <script>
		function remove(){
			if(confirm("해당 제품을 정말 삭제하시겠습니까?") == true) return true;
			else return false;
		}
    </script>
</body>
</html>