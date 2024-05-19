
<%@page import="org.iclass.dao.usersDao"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 탈퇴</title>
</head>
<body>
    <h1>회원 탈퇴</h1>
    <form action="deleteAction.jsp?action=delete" method="post">
  	<label for="deleteuser">비밀번호를 입력해 주세요.</label>
  	<input id="deleteuser" type="text" name="password" value="${pass}">
  	
  	<hr>	
        <button type="button" onclick="delpass()">회원탈퇴</button>
	<c:if test="${samepass == 0 }">
	<input type="hidden" name="isSames" value="2">
	<p>비밀번호 불일치.</p>
	</c:if>
    </form>
</body>
<script type="text/javascript">
	function delpass(){
		const frm = document.forms[0]
		const pass = frm.password.value
		
		if(pass == ''){
			alert('비밀번호를 입력해주세요.')
		} else {
			const frm = document.forms[0]
			frm.action = 'passwordSame.jsp'
			frm.submit()
		}			
	}
	
</script>
</html>
