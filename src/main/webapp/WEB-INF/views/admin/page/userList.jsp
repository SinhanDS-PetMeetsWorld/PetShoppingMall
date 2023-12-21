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
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
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
        	<h1>구매자 목록 조회</h1>
        	<table border='1'>
        		<tr>
        			<td>회원 번호</td>
        			<td>아이디</td>
        			<td>이름</td>
        			<td>이메일</td>
        			<td>연락처</td>
        			<td>성별</td>
        			<td>생년월일</td>
        			<td>광고수신동의여부</td>
        			<td>가입일</td>
        			<td>제재여부</td>
        		</tr>
        	
	        	<c:forEach items="${list }" var="vo">
						<tr class="userInfo" data-no=${vo.no }>
		        			<td>${vo.no }</td>
		        			<td>${vo.id }</td>
		        			<td>${vo.name }</td>
		        			<td>${vo.email }</td>
		        			<td>${vo.phone }</td>
		        			<td>
								<c:if test="${vo.gender==0 }">남자</c:if>
								<c:if test="${vo.gender==1 }">여자</c:if>
							</td>
		        			<td>${vo.birth_date }</td>
		        			<td>${vo.advertisement }</td>
		        			<td>${vo.join_date }</td>
		        			<td>${vo.restricted }</td>
		        		</tr>
	        	</c:forEach>
        	</table>
        	
        	<div>
		   		<ul class='paging'>
		            <c:if test="${paging.prev }">
		            	<li><button class="pageButton" data-page="${paging.startPage-1 }"> << </button></li>
		            </c:if>
		            <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
		            	<c:if test="${p == svo.page}">
			            	<li> <button data-page=${p }>${p }</button></li>
		                </c:if>
		                <c:if test="${p != svo.page}">
		                	<li> <button class="pageButton" data-page=${p }>${p }</button></li>
		                </c:if>
		            </c:forEach>
		            <c:if test="${paging.next }">
		            	<li><button class="pageButton" data-page="${paging.endPage+1 }"> >> </button></li>
		            </c:if>
				</ul> 
		   	</div>
		   	<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="/admin/userList.do">
					<span class="srchSelect">
						<select name="searchType">
							<option value="all">전체</option>
							<option value="no" <c:if test="${productSearchVO.searchType == 'no'}">selected</c:if>>구매자 번호</option>
							<option value="id" <c:if test="${productSearchVO.searchType == 'id'}">selected</c:if>>아이디</option>
							<option value="name" <c:if test="${productSearchVO.searchType == 'name'}">selected</c:if>>이름</option>
						</select>
					</span>
					<span class="searchWord">
						<input type="text" id="sval" name="searchWord" value="${productSearchVO.searchWord}"  title="검색어 입력">
						<input type="submit" value="검색">
					</span>
				</form>
			</div>	
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
   
<script>
	$('.pageButton').on('click', function(){
		location.href="/admin/userList.do?page=" + $(this).data('page') + "&sorttype=${productSearchVO.sorttype}&searchType=${productSearchVO.searchType}&searchWord=${productSearchVO.searchWord}";
	})
</script>
</body>
</html>