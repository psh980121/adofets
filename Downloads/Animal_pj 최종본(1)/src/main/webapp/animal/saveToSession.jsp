<%@page import="org.iclass.dto.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>save to Session</title>
</head>
<body>
<h1>세션 저장확인</h1>
   <% 
   request.setCharacterEncoding("UTF-8");
    String desertionNo = request.getParameter("desertionNo");
    String age = request.getParameter("age");
    String careNm = request.getParameter("careNm");
    String careAddr = request.getParameter("careAddr");
    String happenDt = request.getParameter("happenDt");
    String filename = request.getParameter("filename");
    String colorCd = request.getParameter("colorCd");
    String weight = request.getParameter("weight");
    String processState = request.getParameter("processState");
    String sexCd = request.getParameter("sexCd");
    String neuterYn = request.getParameter("neuterYn");
    String specialMark = request.getParameter("specialMark");
    
    
    
    
    Animal dto = Animal.builder().
    		desertionNo(desertionNo).
    		age(age).
    		careNm(careNm).
    		careAddr(careAddr).
    		happenDt(happenDt).
    		filename(filename).
    		colorCd(colorCd).
    		weight(weight).
    		processState(processState).
    		sexCd(sexCd).
    		neuterYn(neuterYn).
    		specialMark(specialMark).
    		build();
    		
    session.setAttribute("Animal", dto);
    
    
    
    response.sendRedirect("../account/adoptreq.jsp");
    %>
</body>

</html>