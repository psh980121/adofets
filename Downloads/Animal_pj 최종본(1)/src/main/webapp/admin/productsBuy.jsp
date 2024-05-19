<%@page import="org.iclass.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% 
		int pdtcode = Integer.parseInt(request.getParameter("pdtbuy"));
		ProductDao dao = ProductDao.getProductDao();
		ProductDto dto = dao.getByPdtcode(pdtcode);
		
		request.setAttribute("dto", dto);
		pageContext.forward("productsBuyView.jsp");
	%>