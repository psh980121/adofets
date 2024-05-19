<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />

</head>
<body class="d-flex flex-column min-vh-100 pb-0">

	<!-- 헤더 시작, 밝은 테마 -->
	<header data-bs-theme="light">
		<!-- 네비 바에서 화면의 크기가 중간 이상일 때 요소 확대, 상단 고정, 배경 밝게-->
		<nav class="navbar navbar-expand-md fixed-top bg-light"
			style="height: 80px;">
			<!-- 컨테이너 화면 너비만큼 확장(그리드 가능) -->
			<div class="container-fluid">
				<!-- 네비 브랜드 로고 -->
				<a class="navbar-brand" href="002.html"> <!-- alt는 대체 텍스트 --> <img
					src="../image/dog.png" alt="cow" width="60" height="50" />
				</a>

				<!-- 요소를 접을 수 있게 만듬, 콘텐츠 그룹화 -->
				<div id="menu" class="collapse navbar-collapse">

					<!-- 네비 내부 목록, 오른쪽 마진 자동 설정 및 왼쪽 정렬, 아래 마진 2, 중간 크기에서는 아래 마진 0 -->
					<ul class="navbar-nav me-auto mb-2 mb-md-0">

						<!-- 네비 항목 -->
						<li class="nav-item">
							<!-- 네비 링크, 활성화되면 표시, 텍스트 검정, 스크린 리더(aria)에게 현재 페이지임을 알림 --> <a
							class="nav-link active text-black" aria-current="page"
							href="${pageContext.request.contextPath}">Home</a>
						</li>

						<li class="nav-item"><a class="nav-link text-black" href="#">상품</a>
							<ul class="list-unstyled mb-0">
								<li><a
									href="${pageContext.request.contextPath}/products/productsListAction.jsp"
									class="text-decoration-none">상품 전체 보기</a></li>
								<li><a
									href="${pageContext.request.contextPath}/products/products.jsp"
									class="text-decoration-none">상품 등록</a></li>
								<li><a href="#" class="text-decoration-none">SUB_MENU3</a>
								</li>
							</ul></li>

						<li class="nav-item"><a class="nav-link text-black" href="#">커뮤니티</a>
							<ul class="list-unstyled mb-0">

								<li><a href="#" class="text-decoration-none">입양/상품 후기</a></li>
								<li><a href="#" class="text-decoration-none">임시보호/실종</a></li>
								<li><a href="#" class="text-decoration-none">SUB_MENU3</a></li>

							</ul></li>

						<li class="nav-item"><a class="nav-link disabled text-black">공고</a>
						</li>
						<li class="nav-item"><a class="nav-link text-black"
							href="javascript:write()">1:1 문의</a></li>
					</ul>

					<!-- form 내부 요소들을 수평 정렬할 수 있음 -->
					<form class="d-flex" role="search">
						<!-- 폼 입력 필드, 밝은 테마, 오른쪽 마진 3 -->
						<input class="form-control form-control-light me-3" type="search"
							placeholder="Search..." aria-label="Search" />
					</form>

					<!-- 오른쪽 정렬 -->
					<div id="menu" class="text-end d-flex collapse navbar-collapse"
						style="min-width: 180px">

						<!-- 네비 내부 목록, 오른쪽 마진 자동 설정 및 왼쪽 정렬, 아래 마진 2, 중간 크기에서는 아래 마진 0 -->
						<ul class="navbar-nav ms-auto mb-2 mb-md-0">

							<li class="nav-item"><c:if test="${user !=null }">

									<a class="h4 nav-link text-black"> <c:out
											value="${user.username }" /> 님
									</a>

									<ul class="list-unstyled mb-0">

										<li><a href="selectBuy.jsp" class="text-decoration-none">구매목록</a></li>
										<li><a href="selectAdopt.jsp"
											class="text-decoration-none">입양목록</a></li>
										<li><a href="delete.jsp" class="text-decoration-none">회원탈퇴</a></li>
										<li><a href="update.jsp" class="text-decoration-none">내
												정보 수정</a></li>
										<li><a href="../question/MyQuestion.jsp"
											class="text-decoration-none">내 문의내역</a></li>
										<li><a href="${pageContext.request.contextPath }"
											class="text-decoration-none">홈으로</a></li>

									</ul>

									<span> <a
										href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a>
									</span>
									<span> <a
										href="${pageContext.request.contextPath}/account/mypage.jsp">마이페이지</a>
									</span>

								</c:if> <!-- 검은 테두리 흰 바탕 --> <c:if test="${user ==null }">

									<button type="button" class="btn btn-outline-dark me-2"
										onclick="location.href='${pageContext.request.contextPath}/login.jsp'">로그인</button>
									<!-- 노란 배경의 스타일 -->
									<button type="button" class="btn btn-warning"
										onclick="location.href='${pageContext.request.contextPath}/account/signup2.jsp'">회원가입</button>
								</c:if></li>

						</ul>




					</div>
				</div>
			</div>
		</nav>
	</header>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px;">

		<div class="form-signin w-100 m-auto border border-dark px-5 my-5">

			<h3>
				<c:out value="${ user.username}" />
				님의 마이페이지
			</h3>
			<a href="selectBuy.jsp">구매목록</a> <a href="selectAdopt.jsp">입양목록</a> <a
				href="delete.jsp">회원탈퇴</a> <a href="update.jsp">내 정보 수정</a> <a
				href="../question/MyQuestion.jsp">내 문의내역</a> <br> <a
				href="${pageContext.request.contextPath }">홈으로</a>

		</div>

		<!-- 메인 종료 -->
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

	<script type="text/javascript" src=" ../js/islogin.js"></script>
</body>
</html>