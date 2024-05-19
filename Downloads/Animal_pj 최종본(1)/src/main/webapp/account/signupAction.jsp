<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="org.iclass.dto.shelterDto"%>
<%@page import="org.iclass.dao.shelterDao"%>
<%@page import="org.iclass.dao.usersDao"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
 	String userid = request.getParameter("userid");
 	String userpass = request.getParameter("userpass");
 	String username = request.getParameter("username");
 	String usernick = request.getParameter("usernick");
 	String useremail = request.getParameter("useremail");
 	String emailformat = request.getParameter("email");
 	String userphone = request.getParameter("userphone");
 	String usercate = request.getParameter("usercate");
 	String usercity = request.getParameter("usercity");
 	int userage = Integer.parseInt(request.getParameter("userage"));
 	
 	usersDao dao = usersDao.getInstance();
 	usersDto dto = usersDto.builder()
 			.userid(userid)
 			.userpass(userpass)
 			.username(username)
 			.usernick(usernick)
 			.useremail(useremail+'@'+emailformat)
 			.userphone(userphone)
 			.usercate(usercate)
 			.usercity(usercity)
 			.userage(userage)
 			.build();
 	
 	int result = dao.insert(dto);
 	
 	System.out.println(usercate);
 	
 	
 	
 %>
 
 <script type="text/javascript">
 location.href = "http://localhost:8081/Animal_pj/index.jsp"
 </script>