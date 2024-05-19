<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="org.iclass.dto.postDto"%>
<%@page import="org.iclass.dao.postDao"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//    request.setCharacterEncoding("UTF-8");  //filter가 실행함.   

  usersDto dto = (usersDto) session.getAttribute("user");
    
    
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
    String usernick = dto.getUsernick();
    String content = multiRequest.getParameter("postcontent");
    String postpic = multiRequest.getFilesystemName("postpic");
    
 postDao dao = postDao.getInstance();
    
    int idx = dao.insert(postDto.builder()
            .usernick(usernick)
            .postcontent(content)
            .likecnt(0)
            .viewcnt(0)
            .postcate("유기동물 보호 게시판")
            .postitle(title)
            .commentcnt(0)
            .postpic(postpic)
            .build());
%>
<script type="text/javascript">
   alert('글 등록이 완료되었습니다.')
   location.href='list.jsp'
</script>