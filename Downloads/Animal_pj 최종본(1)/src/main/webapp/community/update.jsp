<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.iclass.dto.postDto" %>
<%@ page import="org.iclass.dao.postDao" %>
<%@ page import="org.iclass.dto.usersDto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css?v=3">
</head>
<body>
<%
    usersDto user = (usersDto) session.getAttribute("user");
    if (user == null) /* 로그인이 안된 상태 */
        throw new IllegalAccessException();

    int idx = 0;
    int pageNo = 0;
    idx = Integer.parseInt(request.getParameter("postidx"));
    System.out.println("idx" + idx);
    pageNo = Integer.parseInt(request.getParameter("page"));
    

    postDao dao = postDao.getInstance();
    postDto vo = dao.selectByIdx(idx);

    System.out.println(vo);
    if (!user.getUsernick().equals(vo.getUsernick())) /* 로그인한 사용자와 글쓴이가 다를 때 */
        throw new IllegalAccessException();

    request.setAttribute("vo", vo);
    request.setAttribute("page", pageNo);
    pageContext.forward("updateView.jsp");
%>
</body>
</html>
