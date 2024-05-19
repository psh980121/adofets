<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("status");
	
	QuestionDao dao = QuestionDao.getInstance();
	List<QuestionDto> dto;
	
	if(type.equals("전체")){
		dto = dao.getAllQuestions();
		request.setAttribute("question", dto);
		request.setAttribute("option", type);
		pageContext.forward("adQuestion.jsp");
	} else {
		dto = dao.selectProcessAd(type);
		request.setAttribute("question", dto);
		request.setAttribute("option", type);
		pageContext.forward("adQuestion.jsp");
	}

%>