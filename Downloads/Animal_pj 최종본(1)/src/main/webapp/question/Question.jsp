<%@page import="org.iclass.dto.QuestionDto"%>
<%@page import="org.iclass.dao.QuestionDao"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Question</title>

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
	<!-- 헤더 시작, 밝은 테마 -->
	<%@ include file="../css/header.jsp"%>

	<div class="d-flex">
         <img alt="../image/uni2.jpg" src="../image/uni2.jpg" height="400px"
            width="48%"> <img alt="../image/uni.jpg"
            src="../image/uni.jpg" height="400px" width="54%">
      </div>
 


	<!-- 메인 시작 -->
	<main id="write" style="margin-bottom: 200px;">

		<h1 style="text-align: center; margin-bottom: 30px;">1:1문의사항</h1>
		<p style="text-align: center; margin-bottom: 50px;">
		<form name="frm1" method="post" action="QuestionAction.jsp"
			onsubmit="return isValid()" enctype="multipart/form-data"
			class="w-100 m-auto px-5" style="max-width: 1200px;">
			<hr style="color: gray;">

			<table class="mx-auto" style="text-align: center; margin-top: 100px;">

				<tr>
					<th class="p-4">문의 유형*</th>
					<td><select class="form-select "
						aria-label="Default select example" name="qscategory" required>
							<option selected>선택</option>
							<option value="결제문의">결제문의</option>
							<option value="입양문의">입양문의</option>
							<option value="배송문의">배송문의</option>
							<option value="환불문의">환불문의</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr>
					<th class="p-4">문의 제목*</th>
					<td><input type="text" name="qstitle" size="78" required>
					</td>
				</tr>
				<tr>
					<th>문의 내용*</th>
					<td><textarea rows="20" cols="80" name="qscontent"
							style="resize: none;"
							placeholder="
                    
                    
                    
                    
                    
                                        
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
 ※최대 글자수는 1000자 입니다."
							required></textarea></td>
				</tr>
				<tr>
					<th></th>
					<td style="padding-top: 30px;">
						<div class="input-group">
							<input type="file" name="picture" accept="image/jpeg, image/png"
								class="form-control" id="inputGroupFile04"
								aria-describedby="inputGroupFileAddon04" aria-label="Upload">
						</div>
					</td>
				</tr>
				<tr>
					<td class="pt-3" colspan="2" align="center">
						<button class="btn btn-primary" style="margin-left: 100px;" type="submit">문의하기</button>
						<button type="button" class="btn btn-warning"
							onclick="location.href='MyQuestion.jsp'">목록</button>
					</td>
				</tr>

			</table>

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









