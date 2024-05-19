<%@page import="java.util.ArrayList"%>
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

        if (udto != null) {
            String userid = udto.getUserid();

            if (userid != null) {
                List<buyDto> buyInfoList = bDao.selectBuyByUSERID(userid);

                if (!buyInfoList.isEmpty()) {
                    for (buyDto purchase : buyInfoList) {
    %>
                        <p>구매 번호: <%= purchase.getBuyidx() %></p>
                        <p>상품 코드: <%= purchase.getPdtcode() %></p>
                        <p>사용자 아이디: <%= purchase.getUserid() %></p>
                        <p>구매 개수: <%= purchase.getBuycnt() %></p>

                        <form action="reviewActionBuy.jsp" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="buyidx" value="<%= purchase.getBuyidx() %>">
                            <label for="posttitle">리뷰 제목:</label>
                        <input type="text" name="posttitle" placeholder="리뷰 제목">
                        <label for="postcontent">리뷰 작성란:</label>
                        <textarea name="postcontent" rows="10" cols="100" placeholder="리뷰 작성"></textarea>
                       <label for="postpic">첨부 파일:</label>
                       
                        <input type="file" name="postpic" accept="image/jpg">
                            <button type="submit">리뷰 제출</button>
                            
                        </form>
                        
                        <hr>
    <%
                    }
                } else {
    %>
                    <p>구매 내역이 없습니다.</p>
    <%
                }
            } else {
    %>
                <p>사용자 아이디가 null입니다.</p>
    <%
            }
        } else {
    %>
            <p>로그인한 사용자 정보를 찾을 수 없습니다.</p>
    <%
        }
    %>
</body>
</html>
