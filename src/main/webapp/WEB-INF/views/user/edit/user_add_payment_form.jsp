<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매자 :: 결제수단 추가</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    <style>
    
    	#accountnum_contents{
    		display:none;
    	}
    </style>
    
	<script>
	$(function(){
		$('#accountnum').click(function(){
            $('#card_contents').css("display", "none");
            $('#accountnum_contents').css("display", "block");
            $('#accountnum').css("background" , "#FFDE30");
            $('#card').css("background" , "#F9FAFB");
            
        });

        $('#card').click(function(){
            $('#accountnum_contents').css("display", "none");
            $('#card_contents').css("display", "block");
            $('#card').css("background" , "#FFDE30");      
            $('#accountnum').css("background" , "#F9FAFB");
        });
    });
	</script>
		
	<script>
	
	function doCheck(){
		if($("#account").val() == ''){
			alert('카드번호를 입력하세요!')
			return;	
		}
		if($("#valid_date").val() == ''){
			alert('유효기간을 입력해주세요!')
			return;
		}
		if($("#name").val() == ''){
			alert('별칭을 입력해주세요!')
			return;
		}
		if($("#cvc").val() == ''){
			alert('cvc를 입력해주세요!')
			return;
		}
		
		$("#insert_payment").submit();
		
	}
	
	function doCheck2(){
		if($("#account2").val() == ''){
			alert('계좌번호를 입력하세요!')
			return;	
		}
		if($("#name2").val() == ''){
			alert('별칭을 입력해주세요!')
			return;
		}
		
		$("#insert_payment2").submit();
		
	}
    </script>
    
<style>


.contents {
	border: 1px solid #FFDE30;
	border-top : 1px solid #F9FAFB; 
    width : 442px;
    padding-left : 10px;
}


#card{
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 7px;
 background: #FFDE30;
 border:1px solid #FFDE30;
 font-size: 25px;
 height: 40px;
 padding: 0 11px;
 text-align: center;
 width: 20%;
 min-width: 200px;
 font-weight: 500;
 color: #0F1111;


 border-bottom-left-radius: 0%;
 border-bottom-right-radius: 0%;
 border-bottom : none;
 :hover{
     background: #F7CA00;
     border-color: #F2C200;
     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
 	}
 }

 #accountnum {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 7px;
 background: #F9FAFB;
 border:1px solid #FFDE30;
 font-size: 25px;
 height: 40px;
 padding: 0 11px;
 text-align: center;
 width: 20%;
 min-width: 200px;
 font-weight: 500;
 color: #0F1111;
 border-bottom-left-radius: 0%;
 border-bottom-right-radius: 0%;
 border-bottom : none;
 :hover{
     background: #F7CA00;
     border-color: #F2C200;
     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
 	}
 }


.line {
border : 1px solid black;
  border-collapse : collapse;

}

.aaa{
	   background-color: #fff;
       height: 30px;
       width: 150px;
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

.aaa_selectbank{
	   background-color: #fff;
       height: 38px;
       width: 140px;
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
 
 .addConfirm {
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
 
  margin-left: 120px;
  margin-bottom:20px;
 }
 
 
.info_tag_container{
width : 450px;
height : 60px;
display : flex;
}

.info_tag_container a {
font-size : 14px;
color : #9CA3AF;
margin-top :10px;
}

.info_tag{
 height : 30px;
 width : 120px;
 float : left;
 text-align : left;
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
        <span class="title_on" id="card">카드</span>
        <span class="title" id="accountnum">계좌</span>
       
        <div class="contents" id="card_contents">
      		        <form action="insert_payment.do" id="insert_payment" method="GET">
			
			            <input type="hidden" name="type" id="type" value="0">
			            <h2>결제 카드</h2>
			        	
			        	<div class = "info_tag_container">
	            	 		<div class = "info_tag">
	           		 		<span>카드정보 입력</span>
	            			</div>
	            			
			        		<select class = "aaa_selectbank" name="company" id="company">
								<c:forEach var="card" items="${vo.company_list[0]}" varStatus="status">
									<option value="${status.index}">${card}</option>
								</c:forEach>
		            		</select>
		            		
		            		<div class ="info_space"></div>
		            		
		            		<input class ="aaa" type="text" placeholder="- 를 포함해서 입력하세요" name="account" id="account">
		            		
			        	</div>
			         
			            <div class = "info_tag_container">
	            			<div class = "info_tag">
	            				<span>유효기간 입력 </span>
	            			</div>
			          		<input class="aaa" type="text" placeholder="MM / YYYY" name="valid_date" id="valid_date">
			           </div>
			           
			           
			            <div class = "info_tag_container">
				            <div class ="info_tag">
				                <span>별칭 입력</span>
				            </div>
				            <input class ="aaa" type="text" placeholder="(ex: 엄마카드)" name="name" id="name">
			            </div>
		            	
		            	
		            	<div class ="info_tag_container">
			            	<div class = "info_tag">
			            	<span>카드 CVC 입력</span>
			                </div>
		            	
			            	<input class ="aaa" type="text" placeholder="CVC" name="cvc" id="cvc"><a>&nbsp카드 뒷면 숫자 3자리</a>
			            </div>
			                 <input class ="addConfirm" type="button" onclick="doCheck();" value="등록">
			       		
			       	 </form>   
	       
        </div>
        
         <div class="contents" id="accountnum_contents">
        	<form action="insert_payment.do" id="insert_payment2" method="GET">
	            <input type="hidden" name="type" id="type" value="1">
	            
	            
	            <h2>계좌 등록</h2>
	            
			    <div class = "info_tag_container">
			    
			    	<div class = "info_tag">
	            	<span>계좌 정보</span>
	                </div>

   			        <select class = "aaa_selectbank" name="company" id="company">
							<c:forEach var="bank" items="${vo.company_list[1]}" varStatus="status">
								<option value="${status.index}">${bank}</option>
							</c:forEach>
		            </select>
		            	
		            <div class ="info_space"></div>
		            	
				    <input class ="aaa" type="text" placeholder="- 를 포함해서 입력하세요" name="account" id="account2">
			    </div>
	
	            <div class ="info_tag_container">
	            	
	            	<div class = "info_tag">
	                <span>별칭 입력</span>
	                </div>
	                
	                 <input class ="aaa" type="text" placeholder="(ex: 비상금 계좌)" name="name" id="name2">
	                 
	            </div> 
	                 <input class ="addConfirm" type="button" onclick="doCheck2();" value="등록">
	            
	        </form>
        </div>
    </div>
</body>
</html>