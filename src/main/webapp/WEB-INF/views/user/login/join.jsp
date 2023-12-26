<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
    <title>구매자:: 회원가입</title>
    <script>
    var dupCheck = false;
    	function goSave() {
    		if ($("#id").val() == '') {
    			alert('ID는 필수 입력사항입니다.');
    			$("#id").focus();
    			return;
    		}
    		
    		if (!dupCheck) {
    			alert('ID 중복여부를 체크해주세요');
    			return;
    		}

    		var isCon = true;
    		$.ajax({
				url:'idCheck.do',
				data:{id:$('#id').val()},
				async:false,
				success:function(res) {
					console.log(res);
					if (res == 'true') {
						alert('사용중인 ID입니다.');
						$("#id").val('');
						$("#id").focus();
						isCon = false;
						return;
					}
				}
			})
			if (!isCon) return;
    		
    		if ($("#name").val() == '') {
    			alert('이름은 필수 입력사항입니다.');
    			$("#name").focus();
    			return;
    		}
    		
    		if ($("#email").val() == '') {
    			alert('이메일은 필수 입력사항입니다.');
    			$("#email").focus();
    			return;
    		}
    		
    		if ($("#zipcode").val() == '') {
    			alert('우편번호는 필수 입력사항입니다.');
    			return;
    		}
    		
    		if ($("#addr1").val() == '') {
    			alert('주소는 필수 입력사항입니다.');
    			return;
    		}
    		
    		if ($("#addr2").val() == '') {
    			alert("상세주소는 필수 입력사항입니다.(없으면 '없음'이라고 입력해주세요)");
    			$("#addr2").focus();
    			return;
    		}
    		
    		if ($("#password").val() == '') {
    			alert('비밀번호는 필수 입력사항입니다.');
    			$("#password").focus();
    			return;
    		}
    		
    		if ($("#password").val() != $("#password_check").val()) {
    			alert('비밀번호를 다시 확인하세요(비밀번호 확인란의 내용과 불일치)');
    			$("#password").focus();
    			return;
    		}
    		
    		if ($("#phone0").val() == '' || $("#phone1").val() == '' || $("#phone2").val() == '') {
    			alert("연락처는 필수 입력사항입니다.");
    			return;
    		}
    		
    		if ($("#birth0").val() == '' || $("#birth1").val() == '' || $("#birth2").val() == '') {
    			alert("생년월일은 필수 입력사항입니다.");
    			return;
    		}
    		
    		/*var reg = /^[A-Za-z0-9]{8,}$/;
    		var txt = $("#pw").val();
    		if( txt.match(reg) == null ) {
    		    alert("비밀번호는 영문+숫자 조합해서 8자이상 입력하세요");
    		    return false;
    		} */
    		
    		if(email_auth == false) {
    			alert("이메일 인증이 완료되지 않았습니다.");
    			return;
    		}
    		
    		// 전송
    		$("#frm").submit();
    	}
    	$(function() {
    		$("#idCheck").click(function() {
    			var id = $('#id').val(); // 입력값 변수화; 
    			
    			$.ajax({
    				url:'idCheck.do',
    				data:{id:id},
    				success:function(res) {
    					if (res == 'true') {  
    						alert('사용중인 ID입니다.');
    						$("#id").val('');
    						$("#id").focus();
    					}else if (id === ''){
							alert('ID를 입력해주세요.');  // 빈값 입력 처리 추가
							$("#id").val('');
    						$("#id").focus();
    					}else {
    						dupCheck = true;
    						alert('사용가능한 ID입니다.');
    						$("#id").attr('readonly','readonly');
    					}
    				}
    			})
    		})
    	})
    	var email_auth_num = '';
    	$(function() {
    		$('#emailchecknum_btn').click(function() {    	
    		   var email = $('#email').val(); // 입력값 변수화
    			
   			   if (email === '') {
   		            alert('이메일을 입력해주세요.'); // 이메일 빈값 처리 추가
   		            return;
   		      		 }
        		$.ajax({
        			type : 'post',
        			url : 'emailCheck.do',
        			data : {email:email},
        			success : function(res) {
        				
   						$('#emailcheck_btn').attr('disabled', false);
        				alert('인증번호가 전송되었습니다.');
        				email_auth_num = res;
        				console.log(email_auth_num);
    					}
        		});
        	});
    	})
    	
    	var email_auth = false;
    	$(function(){
    		$('#emailcheck_btn').click(function(){
    			if($('#emailcheck_num').val() == email_auth_num){
    				alert("인증되었습니다.");
    				email_auth = true;
    				return;
    			} else {
    				alert("이메일 인증 실패");
    				return;
    			}
    		});
    	});
  
   	</script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function zipcode_search() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById('zipcode').value = data.zonecode;
	                //document.getElementById("addr1").value = roadAddr;
	                
	                $('#zipcode').val(data.zonecode);
	                $('#addr1').val(roadAddr);
	            }
	        }).open();
	    }
	</script>

