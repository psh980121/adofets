<%@page import="org.iclass.dao.ProductDao"%>
<%@page import="org.iclass.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	int pdtcode = Integer.parseInt(request.getParameter("pdtcode"));

	ProductDto dto = ProductDto.builder().pdtcode(pdtcode).build();
	ProductDao dao = ProductDao.getProductDao();
	dao.delete(pdtcode);
%>

<script type="text/javascript">
	alert('상품 삭제가 완료되었습니다.')
	location.href = "adproductsListAction.jsp"
</script>