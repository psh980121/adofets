<%@page import="org.iclass.dao.buyDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.iclass.dto.buyDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<buyDto> list = (List<buyDto>) session.getAttribute("list");

if (list == null) {
%>
<script type="text/javascript">
	alert('장바구니에 상품이 없습니다.')
	location.href = 'productsListAction.jsp'
</script>
<%
} else {

buyDao dao = buyDao.getInstance();
for(buyDto item : list){
	buyDto dto = new buyDto();
    dto.setPdtcode(item.getPdtcode());
    dto.setUserid(item.getUserid());
    dto.setBuycnt(item.getBuycnt());
	dao.insertBuy(dto);
}




session.removeAttribute("list");
session.removeAttribute("count");
}
%>
<script type="text/javascript">
	alert('구매가 완료되었습니다.')
	location.href = 'productsListAction.jsp'
</script>
