<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
// 현재 날짜를 가져오기
Date currentDate = new Date();

// 날짜를 원하는 형식으로 포맷팅
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String formattedDate = dateFormat.format(currentDate);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Q&A 작성</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/common/template.css">

</head>
<body>
	<div class="contentsright">
		<div>
			<h2>판매자 문의 작성</h2>
			<p>작성자: ${userLoginInfo.id}</p>
			<p>회원번호: ${userLoginInfo.no }</p>
			<p>제품번호: ${product_no}</p>
			<p>판매자번호: ${seller_no}</p>
			<p>
				작성일:
				<%=formattedDate%></p>


			<form method="post" name="frm" id="frm" action="qnainsert.do"
				enctype="multipart/form-data">
				<table class="board_write">
					<tbody>

						<td><textarea name="question_content" id="question_content"
								style="width: 400px; height: 200px;"
								placeholder="판매자에게 문의하실 내용을 적어주세요.(최대 255자) 
욕설, 비방 등 작성 시 관리자가 임의로 삭제할 수 있습니다."></textarea>

						</td>

						<td><input type="hidden" name="user_no"
							value='${userLoginInfo.no}'></td>

						<td><input type="hidden" name="seller_no"
							value='${seller_no}'></td>


						<td><input type="hidden" name="product_no"
							value='${product_no}'></td>

						<td><input type="hidden" name="cmd" value='${move}'>
						</td>

					</tbody>
				</table>
				<div class="btnSet">
					<input type="button" class="btn" value="저장"
						onclick="javascript:goSave();">
				</div>
			</form>

		</div>
	</div>


	<script>
		function goSave() {
			// 사용자가 입력한 데이터 가져오기
			var questionContent = $("#question_content").val();
			var userNo = $("input[name='user_no']").val();
			var productNo = $("input[name='product_no']").val();
			var sellerNo = $("input[name='seller_no']").val();
					
			
			if (questionContent === '') {
				alert('내용을 입력하세요');
				questioncContent.focus();
				return false;
			}

			// Ajax 호출
			$.ajax({
				type : 'POST',
				url : 'qnainsert.do',
				data : {
					question_content : questionContent,
					user_no : userNo,
					product_no : productNo,
					seller_no : sellerNo
				},
				success : function(response) {
					alert('질문이 정상적으로 등록되었습니다.');
					return "user/product/goods/goods";

				},
				error : function(error) {
					// Ajax 실패 시 동작
					alert('입력 오류가 발생했습니다. 나중에 다시 시도해주십시오');
					return "user/product/goods/goods";
				}
			});
		}
	</script>
</body>
</html>