<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />

<title>커뮤니티</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

</head>
<body class="d-flex flex-column min-vh-100 pb-0">
	<%@ include file="../css/header.jsp"%>

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

		<h3>커뮤니티</h3>
		<p>글목록</p>
		<hr style="color: white;">
		<form name="frm1" method="post" action="updateAction.jsp"
			enctype="multipart/form-data">
			<!--onsubmit="return isValid()" 방법도 있음.  -->
			<input type="hidden" name="postidx" value="${vo.postidx }"> <input
				type="hidden" name="page" value="${page}">
			<!-- 현재페이지 번호 전달 - 순서5) post 로 전달해야 하므로 hidden type으로 저장 -->
			<table>
				<tr>
					<th>제목</th>
					<td>
						<!-- 수정된 글은 제목 앞에 `[수정]` 문자열을 넣어줍니다.  --> <c:choose>
							<c:when test="${fn:contains(vo.postitle,'[수정]') }">
								<!-- title 에 `[수정]` 이 있으면 참 -->
								<input type="text" name="postitle" size="50"
									value="${vo.postitle }" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" name="postitle" size="50"
									value="[수정]${vo.postitle }" readonly>
							</c:otherwise>
						</c:choose> <!-- readonly : 입력불가 -->
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" size="50"
						value="${vo.usernick }" disabled="disabled"></td>
					<!-- disabled : 입력 불가 + 파리미터 전송 못함. -->
				</tr>
				<tr>
					<th>작성 날짜</th>
					<!-- 수정할 값이 아니므로 화면에 표시만 합니다. -->
					<td><c:out value="${vo.posttime }" /></td>
				</tr>

				<tr>
					<th>내용</th>
					<!-- textarea 의 크기 : rows="30" cols="80" -->
					<td><textarea rows="30" cols="80" name="postcontent" required><c:out
								value="${vo.postcontent }" /></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" onclick="isValid()">저장</button> <!-- 유효성검사 후 자바스크립트에서 submit. (hrd_mvc2 프로젝트 유효성 검사 참고.)  -->
						<button type="reset">다시쓰기</button>
						<button type="button"
							onclick="location.href='list.jsp?page=${page}'">목록</button> <!-- 현재페이지 번호 전달 - 순서5) -->
					</td>
				</tr>
			</table>
		</form>
		
		<!-- 메인 종료 -->
	</main>

	<!-- 페이지 하단 영역 -->
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

	<script type="text/javascript">
		function isValid() {
			let result = true //유효성 검사 결과 저장
			const content = document.forms[1].postcontent //input 요소 지정
			if (content.value == '') {
				alert('글 내용 작성은 필수 입니다.')
				result = false
				content.focus()
			}

			if (result) {
				document.forms[1].submit()
			}
		}

	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
