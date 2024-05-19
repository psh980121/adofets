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
	<%@ include file="../css/header.jsp"%>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px;">

		<form action="productsAction.jsp" method="post" class="form-signin w-100 m-auto border border-dark px-5" enctype="multipart/form-data">

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
				<label for="pdtCate" class="col-3 col-form-label">상품 카테고리:</label> 
				<select
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
				<button class="btn btn-primary py-2" type="button" onclick="islogin()">상품등록</button>
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
		
		function islogin() {
	         let yn
	         if ('${user.userid}' == '') {
	            yn = confirm('상품 등록은 로그인이 필요합니다. 로그인 하시겠습니까?')
	            if (yn)
	               location.href = '${pageContext.request.contextPath}/login.jsp?back=pd'
	         } else {
	            const login = document.forms[1]
	            login.submit()
	         }

	      }
	</script>
	<script type="text/javascript" src = " ../js/islogin.js"></script>
</body>
</html>









