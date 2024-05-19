<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QuestionDao dao = QuestionDao.getInstance();
	List<QuestionDto> dto = dao.selectProcessAd("처리중");
	request.setAttribute("question", dto);
	pageContext.forward("adQuestion.jsp");
%>