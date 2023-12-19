<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach var="item" items="${qna_list}">
		<div class="Q" onclick="toggleAnswer(this)" >
	    	<p> ${item.question_content} (질문 작성일 : ${item.question_write_date}) </p>
		</div>
		<div class="A" style="display:none;">
			<p style="color : red;"> ${item.answer_content} (답변 작성일 : ${item.answer_write_date})</p>
		</div>
	</c:forEach>
	<div>
   		<ul class='paging'>
            <c:if test="${qnaPaging.prev }">
            	<li><button class="qnaPageButton" data-page="${qnaPaging.startPage-1 }"> << </button></li>
            </c:if>
            <c:forEach var="p" begin="${qnaPaging.startPage}" end="${qnaPaging.endPage}">
            	<c:if test="${p == qna_svo.page}">
	            	<li> <button data-page=${p }>${p }</button></li>
                </c:if>
                <c:if test="${p != qna_svo.page}">
                	<li> <button class="qnaPageButton" data-page=${p }>${p }</button></li>
                </c:if>
            </c:forEach>
            <c:if test="${qnaPaging.next }">
            	<li><button class="qnaPageButton" data-page="${qnaPaging.endPage+1 }"> >> </button></li>
            </c:if>
		</ul> 
   	</div>
</body>
</html>