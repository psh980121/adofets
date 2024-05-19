<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dao.usersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String userid = request.getParameter("userid");
	usersDao dao = usersDao.getInstance();
 	String userpass = request.getParameter("userpass");
 	String username = request.getParameter("username");
 	String usernick = request.getParameter("usernick");
 	String useremail = request.getParameter("useremail");
 	String emailformat = request.getParameter("email");
 	String userphone = request.getParameter("userphone");
 	String usercate = request.getParameter("usercate");
 	String usercity = request.getParameter("usercity");
 	int userage=0;
 	if(request.getParameter("userage") != ""){
 		userage = Integer.parseInt(request.getParameter("userage"));
 	}
	
	Integer result = dao.selectusersId(userid);
	Integer nresult = null;
	if(usernick == ""){
		
	}
	else {		
	nresult = dao.selectusersNick(usernick);
	}
	
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
	
 	request.setAttribute("sameDto", dto);
 	request.setAttribute("uemail", useremail);
 	request.setAttribute("femail", emailformat);
 	request.setAttribute("sameidresult", result);
 	request.setAttribute("samenickresult", nresult);
	pageContext.forward("signup.jsp");
	
	
	
 	
%>

<script type="text/javascript">
	
</script>