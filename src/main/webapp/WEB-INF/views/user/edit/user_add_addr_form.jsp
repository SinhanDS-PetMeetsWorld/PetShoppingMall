<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송지 추가</title>
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
		if($("#comment").val() ==''){
			$("#comment").val("기본");
		}
		
		$("#insert_addr").submit();
		
	}
	
	
	
    </script>
    
    
<style>

.aaa{
	   background-color: #fff;
    height: 30px;
    width: 320px;
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

.addr_aaa{
	   background-color: #fff;
    height: 30px;
    width: 170px;
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

.addr_aaa2{
	   background-color: #fff;
    height: 30px;
    width: 280px;
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
 font-size: 12px;
 width : 100px;
 height: 40px;
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
  margin-left: 150px;
  margin-top : 15px;
 }
 
 
 .info_tag_container{
width : 416px;
height : 60px;
display : flex;
}
 
.info_tag{
 height : 30px;
 width : 120px;
 float : left;
 text-align : center;
 margin-top : 7px;
}

.info_space {
width : 10px;
height : 30px;
}


</style>
</head>
<body>
    <div>
        <h2>배송지 추가</h2>
        <form action="insert_addr.do" id="insert_addr" method="GET">
           
           <div class = "info_tag_container">
           		
           		<div class = "info_tag">
           			<span>수령인</span>
           		</div>
           		<div class = "info_space"></div>
           		<input class ="aaa" type="text" name="name" id="name">
           
           </div>
           
           <div class = "info_tag_container">
                <div class = "info_tag">
                	<span>전화 번호</span>
                </div>
                <div class = "info_space"></div>
                <input class ="aaa" type="text" name="phone" id="phone">
            </div>
            
            <h2> 주소 </h2>
            
            <div class = "info_tag_container">
               
                <div class ="info_tag">
                <span>우편번호</span>
               	</div>
               	
                <input class = "addr_aaa" type="text"  name="zipcode" id="zipcode" readonly> 
                <div class ="info_space"></div>
                <button class ="check" type="button" class="btn" onclick="zipcode_search();">우편번호 검색</button>
             </div>  
             
             <div class ="info_tag_container">
             	<div class ="info_tag">
             	<span>기본주소</span>
             	</div>
             	<input class = "addr_aaa2"  type="text" readonly name="addr1" id="addr1">
             </div>
               
             <div class ="info_tag_container">
             	<div class ="info_tag">
             	<span>상세주소</span>
             	</div>
             	<input class = "addr_aaa2" type="text" name="addr2" id="addr2">
             </div>   
                
             <h2>별명</h2>
            
            <div class ="info_tag_container">
            
            	<div class ="info_tag">
             	<span>별칭 (ex. 집)</span>
             	</div>
             	<div class = "info_space"></div>
            	<input class ="aaa" type="text" placeholder="별칭(ex:집)" name="comment" id="comment">
            </div>
    
            <input class ="createConfirm " type="button" onclick="doCheck();" value="추가">
            
        </form>
    </div>
</body>
</html>