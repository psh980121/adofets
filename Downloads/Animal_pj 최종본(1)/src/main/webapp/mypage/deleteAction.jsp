
<%@page import="org.iclass.dao.usersDao"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 탈퇴 처리</title>
</head>
<body>
    <h1>회원 탈퇴 처리</h1>
    
    <%
        if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
       		usersDto udto = (usersDto) session.getAttribute("user");
        	
        	String userId = udto.getUserid();
            usersDao userDao = usersDao.getInstance();
            int deletedRowCount = userDao.deleteUserById(userId);
            
            if (deletedRowCount > 0) {
    %>
            <p>회원 탈퇴가 완료되었습니다.</p>
    <%
            } else {
    %>
            <p>회원 탈퇴에 실패했습니다.</p>
    <%
            }
        } else {
    %>
            <p>잘못된 요청입니다.</p>
    <%
        }
    %>
    
    <p><a href="${pageContext.request.contextPath}">홈으로 돌아가기</a></p>
</body>
</html>
