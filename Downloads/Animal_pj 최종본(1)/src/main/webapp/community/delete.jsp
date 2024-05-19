<%@page import="org.iclass.dao.postDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int commentidx = Integer.parseInt(request.getParameter("postidx"));
	String pageNo = request.getParameter("page");
	
	postDao dao = postDao.getInstance();
	if(dao.delete(commentidx)==1){
		request.setAttribute("message", "글번호 " + commentidx +" 삭제되었습니다.");
		request.setAttribute("url", "list.jsp?page="+pageNo);
	}
		pageContext.forward("alert.jsp");	
%>
</body>
</html>