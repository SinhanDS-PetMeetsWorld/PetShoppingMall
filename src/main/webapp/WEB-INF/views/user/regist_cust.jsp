<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <title>회원가입</title>
    <script>
    var dupCheck = false;
    	function goSave() {
    		if ($("#email").val() == '') {
    			alert('이메일을 입력하세요');
    			$("#email").focus();
    			return;
    		}
    		/* if (!dupCheck) {
    			alert('ID 중복여부를 체크해주세요');
    			return;
    		} */

    		var isCon = true;
    		$.ajax({
				url:'idCheck.do',
				data:{email:$('#id').val()},
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
    		if ($("#pw").val() == '') {
    			alert('비밀번호를 입력하세요');
    			$("#pw").focus();
    			return;
    		}
    		/* if ($("#pw").val() != $("#pw_check").val()) {
    			alert('비밀번호를 확인하세요');
    			return;
    		}
    		var reg = /^[A-Za-z0-9]{8,}$/;
    		var txt = $("#pw").val();
    		if( txt.match(reg) == null ) {
    		    alert("비밀번호는 영문+숫자 조합해서 8자이상 입력하세요");
    		    return false;
    		} */
    		if ($("#name").val() == '') {
    			alert('이름을 입력하세요');
    			$("#name").focus();
    			return;
    		}
    		// 전송
    		$("#frm").submit();
    	}
    	$(function() {
    		$("#idCheck").click(function() {
    			$.ajax({
    				url:'idCheck.do',
    				data:{email:$('#id').val()},
    				success:function(res) {
    					console.log(res);
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
    	}) -->
    	$('#emailcheck_btn').click(function() {
    		const email = $('#email').val();
    		const checkInput = $('#emailcheck_num');
    		
    		$.ajax({
    			type : 'get',
    			url : '<c:url value ="/user/mailCheck?email="/>'+email,
    			success : function (data) {
    				console.log("data : " +  data);
    				checkInput.attr('disabled',false);
    				var code = data;
    				alert('인증번호가 전송되었습니다.')
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
    <hr>
    <h2>회원 가입</h2>
    <hr>
    <div>
        <a href="">판매자로 가입하기</a>
    </div>
    <hr>
    <form name="regist_form" id="frm" action="regist.do" method="post">
        <div>
            아이디*<br>
            <input type="text" name="id">
            <button id="idCheck">아이디 중복 확인</button>
        </div>
        <hr>
        <div>
            성명*<br>
            <input type="text" name="name">
        </div>
        <hr>
        <div>
            이메일*<br>
            <input type="text" name="email" id="email">
            <button>이메일 인증 번호 발송</button><br>
            <input type="text" name="emailcheck_num" id="emailcheck_num" readonly>
            <button id="emailcheck_btn">이메일 인증하기</button>
        </div>
        <hr>
        
        <div>
            주소
            <div>
            	<input type="text" name="zipcode" id="zipcode" readonly placeholder="우편번호">
            	<button type="button" class="btn" onclick="zipcode_search();">우편번호 검색</button>
            </div>
            <div><input type="text" name="addr1" id="addr1" readonly placeholder="기본주소"></div>
            <div><input type="text" name="addr2" placeholder="상세주소"></div>
        </div>
        <hr>
        
        <div>
            비밀번호*<br>
            <input type="password" name="password">
        </div>
        <div>
            비밀번호 확인*<br>
            <input type="password">
        </div>
        <hr>
        <div>
            연락처*<br>
            <input type="text" maxlength="3" value="010" name="phone0"> - <input type="text" maxlength="4" placeholder="XXXX" name="phone1"> - <input type="text" maxlength="4" placeholder="XXXX" name="phone2">
        </div>
        <hr>
        <div>
            생년월일*<br>
            <input type="text" maxlength="4" placeholder="YYYY" name="birth0"> <input type="text" maxlength="2" placeholder="MM" name="birth1"> <input type="text" maxlength="2" placeholder="DD" name="birth2">
        </div>
        <hr>
        <div>
            성별 * 
            <input type="radio" name="gender" value="0">남자
            <input type="radio" name="gender" value="1">여자
        </div>
        <hr>
        <div>
            <input type="checkbox" name="advertisement"> 광고성 마케팅 수신 동의(선택사항)
        </div>
        <hr>
        <div>
            <input type="submit" value="가입하기" onclick="goSave();">
        </div>
    </form>
</body>
</html>