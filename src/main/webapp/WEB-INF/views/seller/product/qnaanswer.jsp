<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>판매자:: Q&A 관리</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
    <style>
    	.qna_info{
    		line-height: 30px;
    	}
    	.qna_textbox{
    		margin-top: 20px;
    	}
    	
    	.writeAnswer {
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
			 margin-left: 20px;
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
					<c:if test="${empty qna_array}">
						<div class="messagebody">
							<div class="messagebox">
									<img src="/resources/img/common/emptybox.png">
									<h2>고객 문의가 아직 없습니다</h2>
							</div>
						</div>
					</c:if>
					<c:forEach items="${qna_array}" varStatus = "qna_quant">
						<div class="qna_info">	
							<c:if test = "${not empty qna_array[qna_quant.index][0]}">
							  제품명 : ${qna_array[qna_quant.index][0]} <br>
							</c:if>	
							
							<input class="quest_no" type="hidden" data-no="${qna_array[qna_quant.index][3] }"  value="${qna_array[qna_quant.index][3] }">
							
							<c:if test = "${not empty qna_array[qna_quant.index][4]}">
							  질문 등록일 : ${qna_array[qna_quant.index][4]} <br>
							</c:if>		
							<c:if test = "${not empty qna_array[qna_quant.index][5]}">
							   질문 내용 : ${qna_array[qna_quant.index][5]} <br>
							</c:if>		
							<c:if test = "${not empty qna_array[qna_quant.index][6]}">
							  답변 등록일 : ${qna_array[qna_quant.index][6]} <br>
							</c:if>		
							<c:if test = "${not empty qna_array[qna_quant.index][7]}">
							 	 <div class="qna_textbox">
								 	 답변 내용 : 
								 	 <c:if test="${'null' == qna_array[qna_quant.index][7]}">
								 	 	<input type= text id ="answer_content" class="answer_content"  style="width:400px; height:50px"> 		  
						  				<input type="button" id="submit" name = "등록" value="등록" class="writeAnswer" >
						  				<br><br>	
								 	 </c:if>
							 	 <c:if test="${'null' != qna_array[qna_quant.index][7]}">
							 	 		${ qna_array[qna_quant.index][7]} <br><br>
							 	 </c:if>
							 	 </div>
							</c:if>		
							<hr>
							<br>     	
					   </div>	
				   </c:forEach>			
				</div>
			</div>
        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
<script>
	
	$('.writeAnswer').on('click', qnaanswer);
	
	function qnaanswer() {
		//console.log($(this.parentNode).find('.quest_no').find('span').text());
		
		var answer_content = $(this.parentNode.querySelector("#answer_content")).val();
		var no = $(this.parentNode.parentNode).find('.quest_no').data('no');
		
		$.ajax({
			method:'GET',
			url:'/seller/product/qnaanswer.do',
			async: true,
			type:'HTML',
			data: {
				answer_content : answer_content,
							no : no
			},
			success : function(response){
				history.go(0);
			},
			error: function (error) {
	        }
		});
		
	}

</script>
</body>
</html>