<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style>
	.errorbody{
		margin : 100px;
	}
	.errorbox{
		margin : 0 auto;
		width : 500px;
		height : 500px;
		text-align : center;
	}
	.homebtn {
		margin : 20px;
	}
</style>
</head>
<body>
<div>
	<div class="errorbody">
		<div class="errorbox">
			<div>
				<img src="/resources/img/common/erroremoji.jpg">
				<h1>오류가 발생했습니다</h1>
			</div>
			<div>
				요청하신 페이지를 처리 중에 오류가 발생했습니다.
				<br>서비스 이용에 불편을 드려 죄송합니다.
				<br>문제가 반복될 경우 관리자에게 문의 주시기 바랍니다.
			</div>
			<div class="homebtn">
				<a href="/"><img src="/resources/img/common/returnhomebtn.png"></a>
			</div>
		</div>
	</div>
</div>
</body>
</html>