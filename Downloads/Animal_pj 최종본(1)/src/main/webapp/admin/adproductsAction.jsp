<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dto.ProductDto"%>
<%@page import="org.iclass.dao.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 처리기능 -->
	<% 
		String path = "D:\\iclass0419\\upload";
		int size = 10 * 1024 * 1024;	// 파일 전송 용량 최대 크기
		
		// 파일업로드에서는 일반적인 request 가 아닌 MultipartRequest 를 사용합니다.
		//								--> 외부 라이브러리 필요합니다.
		MultipartRequest multiRequest = new MultipartRequest(
					request,		// 원래의 요청 객체
					path,			// 업로드 경로
					size,			// 파일 최대 크기
					"UTF-8",		// 파일명 인코딩
					new DefaultFileRenamePolicy()	
					// 중복된 파일이름 변경 정책. 기본정책은 번호 붙이기
				);
		usersDto udto = (usersDto) session.getAttribute("user");
		
		
    	String id = udto.getUserid();
    	String nick = udto.getUsernick();
    	
		String pdtcode = multiRequest.getParameter("pdtcode");
		String pdtcate = multiRequest.getParameter("pdtcate");
		String pdtprice = multiRequest.getParameter("pdtprice");
		String pdtcontent = multiRequest.getParameter("pdtcontent");
		String pdtname = multiRequest.getParameter("pdtname");
		String pdttype = multiRequest.getParameter("pdttype");
		
		// 파일을 전송 받아 path 경로에 저장하고. 리턴은 받은 파일의 파일명
		String pdtpicture = multiRequest.getFilesystemName("pdtpicture");
		
	/* 	ProductDto dto = new ProductDto(
				Integer.parseInt(pdtcode), 
				pdtcate, 
				Integer.parseInt(pdtprice), 
				null, 
				pdtcontent, 
				pdtname, 
				usernick, 
				userid, 
				pdttype, 
				pdtpicture); */
		
		ProductDto dto = ProductDto.builder()
					.usernick(nick)
					.userid(id)
					.pdtcate(pdtcate)
					.pdtprice(Integer.parseInt(pdtprice))
					.pdtcontent(pdtcontent)
					.pdtname(pdtname)
					.pdtpicture(pdtpicture)
					.build();
				
		dto.setPdttype("NEW");
					
		ProductDao dao = ProductDao.getProductDao();
		int result = dao.insert(dto);
	%>
	
	<script type="text/javascript">
		alert('상품 등록이 완료되었습니다.')
		location.href='../adminindex.jsp';
	</script>
</body>
</html>

<!-- 
	private int pdtcode;		//상품코드
	private String pdtcate; 	//상품카테고리
	private int pdtprice;		//상품가격
	private Date pdtdate;		//등록날짜
	private String pdtcontent;	//상품설명
	private String pdtname;		//상품이름
	private String usernick;	//판매자닉네임
	private String userid;		//판매자ID
	private String pdttype;		//상품타입
	private String pdtpicture;	//상품사진
 -->








