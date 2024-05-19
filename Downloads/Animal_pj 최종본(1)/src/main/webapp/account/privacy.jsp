<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>개인정보 제공 동의</h3>


<div>
<p>
입양신청을 하기 위한 이용약관입니다. 확인해주세요.
</p>
<input type="checkbox" id="form1">
<label for="form1"></label>
</div>

<div>
<p>
개인정보 제공에 동의하십니까 ? 
</p>
<input type="checkbox" id="form2">
<label for="form2"></label>
</div>

<div>
<p>
이벤트 및 광고성 문자 수신
</p>
<input type="checkbox" id="form3">
<label for="form3"></label>
</div>

<button onclick="privacy()" type="button">다음</button>
</body>
<script type="text/javascript" src = " ../js/privacy.js"></script>
</html>