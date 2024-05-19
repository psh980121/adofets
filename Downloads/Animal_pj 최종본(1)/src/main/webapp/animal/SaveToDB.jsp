<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dto.AdoptDto"%>
<%@page import="org.iclass.dao.animalDao"%>
<%@page import="org.iclass.dto.AdoptDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String aniid = request.getParameter("desertionNo");
String adoptDate= request.getParameter("selectedDate");
String filename = request.getParameter("filename");
usersDto udto = (usersDto) session.getAttribute("user");
String id = udto.getUserid();

AdoptDto dto = AdoptDto.builder() 
.adoptdate(adoptDate).aniid(aniid).userid(id).filename(filename).build();
animalDao.getInstance().insertMeeting(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청 완료</title>
</head>
<body>
<script>
// 신청이 완료되었습니다. 메시지 표시
alert('신청이 완료되었습니다.');

// 첫 페이지로 리디렉션
window.opener.location.href = 'listAnimal2.jsp';
window.close();
</script>
console.log(<%=filename%>)
</body>
</html>

