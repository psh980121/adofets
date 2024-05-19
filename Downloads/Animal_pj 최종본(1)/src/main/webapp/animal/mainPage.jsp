<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>
.pointer-cursor {
	cursor: pointer;
}

#photoContainer img {
	margin-bottom: 20px;
}

.img-container {
	position: relative; /* 자식 요소 위치 설정을 위해 부모 요소에 상대적 위치 설정 */
	overflow: hidden; /* 이미지 컨테이너 영역을 벗어나는 이미지를 숨깁니다. */
	width: 200px; /* 이미지 컨테이너의 너비 (원하는 크기로 설정) */
	height: 250px; /* 이미지 컨테이너의 높이 (원하는 크기로 설정) */
}

/* 이미지 스타일 */
.img-container img {
	transition: transform 0.3s ease-in-out; /* 변환 효과를 부드럽게 적용 */
}

/* 이미지 호버 효과 (확대) */
.img-container:hover img {
	transform: scale(1.1); /* 1.1배 확대 (원하는 확대 비율로 조정) */
}
</style>

<body>
	<h1>새로운 가족 찾기</h1>
	<div></div>
	
	<input type="hidden" name=desertionNo id=desertionNo>
	<hr>
	
	<!-- 동물 사진 리스트  -->
	<div id="photoContainer"
		class="w-full grid grid-cols-2 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-y-3 gap-x-3"></div>

	<hr>
	<script type="text/javascript" src="./js/mainAnimalList.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
		
	</script>
</body>
</html>