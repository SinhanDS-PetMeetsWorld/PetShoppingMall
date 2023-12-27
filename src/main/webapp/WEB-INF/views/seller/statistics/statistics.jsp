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
		.minichartbox{
			width : 450px;
			height : 250px;
		}
	</style>
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
					<div class="minichartbox">
						<canvas id="chartex"></canvas>
					</div>
				</div>
			</div>

        </div>
    </div>
    <div class="footer">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>


<script type="text/javascript">
	$(document).ready(function(){
		getGraph();
	});
	
	function getGraph(){
		var dateList = [];
		var salesList = [];
		var cancleList = [];
		var ctx = document.getElementById('chartex');
		
		$.ajax({
			type: "GET",
			url:'',
			data: {},
			success:function(data) {
				alert("success");
				
				for(var i=0; i<data.length; i++){
					dateList.push(data[i].뭐시기);
					salesList.push(data[i].뭐시기);
					cancleList.push(data[i].뭐시기);
				}
				
				new Chart(ctx, {
					type: 'bar',
					   data: {
					       datasets: [{
					           label: 'sales Dataset',
					           data: salesList,
					           borderColor: 'rgb(54, 162, 235)',
					           backgroundColor: 'rgb(54, 162, 235, 0.3)',
					           borderWidth : 1,
					           order: 2
					       }, {
					           label: 'cancle Dataset',
					           data: cancleList,
					           type: 'line',
					           fill: false,
					           borderColor: 'rgb(255, 99, 132)',
					           order: 1
					       }],
					       labels: dateList
					   }
				});
			}
			error:function(data){
				alert('통계 데이터를 불러오지 못했습니다.');
			}
		})
	}
</script>

</body>
</html>