<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />

<title>Main Page</title>

<!-- 커스텀 스타일 시트 불러오기 -->
<link rel="stylesheet" href="css/002.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
html, body {
	width: 100%;
	height: 100%;
	position: relative; /* 부모 요소를 relative로 설정 */
}

canvas {
	position: absolute; /* canvas를 absolute로 설정 */
	top: 0;
	left: 0;
	z-index: -1;
}

main {
	margin-bottom: 200px;
	z-index: 0;
	/* 다른 스타일 속성들 */
}
</style>
</head>

<body class="d-flex flex-column min-vh-100 pb-0">

	<!-- 헤더 시작 -->
	<%@ include file="css/header.jsp"%>


	<canvas id="myCanvas"></canvas>

	<main>
		<!-- Carousel 컴포넌트 슬라이드 설정, data-bs-ride="carousel: 자동 슬라이드 전환  -->
		<div id="myCarousel" class="carousel slide mb-6"
			data-bs-ride="carousel">
			<!-- 몇 번째의 슬라이드가 보여지는지 인디케이터(점) 생성 -->
			<div class="carousel-indicators">
				<!-- data-bs-target="#myCarousel: id="myCarousel 컴포넌트 제어 지정
                data-bs-slide-to="0": 첫 번쨰 슬라이드 지정
                버튼 활성화 표시 -->
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<!-- data-bs-slide-to="1": 두 번쨰 슬라이드 지정 -->
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<!-- data-bs-slide-to="2": 세 번쨰 슬라이드 지정 -->
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<!-- 슬라이드 항목(컨테이너): 스타일, 배치 관리 -->
			<div class="carousel-inner">
				<!-- 개별 슬라이드 항목, 첫 번째, 활성화 -->
				<div class="carousel-item active">
					<!-- 슬라이드 배경을 설정하는 SVG 그래픽, 스크린 리더에게 보이지 않음 
                    preserveAspectRatio: SVG 화면 크기 조정 및 정렬 
                    xMidYMid slice: 이미지 가운데 정렬, 원본 비율 유지한 채로 잘라냄 
                    키보드 탐색 순서에서 제외 -->
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
			         <!-- 배경 사각형 채우기, 배경 색상 지정 -->
			         <rect width="100%" height="100%" fill="white" />
						<a
							href="https://www.animal.go.kr/front/community/show.do?boardId=contents&seq=66&menuNo=2000000016">
					  <image xlink:href="image/banner1.png" width="100%" height="100%"
								y="4%" />
						</a>
            </svg>
					<div class="container">
						<!-- 슬라이드 캡션, 왼쪽 정렬 -->
						<div class="carousel-caption text-start">
							<!-- 텍스트 불투명도 조절 -->

							<!-- 버튼 크게, 파란색으로 -->
							<p></p>
						</div>
					</div>
				</div>
				<!-- 개별 슬라이드 항목, 두 번째 -->
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
		             <!-- 배경을 어둡게 설정 -->
		             <rect width="100%" height="100%" fill="white" />
		             <image xlink:href="image/banner2.png" width="100%"
							height="100%" " y="4%" />
            </svg>
					<div class="container">
						<div class="carousel-caption"></div>
					</div>
				</div>
				<!-- 개별 슬라이드 항목, 세 번째 -->
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
              		<rect width="100%" height="100%" fill="white" />
					<image xlink:href="image/banner3.png" width="80%" height="80%"
							x="10%" y="15%" />
            </svg>
					<div class="container">
						<!-- 슬라이드 캡션, 오른쪽 정렬 -->
						<div class="carousel-caption text-end"></div>
					</div>
				</div>
			</div>
			<!-- 슬라이드 컨트롤 이전 버튼 -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<!-- 이전 버튼 아이콘 -->
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<!-- 목적 설명 보이지 않게  -->
				<span class="visually-hidden">Previous</span>
			</button>
			<!-- 슬라이드 컨트롤 다음 버튼 -->
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- ================================================= -->

		<div class="container marketing">
			<button class="btn btn-outline-warning rounded-pill"
				id="toggleCanvas">ON</button>
			<!-- 행 정의, 슬라이드 아래에 표시되는 세 개의 열 -->
			<div class="row">
				<!-- 동물 사진 리스트  -->
				<div id="photoContainer" class="w-full gap-y-3 gap-x-2 p-5"
					style="text-align: center;"></div>
				<button type="button" class="btn btn-outline-primary"
					style="width: 150px; margin: auto;"
					onclick="location.href='${pageContext.request.contextPath}/animal/listAnimal2.jsp'">더보기</button>
			</div>

			<!-- 수평 구분선(가로줄) 생성 -->
			<hr class="featurette-divider" />

		</div>


		<!-- 메인 종료 -->
	</main>


	<!-- 푸터 시작 -->
	<%@ include file="css/footer.jsp"%>


	<script type="text/javascript" src="002.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/islogin.js">
		
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/mainAnimalList.js"></script>
	<script type="text/javascript">
		function write() {
			let yn
			if ('${user.userid}' == '') {
				yn = confirm('1:1문의는 로그인이 필요합니다. 로그인 하시겠습니까?')
				if (yn)
					location.href = 'login.jsp?back=q' // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
			} else {
				location.href = 'http://localhost:8081/Animal_pj/question/Question.jsp'
			}
		}
	</script>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			const messageblock = document.querySelector(".messageblock");
			const message = document.querySelector(".message");

			let notificationVisible = false;

			message.addEventListener("click", function() {
				if (notificationVisible) {
					messageblock.style.display = "none";
					notificationVisible = false;
				} else {
					messageblock.style.display = "block";
					notificationVisible = true;
				}
			});
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>