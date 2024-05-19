
<%@page import="org.apache.taglibs.standard.tag.common.sql.QueryTagSupport"%>
<%@page import="org.iclass.dao.QuestionDao"%>
<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="java.sql.Date"%>
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
	String id = request.getParameter("qsid");
	String content = request.getParameter("ascontent");
	String process = "답변 완료";
	
	QuestionDto dto = QuestionDto.builder()
			.ascontent(content).qsprocess(process)
			.qsid(id).build();
	
	

	QuestionDao dao = QuestionDao.getInstance();
	dao.Update(dto);

%>
</body>
<script type="text/javascript">
	alert('답변등록완료')
	location.href = 'adQuestionAction.jsp'
</script>
</html>