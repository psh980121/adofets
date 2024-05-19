<%@page import="java.time.LocalDate"%>
<%@page import="org.iclass.dto.postDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.iclass.dto.Paging"%>
<%@page import="org.iclass.dao.postDao"%>
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
int pageNo;

// 페이지 번호를 파라미터로 받습니다.
if (request.getParameter("page") == null) pageNo = 1;
else pageNo = Integer.parseInt(request.getParameter("page"));

postDao dao = postDao.getInstance();
int pageSize = 10;    // 한 페이지에 몇 개의 글 개수인가?

// 카테고리를 파라미터로 받습니다.

Paging pages = new Paging(pageNo, dao.countByCategory("유기동물 보호 게시판"), pageSize);

Map<String, Object> map = new HashMap<>();
map.put("start", pages.getStartNo());    // 요청된 페이지번호로 글목록 시작번호
map.put("end", pages.getEndNo());        // 마지막번호
map.put("category", "유기동물 보호 게시판");           // 카테고리

List<postDto> list = dao.pagelistByCategory(map); // SQL 실행
request.setAttribute("list", list);     // 메인 글 목록
request.setAttribute("today", LocalDate.now()); // 오늘 날짜

// 페이지 번호를 애트리뷰트로 저장
request.setAttribute("page", pageNo);
request.setAttribute("paging", pages);
pageContext.forward("listView2.jsp");



%>
</body>
</html>
