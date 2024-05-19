<%@page import="java.util.List"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dto.postDto"%>
<%@page import="org.iclass.dao.postDao"%>
<%@page import="org.iclass.dto.AdoptDto"%>
<%@page import="org.iclass.dao.AdoptDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
    void logToConsole(String message) {
        System.out.println(message);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>리뷰 제출 결과</title>
    <script>
        function redirectToPage() {
            alert("리뷰가 성공적으로 제출되었습니다.");
            window.location.href = "../community/list3.jsp";
        }
    </script>
</head>
<body>
    <h1>리뷰 제출 결과</h1>
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
        try {
            String adoptIdxStr = multiRequest.getParameter("adoptIdx");
            String postcontent = multiRequest.getParameter("postcontent");
            String postidx = multiRequest.getParameter("postidx");
    		String posttime = multiRequest.getParameter("posttime");
    		String likecnt = multiRequest.getParameter("likecnt");
    		String viewcnt = multiRequest.getParameter("viewcnt");
    		String postcate = multiRequest.getParameter("postcate");
    		String posttitle = multiRequest.getParameter("posttitle");
    		String postpic = multiRequest.getFilesystemName("postpic");
    		usersDto udto = (usersDto) session.getAttribute("user");
    		String userid = udto.getUserid();
    		String usernick = udto.getUsernick();
    		
            logToConsole("adoptIdx: " + adoptIdxStr);
            logToConsole("postcontent: " + postcontent);
            logToConsole("postpic: " + postpic);

            if (adoptIdxStr != null && postcontent != null) {
                int adoptIdx = Integer.parseInt(adoptIdxStr);

                // AdoptDao 인스턴스 생성 및 adoptIdx로 입양 정보 조회
                AdoptDao adoptDao = AdoptDao.getInstance();
                List<AdoptDto> adoption = adoptDao.selectAdoptByUSERID(userid);

                if (adoption != null) {
                    

                    // postDao 인스턴스 생성 및 postDto 생성
                    postDao dao = postDao.getInstance();
                    postDto dto = new postDto();
                    dto.setUsernick(userid);	//유저닉네임
                    dto.setLikecnt(0);			//좋아요수
                    dto.setViewcnt(0);			//조회수
                    dto.setPostcontent(postcontent);	//게시글 내용
                    dto.setPostcate("입양 후기");		//게시글 카테고리
                    dto.setPostitle(posttitle);	//게시글 제목
                    dto.setCommentcnt(0);
                    dto.setPostpic(postpic);		//게시글 첨부사진

                    // 생성한 postDto를 데이터베이스에 삽입
                    long result = dao.insert(dto);
    %>
                    <script>
                        redirectToPage();
                    </script>
    <%
                } else {
    %>
                    <p>입양 정보를 찾을 수 없습니다.</p>
    <%
                }
            } else {
                logToConsole("파라미터 값이 부족합니다.");
    %>
                <p>리뷰 제출에 실패했습니다.</p>
    <%
            }
        } catch (Exception e) {
            logToConsole("예외 발생: " + e.getMessage());
    %>
            <p>예외가 발생했습니다: <%= e.getMessage() %></p>
    <%
            e.printStackTrace();
        }
    %>
</body>
</html>
