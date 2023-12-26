<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
    <style>
    	
    	.swiper-wrapper{
    		centeredSlides : true;
    	}
    	.swiper-slide img {
    	  margin-left : 200px;
		  width: 800px;
		  height: 500px;
		  object-fit : contain;
		}
		.swiper-button-next{
			color : FFDE30;
		}
    </style>
    <script>
		$(function(){
		    // swiper
		    var swiper = new Swiper('.swiper',{
		        autoplay : {
		            delay:3000
		        },
		        loop : true,
		        pagination: {
		            el: ".swiper-pagination",
		            clickable: true,
		          },
		          navigation: {
		            nextEl: ".swiper-button-next",
		            prevEl: ".swiper-button-prev",
		          }
		    });
		});
	</script>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
				 <div class="visual">
		            <div class="swiper">
		                <div class="swiper-wrapper">
		                	<div class="swiper-slide"><img src="/resources/img/common/slide1.png"></div>
		                	<div class="swiper-slide"><img src="/resources/img/common/slide2.png"></div>
		                	<div class="swiper-slide"><img src="/resources/img/common/slide3.png"></div>
		                	<div class="swiper-slide"><img src="/resources/img/common/slide4.png"></div>
		                </div>
		                <div class="swiper-button-next"></div>
      					<div class="swiper-button-prev"></div>
     				 	<div class="swiper-pagination"></div>
		            </div>
       			 </div>

        </div>
        
        
    </div>
        <div class="footer">
	        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>


</body>
</html>