<%@page import="java.util.List"%>
<%@ page import="org.iclass.dto.QuestionDto"%>
<%@ page import="org.iclass.dao.QuestionDao"%>
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
	
	int id = Integer.parseInt(request.getParameter("qsid"));
	request.setAttribute("qsid", id);
	
	QuestionDao dao = QuestionDao.getInstance();
	QuestionDto dto = dao.selectDetail(id);
	
	request.setAttribute("dto", dto);
	pageContext.forward("QuestionDetail.jsp");
%>


</body>
</html>