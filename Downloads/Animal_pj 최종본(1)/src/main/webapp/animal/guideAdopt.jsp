<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양안내</title>
<style type="text/css">
	main img {
		width: 50%;
		height: 50%;
	
	}
</style>

<link rel="stylesheet" href="../css/002.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100 pb-0">
	<!-- 헤더 시작, 밝은 테마 -->
	<%@ include file="../css/header.jsp"%>

	<main style="margin-bottom: 200px; text-align: center;">

		<div id="mainTitle">
<hr>
<img alt="" src="adoptCaution.png">
<div id=adoptStep1>
<img alt="" src="adoptOrder1.png">
</div>
<div>
<img alt="" src="adoptOrder2.png">
</div>
<div>
<img alt="" src="adoptOrder3.png">
</div>
<div>
<img alt="" src="adoptOrder4.png">
</div>
<button type="button" onclick="location.href='listAnimal2.jsp'" class="btn btn-warning">친구들 보러가기</button>
</main>
	<!-- 푸터 시작 -->
	<footer class="container">
		<!-- 오른쪽으로 부유, 현재 페이지 맨 위 링크 -->
		<p class="float-end">
			<a href="#">Back to top</a>
		</p>
		<p class="mb-0">
			&copy; 2017–2023 Company, Inc. &middot; <a href="#">Privacy</a>
			&middot; <a href="#">Terms</a>
		</p>
		<!-- 푸터 종료 -->
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
	</script>
	<script type="text/javascript" src = "${pageContext.request.contextPath}/js/islogin.js">	</script>
</body>
</html>