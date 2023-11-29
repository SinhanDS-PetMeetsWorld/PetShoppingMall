<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <hr>
    <h2>회원 가입</h2>
    <hr>
    <div>
        <a href="">판매자로 가입하기</a>
    </div>
    <hr>
    <form>
        <div>
            아이디*<br>
            <input type="text">
            <button>아이디 중복 확인</button>
        </div>
        <hr>
        <div>
            성명*<br>
            <input type="text">
        </div>
        <hr>
        <div>
            이메일*<br>
            <input type="text" disabled>
            <button>이메일 인증</button>
        </div>
        <hr>
        
        <div>
            주소
            <div><input type="text" disabled placeholder="우편번호"> <button>우편번호 검색</button></div>
            <div><input type="text" disabled placeholder="기본주소"></div>
            <div><input type="text" placeholder="상세주소"></div>
        </div>
        <hr>
        
        <div>
            비밀번호*<br>
            <input type="password">
        </div>
        <div>
            비밀번호 확인*<br>
            <input type="password">
        </div>
        <hr>
        <div>
            연락처*<br>
            <input type="text" maxlength="3" value="010"> - <input type="text" maxlength="4" placeholder="XXXX"> - <input type="text" maxlength="4" placeholder="XXXX">
        </div>
        <hr>
        <div>
            생년월일*<br>
            <input type="text" maxlength="4" placeholder="YYYY"> <input type="text" maxlength="2" placeholder="MM"> <input type="text" maxlength="2" placeholder="DD">
        </div>
        <hr>
        <div>
            성별 * 
            <input type="radio" name="gender" value="0">남자
            <input type="radio" name="gender" value="1">여자
        </div>
        <hr>
        <div>
            <input type="checkbox"> 광고성 마케팅 수신 동의(선택사항)
        </div>
        <hr>
        <div>
            <input type="submit" value="가입하기">
        </div>
    </form>
</body>
</html>