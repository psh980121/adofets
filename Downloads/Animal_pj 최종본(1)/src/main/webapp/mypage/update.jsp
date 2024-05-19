<%@page import="org.iclass.dto.usersDto"%>
<%@page import="org.iclass.dao.usersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />

<title>사용자 정보 수정</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body class="d-flex flex-column min-vh-100 pb-0">
	<%@ include file="../css/header.jsp"%>

	<!-- 메인 시작 -->
	<main style="margin-bottom: 200px; margin-top: 100px;">

		<%
		// 사용자로부터 전달받은 userId 파라미터 받기
		//String userId = request.getParameter("userId");
		usersDto udtos = (usersDto) session.getAttribute("user");
		String id = udtos.getUserid();

		// UserDao 객체를 생성
		usersDao uDao = usersDao.getInstance();

		// UserDao의 selectUserByUSERID 메서드를 호출하여 userId를 매개변수로 전달하여 사용자 정보를 조회
		// SQL 쿼리에서 userId를 문자열로 사용하려고 작은따옴표로 감싸줌
		usersDto userList = uDao.selectUserByUSERID(id);

		// 조회된 사용자 정보 리스트의 크기가 1인 경우에만 해당 사용자의 정보를 가져와서 처리합니다.
		if (userList != null) {
			// userList에서 첫 번째 사용자 정보를 가져옵니다.
		%>

		<form action="updateAction.jsp" method="post"
			class="form-signin w-100 m-auto border border-dark px-5">

			<h1 class="h3 fw-normal">정보수정</h1>
			<input type="hidden" name="userid" value="<%=userList.getUserid()%>">

			<div class="form-group d-flex align-items-center">

				<label for="usercate" class="col-3 col-form-label">User
					Category:</label>

				<div class="form-floating col-7 ms-2 my-1">

					<input type="text" class="form-control" disabled="disabled"
						id="usercate" name="usercate" value="<%=userList.getUsercate()%>">
					<label for="floatingPassword">User Category</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">

				<label for="username" class="col-3 col-form-label">이름:</label>

				<div class="form-floating col-7 ms-2 my-1">

					<input type="text" class="form-control" id="username"
						name="username" value="<%=userList.getUsername()%>"> <label
						for="floatingPassword">Username</label>
				</div>
			</div>
			
			<div class="form-group d-flex align-items-center">

				<label for="userpass" class="col-3 col-form-label">비밀번호:</label>

				<div class="form-floating col-7 ms-2 my-1">

					<input type="password" class="form-control" id="userpass"
						name="userpass" placeholder="Password"
						value="<%=userList.getUserpass()%>"> <label
						for="floatingPassword">Password</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">

				<label for="usernick" class="col-3 col-form-label">닉네임:</label>

				<div class="form-floating col-7 ms-2 my-1">

					<input type="text" class="form-control" id="usernick"
						name="usernick" value="<%=userList.getUsernick()%>"> <label
						for="floatingPassword">Nickname</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">

				<label for="userage" class="col-3 col-form-label">나이:</label>

				<div class="form-floating col-7 ms-2 my-1">

					<input type="number" class="form-control" id="userage"
						name="userage" value="<%=userList.getUserage()%>"> <label
						for="floatingPassword">Age</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">

				<label for="usercity" class="col-3 col-form-label">도시:</label>

				<div class="form-floating col-7 ms-2 my-1">

					<input type="text" class="form-control" id="usercity"
						name="usercity" value="<%=userList.getUsercity()%>"> <label
						for="floatingPassword">City</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">

				<label for="useremail" class="col-3 col-form-label">이메일:</label>

				<div class="form-floating col-7 ms-2 my-1">

					<input type="email" class="form-control" id="useremail"
						name="useremail" value="<%=userList.getUseremail()%>"> <label
						for="floatingPassword">Email</label>
				</div>
			</div>

			<div class="form-group d-flex align-items-center">

				<label for="userphone" class="col-3 col-form-label">전화번호:</label>

				<div class="form-floating col-7 ms-2 my-1">

					<input type="tel" class="form-control" id="userphone"
						name="userphone" value="<%=userList.getUserphone()%>"> <label
						for="floatingPassword">Phone</label>
				</div>
			</div>

			<div class="form-group d-flex justify-content-center mt-5">
				<button type="submit" class="btn btn-primary py-2" type="submit" onclick="fix()">수정하기</button>
			</div>
		</form>

		<form action="deleteAction.jsp?action=delete" method="post"
			class="form-signin w-100 m-auto border border-dark px-5">
			
			<h1>회원 탈퇴</h1>
			
			<label for="deleteuser">비밀번호를 입력해 주세요.</label> <input id="deleteuser"
				type="text" name="password" value="${pass}">

			<hr>
			<button type="button" onclick="delpass()">회원탈퇴</button>
			<c:if test="${samepass == 0 }">
				<input type="hidden" name="isSames" value="2">
				<p>비밀번호 불일치.</p>
			</c:if>
		</form>

		<%
		} else {
		%>

		<p>유저를 찾을수 없음</p>

		<%
		}
		%>

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
		function delpass() {
			const frm = document.forms[2]
			const pass = frm.password.value

			if (pass == '') {
				alert('비밀번호를 입력해주세요.')
			} else {
				const frm = document.forms[2]
				frm.action = '../account/passwordSame.jsp'
				frm.submit()
			}
		}
	</script>
	
	<script type="text/javascript">
		function fix() {
			const ff = document.forms[1]
			alert('정보 수정이 완료되었습니다.')
			ff.submit()
		}
	</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
