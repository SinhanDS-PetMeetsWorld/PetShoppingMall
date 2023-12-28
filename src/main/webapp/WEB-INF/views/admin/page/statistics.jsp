<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
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
			height : 180px;
			margin-top : 20px;
		}
		.chartarea {
			clear : both;
			margin-left : 40px;
		}
		.bigchartarea{
			margin-bottom : 30px;
		}
		.detailchartarea {
			width : 950px;
			height : 650px;
			clear : both;
		}
		.bigchartbox{
			margin-left : 30px;
			margin-top : 30px;
			width : 800px;
			height : 400px;
		}
		.bigchart {
			width : 600px;
			height : 600px;
			float : left;
		}
		.smallchart {
			width : 300px;
			height : 300px;
			float : left;
		}
		
		.menu_name2{
			margin-top : 20px;
			margin-bottom : 20px;
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
			getQuantityGraph();
			getPriceGraph();
			getCategory1Graph();
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
				data: {},
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
				data: {},
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
            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        </div>
        <div>
        	<%@ include file="/WEB-INF/views/common/admin_menu.jsp" %>
        </div>
        <div class="contents">
        	
					<div class="chartarea">
					
						<div class="totalboxarea">
							<div class="totalbox"><div class="totalbox_name">총 결제건수</div>  <h3 class="totalbox_data">${totalStatistics.orders} 건</h3></div>
							<div class="totalbox"><div class="totalbox_name">총 결제 금액</div>  <h3 class="totalbox_data">${totalStatistics.sale} 원</h3></div>
							<div class="totalbox"><div class="totalbox_name">총 실매출 금액</div>  <h3 class="totalbox_data">${totalStatistics.realsales} 원</h3></div>
							<div class="totalbox"><div class="totalbox_name">총 결제 상품수량</div>  <h3 class="totalbox_data">${totalStatistics.quantity} 개</h3></div>
						</div>
						
						<div class="bigchartarea">
								<h2>전체 통계</h2>
							<div class="bigchartbox">
								<canvas id="chart1"></canvas>
							</div>
							<div class="bigchartbox">
								<canvas id="chart2"></canvas>
							</div>
						</div>
						
						<h2 class="menu_name2">항목별 세부 통계</h2>
						<button class="selected_tab_button  chartbtn" type="button" id="chartbtn" onclick="getCategory1Graph();">대분류별</button>
						<button class="tab_button chartbtn" type="button" id="chartbtn" onclick="getGenderGraph();">성별별</button>
						<button class="tab_button chartbtn" type="button" id="chartbtn" onclick="getAgeGraph();">나이별</button>
						<button class="tab_button chartbtn" type="button" id="chartbtn" onclick="getSellerGraph();">판매자별</button><br>
						<button class="tab_button chartbtn" type="button" id="chartbtn" onclick="getCategory2Graph_dog();">소분류별 : 강아지</button>
						<button class="tab_button chartbtn" type="button" id="chartbtn" onclick="getCategory2Graph_cat();">소분류별 : 고양이</button>
						<button class="tab_button chartbtn" type="button" id="chartbtn" onclick="getCategory2Graph_etc();">소분류별 : 기타</button>
						<hr class = "start_line">
						
						<div class="detailchartarea">
							<div class="bigchart"><div class="titleInGraphe1_2"><h2>총매출</h2></div><canvas id="detailchart1"></canvas></div>
							<div class="smallchart"><div class="titleInGraphe2_2"><h2>취소</h2></div><canvas id="detailchart2"></canvas></div>
							<div class="smallchart"><div class="titleInGraphe2_2"><h2>환불</h2></div><canvas id="detailchart3"></canvas></div>
						</div>
						
					</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
    <script>
		$('.chartbtn').on('click', fill);
		function fill(){
			$('.selected_tab_button').addClass('tab_button');
			$('.selected_tab_button').removeClass('selected_tab_button');
			$(this).attr('class', 'selected_tab_button');				
		}
	</script>
    
    
    <script>
	function clearChart(){
		var chartStatus = Chart.getChart('detailchart1');
		if (chartStatus !== undefined) {
		  chartStatus.destroy();
		}
		var chartStatus = Chart.getChart('detailchart2');
		if (chartStatus !== undefined) {
		  chartStatus.destroy();
		}
		var chartStatus = Chart.getChart('detailchart3');
		if (chartStatus !== undefined) {
		  chartStatus.destroy();
		}
	}
    
    function getCategory1Graph(){
		var category1List = [];
		var salesList = [];
		var cancleList = [];
		var refoundList = [];
		var ctx1 = document.getElementById('detailchart1');
		var ctx2 = document.getElementById('detailchart2');
		var ctx3 = document.getElementById('detailchart3');
		
		var name_list = new Array();
		<c:forEach items="${cvo.category_name}" var="vo">
			name_list.push("${vo}");
		</c:forEach>
		
		$.ajax({
			type: "GET",
			url:'statistics_category1.do',
			data: {},
			success:function(data) {
				clearChart();
				
				for(var i=0; i<data.length; i++){
					category1List.push(name_list[data[i].category1]);
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
					        	      'rgb(255, 205, 86)'
					        	    ],
					       }],
					       labels: category1List
					   },
					 options: {
						 title : { display : true, text : '대분류별 매출액' }
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
					        	      'rgb(255, 205, 86)'
					        	    ],
					       }],
					       labels: category1List
					   },
					options: {
						title : { display : true, text : '대분류별 취소액' }
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
					        	      'rgb(255, 205, 86)'
					        	    ],
					       }],
					       labels: category1List
					   },
					options: {
						title : { display : true, text : '대분류별 환불액' }
					}
				});
			},
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
	}
	
	function getCategory2Graph_dog(){
		var category2List = [];
		var salesList = [];
		var cancleList = [];
		var refoundList = [];
		var ctx1 = document.getElementById('detailchart1');
		var ctx2 = document.getElementById('detailchart2');
		var ctx3 = document.getElementById('detailchart3');
		
		var name_list = new Array();
		<c:forEach items="${cvo.category[0]}" var="vo">
		name_list.push("${vo}");
	</c:forEach>
		
		$.ajax({
			type: "GET",
			url:'statistics_category2.do',
			data: { catogory1 : 0 },
			success:function(data) {
				clearChart();
				
				for(var i=0; i<data.length; i++){
					category2List.push(name_list[data[i].category2]);
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 매출액' }
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 취소액' }
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 환불액' }
					}
				});
			},
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
	}
	
	function getCategory2Graph_cat(){
		var category2List = [];
		var salesList = [];
		var cancleList = [];
		var refoundList = [];
		var ctx1 = document.getElementById('detailchart1');
		var ctx2 = document.getElementById('detailchart2');
		var ctx3 = document.getElementById('detailchart3');
		
		var name_list = new Array();
		<c:forEach items="${cvo.category[1]}" var="vo">
		name_list.push("${vo}");
	</c:forEach>
		
		$.ajax({
			type: "GET",
			url:'statistics_category2.do',
			data: { category1 : 1 },
			success:function(data) {
				clearChart();
				
				for(var i=0; i<data.length; i++){
					category2List.push(name_list[data[i].category2]);
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 매출액' }
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 취소액' }
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 환불액' }
					}
				});
			},
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
	}
	
	function getCategory2Graph_etc(){
		var category2List = [];
		var salesList = [];
		var cancleList = [];
		var refoundList = [];
		var ctx1 = document.getElementById('detailchart1');
		var ctx2 = document.getElementById('detailchart2');
		var ctx3 = document.getElementById('detailchart3');
		
		var name_list = new Array();
		<c:forEach items="${cvo.category[2]}" var="vo">
		name_list.push("${vo}");
	</c:forEach>
		
		$.ajax({
			type: "GET",
			url:'statistics_category2.do',
			data: { category1 : 2 },
			success:function(data) {
				clearChart();
				
				for(var i=0; i<data.length; i++){
					category2List.push(name_list[data[i].category2]);
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 매출액' }
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 취소액' }
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
					       labels: category2List
					   },
					options: {
						title : { display : true, text : '소분류별 환불액' }
					}
				});
			},
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
	}
	
	function getGenderGraph(){
		var nameList = ["남자", "여자"];
		var genderList = [];
		var salesList = [];
		var cancleList = [];
		var refoundList = [];
		var ctx1 = document.getElementById('detailchart1');
		var ctx2 = document.getElementById('detailchart2');
		var ctx3 = document.getElementById('detailchart3');
		
		$.ajax({
			type: "GET",
			url:'statistics_genderchart.do',
			data: {},
			success:function(data) {
				clearChart();
				
				for(var i=0; i<data.length; i++){
					genderList.push(nameList[data[i].gender]);
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
					        	      'rgb(54, 162, 235)',
					        	      'rgb(255, 99, 132)'
					        	    ],
					       }],
					       labels: genderList
					   },
					 options: {
						 title : { display : true, text : '성별별 매출액' }
					 }
				});
				
				new Chart(ctx2, {
					type: 'doughnut',
					data: {
					       datasets: [{
					           data: cancleList,
					           backgroundColor: [
					        	      'rgb(54, 162, 235)',
					        	      'rgb(255, 99, 132)'
					        	    ],
					       }],
					       labels: genderList
					   },
					options: {
						title : { display : true, text : '성별별 취소액' }
					}
				});
				
				new Chart(ctx3, {
					type: 'doughnut',
					data: {
					       datasets: [{
					           data: refoundList,
					           backgroundColor: [
					        	      'rgb(54, 162, 235)',
					        	      'rgb(255, 99, 132)'
					        	    ],
					       }],
					       labels: genderList
					   },
					options: {
						title : { display : true, text : '성별별 환불액' }
					}
				});
			},
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
	}
	
	function getAgeGraph(){
		var ageList = [];
		var salesList = [];
		var cancleList = [];
		var refoundList = [];
		var ctx1 = document.getElementById('detailchart1');
		var ctx2 = document.getElementById('detailchart2');
		var ctx3 = document.getElementById('detailchart3');
		
		$.ajax({
			type: "GET",
			url:'statistics_agechart.do',
			data: { },
			success:function(data) {
				clearChart();
				
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
						 title : { display : true, text : '나이대별 매출액' }
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
					   },
					options: {
						title : { display : true, text : '나이대별 취소액' }
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
					   },
					options: {
						title : { display : true, text : '나이대별 환불액' }
					}
				});
			},
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
	}
	
	function getSellerGraph(){
		var sellerList = [];
		var salesList = [];
		var cancleList = [];
		var refoundList = [];
		var ctx1 = document.getElementById('detailchart1');
		var ctx2 = document.getElementById('detailchart2');
		var ctx3 = document.getElementById('detailchart3');
		
		$.ajax({
			type: "GET",
			url:'statistics_sellerchart.do',
			data: { },
			success:function(data) {
				clearChart();
				
				for(var i=0; i<data.length; i++){
					sellerList.push(data[i].seller_no);
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
					       labels: sellerList
					   },
					 options: {
						 title : { display : true, text : '판매별 매출액' }
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
					       labels: sellerList
					   },
					options: {
						title : { display : true, text : '판매자별 취소액' }
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
					       labels: sellerList
					   },
					options: {
						title : { display : true, text : '판매자별 환불액' }
					}
				});
			},
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
	}
    
    </script>
</body>
</html>