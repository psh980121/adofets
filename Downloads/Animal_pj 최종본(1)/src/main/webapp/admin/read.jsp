<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="org.iclass.dao.postDao"%>
<%@page import="org.iclass.dto.postDto"%>
<%@page import="org.iclass.dto.commentDto"%>
<%@page import="org.iclass.dao.commentDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
    int idx = 0;
    int pageNo = 0;
    
    if (request.getParameter("postidx") != null) {
       idx = Integer.parseInt(request.getParameter("postidx"));
       System.out.println(idx);
    }
    if (request.getParameter("page") != null) {
        pageNo = Integer.parseInt(request.getParameter("page"));
    }
    	System.out.println(idx);
    
    
    postDao dao = postDao.getInstance();
    dao.setReadCount(idx);
    postDto vo = dao.selectByIdx(idx);
    
    
    commentDao cmtdao = commentDao.getInstance();
    cmtdao.setCommentCount(idx);
	
    request.setAttribute("vo", vo);
    request.setAttribute("page", pageNo);

    List<commentDto> cmtlist = cmtdao.commentsList(idx);
    request.setAttribute("cmtlist", cmtlist);

    System.out.println(cmtlist);
    pageContext.forward("readView.jsp");
    %>