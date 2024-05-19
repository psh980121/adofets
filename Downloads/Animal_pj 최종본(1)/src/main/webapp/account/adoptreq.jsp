<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdoptReq</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

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
				<a class="navbar-brand" href="${pageContext.request.contextPath}">
					<!-- alt는 대체 텍스트 --> <img src="../image/dog.png" alt="cow"
					width="60" height="50" />
				</a>
				<!-- 요소를 접을 수 있게 만듬, 콘텐츠 그룹화 -->
				<div id="menu" class="collapse navbar-collapse" id="navbarCollapse">
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
							</ul></li>
						<li class="nav-item"><a class="nav-link text-black" href="#">커뮤니티</a>
							<ul class="list-unstyled mb-0">
								<li><a href="#" class="text-decoration-none">입양/상품 후기</a></li>
								<li><a href="#" class="text-decoration-none">임시보호/실종</a></li>
								<li><a href="#" class="text-decoration-none">SUB_MENU3</a>
								</li>
							</ul></li>
						<li class="nav-item"><a class="nav-link disabled text-black">공고</a>
							<ul class="list-unstyled mb-0">
								<li><a
									href="${pageContext.request.contextPath}/animal/guideAdopt.jsp"
									class="text-decoration-none">입양 안내</a></li>
								<li><a
									href="${pageContext.request.contextPath}/animal/listAnimal2.jsp"
									class="text-decoration-none">입양 동물 목록</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link text-black"
							href="javascript:write()">1:1 문의</a></li>
					</ul>
					<!-- form 내부 요소들을 수평 정렬할 수 있음 -->
					<form class="d-flex" role="search">
						<!-- 폼 입력 필드, 밝은 테마, 오른쪽 마진 3 -->
						<input class="form-control form-control-light me-3" type="search"
							style="min-width: 280px" placeholder="Search..."
							aria-label="Search" />
					</form>
					<!-- 오른쪽 정렬 -->
					<div class="text-end d-flex" style="min-width: 280px">
						<c:if test="${user !=null }">
							<h4 class="m-auto">
								<c:out value="${user.username }" />
								님
							</h4>
							<span class="px-2"> <a class="text-decoration-none"
								href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a>
							</span>
							<span class="px-2"> <a class="text-decoration-none"
								href="${pageContext.request.contextPath}/account/mypage.jsp">마이페이지</a>
							</span>
						</c:if>

						<!-- 검은 테두리 흰 바탕 -->
						<c:if test="${user ==null }">
							<h4 class="m-auto"></h4>
							<button type="button" class="btn btn-outline-dark me-2"
								onclick="location.href='${pageContext.request.contextPath}/login.jsp'">로그인</button>
							<!-- 노란 배경의 스타일 -->
							<button type="button" class="btn btn-warning"
								onclick="location.href='${pageContext.request.contextPath}/account/signup.jsp'">회원가입</button>
						</c:if>
					</div>

				</div>
			</div>
		</nav>
	</header>

	<main style="margin-bottom: 200px; text-align: center;">
	
		<h3 class="m-5" style="text-align: center;">1차 입양조건 검사</h3>
		
		<form action="" class="w-100 m-auto p-5 border" style="max-width: 1200px; text-align: left;">

			<div>
				<p>1. 반려동물 주 보호자의 나이는 몇살입니까?</p>
				<input type="number" name="age">
			</div>

			<div>
				<p>2. 현재 직업이 있습니까?</p>
				<input type="radio" name="job" id="havejob" value="yes"> <label
					for="havejob">예</label> <input type="radio" name="job"
					id="uhavejob" value="no"> <label for="uhavejob">아니오</label>
			</div>
			<!-- 현재직업 '아니오' 시 나타남 -->
			<div id="hd1" style="display: none;">
				<p>2-1. 모아둔 돈이 있거나 취업할 예정이 있습니까?</p>
				<input type="radio" name="hvjob" id="hd1-1" value="yes"> <label
					for="hd1-1">예</label> <input type="radio" name="hvjob" id="hd1-2"
					value="no"> <label for="hd1-2">아니오</label>
			</div>

			<div>
				<p>3. 주 보호자의 월 소득은 어떤 수준입니까?</p>
				<input type="radio" name="money" id="nomoney" value="0"> <label
					for="nomoney">수입 없음</label> <input type="radio" name="money"
					id="hundred" value="100"> <label for="hundred">100만원</label>
				<input type="radio" name="money" id="twohundred" value="200">
				<label for="twohundred">200만원</label> <input type="radio"
					name="money" id="trhundred" value="300"> <label
					for="trhundred">300만원</label> <input type="radio" name="money"
					id="uphundred" value="up"> <label for="uphundred">300
					이상</label>
			</div>

			<div>
				<p>4. 동물에 대한 어떤 알레르기라도 있으십니까?</p>
				<input type="radio" name="allergy" id="yallergy" value="yes">
				<label for="yallergy">예</label> <input type="radio" name="allergy"
					id="nallergy" value="no"> <label for="nallergy">아니오</label>
			</div>

			<div>
				<p>5. 가족구성원이 어떻게 되십니까?</p>
				<input type="checkbox" id="alone" name="family" value="alone">
				<label for="alone">자취</label> <input type="checkbox" id="parent"
					name="family" value="parent"> <label for="parent">부모님</label>
				<input type="checkbox" id="marry" name="family" value="marry">
				<label for="marry">배우자</label> <input type="checkbox" id="child"
					name="family" value="child"> <label for="child">자식</label>
			</div>

			<div id="hd2" style="display: none;">
				<p>5-1-1. 가족구성원들의 동의를 모두 받았습니까?</p>
				<input type="radio" name="agree" id="yagree" value="all"> <label
					for="yagree">모두동의</label> <input type="radio" name="agree"
					id="hagree" value="half"> <label for="hagree">부분동의</label>
				<input type="radio" name="agree" id="nagree" value="no"> <label
					for="nagree">모두반대</label>
			</div>

			<div id="hd3" style="display: none;">
				<p>5-1-2. 가족구성원이 동물에 대한 어떤 알레르기라도 있으십니까?</p>
				<input type="radio" name="fallergy" id="fyallergy" value="yes">
				<label for="fyallergy">예</label> <input type="radio" name="fallergy"
					id="fnallergy" value="no"> <label for="fnallergy">아니오</label>
			</div>

			<div id="hd4" style="display: none;">
				<p>5-2-1. 현재 자식 중, 가장 어린 자식의 나이는 몇살입니까?</p>
				<input type="number" name="cage">
			</div>

			<p>6. 하루에 몇시간 이상씩 집을 비우십니까?</p>
			<input type="radio" name="leave" id="noleave" value="0"> <label
				for="noleave">안비움</label> <input type="radio" name="leave"
				id="ohleave" value="1"> <label for="ohleave">1시간</label> <input
				type="radio" name="leave" id="thleave" value="2"> <label
				for="thleave">2시간</label> <input type="radio" name="leave"
				id="fhleave" value="4"> <label for="fhleave">4시간</label> <input
				type="radio" name="leave" id="ehleave" value="8"> <label
				for="ehleave">8시간</label>

			<div>
				<p>7. 하루 이상 집을 비우게될시, 반려동물을 맡길 공간이 존재합니까?</p>
				<input type="radio" name="anihome" id="yhome" value="yes"> <label
					for="yhome">예</label> <input type="radio" name="anihome" id="nhome"
					value="no"> <label for="nhome">아니오</label>
			</div>

			<div>
				<p>8. 주거의 형태?</p>
				<input type="radio" name="house" id="house1" value="1"> <label
					for="house1">아파트</label> <input type="radio" name="house"
					id="house2" value="2"> <label for="house2">단독주택</label> <input
					type="radio" name="house" id="house3" value="3"> <label
					for="house3">빌라</label> <input type="radio" name="house"
					id="house4" value="4"> <label for="house4">집이 없음</label>
			</div>

			<hr>
			<div>
				<p>반려견은 10~15년 이상, 길면 20년 이상 삽니다. 결혼, 임신, 유학, 이사 등으로 가정환경이 바뀌어도
					끝까지 책임지고 보살피겠다는 결심이 섰습니까?</p>
				<input type="radio" name="form1" id="f1yes" value="yes"> <label
					for="f1yes">예</label> <input type="radio" name="form1" id="f1no"
					value="no"> <label for="f1no">아니오</label>
			</div>

			<div>
				<p>반려동물을 맞이할 환경적 준비, 마음의 각오는 되어 있습니까?</p>
				<input type="radio" name="form2" id="f2yes" value="yes"> <label
					for="f2yes">예</label> <input type="radio" name="form2" id="f2no"
					value="no"> <label for="f2no">아니오</label>
			</div>

			<div>
				<p>강아지가 화내게 해도 화내지않을 자신이 있으십니까</p>
				<input type="radio" name="form3" id="f3yes" value="yes"> <label
					for="f3yes">예</label> <input type="radio" name="form3" id="f3no"
					value="no"> <label for="f3no">아니오</label>
			</div>

			<button class="btn btn btn-primary m-3" onclick="req_test()" type="button">제출하기</button>
		</form>

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

	<script type="text/javascript" src=" ../js/adoptreq.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
		
	</script>
</body>
</html>