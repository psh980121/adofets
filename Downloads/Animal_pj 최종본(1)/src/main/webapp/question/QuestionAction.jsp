<%@page import="org.iclass.dto.usersDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.iclass.dao.QuestionDao"%>
<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="java.util.Date"%>
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
String path = "d:\\iclass0419\\upload";
int size = 10*1024*1024;      // 파일 전송 용량 최대 크기

// 파일 업로드에서는 일반적인 request 가 아닌 MultipartRequest 를 사용합니다.
//                        --> 외부 라이브러리 필요합니다.
MultipartRequest multiRequest = new MultipartRequest(
		   	request,			//원래의 요청 객체
		   	path,				//업로드 경로
		   	size,				//파일 최대 크기
		   	"UTF-8",			//파일명 인코딩
		   	new DefaultFileRenamePolicy()	//중복된 파일이름 변경 정책
		   	);

	request.setCharacterEncoding("UTF-8");

	
	String qscategory= multiRequest.getParameter("qscategory");
	String qstitle = multiRequest.getParameter("qstitle");
	String userid = multiRequest.getParameter("userid");
	
	 usersDto udto = (usersDto) session.getAttribute("user"); 
	
	
	String qsprocess =multiRequest.getParameter("qsprocess");
	String sdate = multiRequest.getParameter("sdate");
	String qscontent = multiRequest.getParameter("qscontent");
	String picture = multiRequest.getFilesystemName("picture");
	if (picture == null){
		picture = null;
	
	}
	QuestionDao dao = QuestionDao.getInstance();
	QuestionDto dto = QuestionDto.builder()
			 .qscategory(qscategory)
			 .qstitle(qstitle)
			// .userid(userid)
			 .userid(udto.getUserid()) 
			 .qsprocess("처리중")
			 .qscontent(qscontent)
			 .picture(picture)
			 .build();
	
	dao.insert(dto);
			 
			 
	 
%>
<script type="text/javascript">
	alert('문의 내용이 접수되었습니다.')
	location.href='MyQuestion.jsp'
</script>
</body>
</html>