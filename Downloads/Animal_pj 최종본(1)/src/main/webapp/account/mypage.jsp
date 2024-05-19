<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>MyPage</title>
<link rel="stylesheet" href="../css/002.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="d-flex flex-column min-vh-100 pb-0">
<%@ include file="../css/header.jsp"%>
<main style="margin-bottom: 200px; margin-top: 50px;">
<h3><c:out value="${ user.username}"/>님의 마이페이지</h3>
<a href="selectBuy.jsp">구매목록</a>
<a href="selectAdopt.jsp">입양목록</a>
<a href="delete.jsp">회원탈퇴</a>
<a href="update.jsp">내 정보 수정</a>
<a href="../question/MyQuestion.jsp">내 문의내역</a>
</main>
<%@ include file="../css/footer.jsp"%>
</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
	</script>
	<script type="text/javascript" src = "${pageContext.request.contextPath}/js/islogin.js">	</script>
</html>