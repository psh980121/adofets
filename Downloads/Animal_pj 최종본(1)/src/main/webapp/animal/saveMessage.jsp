<%@page import="org.iclass.dao.usersDao"%>
<%@page import="org.iclass.dto.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸메세지확인</title>
</head>
<body>
<%
    // 입력 폼에서 전송된 데이터 가져오기
    request.setCharacterEncoding("UTF-8");
    String message = request.getParameter("message");
    String userid = request.getParameter("userid");
    String animalId = request.getParameter("aniid");

    Message dto = new Message(userid,animalId,message);
    usersDao dao = usersDao.getInstance();
    int result = dao.sendMessage(dto);
    
    if (result > 0) {
        // 메시지 전송이 완료되었을 때 팝업 창을 띄우고 메시지를 표시
        out.println("<script>alert('메시지 전송이 완료되었습니다.'); window.close();</script>");
    } else {
        // 메시지 전송 중 오류가 발생한 경우 오류 메시지를 팝업 창으로 표시
        out.println("<script>alert('메시지 전송 중 오류가 발생했습니다.'); window.close();</script>");
    }
    		
%>
</body>
</html>