<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	
	<style>
		
		.chartarea {
			width : 950px;
			height : 650px;
		}
		.bigchart {
			width : 600px;
			height : 600px;
			border : 1px solid;
			float : left;
		}
		.smallchart {
			width : 300px;
			height : 300px;
			border : 1px solid;
			float : left;
		}
		 .menu_name {
			margin-bottom: 10px;	
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
			 	
			 .start_line {
			        border: 1px solid #FFDE30;
			        margin-bottom : 10px;
			        width : 800px;
			     }
	</style>
	<style>
		.titleInGraphe{
			position:absolute;
			margin-top : 560px;
		}
		.titleInGraphe2{
			position:absolute;
			margin-top : 260px;
		}
		.titleInGraphe1_2{
			position:absolute;
			margin-top : 560px;
		}
		.titleInGraphe2_2{
			position:absolute;
			margin-top : 260px;
		}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		getGenderGraph();
	});
	
	function getGenderGraph(){
		var ageList = [];
		var salesList = [];
		var cancleList = [];
		var refoundList = [];
		var ctx1 = document.getElementById('chart1');
		var ctx2 = document.getElementById('chart2');
		var ctx3 = document.getElementById('chart3');
		
		$.ajax({
			type: "GET",
			url:'statistics_agechart.do',
			data: { seller_no : "${seller.no}" },
			success:function(data) {
				for(var i=0; i<data.length; i++){
					ageList.push(data[i].age);
					salesList.push(data[i].sale);
					cancleList.push(data[i].cancle);
					refoundList.push(data[i].refound);
				}
				
				new Chart(ctx1, {
					type: 'doughnut',
					data: {
					       datasets: [{
					           data: salesList,
					           backgroundColor: [
					        	   'rgb(255, 99, 132)',
					        	   'rgb(54, 162, 235)',
					        	   'rgb(255, 205, 86)',
					        	   '#5a5e9a', '#FCA5A5', '#34D399',
					        	   '#8B5CF6', '#005e36', '#a3acff',
					        	   '#ee243c', '#e8600a'
					        	    ],
					       }],
					       labels: ageList
					   },
					 options: {
						 title : { display : true, text : '대분류별 매출' }
					 }
				});
				
				new Chart(ctx2, {
					type: 'doughnut',
					data: {
					       datasets: [{
					           data: cancleList,
					           backgroundColor: [
					        	   'rgb(255, 99, 132)',
					        	   'rgb(54, 162, 235)',
					        	   'rgb(255, 205, 86)',
					        	   '#5a5e9a', '#FCA5A5', '#34D399',
					        	   '#8B5CF6', '#005e36', '#a3acff',
					        	   '#ee243c', '#e8600a'
					        	    ],
					       }],
					       labels: ageList
					   }
				});
				
				new Chart(ctx3, {
					type: 'doughnut',
					data: {
					       datasets: [{
					           data: refoundList,
					           backgroundColor: [
					        	   'rgb(255, 99, 132)',
					        	   'rgb(54, 162, 235)',
					        	   'rgb(255, 205, 86)',
					        	   '#5a5e9a', '#FCA5A5', '#34D399',
					        	   '#8B5CF6', '#005e36', '#a3acff',
					        	   '#ee243c', '#e8600a'
					        	    ],
					       }],
					       labels: ageList
					   }
				});
			},
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
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
				<h1 class = "menu_name">통계 확인</h1>
					<button class="tab_button" type="button" onclick="location.href='/seller/statistics/statistics.do'">전체 통계</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/statistics/statistics_category.do'">카테고리 통계</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/statistics/statistics_gender.do'">성별 통계</button>
					<button class="selected_tab_button" type="button" onclick="location.href='/seller/statistics/statistics_age.do'">나이 통계</button>
					<hr class = "start_line">
			
					<div class="chartarea">
						<div class="bigchart"><div class="titleInGraphe"><h2>총매출</h2></div><canvas id="chart1"></canvas></div>
						<div class="smallchart"><div class="titleInGraphe2"><h2>취소</h2></div><canvas id="chart2"></canvas></div>
						<div class="smallchart"><div class="titleInGraphe2"><h2>환불</h2></div><canvas id="chart3"></canvas></div>
					</div>
			</div>

        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>



</body>
</html>