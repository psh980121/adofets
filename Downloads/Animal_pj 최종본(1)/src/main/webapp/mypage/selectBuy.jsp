<%@page import="java.util.ArrayList"%>
<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dto.buyDto"%>
<%@page import="org.iclass.dao.buyDao"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>

<script src="/docs/5.3/assets/js/color-modes.js"></script>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />

<title>구매 내역</title>

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
	<main style="margin-bottom: 200px;">

		<h1 style="text-align: center; margin-bottom: 30px;">구매 내역</h1>

		<div class="border rounded border-primary p-2 m-auto"
			style="width: 918px;">
			<%
			buyDao bDao = buyDao.getInstance();
			usersDto udtos = (usersDto) session.getAttribute("user");

			if (udto != null) {
				String usid = udtos.getUserid();

				if (usid != null && !usid.isEmpty()) {
					List<buyDto> buyInfoList = bDao.selectBuyByUSERID(usid);
					if (!buyInfoList.isEmpty()) {
				for (buyDto purchase : buyInfoList) {
			%>

			<div class="w-100 m-auto" style="max-width: 800px;">

				<p style="text-align: center; margin-bottom: 50px;"></p>

				<div class="border p-2 mb-3">
					<div class="form-group d-flex align-items-center">
						<label class="col-2 col-form-label" for="posttitle">구매 번호:</label>
						<div class="form-floating col-9 my-1 border-bottom">
							<%=purchase.getBuyidx()%>
						</div>
					</div>

					<div class="form-group d-flex align-items-center">
						<label class="col-2 col-form-label" for="posttitle">상품 코드:</label>
						<div class="form-floating col-9 my-1 border-bottom">
							<%=purchase.getPdtcode()%>
						</div>
					</div>

					<div class="form-group d-flex align-items-center">
						<label class="col-2 col-form-label" for="posttitle">사용자
							아이디:</label>
						<div class="form-floating col-9 my-1 border-bottom">
							<%=purchase.getUserid()%>
						</div>
					</div>

					<div class="form-group d-flex align-items-center">
						<label class="col-2 col-form-label" for="posttitle">구매 개수:</label>
						<div class="form-floating col-9 my-1 border-bottom">
							<%=purchase.getBuycnt()%>
						</div>
					</div>
				</div>

				<button class="btn btn-outline-success rounded-pill" type="button"
					id="showReviewForm">
					<i class="bi bi-pencil me-1"></i>리뷰 작성
				</button>

				<form action="reviewActionBuy.jsp" method="post"
					enctype="multipart/form-data" id="reviewForm"
					style="display: none;">

					<input type="hidden" name="buyidx"
						value="<%=purchase.getBuyidx()%>">

					<div class="form-group d-flex align-items-center mt-3">
						<div class="form-floating col-7 my-1">
							<input type="text" name="posttitle" placeholder="리뷰 제목">
						</div>
					</div>
					
					<div class="form-group d-flex align-items-center">
						<div class="form-floating col-7 my-1">
							<textarea name="postcontent" rows="10" cols="80"
								style="resize: none;" placeholder="리뷰 작성"></textarea>
						</div>
					</div>
					
					<div class="form-group d-flex align-items-center">
						<div class="form-floating col-8 my-1">
							<input type="file" name="postpic" accept="image/jpg">
						</div>
						<button type="submit" class="btn btn-outline-dark rounded-pill">제출</button>
					</div>

				</form>

				<hr>
				<%
				}
				} else {
				%>
				<p>구매 내역이 없습니다.</p>
				<%
				}
				} else {
				%>
				<p>사용자 아이디가 비어 있습니다.</p>
				<%
				}
				} else {
				%>
				<p>로그인한 사용자 정보를 찾을 수 없습니다.</p>
				<%
				}
				%>
			</div>
		</div>
		
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

	<script>
		var reviewButtons = document
				.querySelectorAll('button[id^="showReviewForm"]');
		for (var i = 0; i < reviewButtons.length; i++) {
			reviewButtons[i].addEventListener('click', function() {
				var reviewForm = this.nextElementSibling;
				if (reviewForm) {
					if (reviewForm.style.display === 'block') {
						// 이미 열려있는 경우 버튼을 누르면 폼을 닫습니다.
						reviewForm.style.display = 'none';
					} else {
						// 열려있지 않은 경우 폼을 열고 다른 폼을 닫습니다.
						closeAllReviewForms();
						reviewForm.style.display = 'block';
					}
				}
			});
		}

		// 모든 리뷰 폼을 닫는 함수
		function closeAllReviewForms() {
			var reviewForms = document
					.querySelectorAll('form[id^="reviewForm"]');
			for (var i = 0; i < reviewForms.length; i++) {
				reviewForms[i].style.display = 'none';
			}
			var reviewButtons = document
					.querySelectorAll('button[id^="showReviewForm"]');
			for (var i = 0; i < reviewButtons.length; i++) {
				reviewButtons[i].style.display = 'inline-block';
			}
		}
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/islogin.js"></script>
</body>
</html>
