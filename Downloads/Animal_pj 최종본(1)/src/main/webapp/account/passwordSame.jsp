<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dao.usersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String password = request.getParameter("password");

	usersDao dao = usersDao.getInstance();
	
	int result = dao.selectusersPass(password);
	
	if(result == 0){
	request.setAttribute("pass", password);
	request.setAttribute("samepass", result);
	pageContext.forward("../mypage/update.jsp");	
	} else{
			
		usersDto udto = (usersDto) session.getAttribute("user");
		String userId = udto.getUserid();
		System.out.println(userId);
        usersDao userDao = usersDao.getInstance();
        int deletedRowCount = userDao.deleteUserById(userId);
       
        
        
        request.setAttribute("message", "회원탈퇴가 완료되었습니다.");
        request.setAttribute("url", "../index.jsp");
        session.invalidate();
        pageContext.forward("alert.jsp");
        
		
	}
	

%>