<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dto.AdoptDto"%>
<%@page import="org.iclass.dao.AdoptDao"%>
<%@page import="java.util.List"%> 

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>입양 내역</title>
</head>
<body>
    <h1>입양 내역</h1>
    <% 
        // AdoptDao의 인스턴스 생성
        AdoptDao adoptDao = AdoptDao.getInstance();
		usersDto udto = (usersDto) session.getAttribute("user");
		String userid = udto.getUserid();
        // 사용자 ID에 해당하는 입양 내역 조회
        List<AdoptDto> adoptionList = adoptDao.selectAdoptByUSERID(userid);

        // 조회된 입양 내역 출력
        for (AdoptDto adoption : adoptionList) {
    %>
        <p>입양번호: <%= adoption.getAdoptidx() %></p>
        <p>동물 아이디: <%= adoption.getAniid() %></p>
        <p>입양날짜: <%= adoption.getAdoptdate() %></p>
        <hr>
    <%
        }
    %>
</body>
</html>
