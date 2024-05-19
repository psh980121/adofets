<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dao.usersDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = request.getParameter("userid");
		String password = request.getParameter("userpass");
		System.out.println(id);
		System.out.println(password);
		//할일 : dao 로 id,password 확인하는 메소드 실행
		Map<String, String> map = new HashMap<>();
		map.put("userid", id);
		map.put("userpass", password);
		usersDao dao = usersDao.getInstance();
		usersDto dto = dao.login(map);
		
		String url = request.getContextPath();
		String back = (String) session.getAttribute("back");
		if (dto != null) {
		session.setAttribute("user", dto);	
	//로그인 성공
		if(dto.getUsercate().equals("관리자")){
			System.out.println(dto.getUsercate());
			url="adminindex.jsp";
			session.removeAttribute("back");
		} 

	if (back != null) {
		
			url = back;
			session.removeAttribute("back"); //back 이름의 애트리뷰트 삭제
		}
		
	
	
	
		} else { //로그인 실패
	url = "login.jsp?incorrect=y";
		}
		
		response.sendRedirect(url);
%>