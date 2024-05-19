<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>
<!-- color-modes.js 파일을 불러와서 다양한 테마 모드를 처리 -->
<script src="/docs/5.3/assets/js/color-modes.js"></script>
<!-- 문서 정보 및 스타일 설정 -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들" />
<meta name="generator" content="Hugo 0.115.4" />
<title>Main Page</title>

<!-- 커스텀 스타일 시트 불러오기 -->
<link rel="stylesheet" href="css/002.css" />

<!-- Bootstrap CSS 불러오기 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- 문서의 본래 URL 지정 -->
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.3/examples/carousel/" />
</head>

<body>
	<!-- 밝은 테마 -->
<%@ include file="css/adheader.jsp"%>

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
			         <rect width="100%" height="100%"
					  fill="white" />
					  <image xlink:href="image/banner1.png" width="100%"
					  height="100%" y="4%" />
            </svg>
					<div class="container">
						<!-- 슬라이드 캡션, 왼쪽 정렬 -->
						<div class="carousel-caption text-start">
							<!-- 텍스트 불투명도 조절 -->
							
							<!-- 버튼 크게, 파란색으로 -->
							<p>
								<a class="btn btn-lg btn-primary" href="https://www.animal.go.kr/front/community/show.do?boardId=contents&seq=66&menuNo=2000000016">등록하러가기</a>
							</p>
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
						<div class="carousel-caption">
						</div>
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
						<div class="carousel-caption text-end">
							
						</div>
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

		

		
		<!-- 메인 종료 -->
	</main>

		<!-- ================================================= -->

		

	<!-- 페이지 하단 영역 -->
<%@ include file="css/footer.jsp"%>
	<!-- Bootstrap JS 파일 불러오기 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		
		<script type="text/javascript">
	function write() {
		let yn
		if('${user.userid}'==''){
			yn=confirm('1:1문의는 로그인이 필요합니다. 로그인 하시겠습니까?')
			if(yn) location.href='login.jsp?back=q'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
		}else{
			location.href='question/Question.jsp'
		}
	}
</script>
</body>
</html>