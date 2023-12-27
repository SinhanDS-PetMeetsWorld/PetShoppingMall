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
		.bigchartbox{
			width : 800px;
			height : 400px;
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
								   text : "최근 일주일 총 주문 건수 대비 취소, 환불 건수"
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
								   text : "최근 일주일 총 주문 매출 대비 취소, 환불 가격"
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
				<div>
				최근 1주일간 판매 성과
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