<%@page import="org.iclass.dto.QuestionDto"%>
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
    --bs-btn-focus-shadow-rgb: 130,138,145;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #70c2ff;
    --bs-btn-active-border-color: #79c1ff;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #40a5ff;
    --bs-btn-disabled-border-color: #2f9dff;
}

.dropdown-menu-dark{
--bs-dropdown-bg : #5faff5;
--bs-dropdown-link-color: white;
}





</style>
</head>

<body class="d-flex flex-column min-vh-100 pb-0">

	<!-- 헤더 시작, 밝은 테마 -->
<%@ include file="../css/adheader.jsp"%>

	<!-- 메인 시작 -->
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-bottom: 200px; margin-top: 50px;	">

		<h2 class="text-primary text-opacity-25">문의 게시판</h2>
		<div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
   			 <c:if test="${option == null }">
   			 처리중
   			 </c:if>
   			 <c:if test="${option == '처리중' }">
   			 처리중
   			 </c:if>
   			 <c:if test="${option == '전체' }">
   			 전체
   			 </c:if>
   			 <c:if test="${option == '답변 완료' }">
   			 답변 완료
   			 </c:if>
   			 
  			</button>
            
               <ul class="dropdown-menu dropdown-menu-dark">
                  <li>
                     <button name="bt1" value="전체" class="dropdown-item" onclick="adchange('전체')">전체</button>
                  </li>
                  <li>
                     <button name="bt2" value="처리중" class="dropdown-item" onclick="adchange('처리중')">처리중</button>
                  </li>
                  <li>
                     <button name="bt3" value="답변 완료" class="dropdown-item" onclick="adchange('답변 완료')">답변 완료</button>
                  </li>
               </ul>
            </div>
			<br>
       		<br>
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
							<th scope="col">문의 번호</th>
							<th scope="col">문의 유형</th>
							<th scope="col">문의 제목</th>
							<th scope="col">문의 ID</th>
							<th scope="col">문의 날짜</th>
							<th scope="col">문의 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="qna" items="${question}">
							<tr>
								<td><a class="text-decoration-none"
									href="javascript:adupdate('${qna.getQsid()}')">${qna.getQsid()}</a>
								</td>
								<td>${qna.getQscategory()}</td>
								<td>${qna.getQstitle()}</td>
								<td>${qna.getUserid()}</td>
								<td>${qna.getQsdate()}</td>
								<td>${qna.getQsprocess()}</td>
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

	<script type="text/javascript">
		function adupdate(id) {
			const up = document.forms[1]
			up.adqsid.value = id

			up.action = 'adQuestionUpdate.jsp'
			up.submit()
		}
		
		// 버튼을 클릭하면 옵션 목록을 열거나 닫습니다.
	    const toggleBtn = document.querySelector(".toggle-btn");
	    const selectbox = document.querySelector(".selectbox");

	    toggleBtn.addEventListener("click", () => {
	      selectbox.classList.toggle("open");
	    });
	    
		
	function adchange(status) {
			const ff = document.forms[1]
			
			ff.status.value = status
			ff.action = 'adqscate.jsp'
			ff.submit()
			
		}	
	</script>
<script type="text/javascript">
	const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
	const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))
	
	</script>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">		
	</script>
</body>
</html>
