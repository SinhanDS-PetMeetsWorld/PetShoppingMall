<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
	
	function doCheck(){
		if($("#name").val() == ''){
			alert('받는이를 입력해주세요!')
			return;	
		}
		if($("#phone").val() == ''){
			alert('전화번호를 입력해주세요!')
			return;
		}
		if($("#zipcode").val() == ''){
			alert('주소를 정확히 입력해주세요!')
			return;
		}
		if($("#addr2").val() == ''){
			alert('상세주소를 정확히 입력해주세요!')
			return;
		}
		
		$("#modify_addr").submit();
		
	}
	
	
	
    </script>
</head>
<body>
    <div>
        배송지 추가
        <form action="modify_addr.do" id="modify_addr" method="POST">
            <div>
                <input type="text" placeholder="받는이 성명" name="name" id="name" value="${vo.name }">
            </div>
            <div>
                <input type="text" placeholder="전화번호" name="phone" id="phone" value="${vo.phone }">
            </div>
            <div>
                주소
                <div><input type="text" readonly placeholder="우편번호" name="zipcode" id="zipcode" value="${vo.zipcode }"> <button type="button" class="btn" onclick="zipcode_search();">우편번호 검색</button></div>
                <div><input type="text" readonly placeholder="기본주소" name="addr1" id="addr1" value="${vo.addr1 }"></div>
                <div><input type="text" placeholder="상세주소" name="addr2" id="addr2" value="${vo.addr2 }"></div>
                <input type="hidden" name="no" value="${vo.no }">
            </div>
            <div>
                <input type="text" placeholder="별칭(ex:집)" name="comment" id="comment" value="${vo.comment }">
            </div>
            <div>
                 <input type="button" onclick="doCheck();" value="수정">
            </div>
            
        </form>
    </div>
</body>
</html>