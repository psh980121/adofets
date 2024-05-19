<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dto.buyDto"%>
<%@page import="org.iclass.dao.buyDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>구매 내역</title>
</head>
<body>
    <h1>구매 내역</h1>
    <% 
        buyDao bDao = buyDao.getInstance();

    	usersDto udto = (usersDto) session.getAttribute("user");
    	String userid = udto.getUserid();
        List<buyDto> purchaseList = bDao.selectBuyByUSERID(userid);
		
        
        for (buyDto purchase : purchaseList) {
    %>
        <p>구매 번호: <%= purchase.getBuyidx() %></p>
        <p>상품 코드: <%= purchase.getPdtcode() %></p>
        <p>사용자 아이디: <%= purchase.getUserid() %></p>
        <p>구매개수: <%= purchase.getBuycnt() %></p>
        <hr>
    <%
        }
    %>
</body>
</html>
