<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Sign Up Page</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

<body class="d-flex flex-column min-vh-100 pb-0">
	<%@ include file="../css/header.jsp"%>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px; margin-top: 70px;">

		<form action="signupAction.jsp" method="post"
			class="form-signin w-100 m-auto border border-dark px-5">

			<img class="mb-4 mt-5" src="../image/uni.png" alt="cow" width="200"
				height="180" />
			<h1 class="h3 fw-normal">회원가입 해주세요.</h1>

			<!-- flex 묶기 -->
			<div class="form-group d-flex align-items-center">
			<input type="hidden" name="sameidresult" value="${sameidresult }">
			<input type="hidden" name="samenickresult" value="${samenickresult }">
				<!-- userID 입력 필드 -->
				<label for="userID" class="col-3 col-form-label">아이디:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="text" class="form-control" id="userID" name="userid"
						placeholder="ID" value="${sameDto.userid }" /> <label
						for="floatingInput">ID</label>
					<div id="sameid">
						<c:if test="${empty sameidresult} ">

						</c:if>
						<c:if test="${sameidresult == 1 }">
							<span class="text-danger fw-bold">중복</span>
						</c:if>
						<c:if test="${sameidresult == 0 }">
							<span class="text-success fw-bold">사용가능</span>
						</c:if>
					</div>
				</div>
				<button type="button" class="btn btn-primary col-2 ms-2"
					onclick="isSame()">중복검사</button>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- userPass 입력 필드 -->
				<label for="userPass" class="col-3 col-form-label">비밀번호:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="password" class="form-control" id="userPass"
						name="userpass" placeholder="Password"
						value="${sameDto.userpass }" /> <label for="floatingPassword">Password</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- userName 입력 필드 -->
				<label for="userName" class="col-3 col-form-label">이름:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="text" class="form-control" id="userName"
						name="username" placeholder="이름" value="${sameDto.username }" />
					<label for="floatingUserName">Name</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- userNick 입력 필드 -->
				<label for="userNick" class="col-3 col-form-label">닉네임:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="text" class="form-control" id="userNick"
						name="usernick" placeholder="닉네임" value="${sameDto.usernick }" />
					<label for="floatingUserNick">NickName</label>
					<div id="samenick">
						<c:if test="${empty samenickresult} ">

						</c:if>
						<c:if test="${samenickresult == 1 }">
							<span class="text-danger fw-bold">중복</span>
						</c:if>
						<c:if test="${samenickresult == 0 }">
							<span class="text-success fw-bold">사용가능</span>
						</c:if>
					</div>
				</div>
				<button type="button" class="btn btn-primary col-2 ms-2"
					onclick="isSame2()">중복검사</button>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- userAge 입력 필드 -->
				<label for="userAge" class="col-3 col-form-label">나이:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="number" class="form-control" id="userAge"
						name="userage" placeholder="나이" value="${sameDto.userage }" /> <label
						for="floatingUserAge">Age</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- userEmail 입력 필드 -->
				<label for="userEmail" class="col-3 col-form-label">이메일:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="text" class="form-control" id="userEmail"
						name="useremail" placeholder="이메일" value="${uemail}" /> <label
						for="floatingUserEmail">Email</label>
				</div>
				@<select name="email" style="height: 50px;">
					<option>naver.com</option>
					<option>gmail.com</option>
					<option>nate.com</option>
				</select>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- userPhone 입력 필드 -->
				<label for="userPhone" class="col-3 col-form-label">전화번호:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="text" class="form-control" id="userPhone"
						name="userphone" placeholder="전화번호" value="${sameDto.userphone }" />
					<label for="floatingUserPhone">Phone</label>
				</div>
			</div>

			<div>
				<label for="userCate" class="col-3 col-form-label">유형:</label> <select
					class="col-7 ms-1 my-1" id="userCate" name="usercate"
					style="height: 50px">
					<option>사용자</option>
					<option>관리자</option>
				</select>
			</div>

			<div class="form-group d-flex align-items-center">
				<!-- userCity 입력 필드 -->
				<label for="userCity" class="col-3 col-form-label">도시:</label>
				<div class="form-floating col-7 ms-2 my-1">
					<input type="text" class="form-control" id="userCity"
						name="usercity" placeholder="도시" value="${sameDto.usercity }" />
					<label for="floatingUserCity">City</label>
				</div>
			</div>

			<div class="form-group d-flex justify-content-center mt-5">
				<button class="btn btn-primary py-2" type="button" onclick="func_join()">회원가입</button>
			</div>

		</form>

		<!-- 메인 종료 -->
	</main>
	<!-- 푸터 시작 -->
<%@ include file="../css/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
	<script type="text/javascript" src=" ../js/signup.js"></script>
	<script type="text/javascript" src = "${pageContext.request.contextPath}/js/islogin.js">	</script>
</body>
</html>









