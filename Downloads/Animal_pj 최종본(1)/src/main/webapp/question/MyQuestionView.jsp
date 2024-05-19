<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="org.iclass.dao.QuestionDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>My page</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
/* 드롭다운 메뉴를 숨깁니다. */
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* 드롭다운 메뉴의 항목 스타일 */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* 드롭다운 메뉴를 표시합니다. */
.dropdown:hover .dropdown-content {
	display: block;
}

.btn-secondary {
	--bs-btn-color: #fff;
	--bs-btn-bg: #5faff5;
	--bs-btn-border-color: #71bcff;
	--bs-btn-hover-color: #fff;
	--bs-btn-hover-bg: #7abdff;
	--bs-btn-hover-border-color: #77c5ff;
	--bs-btn-focus-shadow-rgb: 130, 138, 145;
	--bs-btn-active-color: #fff;
	--bs-btn-active-bg: #70c2ff;
	--bs-btn-active-border-color: #79c1ff;
	--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	--bs-btn-disabled-color: #fff;
	--bs-btn-disabled-bg: #40a5ff;
	--bs-btn-disabled-border-color: #2f9dff;
}

.dropdown-menu-dark {
	--bs-dropdown-bg: #5faff5;
	--bs-dropdown-link-color: white;
}
</style>

</head>
<%
/* ProductDao dao = ProductDao.getProductDao();
ProductDto dto = dao.getByPdtname("소");
request.setAttribute("ProductDto", dto); */
%>

<body class="d-flex flex-column min-vh-100 pb-0">
	<!-- 헤더 시작, 밝은 테마 -->
	<%@ include file="../css/header.jsp"%>

	<div class="d-flex">
         <img alt="../image/uni2.jpg" src="../image/uni2.jpg" height="450px"
            width="48%"> <img alt="../image/uni.jpg"
            src="../image/uni.jpg" height="450px" width="54%">
    
	</div>

	<!-- 메인 시작 -->
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-bottom: 200px; margin-top: 50px;">

		<form method="post" action="QuestionDetailUpdate.jsp"
			class="w-100 m-auto px-5"
			style="max-width: 1200px; margin-top: 50px;">
			<input type="hidden" name="qsid" id="qsid">
		</form>

		<h1 class="text-primary text-opacity-25"
			style="text-align: center; margin-right: 300px;" id="main">내 문의
			내역</h1>

		<form action="" method="post">
			<input type="hidden" name="userid" value="${param.userid }">
			<!-- <input type="hidden" name="status" value=""> -->

			<div class="dropdown">
				<a class="btn request-see-all ml-auto" href="Question.jsp" "> < 문의 하러가기</a>
				<select class="form-select form-select-lg"
					aria-label="Large select example" name="status"
					onchange="adchange(this.value)"
					style="background-color: #58ACFA; color: white;">
					<option selected="selected" value="all" ${option=='all'? 'selected':'' }>전체</option>
					<option value="처리중" ${option=='처리중'? 'selected':'' }>처리중</option>
					<option value="답변 완료" ${option=='답변 완료'? 'selected':'' }>답변
						완료</option>
				</select>
			</div>
			<br> <br>

			<div class="border border-primary rounded"
				style="width: 1252px; padding: 10px;">

				<div class="table-responsive small">

					<table class="table table-striped table-hover table-sm"
						style="width: 1230px;">

						<thead>
							<tr class="border">
								<th style="width: 150px;">문의 번호</th>
								<th style="width: 150px;">문의 유형</th>
								<th style="width: 700px;">문의 제목</th>
								<th style="width: 150px;">문의 날짜</th>
								<th style="width: 150px;">문의 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="dto" items="${list}">
										<tr class="border">
											<td style="padding: 8px 0px 8px 0px"><a
												class="text-decoration-none"
												href="javascript:detail('${dto.qsid}')">${dto.qsid }</a></td>
											<td style="padding: 8px 0px 8px 0px">${dto.qscategory}</td>
											<td style="padding: 8px 0px 8px 0px">${dto.qstitle}</td>
											<td style="padding: 8px 0px 8px 0px">${dto.qsdate}</td>
											<td style="padding: 8px 0px 8px 0px">${dto.qsprocess}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td style="padding: 15px 0px 15px 0px" colspan="5">문의 내역이
											없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>

					</table>
					<div
						style="width: 700px; margin: auto; padding: 10px; text-align: center; font-family: Arial, sans-serif; font-size: 18px;">
						전체 글 개수:
						<c:out value="${paging.totalCount}" />
						<br>
						<hr>

						<!-- << 버튼 -->
						<a class="pagenum" href="?page=1&status=${option}#main"
							aria-label="첫 페이지로 이동">&lt;&lt;</a>

						<!-- < 이전 페이지 버튼 -->
						<a class="pagenum"
							href="?page=${paging.startPage - 1}&status=${option}#main"
							style='<c:if test="${paging.startPage==1}">display:none;</c:if>'
							aria-label="이전 페이지로 이동">&lt;</a>

						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${paging.startPage}"
							end="${paging.endPage}">
							<a class="pagenum ieach" href="?page=${i}&status=${option}#main">${i}</a>
						</c:forEach>

						<!-- > 다음 페이지 버튼 -->
						<a class="pagenum"
							href="?page=${paging.endPage + 1}&status=${option}#main"
							style='<c:if test="${paging.endPage==paging.totalPage}">display:none;</c:if>'
							aria-label="다음 페이지로 이동">&gt;</a>

						<!-- >> 버튼 -->
						<a class="pagenum"
							href="?page=${paging.totalPage}&status=${option}#main"
							aria-label="마지막 페이지로 이동">&gt;&gt;</a>
					</div>
				</div>
			</div>




			<!-- form 종료 -->
		</form>

		<!-- 메인 종료 -->
	</main>

	<!-- footer 시작 -->
	<footer style="width: 100%; height: 100px; margin: 0px;">
		<div class="footer-wrap" style="position: relative;">
			<div
				style="background-color: skyblue; width: 100%; height: 150px; text-align: center; padding: 20px;">
				<p style="color: black; font-weight: bold;">강아지파양 고양이파양 유기동 물방지
					무료분양입양 아이조아요양보호소</p>
				<p>ⓒ 2023 강아지파양 고양이파양 유기동물방지 무료분양입양 입소보호소 All rights reserved.</p>
			</div>
		</div>
	</footer>

	<script type="text/javascript">
		function detail(id) {
			const dt = document.forms[1];

			dt.qsid.value = id;
			dt.action = 'QuestionDetailUpdate.jsp'
			dt.submit();
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
	<script>
		// 버튼을 클릭하면 옵션 목록을 열거나 닫습니다.
		/*  const toggleBtn = document.querySelector(".toggle-btn");
		 const selectbox = document.querySelector(".selectbox");

			 Btn.addEventListener("click", () => {
		   selectbox.classList.toggle("open");
		 }); */

		function adchange() {
			const ff = document.forms[2]

			//ff.status.value = status
			ff.action = "MyQuestion.jsp#main"
			ff.submit()

		}
	</script>

	<script type="text/javascript">
		//const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
		//const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))
	</script>


</body>
</html>



