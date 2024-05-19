<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Login Page</title>

<link rel="stylesheet" href="css/002.css" />
<link rel="stylesheet" href="css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<style type="text/css">
#incorrect {
	display: none;
	color: red;
	font-weight: 1.2rem;
}
</style>

</head>

<body class="d-flex flex-column min-vh-100 pb-0">

	<!-- 헤더 시작 -->
	<%@ include file="css/header.jsp"%>

	<section class="py-5 text-center container border border-dark my-5">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">하루의 시작, 아침식사</h1>
				<p class="lead text-body-secondary">하루를 시작하는 아침식사는 삼시 세끼 중 가장
					중요하다. 아침식사에서 반드시 보충하면 좋은 영양소는 단백질이다. 단백질은 매 끼니 조금씩 섭취하면 좋지만 아침 식사에서
					단백질을 섭취가 쉽지 않다. 아침 식사로 좋은 단백질 식품은 그릭요거트, 달걀, 코티지치즈, 우유 등이다. 미국의 한
					연구에서 아침식사를 고단백으로 채운 사람들의 체질량지수가 점심이나 저녁때 푸짐한 식사를 한 사람보다 낮은 것으로
					나타났고, 일반적으로 아침식사를 한 사람들이 거른 사람들에 비해 체중을 더 낮게 유지했다고 밝혔다.</p>
				<p>
					<a href="#" class="btn btn-primary my-2">Main call to action</a> <a
						href="#" class="btn btn-secondary my-2">Secondary action</a>
				</p>
			</div>
		</div>
	</section>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px;">

		<%
		String temp = request.getParameter("back");
		if (temp != null && temp.equals("q"))
			session.setAttribute("back", "question/Question.jsp");
		if (temp != null && temp.equals("a"))
			session.setAttribute("back", "animal/listAnimal2.jsp");
		if (temp != null && temp.equals("p"))
			session.setAttribute("back", "products/productsListAction.jsp");
		if (temp != null && temp.equals("pd"))
			session.setAttribute("back", "products/products.jsp");
		%>

		<label id="incorrect">계정 정보가 일치하지 않습니다.</label>
		<form action="loginAction.jsp" method="post"
			class="form-signin w-100 m-auto m-auto border border-dark px-5">

			<img class=" mb-4 mt-5 mx-auto d-block" src="image/uni.png" alt="cow"
				width="200" height="180" />
			<h1 class="h3 fw-normal text-center mb-3">로그인 해주세요.</h1>

			<!-- flex 묶기 -->
			<div class="form-group d-flex align-items-center">
				<!-- userID 입력 필드 -->
				<label for="userid" class="col-3 col-form-label">ID:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="text" class="form-control" id="userid" name="userid"
						placeholder="ID" required /> <label for="floatingInput">ID</label>
				</div>
			</div>
			<div id="sameid"></div>

			<div class="form-group d-flex align-items-center">
				<!-- userPass 입력 필드 -->
				<label for="pwd" class="col-3 col-form-label">Password:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="password" class="form-control" id="password"
						name="userpass" placeholder="Password" required /> <label
						for="floatingPassword">Password</label>
				</div>
			</div>

			<div class="form-group d-flex justify-content-center my-5">
				<button class="btn btn-primary py-2 mx-3" type="submit">로그인</button>
				<button class="btn btn-primary py-2 mx-3" type="button"
					onclick="location.href='${pageContext.request.contextPath}'">회원가입</button>
			</div>

		</form>

		<!-- 메인 종료 -->
	</main>

	<!-- 푸터 시작 -->
	<%@ include file="css/footer.jsp"%>

	<script type="text/javascript">
		console.log('${param.incorrect}')

		if ('${param.incorrect}' === 'y')
			document.getElementById('incorrect').style.display = 'inline-block'
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/islogin.js">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
</body>
</html>
