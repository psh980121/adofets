<%@page import="org.iclass.dao.commentDao"%>
<%@page import="org.iclass.dto.commentDto"%>
<%@page import="org.iclass.dto.usersDto"%>
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
	int commentidx = 0;
    int postidx = 0;
    int pageNo = 0;
    
    String f = request.getParameter("f");
    commentDao dao = commentDao.getInstance();

    if (request.getParameter("postidx") != null) {
    	postidx = Integer.parseInt(request.getParameter("postidx"));
        System.out.println(postidx);
        commentidx = Integer.parseInt(request.getParameter("commentidx"));
    }
    if (request.getParameter("page") != null) {
        pageNo = Integer.parseInt(request.getParameter("page"));
    }
    System.out.println(page);
    System.out.println(postidx);

    
    
    if (f.equals("1")) { 
        String commentContent = request.getParameter("commentContent");
        String usernick = request.getParameter("commentnick");
        usersDto user = (usersDto) session.getAttribute("user");
        String userid = request.getParameter("userid");
        
        // 이제 commentid를 사용할 수 있습니다.
       
        
        
        
        commentDto dto = commentDto.builder()
        		.commentidx(commentidx)
                .commentContent(commentContent)
                .commentnick(usernick)
                .postidx(postidx)
                .build();
        
        if (dao.insert(dto) == 1) { // 댓글 저장 완료
            dao.setCommentCount(postidx); // 댓글 갯수 새로 구하기
            request.setAttribute("message", "댓글 등록이 완료되었습니다.");
        }

    } else if (f.equals("2")) { 
        if (dao.delete(commentidx) == 1) {
            dao.setCommentCount(postidx); // 댓글 갯수 새로 구하기
            request.setAttribute("message", "댓글 삭제 완료되었습니다.");
        }
    } else {
        throw new IllegalAccessException();
    }

    String redirectUrl = "read.jsp?postidx=" + postidx + "&page=" + pageNo;
    request.setAttribute("url", redirectUrl);
    pageContext.forward("alert.jsp");
%>

</body>
</html>