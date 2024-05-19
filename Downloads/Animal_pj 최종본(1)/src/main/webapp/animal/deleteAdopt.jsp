<%@page import="org.iclass.dao.usersDao"%>
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
   request.setCharacterEncoding("UTF-8");
   int adoptidx = Integer.parseInt(request.getParameter("aniidx"));
   String message = request.getParameter("message");

int result = usersDao.getInstance().deleteAdopt(adoptidx);
   if (result != 0) {
       // Use JavaScript alert and location in a script block
%>
      <script type="text/javascript">
           alert("삭제되었습니다");
           location.href = "ShelterAdopt.jsp";
       </script> 
<%
   } 
   // Output aniid and message
   out.print(adoptidx);
   out.print(message);
%>


</body>
</html>
