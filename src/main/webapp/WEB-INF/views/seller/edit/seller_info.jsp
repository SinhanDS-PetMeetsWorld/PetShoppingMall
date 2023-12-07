<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.String.*" %>
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
					<h1>회원정보</h1>
					    <form id="seller_info_modify" name="seller_info_modify" action="update.do" method="POST">
					    	<div class="hidden" style="display:none">
						        <input type="hidden" name="temp" id="phone" value="${vo.phone }">
						        <input type="hidden" name="no" id="no" value="${vo.no }">
<!-- 						        <input type="hidden" name="vo_password" id="vo_password" value="${vo.password }">   -->
					        </div>
					        <span>이름</span>
					        <input type="text" name="name" placeholder="홍길동" value="${vo.name }">
					        <span>아이디</span>
					        <!-- <input type="text" name="id" placeholder="hong" disabled>  -->
					        ${vo.id }
					        <br>
					        <span>기존 비밀번호</span>
					        <input type="password" id="password" name="password" placeholder="비밀번호 변경 시에만 입력하시면 됩니다">
					        <br>
					        <span>새 비밀번호</span>
					        <input type="password" id="new_password" name="new_password">
					        <span>새 비밀번호 확인</span>
					        <input type="password" id="check_password" name="check_password">
					        <br>
					        <span>이메일</span>
					        <input type="email" name="email" placeholder="hong@email.com" value="${vo.email }">
					        <br>
					        <span>연락처</span>
					        <span>
					            <input type="tel" id="phone0" name="phone0" maxlength="3"/> -
					            <input type="tel" id="phone1" name="phone1" maxlength="4"/> -
					            <input type="tel" id="phone2" name="phone2" maxlength="4"/>
					        </span>
					       	<br>
					       	<span>사업자 등록번호</span>
					       	<span>
					       		<input type="text" name="business_number" id="business_number" value="${vo.business_number }">
					       	</span>
					       	<br>
					       	<div>주소
					       		<div><input type="text" readonly placeholder="우편번호" name="zipcode" id="zipcode"  value="${vo.zipcode }"> <button type="button" class="btn" onclick="zipcode_search();">우편번호 검색</button></div>
					       		<div><input type="text" readonly placeholder="기본주소" name="addr1" id="addr1" value="${vo.addr1 }"></div>
                				<div><input type="text" placeholder="상세주소" name="addr2" id="addr2" value="${vo.addr2 }"></div>
					        </div>
					        <div>
					        	<select name="bank" id="bank">
									<c:forEach var="company" items="${vo.company_list[0]}" varStatus="status">
										<option value="${status.index}" <c:if test="${status.index eq vo.bank}">selected="selected"</c:if>>${company}</option>
									</c:forEach>
				            	</select>
				            	<input type="text" placeholder="- 를 제외하고 입력하세요" name="account" id="account" value="${vo.account}" >
					        </div>
					      	
					        <button type="button">회원 탈퇴</button>
					        <br>
					        <input type="button" onclick="doEdit();" value="수정">
					        
					        
					    </form> 
				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>