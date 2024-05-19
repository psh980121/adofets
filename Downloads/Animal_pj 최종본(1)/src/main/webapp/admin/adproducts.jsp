<%@page import="org.iclass.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Login Page</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<%
/* ProductDao dao = ProductDao.getProductDao();
ProductDto dto = dao.getByPdtname("소");
request.setAttribute("ProductDto", dto); */
%>

<body class="d-flex flex-column min-vh-100 pb-0">
	<%@ include file="../css/adheader.jsp"%>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px;">
		<section class="py-5 text-center container border border-dark my-5">
			<div class="row py-lg-5">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">하루의 시작, 아침식사</h1>
					<p class="lead text-body-secondary">하루를 시작하는 아침식사는 삼시 세끼 중 가장
						중요하다. 아침식사에서 반드시 보충하면 좋은 영양소는 단백질이다. 단백질은 매 끼니 조금씩 섭취하면 좋지만 아침
						식사에서 단백질을 섭취가 쉽지 않다. 아침 식사로 좋은 단백질 식품은 그릭요거트, 달걀, 코티지치즈, 우유 등이다.
						미국의 한 연구에서 아침식사를 고단백으로 채운 사람들의 체질량지수가 점심이나 저녁때 푸짐한 식사를 한 사람보다 낮은
						것으로 나타났고, 일반적으로 아침식사를 한 사람들이 거른 사람들에 비해 체중을 더 낮게 유지했다고 밝혔다.</p>
					<p>
						<a href="#" class="btn btn-primary my-2">Main call to action</a> <a
							href="#" class="btn btn-secondary my-2">Secondary action</a>
					</p>
				</div>
			</div>
		</section>

		<form action="adproductsAction.jsp" method="post"
			enctype="multipart/form-data"
			class="form-signin w-100 m-auto border border-dark px-5">

			<img class="m-auto my-3" id="imagePreview" src="../image/cow.jpg"
				alt="상품 이미지 미리보기" style="max-width: 100%;">
			<h1 class="h3 fw-normal">상품 등록해주세요.</h1>

			<!-- flex 묶기 -->
			<div class="form-group d-flex align-items-center">
				<!-- pdtName 입력 필드 -->
				<label for="pdtName" class="col-3 col-form-label">상품명:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="text" class="form-control" id="pdtName" name="pdtname"
						placeholder="상품명" /> <label for="pdtName">상품명</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- pdtPrice 입력 필드 -->
				<label for="pdtPrice" class="col-3 col-form-label">가격:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="number" class="form-control" id="pdtPrice"
						name="pdtprice" placeholder="가격" /> <label for="pdtPrice">가격</label>
				</div>
			</div>

			<div>
				<label for="pdtCate" class="col-3 col-form-label">상품 카테고리:</label> <select
					class="col-7 ms-1 my-1" id="pdtCate" name="pdtcate"
					style="height: 50px;">
					<option>강아지용품</option>
					<option>고양이용품</option>
				</select>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- pdtContent 입력 필드 -->
				<label for="pdtContent" class="col-3 col-form-label">상품설명:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<textarea class="form-control" id="pdtContent" name="pdtcontent"
						placeholder="상품설명" style="height: 200px; resize: none;"></textarea>
					<label for="pdtContent">상품설명</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">
				<label for="pdtPicture" class="col-3 col-form-label">상품 이미지:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="file" id="pdtPicture" name="pdtpicture"
						accept="image/jpeg, image/png" onchange="previewImage(this)" />
				</div>
			</div>

			<div class="form-group d-flex justify-content-center mt-5">
				<button class="btn btn-primary py-2" type="submit">상품등록</button>
			</div>

		</form>

		<!-- 메인 종료 -->
	</main>
	<!-- 푸터 시작 -->
<%@ include file="../css/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
		
	</script>
	<script>
		function previewImage(input) {
			var imagePreview = document.getElementById('imagePreview');
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					imagePreview.src = e.target.result;
					imagePreview.style.display = 'block';
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script type="text/javascript" src = " ../js/islogin.js"></script>
</body>
</html>









