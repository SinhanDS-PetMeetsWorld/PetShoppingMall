<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.String.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>구매자 :: 회원 정보</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
    
 <style>
 
 .menu_name {
margin-bottom: 10px;	
}
 
.text {
margin-bottom: 30px;
}
 
 .selected_tab_button {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 7px;
 background: #FFDE30;
 border:2px solid #FFDE30;
 font-size: 18px;
 height: 40px;
 padding: 0 11px;
 text-align: center;
 width: 20%;
 min-width: 200px;
 font-weight: 500;
 color: #0F1111;
 margin-right: -4px;
 border-bottom-left-radius: 0%;
 border-bottom-right-radius: 0%;
 :hover{
     background: #F7CA00;
     border-color: #F2C200;
     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
 	}
 }

 .tab_button {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 7px;
 background: #F9FAFB;
 border:1px solid #FFDE30;
 font-size: 18px;
 height: 40px;
 padding: 0 11px;
 text-align: center;
 width: 20%;
 min-width: 200px;
 font-weight: 500;
 color: #0F1111;
 margin-right: -4px;
 margin-top: -1px;
 border-bottom-left-radius: 0%;
 border-bottom-right-radius: 0%;
 border-bottom : none;
 :hover{
     background: #F7CA00;
     border-color: #F2C200;
     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
 	}
 }
 
 .recreateConfirm {
  display: inline-block;
  outline: 0;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  border: none;
  width: 150px;
  height: 40px;
  font-size: 16px;
  background-color: #fd0;
  font-weight: 800;
  color: #222;
  margin-top:5px;
  margin-left: 300px;
 }
 
 .confirm_withdrawal {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 6px;
 border: 2px solid #ff4742;
 color: #fff;
 background-color: #ff4742;
 padding: 8px;
 box-shadow: rgba(0, 0, 0, 0.07) 0px 2px 4px 0px, rgba(0, 0, 0, 0.05) 0px 1px 1.5px 0px;
 font-weight: 800;
 font-size: 16px;
 height: 40px;
 margin-top:5px;
 margin-left: 100px;
 
 :hover{
     background: 0 0;
     color: #ff4742;
 	}
 
 }
  
.aaa{
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

 .info_tag_container {
 	height : 30px;
 	width : 800px;
 	display: flex;
}

.info_tag{
 height : 30px;
 width : 130px;
 float : left;
 text-align : left;
 margin-top : 3px;
}

.info_space {
 height : 30px;
 width : 70px;
}

.insert_tag{
 height : 30px;
 width : 190px;
 float : left;
}

.info_new_password_tag {
 height : 30px;
 width : 132px;
 float : left;
 text-align : left;
 margin-top : 3px;
 margin-left : 15px;
}

.info_tag_sex{
 height : 30px;
 width : 130px;
 float:left;
 text-align:center;
}

.info_tag_birth{
 height : 30px;
 width : 600px;
 float:left;
}

.info_tag_phone{
 height : 30px;
 width : 870px;
 float:left;
 
}

.check_ad{
height:20px;
width:1000px;
text-align:left;

}

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 800px;
     }
 

 .line {
 		margin-top : 10px;
 		margin-bottom : 10px;
 		width : 800px;
        border: 1px solid #ccc;
     }
 
 .final_line {
 		margin-bottom : 10px;
 		width : 800px;
        border: 1px solid #FFDE30;
     }
 
.info_tag_container_final {
 	height : 60px;
 	width : 1000px;
}
 
.recreate  {
	width: 400px;
	float: left;
} 

.withdrawal {
	width : 400px;
	float: right;
}

</style>
    
    <script>
    window.onload = function(){
		var phone = document.getElementById("phone").value;
		var phone_arr = phone.split('-');
		
		for(var i=0; i<phone_arr.length; i++){
			document.getElementById("phone" + i).setAttribute('value', phone_arr[i]);
		}
		
		var birth = document.getElementById("birth").value;
		var birth_arr = birth.split('-');
		
		for(var i=0; i<birth_arr.length; i++){
			document.getElementById("birth" + i).setAttribute('value', birth_arr[i]);
		}
		
	};
	
	function doEdit(){
		if($("#password").val() != ''){
			/*if($("#vo_password").val() != $("#password").val()){
				alert('현재 비밀번호가 일치하지 않습니다.')
				return false;
			}*/
			if($("#new_password").val() != $("#check_password").val()){
				alert('비밀번호 확인이 일치하지 않습니다.');
				return;
			}
			if($("#new_password").val() == ''){
				alert('변경할 비밀번호를 입력하세요.');
				return;
			}
			
		}
		if($("#new_password").val() != ''){
			if($("#password").val() == ''){
				alert('현재 비밀번호를 입력하세요.');
				return;
			}
			
		}
		$("#user_info_modify").submit();
		
		
	}
	
    </script>

