<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dao.usersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 정보 수정</title>
</head>
<body>
    <%
    // 사용자로부터 전달받은 userId 파라미터 받기
    //String userId = request.getParameter("userId");
   	usersDto udto = (usersDto) session.getAttribute("user");
	String userid = udto.getUserid();
    
    // UserDao 객체를 생성
    usersDao uDao = usersDao.getInstance();
    
    // UserDao의 selectUserByUSERID 메서드를 호출하여 userId를 매개변수로 전달하여 사용자 정보를 조회
    // SQL 쿼리에서 userId를 문자열로 사용하려고 작은따옴표로 감싸줌
    usersDto userList = uDao.selectUserByUSERID(userid);

    // 조회된 사용자 정보 리스트의 크기가 1인 경우에만 해당 사용자의 정보를 가져와서 처리합니다.
    if (userList != null) {
        // userList에서 첫 번째 사용자 정보를 가져옵니다.
        	
%>
    
    <form action="updateAction.jsp" method="post">
        <input type="hidden" name="userid" value="<%= userList.getUserid() %>">
        <label for="usercate">User Category:</label>
        <input type="text" id="usercate" name="usercate" value="<%= userList.getUsercate() %>"><br>
        <label for="userpass">Password:</label>
        <input type="text" id="userpass" name="userpass" value="<%= userList.getUserpass() %>"><br>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<%= userList.getUsername() %>"><br>
        <label for="usernick">Nickname:</label>
        <input type="text" id="usernick" name="usernick" value="<%= userList.getUsernick() %>"><br>
        <label for="userage">Age:</label>
        <input type="number" id="userage" name="userage" value="<%= userList.getUserage() %>"><br>
        <label for="usercity">City:</label>
        <input type="text" id="usercity" name="usercity" value="<%= userList.getUsercity() %>"><br>
        <label for="useremail">Email:</label>
        <input type="email" id="useremail" name="useremail" value="<%= userList.getUseremail() %>"><br>
        <label for="userphone">Phone:</label>
        <input type="tel" id="userphone" name="userphone" value="<%= userList.getUserphone() %>"><br>
        <input type="submit" value="Update">
    </form>
    
    <%
        } else {
    %>
    
    <p>유저를 찾을수 없음</p>
    
    <%
        }
    %>
</body>
</html>
