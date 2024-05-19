<%@page import="org.iclass.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("bt1");
	if(type == null){
		type = request.getParameter("bt2");
			if(type == null) {
				type = request.getParameter("bt3");
			}
	} 


	ProductDao dao = ProductDao.getProductDao();
	System.out.println(type);
	
	if(type.equals("전체")){
		List<ProductDto> list = dao.getProducts();
		request.setAttribute("lists", list);
		request.setAttribute("option", type);
		pageContext.forward("productsListView.jsp");
	} else {
	List<ProductDto> list = dao.getByPdttype(type);
	request.setAttribute("lists", list);
	request.setAttribute("option", type);
	pageContext.forward("productsListView.jsp");	
	}
	
	


%>