</head>
<body>
	<div class="wrap">
        <div class="header">
        	<c:if test="${empty adminLoginInfo}">
	            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        	</c:if>
        	<c:if test="${!empty adminLoginInfo}">
	            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        	</c:if>
        </div>

        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<h1 class = "menu_name">회원정보</h1>
					    <button class = "selected_tab_button" type="button" onclick="location.href='/user/edit.do'">기본정보 변경</button>
					    <button class = "tab_button" type="button" onclick="location.href='/user/edit_addr.do'">주소 변경</button>
					    <button class = "tab_button" type="button" onclick="location.href='/user/edit_payment.do'">결제 수단</button>
					
						<hr class = "start_line">
					    <form id="user_info_modify" name="user_info_modify" action="update.do" method="POST">
					    	<div class="hidden" style="display:none">
						        <input type="hidden" name="temp" id="phone" value="${vo.phone }">
						        <input type="hidden" name="birth" id="birth" value="${vo.birth_date }">
						        <input type="hidden" name="no" id="no" value="${vo.no }">
					        </div>
					        
					        <div class = "info_tag_container">
					        	<div class = "info_tag">
						        <span>이름</span>
						        </div>
						        
						       	<div class = "insert_tag">
						       		<input class ="aaa" type="text" name="name" placeholder="홍길동" value="${vo.name }">
						       	</div>
						     
					        </div> 
					        
					        <hr class = "line">
					        
					        <div class = "info_tag_container">
					        	<div class = "info_tag">
					        	<span class = "text">아이디</span>
					        	</div>
								<div class = "info_tag">
									${vo.id }
								</div>					        	
					        </div>
					        
					        <hr class = "line">
					        
					    	<div class = "info_tag_container">
					    	
					    		<div class = "info_tag">
					    			<span>기존 비밀번호</span>
					    		</div>	
						        <input class ="aaa" type="password" id="password" name="password" placeholder="비밀번호 변경 시에만 입력">
					    	</div>
						    
						    <hr class = "line">
						         
						    <div class="info_tag_container">
						    	<div class= "info_tag">
								    <span>성별</span>
							   </div>
								   	<span>
								   		<input type="radio" name="gender" value="0" <c:if test="${vo.gender == 0}">checked</c:if>> 남성
								       	<input type="radio" name="gender" value="1" <c:if test="${vo.gender == 1}">checked</c:if>> 여성
								   	</span>  
						    </div>     
					       
					        <hr class = "line">
					       
					        <div class = "info_tag_container">
					        	
					        	<div class = "info_tag">
					        	<span>새 비밀번호</span>
					        	</div>
					        	
					        	<div class = "insert_tag">
						        	<input class ="aaa" type="password" id="new_password" name="new_password">
						        </div>
					        	
					        	
					        	
					        	<div class = "info_new_password_tag">
					        	<span>새 비밀번호 확인</span>
					        	</div>
					        	<div class = "info_space"></div>
					        	
					        	<div class = "insert_tag">
					        		<input class ="aaa" type="password" id="check_password" name="check_password">
					        	</div>
					        	
					        </div>
					        
					        <hr class = "line">
					        
					       <div class = "info_tag_container">
					        	<div class = "info_tag">
						        	<span>이메일</span>
					        	</div>
					        	<input class ="aaa" type="email" name="email" placeholder="hong@email.com" value="${vo.email }">
					       </div>
					        
					        <hr class = "line">
					        
					        
					        <div class = "info_tag_container">
				
								   <div class="info_tag">
					        		<span>생년월일</span>
					        		</div>
					        		
					        		   <div class = "info_tag_birth">
						        			<span>
										        <input class ="aaa" type="text" id="birth0" name="birth0" placeholder="YYYY" maxlength="4"/> -
										        <input class ="aaa" type="text" id="birth1" name="birth1" placeholder="MM" maxlength="2"/> -
										        <input class ="aaa" type="text" id="birth2" name="birth2" placeholder="DD" maxlength="2"/>
						        			</span>
						        			<br>
						        		</div>
						    </div> 

							<hr class = "line">       
					        
					        <div class = "info_tag_container_final">
					        	    <div class = "info_tag">
						            <span>연락처</span>
						        	</div>
						        	
						        	<div class = "info_tag_phone">
								        <span>
								            <input class ="aaa" type="tel" id="phone0" name="phone0" maxlength="3"/> -
								            <input class ="aaa" type="tel" id="phone1" name="phone1" maxlength="4"/> -
								            <input class ="aaa" type="tel" id="phone2" name="phone2" maxlength="4"/>
								        </span>
								   </div>
								   
								   <div class ="check_ad">
					        			<input type="radio" name="agreement" value="agreement" <c:if test="${vo.advertisement == true}">checked</c:if>> 광고성 마케팅 수신에 동의(선택사항)
								        <span>동의 시 이메일로 할인 정보를 전달해 드립니다.</span>
					        	   
					        	   </div>
					        	   	
					       	 </div>
					         <hr class = "final_line">
					         
					         <div class = "info_tag_container_final">
					         
					         	<div class = "recreate">
					         		<input class = "recreateConfirm" type="button" onclick="doEdit();" value="수정">
					         	</div> 
					        	 
					        	<div class = "withdrawal">
					        		<button class ="confirm_withdrawal" type="button">회원 탈퇴</button>
					        	</div> 
					         	 
					         </div> 
							
					    </form>
		
				</div>
			</div>

        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
<script>
	$('.confirm_withdrawal').on('click', function(){
		confirm("회원 탈퇴 후에는 복구가 불가능합니다. \n정말 삭제하겠습니까?");
		location.href="/user/withdrawal.do";
	})
</script>
</body>
</html>