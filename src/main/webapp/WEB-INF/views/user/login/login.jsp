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
	    .contentsright{
			width: 1200px;
			padding: 0;
		}
		
		
		.login_form_all{
			width:500px;
			height:500px;
			margin: 0 auto;
			margin-top: 50px;
			margin-bottom: 50px;
			text-align: center;
		}
		
		.login_form_all h1{
			margin: 20px 0 30px 0;
		}
		
		.login_form{
			border: 1px solid gray;
			border-radius: 5%;
			height: 470px;
		}
		
		.id{
			margin: 20px 0 20px 100px;
			font-size: 20px;
			text-align: left;
		}
		.id input{
			width: 300px;
			height: 50px;
			border-radius: 30px;
			margin-top: 10px;
			padding: 0px 20px;
			border: 1px solid lightgray;
			outline: none;
		}
		
		.pwd{
			margin: 20px 0 20px 100px;
			font-size: 20px;
			text-align: left;
		}
		.pwd input{
			width: 300px;
			height: 50px;
			border-radius: 30px;
			margin-top: 10px;
			padding: 0px 20px;
			border: 1px solid lightgray;
			outline: none;
		}
		
		.find_idpwd a{
			text-decoration: none;
			color: gray;
		}
		
		.submit{
			margin: 0 auto;
	  		width: 80%;
	  		height: 150px;
		}	
		
		.submit .sign_in {
			width: 80%;
			height: 50px;
			border: 0;
			outline: none;
			border-radius: 40px;
			background: linear-gradient(to left, #FFDE30, #ffe76b);
			color: black;
			font-size: 1.2em;
			font-weight: bolder;
			letter-spacing: 2px;
			
			margin: auto;
			
			margin-top: 20px;
			margin-bottom: 10px;
			line-height: 50px;
		}
		
		.submit .sign_in a{
			text-decoration: none;
			color: black;
		}
		
		.submit input {
			width: 80%;
			height: 50px;
			border: 0;
			outline: none;
			border-radius: 40px;
			background: linear-gradient(to left, #FFDE30, #ffe76b);
			color: black;
			font-size: 1.2em;
			font-weight: bolder;
			letter-spacing: 2px;
			
		}
    </style>
    
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
			<div class="contentsright">
				<div class="login_form_all">	
						<h1>로그인</h1>
						<div class="login_form">
						    <form method="post" action="login.do">
						        <div>
						            <div class="id">
						                아이디<br>
						                <input type="text" id = "id" name = "id">
						            </div>
						            <div class="pwd">
						                비밀번호<br>
						                <input type="password" id="password" name ="password">
						            </div>
						            
						            <div class="find_idpwd">
						                <a href="">아이디 찾기</a>	&nbsp&nbsp&nbsp&nbsp/&nbsp&nbsp&nbsp&nbsp <a href="">비밀번호 찾기</a>
									</div>
						            <div class="submit">
							            <div class="sign_in">
						         	       <a href="/user/join.do">회원 가입</a>
						            	</div>
						                <input type="submit" value="로그인">
						            </div>
						        </div>
						        <a href="/seller/login.do">판매자로 로그인하기</a>
						    </form>
						    
						    </div>
				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>