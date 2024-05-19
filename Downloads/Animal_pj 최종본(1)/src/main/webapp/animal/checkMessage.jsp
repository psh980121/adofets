<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dto.Message"%>
<%@page import="org.iclass.dao.usersDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 확인</title>

</head>
<body>
	<div class="container"
		style="max-width: 800px; margin: 0 auto; padding: 20px; background-color: #fff; box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);">
		<h1>메세지 확인</h1>
		<%
		  usersDto udto = (usersDto) session.getAttribute("user");
		  String useridd = null;

		  if (udto != null) {
		    useridd = udto.getUserid();
		  
			List<Message> messages = usersDao.getInstance().checkMessage(useridd);
		for (Message item : messages) {
		  %>
		<div class="message"
			style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px; background-color: #fff;">
			<p>
				<strong>ID:</strong>
				<%=item.getUserid()%></p>
			<p>
				<strong>메세지:</strong>
				<%=item.getMessage()%></p>
			<p>
				<strong>동물ID:</strong>
				<%=item.getAniid()%></p>
		</div>
		
		
		
		<%
			}
		}
		%>
	</div>
</body>
</html>
