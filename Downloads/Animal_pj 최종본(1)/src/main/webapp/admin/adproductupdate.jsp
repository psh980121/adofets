<%@page import="org.iclass.dao.ProductDao"%>
<%@page import="org.iclass.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	
	String name = request.getParameter("pdtname");
	String cate = request.getParameter("pdtcate");
	String content = request.getParameter("pdtcontent");
	int pdtcode = Integer.parseInt(request.getParameter("pdtcode"));
	int pdtprice = Integer.parseInt(request.getParameter("pdtprice"));

	ProductDto dto = ProductDto.builder().pdtcate(cate)
			.pdtcontent(content)
			.pdtname(name)
			.pdtcode(pdtcode)
			.pdtprice(pdtprice)
			.build();
	
	ProductDao dao = ProductDao.getProductDao();
	
	dao.update(dto);
	

%>
<script type="text/javascript">
	alert('상품 정보 수정이 완료되었습니다.')
	location.href = "adproductsListAction.jsp"
</script>