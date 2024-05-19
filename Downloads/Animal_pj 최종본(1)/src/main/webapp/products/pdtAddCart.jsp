<%@page import="org.iclass.dao.ProductDao"%>
<%@page import="org.iclass.dto.buyCartDto"%>
<%@page import="org.iclass.dao.buyDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.iclass.dto.buyDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<buyDto> list = (List<buyDto>) session.getAttribute("list");
	List<buyCartDto> cartlist = (List<buyCartDto>) session.getAttribute("cartlist");
	Integer  count = (Integer) session.getAttribute("count");
	if(list == null){
		list = new ArrayList<>();
		session.setAttribute("list", list);
	}
	if(cartlist == null){
		cartlist = new ArrayList<>();
		session.setAttribute("cartlist", cartlist);
	}
	if(count == null){
		count = 0;
		session.setAttribute("count", count);
	}
	
	usersDto udto = (usersDto) session.getAttribute("user");
	String id = udto.getUserid();
	
	int pdtCode = Integer.parseInt(request.getParameter("pcode"));
	int buyCnt = Integer.parseInt(request.getParameter("bcnt"));
	
	ProductDao dao = ProductDao.getProductDao();
	buyDto dto = buyDto.builder().buycnt(buyCnt).pdtcode(pdtCode).userid(id).build(); 
	list.add(dto);
	
	buyCartDto bcdto = dao.getCart(dto.getPdtcode());
	bcdto.setBuycnt(buyCnt);
	cartlist.add(bcdto);
	count += 1;
	
	
	
	session.setAttribute("count", count);
	session.setAttribute("list", list);
	session.setAttribute("cartlist", cartlist);
	
	
	
%>
<script type="text/javascript">
	alert('장바구니에 추가되었습니다!')
	location.href = 'productsListAction.jsp'
</script>