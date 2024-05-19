
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="org.iclass.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>1:1 문의사항 처리</title>

<link rel="stylesheet" href="../css/002.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

<body class="d-flex flex-column min-vh-100 pb-0">

	<!-- 헤더 시작, 밝은 테마 -->
<%@ include file="../css/adheader.jsp"%>

	<!-- 메인 시작 -->
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-bottom: 200px; margin-top: 50px;	">

		<h2 class="text-primary text-opacity-25">상품 매출 확인</h2>
		<form action="" method="post" class="border border-primary rounded"
			style="width: 1252px; padding: 10px;">
			<input type="hidden" name="adqsid" value="">
			<input type="hidden" name="status" value="">
			
			<div class="table-responsive small">

				<!-- 테이블의 행에 번갈아가며 배경색을 지정하여 줄을 구분 -->
				<table class="table table-striped table-hover table-sm"
					style="width: 1230px;">
					<thead>
						<tr>
							<th scope="col">상품 코드</th>
							<th scope="col">상품 이름</th>
							<th scope="col">상품 가격</th>
							<th scope="col">판매 개수</th>
							<th scope="col">총 가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sale" items="${sales}">
							<tr>
								<td>${sale.getPdtcode()}</td>
								<td>${sale.getPdtname()}</td>
								<td>${sale.getPdtprice()}</td>
								<td>${sale.getCounts()}</td>
								<td>${sale.getTotal()}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>

		<!-- 메인 종료 -->
	</main>
	<!-- 푸터 시작 -->
<%@ include file="../css/footer.jsp"%>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">		
	</script>
</body>
</html>
