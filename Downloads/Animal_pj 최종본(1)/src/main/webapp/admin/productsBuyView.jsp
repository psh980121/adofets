<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
</head>
<body>
	<form action="" method="post">
	<input type="hidden" name="pdtcode" value="${dto.pdtcode}">

		<input type="hidden" name="pcode" value="${dto.pdtcode }"> <img
			alt="${dto.pdtpicture}" src="/upload/${dto.pdtpicture}"
			style="border: 1px solid gray; margin-bottom: 5px; width: 400px; height: 400px;">
		<p>
		<table>		
			<tr>
				<th>상품 이름</th>
				<td><input type="text" name="pdtname" value="${dto.pdtname}"></td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td><input type="number" name="pdtprice" value="${dto.pdtprice}"></td>
			</tr>
			<tr>
				<th>상품 카테고리</th>
				<td><input type="text" name="pdtcate" value="${dto.pdtcate}"></td>
			</tr>
			<tr>
				<th>상품 설명</th>
				<td><input type="text" name="pdtcontent" value="${dto.pdtcontent}"></td>
			</tr>
		
		</table>
 
		<br>
		<button type="button" onclick="update()">수정하기</button>
		<button type="button" onclick="pdelete()">삭제하기</button>

	</form>
	<script type="text/javascript">
			var ff = document.forms[0]
		function update() {
			ff.action = 'adproductupdate.jsp'
			ff.submit();
			
		}
		
		function pdelete() {
			ff.action = 'adproductdelete.jsp'
			ff.submit();			
		}
	
	</script>
</body>

</html>