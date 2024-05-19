<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="org.iclass.dao.QuestionDao"%>
<%@page import="org.iclass.dto.ProductDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>QuestionDetail</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />
<link rel="stylesheet" href="../css/005.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />

</head>

<body class="d-flex flex-column min-vh-100 pb-0">
	<!-- 헤더 시작, 밝은 테마 -->
	<%@ include file="../css/header.jsp"%>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px;">
		<div class="d-flex">
         <img alt="../image/uni2.jpg" src="../image/uni2.jpg" height="450px"
            width="48%"> <img alt="../image/uni.jpg"
            src="../image/uni.jpg" height="450px" width="54%">
     	 </div>
			
	


		<form method="post" action="QuestionDetailUpdate"
			enctype="multipart/form-data" class="w-100 m-auto px-5"
			style="max-width: 1000px;">

			<h1 style="text-align: center;">문의 상세 정보</h1>
			<hr>

			<div class="container-inner container-inner--request-page page">

				<div class="row row--flex">

					<div class="column request-column-top" style="width: 80%">
						<div class="request-box">
							<a class="btn request-see-all" href="MyQuestion.jsp"> < 되돌아가기</a>
						</div>
						<!-- column request-column-top -->
					</div>

					<!-- 왼쪽 문의 번호, 작성 날짜, 문의 처리 상태 -->
					<div class="column request-column-sidebar" style="width: 20%">
						<ul class="request-info">
							<li>
								<div class="request-info__title">문의 번호</div>
								<div class="request-info__text">${dto.getQsid() }</div>
								<hr>
							</li>
							<li>
								<div class="request-info__title">문의 유형</div>
								<div class="request-info__text">${dto.getQscategory()}</div>
								<hr>
							</li>
							<li>
								<div class="request-info__title">작성 날짜</div>
								<div class="request-info__text">${dto.getQsdate()}</div>
								<hr>
							</li>
							<li>
								<div class="request-info__title">문의 처리 상태</div>
								<div class="request-info__text request-status--open">${dto.getQsprocess()}</div>
							</li>
						</ul>
					</div>

					<!-- 오른쪽 문의 제목, 문의 내용-->
					<div class="column request-column-content" style="width: 60%">

						<div class="request-box request-container">
							<!-- 문의 제목 -->
							<h1 class="request-subject mb-3">${dto.getQstitle()}</h1>
							<!-- 문의 내용 -->
							<div class="request-description">${dto.getQscontent()}</div>
						</div>

						<!-- 오른쪽 아래 답변 내용 -->
						<div class="request-box request-container">
							<ul class="request-info">
								<li>
									<div class="request-info__title">첨부파일</div> <c:choose>
										<c:when test="${not empty dto.getPicture()}">
											<img src="/upload/${dto.getPicture()}" alt="첨부파일" style="width: 400px; height: 400px;">
										</c:when>
										<c:otherwise>
											<p>첨부 파일 없음</p>
										</c:otherwise>
									</c:choose>
									<hr>
								</li>
								<li>
									<div class="request-info__title">답변 날짜</div>
									<div class="request-info__text">${dto.getAsdate()}</div> <c:choose>
										<c:when test="${not empty dto.getAsdate()}">
										</c:when>
										<c:otherwise>
											<td style="padding: 8px 0px 8px 0px">Type a response...</td>
										</c:otherwise>
									</c:choose>
								</li>
								<li>
									<div class="request-info__title">답변 내용</div>
									<div class="request-info__text">${dto.getAscontent()}</div> <c:choose>
										<c:when test="${not empty dto.getAscontent()}">
										</c:when>
										<c:otherwise>
											<td style="padding: 8px 0px 8px 0px">Type a response...</td>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>
						</div>

					</div>

					<!-- row row--flex -->
				</div>

				<!-- container-inner container-inner--request-page page -->
			</div>

			<!-- form 종료 -->
		</form>

		<!-- 메인 종료 -->
	</main>
	<!-- 푸터 시작 -->
	<footer style="width: 100%; height: 100px; margin: 0px;">
		<div class="footer-wrap" style="position: relative;">
			<div
				style="background-color: skyblue; width: 100%; height: 200px; text-align: center; padding: 20px;">
				<p style="color: black; font-weight: bold;">강아지파양 고양이파양 유기동 물방지
					무료분양입양 아이조아요양보호소</p>
				<p>ⓒ 2023 강아지파양 고양이파양 유기동물방지 무료분양입양 입소보호소 All rights reserved.</p>
			</div>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
</body>
</html>









