<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />

<title>커뮤니티</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body class="d-flex flex-column min-vh-100 pb-0">
	<%@ include file="../css/header.jsp"%>

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
	<main id="missing" style="margin-bottom: 200px;">

		<h3 style="text-align: center; margin-bottom: 30px;">실종동물 찾습니다.</h3>

		<p style="text-align: center; margin-bottom: 50px;">어떤 동물을
			잃어버리셨나요?</p>

		<form name="frm1" method="post" action="missingAnimal.jsp"
			onsubmit="return isValid()" enctype="multipart/form-data"
			class="w-100 m-auto px-5" style="max-width: 1200px;">
			
			<hr style="color: gray;">

			<table class="mx-auto" style="text-align: center; margin-top: 100px;">

				<tr>
					<th class="p-2">제목</th>
					<td><input type="text" name="postitle" size="78" required></td>
				</tr>

				<tr>
					<th class="p-4">작성자</th>
					<td><input type="text" name="writer" size="78"
						value="${user.userid}" disabled="disabled"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea rows="20" cols="80" name="postcontent" required></textarea>
					</td>
				</tr>

				<tr>
					<th></th>
					<td style="padding-top: 30px;">
						<div class="input-group">
							<input type="file" name="postpic" accept="image/jpeg, image/png"
								class="form-control" id="inputGroupFile04"
								aria-describedby="inputGroupFileAddon04" aria-label="Upload" required>
						</div>
					</td>
				</tr>


				<tr>
					<td class="pt-3" colspan="2" align="center">
						<button class="btn btn-outline-danger" style="margin-left: 100px;"
							type="submit">저장</button>
						<button class="btn btn-outline-success mx-1" type="reset">재작성</button>
						<button class="btn btn-outline-primary" type="button"
							onclick="location.href='list.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</form>

		<!-- 메인 종료 -->
	</main>

	<!-- 페이지 하단 영역 -->
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
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/islogin.js"></script>
</body>
</html>