<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        배송지 추가
        <form action="">
            <div>
                <input type="text" placeholder="받는이 성명" name="name">
            </div>
            <div>
                <input type="text" placeholder="전화번호" name="phone">
            </div>
            <div>
                주소
                <div><input type="text" readonly placeholder="우편번호" name="zipcode"> <button>우편번호 검색</button></div>
                <div><input type="text" readonly placeholder="기본주소" name="arr1"></div>
                <div><input type="text" placeholder="상세주소" name="arr2"></div>
            </div>
            <div>
                <input type="text" placeholder="별칭(ex:집)" name="comment">
            </div>
            <div>
                <input type="submit" value="입력 완료">
            </div>
            
        </form>
    </div>
</body>
</html>