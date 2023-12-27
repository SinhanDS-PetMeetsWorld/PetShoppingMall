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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
	<style>
		
		.chartarea {
			clear : both;
			
		}
		.bigchartbox{
			width : 600px;
			height : 600px;
		}
		.category2area{
			width : 950px;
			height : 650px;
			border : 1px solid;
		}
		.cat2big {
			width : 600px;
			height : 600px;
			border : 1px solid;
			float : left;
		}
		.cat2small {
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
	
	<script type="text/javascript">
		$(document).ready(function(){
			getCategory1Graph();
		});
		
		function getCategory1Graph(){
			var category1List = [];
			var salesList = [];
			var cancleList = [];
			var refoundList = [];
			var ctx = document.getElementById('chart1');
			
			var name_list = new Array();
			<c:forEach items="${cvo.category_name}" var="vo">
				name_list.push("${vo}");
			</c:forEach>
			
			$.ajax({
				type: "GET",
				url:'statistics_category1.do',
				data: { seller_no : "${seller.no}" },
				success:function(data) {
					for(var i=0; i<data.length; i++){
						category1List.push(name_list[data[i].category1]);
						salesList.push(data[i].sale);
						cancleList.push(data[i].cancle);
						refoundList.push(data[i].refound);
					}
					
					new Chart(ctx, {
						type: 'doughnut',
						data: {
						       datasets: [{
						           label: '주문',
						           data: salesList,
						           backgroundColor: [
						        	      'rgb(255, 99, 132)',
						        	      'rgb(54, 162, 235)',
						        	      'rgb(255, 205, 86)'
						        	    ],
						       }],
						       labels: category1List
						   },
						   options : {
							   title : {
								   display : true,
								   text : "카테고리별"
							   }
						   }
					});
				},
				error:function(data){
					alert('통계 데이터를 불러오지 못했습니다.');
				}
			})
		}
		
		function getCategory2Graph(){
			var category2List = [];
			var salesList = [];
			var cancleList = [];
			var refoundList = [];
			var ctx = document.getElementById('chart2');
			
			$.ajax({
				type: "GET",
				url:'statistics_category2.do',
				data: { seller_no : "${seller.no}",
						catogory1 : 0 },
				success:function(data) {
					for(var i=0; i<data.length; i++){
						category2List.push(data[i].category2);
						salesList.push(data[i].sale);
						cancleList.push(data[i].cancle);
						refoundList.push(data[i].refound);
					}
					
					new Chart(ctx, {
						type: 'doughnut',
						   data: {
						       datasets: [{
						           label: '주문',
						           data: salesList,
						           borderColor: 'rgb(54, 162, 235)',
						           backgroundColor: 'rgb(54, 162, 235, 0.3)',
						           order: 3
						       }, {
						           label: '취소',
						           data: cancleList,
						           type: 'dougnut',
						           fill: false,
						           borderColor: 'rgb(255, 99, 132)',
						           order: 2
						       }, {
						           label: '환불',
						           data: refoundList,
						           type: 'dougnut',
						           fill: false,
						           borderColor: '#B771ED',
						           order: 1
						       }],
						       labels: category2List
						   },
						   options : {
							   title : {
								   display : true,
								   text : "최근 일주일 총 결제금액 대비 취소, 환불 금액"
							   }
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
					<button class="selected_tab_button" type="button" onclick="location.href='/seller/statistics/statistics_category.do'">카테고리 통계</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/statistics/statistics_gender.do'">성별 통계</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/statistics/statistics_age.do'">나이 통계</button>
					<hr class = "start_line">
			
					<div class="chartarea">
						<div class="bigchartbox">
							<canvas id="chart1"></canvas>
						</div>
						<button id="chartbtn" onclick="getCategory2Graph();">강아지</button>
						<div class="category2area">
							<div class="cat2big"><canvas id="chart2"></canvas></div>
							<div class="cat2small"><canvas id="chart3"></canvas></div>
							<div class="cat2small"><canvas id="chart4"></canvas></div>
						</div>
					</div>
					
					
			</div>

        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>



</body>
</html>