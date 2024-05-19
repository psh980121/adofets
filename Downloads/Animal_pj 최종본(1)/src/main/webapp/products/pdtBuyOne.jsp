<%@page import="org.iclass.dao.buyDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.iclass.dto.buyDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	usersDto udto = (usersDto) session.getAttribute("user");
	String id = udto.getUserid();
	
	int pdtCode = Integer.parseInt(request.getParameter("pcode"));
	int buyCnt = Integer.parseInt(request.getParameter("bcnt"));
	
	
	buyDto dto = buyDto.builder().buycnt(buyCnt).pdtcode(pdtCode).userid(id).build(); 
	
	
	buyDao dao = buyDao.getInstance();
	
	dao.insertBuy(dto);
%>
<script type="text/javascript">
		alert('구매가 완료되었습니다.')
		location.href = 'productsListAction.jsp'
</script>