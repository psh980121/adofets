
<%@page import="org.iclass.dao.usersDao"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 탈퇴</title>
</head>
<body>
    <form action="deleteAction.jsp?action=delete" method="post">
    <h1>회원 탈퇴</h1>
  	<label for="deleteuser">비밀번호를 입력해 주세요.</label>
  	<input id="deleteuser" type="text" name="password">
  	<button type="button" onclick="deluser()">비밀번호 확인</button>
  	<hr>	
        <input type="submit" value="회원 탈퇴">
    </form>
</body>
<script type="text/javascript">
	function deluser(){
		const frm = document.forms[0]
		const pass = frm.password.value
		
		if(pass == ''){
			alert('비밀번호를 입력해주세요.')
		}
		
		
	}
</script>
</html>
