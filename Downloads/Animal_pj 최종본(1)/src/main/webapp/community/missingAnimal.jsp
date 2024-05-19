<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.iclass.dto.postDto"%>
<%@page import="org.iclass.dao.postDao"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	//로그인 기능 구현되면 주석 풀기
	usersDto dto = (usersDto) session.getAttribute("user");
	String usernick = dto.getUsernick();
	
	String path = "D:\\iclass0419\\upload"; // 파일 업로드 경로 설정
    int size = 1000 * 1024 * 1024; // 파일 최대 크기 설정 (10MB)

    MultipartRequest multiRequest = new MultipartRequest(
            request,             // 원래의 요청 객체
            path,                // 업로드 경로
            size,                // 파일 최대 크기
            "UTF-8",             // 파일명 인코딩
            new DefaultFileRenamePolicy()
    );
	
	String title = multiRequest.getParameter("postitle");
	String writer = multiRequest.getParameter("writer");
	String content = multiRequest.getParameter("postcontent");
	String postpic = multiRequest.getFilesystemName("postpic");
	
	System.out.println(title);
	postDao dao = postDao.getInstance();
	
	int idx = dao.insert(postDto.builder()
			.usernick(usernick)
			.postcontent(content)
			.likecnt(0)
			.viewcnt(0)
			.postcate("실종")
			.postitle(title)
			.commentcnt(0)
			.postpic(postpic)
			.build());
%> 
<!DOCTYPE html>
<html>
<head>
    <title>글 작성 결과</title>
    <meta charset="UTF-8">
    <script>
        alert("글이 성공적으로 작성되었습니다.");
        window.location.href = "list2.jsp";
    </script>
</head>
<body>
</body>
</html>