<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.String.*" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>판매자:: 회원 정보</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
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
    
    <script>
    window.onload = function(){
		var phone = document.getElementById("phone").value;
		var phone_arr = phone.split('-');
		
		for(var i=0; i<phone_arr.length; i++){
			document.getElementById("phone" + i).setAttribute('value', phone_arr[i]);
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
		$("#seller_info_modify").submit();
		
		
	}
	
	
	
    </script>
<style>
 .menu_name {
margin-bottom: 10px;	
}

.start_line {
        border: 1px solid #FFDE30;
        margin-bottom : 10px;
        width : 800px;
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
 margin-top : 3px;
}

.info_space {
 height : 30px;
 width : 70px;
}

.insert_tag{
 height : 30px;
 width :  870px;
 float : left;
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
 
 .line {
 		margin-top : 10px;
 		margin-bottom : 10px;
 		width : 800px;
        border: 1px solid #ccc;
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
 
 .final_line {
 		margin-top : 10px;
 		width : 800px;
        border: 1px solid #FFDE30;
} 
 
.info_tag_container_final {
 	height : 60px;
 	width : 1000px;
 	margin-top : 10px;
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
 
.recreate  {
	width: 400px;
	float: left;
} 

.withdrawal {
	width : 400px;
	float: right;
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
					<h1 class ="menu_name">회원정보</h1>
					
						<hr class = "start_line">
					    <form id="seller_info_modify" name="seller_info_modify" action="update.do" method="POST">
						    	<div class="hidden" style="display:none">
							        <input type="hidden" name="temp" id="phone" value="${vo.phone }">
							        <input type="hidden" name="no" id="no" value="${vo.no }">
						        </div>
					        
					        
					        
					<div class ="info_tag_container">
					       <div class = "info_tag"><span>이름</span></div>
						       
						    <div class ="insert_tag">    
					        	<input class ="aaa" type="text" name="name" placeholder="홍길동" value="${vo.name }" readonly>
					        	<span>아이디</span> ${vo.id }
					        </div>
					</div>	        
					        
					 <hr class ="line"> 
					       
					<div class ="info_tag_container">
						<div class ="info_tag"><span>기존 비밀번호</span></div>
					
						<div class = "insert_tag">
						<input class ="aaa" type="password" id="password" name="password" placeholder="비밀번호 변경 시에만 입력">
						</div>        
					</div>
					        
					<hr class = "line">
					
					<div class ="info_tag_container">
							<div class ="info_tag"><span>새 비밀번호</span></div>
							
							<div class = "insert_tag">
							<input class ="aaa" type="password" id="new_password" name="new_password">
					        <span>새 비밀번호 확인</span>
					        <input class ="aaa" type="password" id="check_password" name="check_password">
							</div>
					</div>				    
					        
					<hr class ="line">
					
					
					<div class = "info_tag_container">
							<div class ="info_tag"><span>이메일</span></div>
						
							<div class = "insert_tag">
							<input class = "aaa" type="email" name="email" placeholder="hong@email.com" value="${vo.email }" readonly>
							</div>
					</div>			
							      
					<hr class = "line">      
					        
					<div class = 'info_tag_container'>
							<div class ="info_tag"><span>연락처</span></div>
					
							<div class = "insert_tag">
						            <input class = "aaa" type="tel" id="phone0" name="phone0" maxlength="3"/> -
						            <input class = "aaa" type="tel" id="phone1" name="phone1" maxlength="4"/> -
						            <input class = "aaa" type="tel" id="phone2" name="phone2" maxlength="4"/>
							</div>
					</div>      
					
					<hr class = "line">
					
					<div class = "info_tag_container">
							<div class ="info_tag"><span>사업자 등록번호</span></div>
					
							<div class = "insert_tag">
								<span>
						       		<input class = "aaa" type="text" name="business_number" id="business_number" value="${vo.business_number }" readonly>
						       	</span>
							</div>
					</div>        
					       	
					<hr class ="line">       	
					       	
					<div class = "info_tag_container">
						
						<div class ="info_tag"><span>주소</span></div>
						
						<div class = "insert_tag">
								<input class = "aaa" type="text" readonly placeholder="우편번호" name="zipcode" id="zipcode"  value="${vo.zipcode }" readonly> 
								<button class ="check" type="button" class="btn" onclick="zipcode_search();">우편번호 검색</button>
					       		<input class ="aaa" type="text" readonly placeholder="기본주소" name="addr1" id="addr1" value="${vo.addr1 }" readonly>
                				<input class ="aaa" type="text" placeholder="상세주소" name="addr2" id="addr2" value="${vo.addr2 }">
						</div>
					       		
					</div>
					 
					<hr class ="line">
					        
					<div class = "info_tag_container">
					
							<div class = "info_tag"><span>정산 계좌*</span></div>
							
							<div class ="insert_tag">
						        	<select class ="aaa" name="bank" id="bank">
										<c:forEach var="company" items="${vo.company_list[0]}" varStatus="status">
											<option value="${status.index}" <c:if test="${status.index eq vo.bank}">selected="selected"</c:if>>${company}</option>
										</c:forEach>
					            	</select>
					            	<input class ="aaa" type="text" placeholder="- 를 제외하고 입력하세요" name="account" id="account" value="${vo.account}" >
					        </div>
					  </div> 	
					  
					  <hr class ="final_line">
					  
					  <div class ="info_tag_container_final">
						  	  <div class = "recreate">
							 		 <input class ="recreateConfirm" type="button" onclick="doEdit();" value="수정">
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
</body>
<script>
	$('.confirm_withdrawal').on('click', function(){
		confirm("회원 탈퇴 시 1년 동안 회원 탈퇴를 철회 할 수 있습니다.\n 해당 기간동안은 이 계정에서 올린 상품들은 검색되지 않습니다.\n 1년이 지나면 계정을 복구할 수 없습니다. 정말 삭제하시겠습니까??");
		location.href="/seller/withdrawal.do";
	})
</script>
</html>