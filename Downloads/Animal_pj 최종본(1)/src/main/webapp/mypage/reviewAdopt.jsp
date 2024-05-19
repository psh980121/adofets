<%@page import="org.iclass.dto.AdoptDto"%>
<%@page import="org.iclass.dao.AdoptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />

<title>리뷰 작성</title>

<!-- 커스텀 스타일 시트 불러오기 -->
<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />

</head>

<body class="d-flex flex-column min-vh-100 pb-0">

	<!-- 헤더 시작 -->
	<%@ include file="../css/header.jsp"%>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px; margin-top: 70px;">

		<h1 style="text-align: center; margin: 50px;">리뷰 작성</h1>

		<%
		try {
			String adoptIdxStr = request.getParameter("adoptIdx");
			if (adoptIdxStr != null) {
				int adoptIdx = Integer.parseInt(adoptIdxStr);

				// AdoptDao의 인스턴스 생성
				AdoptDao adoptDao = AdoptDao.getInstance();
				// 입양 번호에 해당하는 입양 정보 조회
				AdoptDto adoption = adoptDao.selectAdoptByAdoptIdx(adoptIdx);

				if (adoption != null) {
		%>

		<div class="form-signin w-100 m-auto border border-dark px-5">

			<div style="margin: 5px; text-align: center;">
				<img alt="${adoption.filename}" src="<%=adoption.getFilename()%>"
					style="border: 1px solid gray; margin-bottom: 5px; width: 400px; height: 400px;">
			</div>

			<div class="border p-1" style="margin: 0px 80px;">
				<div class="form-group d-flex align-items-center">

					<label class="col-3 col-form-label">입양번호:</label>

					<div class="form-floating col-7 ms-2 my-1">
						<%=adoption.getAdoptidx()%>
					</div>

				</div>

				<div class="form-group d-flex align-items-center">

					<label class="col-3 col-form-label">동물 아이디:</label>

					<div class="form-floating col-7 ms-2 my-1">
						<%=adoption.getAniid()%>
					</div>

				</div>

				<div class="form-group d-flex align-items-center">

					<label class="col-3 col-form-label">입양날짜:</label>

					<div class="form-floating col-7 ms-2 my-1">
						<%=adoption.getAdoptdate()%>
					</div>

				</div>
			</div>

			<form action="reviewActionadopt.jsp" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="adoptIdx"
					value="<%=adoption.getAdoptidx()%>">

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

		</div>
		<br>

		<%
		} else {
		%>
		<p>입양 정보를 찾을 수 없습니다.</p>
		<%
		}
		}

		} catch (NumberFormatException e) {
		%>
		<p>잘못된 입양 번호 형식입니다.</p>
		<%
		} catch (Exception e) {
		e.printStackTrace();
		%>
		<p>
			오류가 발생했습니다:
			<%=e.getMessage()%></p>
		<%
		}
		%>

		<!-- 메인 종료 -->
	</main>

	<!-- 푸터 시작 -->
	<%@ include file="../css/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

