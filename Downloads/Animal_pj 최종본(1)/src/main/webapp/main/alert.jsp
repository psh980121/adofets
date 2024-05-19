<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- alert과 location.href를 out.print로 작성하지 않기 위해 별도로 작성 -->
	<script type="text/javascript">
		alert('${message}')
		location.href='${url}'
	</script>	
</body>
</html>