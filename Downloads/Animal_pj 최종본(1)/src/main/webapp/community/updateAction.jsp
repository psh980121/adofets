<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="org.iclass.dto.postDto" %>
<%@ page import="org.iclass.dao.postDao" %>
<%@ page import="org.iclass.dto.usersDto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    String path = "D:\\iclass0419\\upload"; // 파일 업로드 경로 설정
    int size = 1000 * 1024 * 1024; // 파일 최대 크기 설정 (10MB)

    MultipartRequest multiRequest = new MultipartRequest(
            request,             // 원래의 요청 객체
            path,                // 업로드 경로
            size,                // 파일 최대 크기
            "UTF-8",             // 파일명 인코딩
            new DefaultFileRenamePolicy()
    );
    int postidx = Integer.parseInt(multiRequest.getParameter("postidx"));
    String postitle = multiRequest.getParameter("postitle");
    String postcontent = multiRequest.getParameter("postcontent");
    String pageNo = multiRequest.getParameter("page");
    String postpic = multiRequest.getFilesystemName("postpic");

    postDto vo = postDto.builder()
            .postidx(postidx)
            .postitle(postitle)
            .postcontent(postcontent)
            .postpic(postpic)
            .build();

    postDao dao = postDao.getInstance();
    int result = dao.update(vo);
    if (result == 1) {
        request.setAttribute("message", "글 수정이 완료되었습니다.");
        request.setAttribute("url", "read.jsp?postidx=" + postidx + "&page=" + pageNo);
        pageContext.forward("alert.jsp");
    }
%>
</body>
</html>
