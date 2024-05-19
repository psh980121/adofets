<%@page import="org.iclass.dao.usersDao"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%
    // 사용자로부터 전달받은 userId 파라미터 받기
          usersDto udto = (usersDto) session.getAttribute("user");
       String userid = udto.getUserid();

    // 사용자가 수정한 정보를 받아옵니다.
    String userCate = request.getParameter("usercate");
    String userPass = request.getParameter("userpass");
    String username = request.getParameter("username");
    String userNick = request.getParameter("usernick");
    int userAge = Integer.parseInt(request.getParameter("userage"));
    String userCity = request.getParameter("usercity");
    String userEmail = request.getParameter("useremail");
    String userPhone = request.getParameter("userphone");

    // UserDto 객체를 생성하여 사용자가 수정한 정보를 저장합니다.
    usersDto updatedUser = usersDto.builder().usernick(userNick).userage(userAge).userpass(userPass)
                          .username(username).usercity(userCity).useremail(userEmail)
                          .userphone(userPhone).userid(userid).build();
    

    // UserDao 객체를 생성합니다.
     usersDao dao = usersDao.getInstance();

    // UserDao의 updateUser 메서드를 호출하여 사용자 정보를 업데이트합니다.
    int result = dao.updateUser(updatedUser);
   
   
 
%>
<script>
	location.href ='update.jsp';
</script>