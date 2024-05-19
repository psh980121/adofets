<%@ page import="java.util.HashMap" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="org.iclass.dto.postDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.iclass.dto.Paging" %>
<%@ page import="org.iclass.dao.postDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!-- 전체보기 -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
int pageNo;

if (request.getParameter("page") == null) {
    pageNo = 1;
} else {
    pageNo = Integer.parseInt(request.getParameter("page"));
}

postDao dao = postDao.getInstance();
int pageSize = 10; 

Paging pages = new Paging(pageNo, dao.count(), pageSize); // 변경된 부분: countAll() 함수를 호출하여 전체 게시물 수 가져오기

Map<String, Object> map = new HashMap<>();
map.put("start", pages.getStartNo());
map.put("end", pages.getEndNo());

List<postDto> list = dao.list(map); // 변경된 부분: dao.list() 함수 호출

request.setAttribute("list", list); 
request.setAttribute("today", LocalDate.now()); 

request.setAttribute("page", pageNo);
request.setAttribute("paging", pages);

pageContext.forward("listView1.jsp");
%>
</body>
</html>
