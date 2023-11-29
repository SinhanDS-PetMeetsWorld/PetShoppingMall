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
    <form name="regist_form" action="regist.do" method="post">
        <div>
            아이디*<br>
            <input type="text" name="id">
            <button>아이디 중복 확인</button>
        </div>
        <hr>
        <div>
            성명*<br>
            <input type="text" name="name">
        </div>
        <hr>
        <div>
            이메일*<br>
            <input type="text" name="" disabled>
            <button>이메일 인증</button>
        </div>
        <hr>
        
        <div>
            주소
            <div><input type="text" name="zipcode" disabled placeholder="우편번호"> <button>우편번호 검색</button></div>
            <div><input type="text" name="addr1" disabled placeholder="기본주소"></div>
            <div><input type="text" name="addr2" placeholder="상세주소"></div>
        </div>
        <hr>
        
        <div>
            비밀번호*<br>
            <input type="password" name="password">
        </div>
        <div>
            비밀번호 확인*<br>
            <input type="password">
        </div>
        <hr>
        <div>
            연락처*<br>
            <input type="text" maxlength="3" value="010" name="phone0"> - <input type="text" maxlength="4" placeholder="XXXX" name="phone1"> - <input type="text" maxlength="4" placeholder="XXXX" name="phone2">
        </div>
        <hr>
        <div>
            생년월일*<br>
            <input type="text" maxlength="4" placeholder="YYYY" name="birth0"> <input type="text" maxlength="2" placeholder="MM" name="birth1"> <input type="text" maxlength="2" placeholder="DD" name="birth2">
        </div>
        <hr>
        <div>
            성별 * 
            <input type="radio" name="gender" value="0">남자
            <input type="radio" name="gender" value="1">여자
        </div>
        <hr>
        <div>
            <input type="checkbox" name="advertisement"> 광고성 마케팅 수신 동의(선택사항)
        </div>
        <hr>
        <div>
            <input type="submit" value="가입하기">
        </div>
    </form>
</body>
</html>