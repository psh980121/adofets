<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />
<link rel="stylesheet" href="../css/005.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

</head>

<body class="d-flex flex-column min-vh-100 pb-0">

<%@ include file="../css/adheader.jsp"%>

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

		<form action="adqsUpdateAction.jsp" method="post"
			class="w-100 m-auto px-5" style="max-width: 1000px;">
			<input type="hidden" name="qsid" value="${qsdto.qsid}">

			<h1 style="text-align: center;">문의 상세 정보</h1>
			<hr>

			<div class="container-inner container-inner--request-page page">

				<div class="row row--flex">

					<div class="column request-column-top" style="width: 80%">
						<div class="request-box">
							<a class="btn request-see-all" href="adQuestionAction.jsp"> < 되돌아가기</a>
						</div>
						<!-- column request-column-top -->
					</div>

					<!-- 왼쪽 문의 번호, 작성 날짜, 문의 처리 상태 -->
					<div class="column request-column-sidebar" style="width: 20%">
						<ul class="request-info">
							<li>
								<div class="request-info__title">문의 번호</div>
								<div class="request-info__text">
									<c:out value="${qsdto.qsid}" />
								</div>
								<hr>
							</li>
							<li>
								<div class="request-info__title">문의 아이디</div>
								<div class="request-info__text">
									<c:out value="${qsdto.userid}" />
								</div>
								<hr>
							</li>
							<li>
								<div class="request-info__title">문의 유형</div>
								<div class="request-info__text">
									<c:out value="${qsdto.qscategory}" />
								</div>
								<hr>
							</li>
							<li>
								<div class="request-info__title">작성 날짜</div>
								<div class="request-info__text">
									<c:out value="${qsdto.qsdate }" />
								</div>
								<hr>
							</li>
							<li>
								<!-- 수정 가능성 있는 행 -->
								<div class="request-info__title">문의 처리 상태</div>
								<div class="request-info__text request-status--open">${qsdto.qsprocess}</div>
							</li>
						</ul>
					</div>

					<!-- 오른쪽 문의 제목, 문의 내용-->
					<div class="column request-column-content" style="width: 60%">

						<div class="request-box request-container">
							<!-- 문의 제목 -->
							<h1 class="request-subject mb-3">
								<c:out value="${qsdto.qstitle }" />
							</h1>
							<!-- 문의 내용 -->
							<div class="request-description">
								<c:out value="${qsdto.qscontent }" />
							</div>
						</div>

						<!-- 오른쪽 아래 답변 내용 -->
						<div class="request-box request-container">
							<ul class="request-info">
									<c:if test="${not empty qsdto.picture}">
								<li>
									<div class="request-info__title">문의 사진</div>
										<tr>
											<th>문의 사진</th>
											<td><img alt="${qsdto.picture }"
												src="/upload/${qsdto.picture }"
												style="width: 100%; height: 400px"></td>
										</tr>

									<hr>
								</li>
									</c:if>
									
									<c:if test="${empty qsdto.ascontent }">
								<li>
									<div class="request-info__title">답변 하기</div>
									<div class="request-info__text">
										<textarea rows="15" cols="67" name="ascontent"
											style="resize: none; font-family: fantasy;"></textarea>
									</div>
									<div >
									<button class="btn btn-primary w-100" 
										type="submit">제출하기</button>
									</div>
								</li>
								</c:if>
								<c:if test="${not empty qsdto.ascontent}">
								<div class="request-info__title">답변 내용</div>
									<div class="request-description">
								<c:out value="${qsdto.ascontent }" />
							</div>
								
								</c:if>
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
<%@ include file="../css/footer.jsp"%>

	<script type="text/javascript" src=" ../js/islogin.js"></script>
</body>
</html>