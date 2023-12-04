<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <title>판매자 회원가입</title>
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
						alert('ID가 중복되었습니다.');
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
    		
    		if ($("#business_number").val() == '') {
    			alert("사업자 등록번호는 필수 입력사항입니다.");
    			return;
    		}
    		
    		/*if ($("#").val() == '' || $("").val() == '') {
    			alert("정산 계좌는 필수 입력사항입니다.");
    			return;
    		}*/
    		
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
    			$.ajax({
    				url:'idCheck.do',
    				data:{id:$('#id').val()},
    				success:function(res) {
    					if (res == 'true') {
    						alert('ID가 중복되었습니다.');
    						$("#id").val('');
    						$("#id").focus();
    					} else {
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
        		$.ajax({
        			type : 'post',
        			url : 'emailCheck.do',
        			data : {email:$('#email').val()},
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
    				alert("이메일 인증 성공");
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
</head>
<body>
    <h2>판매자 회원 가입</h2>
    <form name="regist_form" id="frm" action="" method="post">
        <div>
            아이디*<br>
            <input type="text" name="id" id="id">
            <button type="button" id="idCheck">아이디 중복 확인</button>
        </div>
        <hr>
        
        <div>
            성명*<br>
            <input type="text" name="name" id="name">
        </div>
        <div>
            이메일*<br>
            <input type="text" name="email" id="email">
            <button type="button" id="emailchecknum_btn">이메일 인증 번호 발송</button><br>
            <input type="text" name="emailcheck_num" id="emailcheck_num">
            <button type="button" id="emailcheck_btn" disabled="disabled">이메일 인증하기</button>
        </div>
        <hr>

        <div>
            주소
            <div><input type="text" name="zipcode" id="zipcode" readonly placeholder="우편번호">
            <button type="button" class="btn" onclick="zipcode_search();">우편번호 검색</button></div>
            <div><input type="text" name="addr1" id="addr1" readonly placeholder="기본주소"></div>
            <div><input type="text" name="addr2" id="addr2" placeholder="상세주소"></div>
        </div>
        <hr>

        <div>
            비밀번호*<br>
            <input type="password" name="password" id="password">
        </div>
        <div>
            비밀번호 확인*<br>
            <input type="password" id="password_check">
        </div>
        <hr>
        
        <div>
            연락처*<br>
            <input type="text" maxlength="3" value="010" name="phone0" id="phone0"> 
            - <input type="text" maxlength="4" placeholder="XXXX" name="phone1" id="phone1"> 
            - <input type="text" maxlength="4" placeholder="XXXX" name="phone2" id="phone2">
        </div>
        <hr>
        
        <div>
            사업자 등록번호*<br>
            <input type="text" id="business_number" name="business_number" placeholder="10자리, '-'없이 숫자만 입력하세요">
        </div>
        <hr>
        
        <div>
            정산 계좌*<br>
            <select name="" id="">
                <option value="0">신한은행</option>
                <option value="1">국민은행</option>
                <option value="2">KEB하나은행</option>
                <option value="3">SC제일은행</option>
                <option value="4">우리은행</option>
                <option value="5">외환은행</option>
                <option value="6">한국시티은행</option>
                <option value="7">경남은행</option>
                <option value="8">광주은행</option>
                <option value="9">대구은행</option>
                <option value="10">부산은행</option>
                <option value="11">전북은행</option>
                <option value="12">제주은행</option>
                <option value="13">기업은행</option>
                <option value="14">농협은행</option>
                <option value="15">수협은행</option>
                <option value="16">한국산업은행</option>
                <option value="17">한국수출입은행</option>
                <option value="18">우체국예금보험</option>
            </select>
            <input type="text" name="" id="" placeholder="'-'없이 숫자만 입력하세요">
        </div>
        <hr>
        
        <div>
            <input type="button" value="가입하기" onclick="goSave();">
        </div>
    </form>
</body>
</html>