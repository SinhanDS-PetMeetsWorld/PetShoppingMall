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
		.totalbox{
			width : 160px;
			height : 90px;
			border : 1px solid #E2E2E2;
			border-top : 2px solid #a0a0a0;
			float : left;
			margin : 40px 0px 0px 40px;
		}
		.totalbox_name{
			margin : 17px 0 10px 15px;
			color : #a9a9a9;
			font-weight : bold;
			font-size : 12px;
		}
		.totalbox_data{
			margin-left : 15px;
		}
		
		.totalboxarea{
			height : 230px;
			margin-top : 20px;
		}
		.chartarea {
			clear : both;
			
		}
		.bigchartbox{
			margin-left : 30px;
			margin-top : 30px;
			width : 800px;
			height : 400px;
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
			getQuantityGraph();
			getPriceGraph();
		});
		
		function getQuantityGraph(){
			var dateList = [];
			var salesList = [];
			var cancleList = [];
			var refoundList = [];
			var ctx = document.getElementById('chart1');
			
			$.ajax({
				type: "GET",
				url:'QuantityRecentWeek.do',
				data: { seller_no : "${seller.no}" },
				success:function(data) {
					for(var i=0; i<data.length; i++){
						dateList.push(data[i].order_date);
						salesList.push(data[i].sale);
						cancleList.push(data[i].cancle);
						refoundList.push(data[i].refound);
					}
					
					new Chart(ctx, {
						type: 'bar',
						   data: {
						       datasets: [{
						           label: '주문',
						           data: salesList,
						           borderColor: 'rgb(54, 162, 235)',
						           backgroundColor: 'rgb(54, 162, 235, 0.3)',
						           borderWidth : 1,
						           order: 3
						       }, {
						           label: '취소',
						           data: cancleList,
						           type: 'line',
						           fill: false,
						           borderColor: 'rgb(255, 99, 132)',
						           order: 2
						       }, {
						           label: '환불',
						           data: refoundList,
						           type: 'line',
						           fill: false,
						           borderColor: '#B771ED',
						           order: 1
						       }],
						       labels: dateList
						   },
						   options : {
							   title : {
								   display : true,
								   text : "최근 일주일 총 주문건수 대비 취소, 환불건수"
							   }
						   }
					});
				},
				error:function(data){
					alert('통계 데이터를 불러오지 못했습니다.');
				}
			})
		}
		
		function getPriceGraph(){
			var dateList = [];
			var salesList = [];
			var cancleList = [];
			var refoundList = [];
			var ctx = document.getElementById('chart2');
			
			$.ajax({
				type: "GET",
				url:'PriceRecentWeek.do',
				data: { seller_no : "${seller.no}" },
				success:function(data) {
					for(var i=0; i<data.length; i++){
						dateList.push(data[i].order_date);
						salesList.push(data[i].sale);
						cancleList.push(data[i].cancle);
						refoundList.push(data[i].refound);
					}
					
					new Chart(ctx, {
						type: 'bar',
						   data: {
						       datasets: [{
						           label: '주문',
						           data: salesList,
						           borderColor: 'rgb(54, 162, 235)',
						           backgroundColor: 'rgb(54, 162, 235, 0.3)',
						           borderWidth : 1,
						           order: 3
						       }, {
						           label: '취소',
						           data: cancleList,
						           type: 'line',
						           fill: false,
						           borderColor: 'rgb(255, 99, 132)',
						           order: 2
						       }, {
						           label: '환불',
						           data: refoundList,
						           type: 'line',
						           fill: false,
						           borderColor: '#B771ED',
						           order: 1
						       }],
						       labels: dateList
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
					<button class="selected_tab_button" type="button" onclick="location.href='/seller/statistics/statistics.do'">전체 통계</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/statistics/statistics_category.do'">카테고리 통계</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/statistics/statistics_gender.do'">성별 통계</button>
					<button class="tab_button" type="button" onclick="location.href='/seller/statistics/statistics_age.do'">나이 통계</button>
					<hr class = "start_line">
			
				<div class="totalboxarea">
					<h2>최근 일주일 매출 통계(totalbox부분 피그마 참고해서 수정...부탁드립니다)</h2>
					<div class="totalbox"><div class="totalbox_name">총 결제건수</div>  <h3 class="totalbox_data">${totalStatistics.orders} 건</h3></div>
					<div class="totalbox"><div class="totalbox_name">총 결제 금액</div>  <h3 class="totalbox_data">${totalStatistics.sale} 원</h3></div>
					<div class="totalbox"><div class="totalbox_name">총 실매출 금액</div>  <h3 class="totalbox_data">${totalStatistics.realsales} 원</h3></div>
					<div class="totalbox"><div class="totalbox_name">총 결제 상품수량</div>  <h3 class="totalbox_data">${totalStatistics.quantity} 개</h3></div>
				</div>
					<div class="chartarea">
						<h2>통계 상세 보기</h2>
						<div class="bigchartbox">
							<canvas id="chart1"></canvas>
						</div>
						<div class="bigchartbox">
							<canvas id="chart2"></canvas>
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