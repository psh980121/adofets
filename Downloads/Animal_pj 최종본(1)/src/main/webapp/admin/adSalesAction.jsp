<%@page import="java.util.List"%>
<%@page import="org.iclass.dto.productsSalesDto"%>
<%@page import="org.iclass.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	ProductDao dao = ProductDao.getProductDao();

	List<productsSalesDto> dto = dao.Sales();
	request.setAttribute("sales", dto);
	pageContext.forward("adSalesView.jsp");
%>