<style>
 .menu_name {
margin-bottom: 10px;	
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

.createConfirm {
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
  margin-top:5px;
  margin-left: 350px;
 }

.check {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 6px;
 border: 2px solid #FFDE30;
 color: #0F1111;
 background-color: white;
 padding-left : 10px;
 padding-right : 10px;
 box-shadow: rgba(0, 0, 0, 0.07) 0px 2px 4px 0px, rgba(0, 0, 0, 0.05) 0px 1px 1.5px 0px;
 font-weight: 800;
 font-size: 11px;
 height: 30px;
}

.info_tag_container {
 	height : 30px;
 	width : 1000px;
 	display: flex;
}

.info_tag{
 height : 30px;
 width : 130px;
 float : left;
 text-align : left;
 margin-top : 5px;
}

.info_space {
 height : 30px;
 width : 70px;
}

.insert_tag{
 height : 30px;
 width : 870px;
 float : left;

}

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 900px;
   }


 .line {
 		margin-top : 10px;
 		margin-bottom : 10px;
 		width : 900px;
        border: 1px solid #ccc;
}

 .final_line {
 		margin-bottom : 10px;
 		width : 900px;
        border: 1px solid #FFDE30;
   }
   
.signin_seller {
width : 900px;
text-align : right;

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
				<div class="login_all">
				
				    <h1 id = "menu_name">회원 가입</h1>
				    
				    <div class="signin_seller"> 
				        <a href="/seller/join.do">판매자로 가입하기</a>
				        <hr class = "start_line">
				    </div>
			
				    <form name="regist_form" id="frm" action="regist.do" method="post">
				        
				       <div class ="info_tag_container">
				       		<div class = "info_tag"><span>아이디* </span></div>
				       		
				       		<div class= "insert_tag">
				       				<input class ="aaa" type="text" name="id" id="id">
				            		<button class = "check" type="button" id="idCheck">아이디 중복 확인</button>
				       		</div>
				        </div>
				        
				        <hr class ="line">

				        <div class = "info_tag_container">
				            
				            <div class ="info_tag"><span>성명*</span></div>
				            
				            <div class = "insert_tag">
				              <input class ="aaa" type="text" name="name" id="name">
				            
				           		<span>성별*</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				           		
					            <input type="radio" name="gender" value="0" checked>남자
					            <input type="radio" name="gender" value="1">여자
				        	</div>
				            
				        </div> 
				        
				        <hr class ="line">
				           
				        <div class = "info_tag_container">
				            
				            <div class = "info_tag"><span>이메일*</span></div>
				            
				            <div class = "insert_tag">
				            	<input class = "aaa" type="text" name="email" id="email">
				          	    <button class = "check" type="button" id="emailchecknum_btn">인증 번호 발송</button>
				          	    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				          	 	<input class = "aaa" type="text" name="emailcheck_num" id="emailcheck_num">
				         	    <button class = "check" type="button" id="emailcheck_btn" disabled="disabled">이메일 인증</button>
				          	</div>
				        </div>

				        <hr class = "line">

				        <div class = "info_tag_container">
				           
					           <div class = "info_tag"><span>주소</span></div>
					           
					           <div class = "insert_tag">
					            	<input class ="aaa" type="text" name="zipcode" id="zipcode" readonly placeholder="우편번호">
					            	<button class ="check" type="button" class="btn" onclick="zipcode_search();">우편번호 검색</button>
					            	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					            	<input class = "aaa" type="text" name="addr1" id="addr1" readonly placeholder="기본주소">
					            <input class = "aaa" type="text" name="addr2" id="addr2" placeholder="상세주소">
					            </div>
				            
				        </div>
				       
				        <hr class ="line">
				        
				        <div class = "info_tag_container">
				            
				            <div class = "info_tag"><span>비밀번호*</span></div>
				            
				            <div class = "insert_tag">
				            	<input class="aaa" type="password" name="password" id="password">
				        		<span>비밀번호 확인*</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				            	<input class="aaa" type="password" id="password_check">
				            </div>
				            
				        </div>
				        
				        <hr class = "line">
				      
				        <div class = "info_tag_container">
				            
					            <div class ="info_tag"><span>연락처*</span></div>
					            
					            <div class = "insert_tag">
					            	<input class = "aaa" type="text" maxlength="3" value="010" name="phone0" id="phone0"> 
					            - <input class = "aaa" type="text" maxlength="4" placeholder="XXXX" name="phone1" id="phone1"> 
					            - <input class = "aaa" type="text" maxlength="4" placeholder="XXXX" name="phone2" id="phone2">
					            </div>
				        </div>
				        
				        <hr class = "line">
				        
				        <div class = "info_tag_container">
				            <div class ="info_tag"><span>생년월일*</span></div>
				            
				            <div class = "insert_tag">
				             <input class = "aaa" type="text" maxlength="4" placeholder="YYYY" name="birth0" id="birth0">
				             <input class = "aaa" type="text" maxlength="2" placeholder="MM" name="birth1" id="birth1"> 
				             <input class = "aaa" type="text" maxlength="2" placeholder="DD" name="birth2" id="birth2">
				        	</div>
				        </div>
				        <hr class = "line">
				        
				        <div class= "info_tag_container">
				            <input type="checkbox" name="advertisement" checked> 광고성 마케팅 수신 동의(선택사항)
				        </div>
				        
				        <hr class = "final_line">
					    
					    <div class="sign_in_btn">
					            <input class = "createConfirm" type="button" value="가입하기" onclick="goSave();">
					    </div>
				    </form>
				
				</div>
			</div>
        </div>
    </div>
</body>
</html>