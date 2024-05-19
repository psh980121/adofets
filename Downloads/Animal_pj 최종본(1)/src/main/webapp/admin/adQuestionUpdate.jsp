<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="org.iclass.dao.QuestionDao"%>
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
	int id = Integer.parseInt(request.getParameter("adqsid"));
	request.setAttribute("qsid", id);
	
	QuestionDao dao = QuestionDao.getInstance();
	QuestionDto dto = dao.selectByQsID(id);
	
	request.setAttribute("qsdto", dto);
	pageContext.forward("adqsUpdateView.jsp");
%>

</body>
</html>