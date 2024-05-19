<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.iclass.dto.Paging"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.QuestionDao"%>
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
if (request.getParameter("page") == null)
    pageNo = 1;
else
    pageNo = Integer.parseInt(request.getParameter("page"));

String status = request.getParameter("status"); // status 파라미터를 받아옴
if(status == null) {
	status = "all";
}
int pageSize = 10; // 한 페이지에 보여줄 글의 수를 10으로 설정

usersDto udto = (usersDto) session.getAttribute("user"); 
String id = udto.getUserid();
QuestionDao dao = QuestionDao.getInstance();
System.out.println(id);
//전체, 처리중, 답변 완료 동일하게 검색과 페이징
Map<String, Object> pmap = new HashMap<>();
pmap.put("userid", id); // 요청된 페이지 번호로 글 목록 시작 번호
pmap.put("qsprocess", status); //
System.out.println(pmap);
System.out.println(status);


Paging pages = new Paging(pageNo, dao.count(pmap), pageSize);
pmap.put("start", pages.getStartNo()); // 요청된 페이지 번호로 글 목록 시작 번호
pmap.put("end", pages.getEndNo()); //

List<QuestionDto> list = dao.processList(pmap);

request.setAttribute("list", list); // 메인글 목록
request.setAttribute("today", LocalDate.now()); // 오늘 날짜
request.setAttribute("page", pageNo); // 현재 페이지 번호
request.setAttribute("paging", pages);

/* if (status == null || "전체".equals(status)) {
    question = dao.selectAllbyId(id);
} else if ("처리중".equals(status) || "답변 완료".equals(status)) {
    question = dao.selectProcess(map); // map을 전달
} else {
    // 다른 상태 처리 로직 추가
    // 예: 기본적으로 전체 상태로 처리하거나 에러 처리 등
    question = dao.selectAllbyId(id);
} */

/* // 문의내역을 10개씩 페이징하여 가져오도록 수정
int startIndex = (pageNo - 1) * pageSize;
int endIndex = pageNo * pageSize;

List<QuestionDto> displayedQuestion = new ArrayList<>();

if (question != null) {
    int totalSize = question.size();
    
     // 시작 인덱스부터 끝 인덱스까지의 문의내역을 가져옴
    for (int i = startIndex; i < endIndex && i < totalSize; i++) {
        displayedQuestion.add(question.get(i));
    }
}  */

// request.setAttribute("question", displayedQuestion);
request.setAttribute("option", status);
pageContext.forward("MyQuestionView.jsp");
%>
</body>
</html>