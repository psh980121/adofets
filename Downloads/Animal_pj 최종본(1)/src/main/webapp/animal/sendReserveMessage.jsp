<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 전송</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	<div>
		<h3 class="m-2">메시지 전송</h3>
		<hr>
		<form id="messageForm" method="post" action="saveMessage.jsp">
			<div id="sender-info">
				<input type="hidden" id="userid" name="userid"
					value="<%=request.getParameter("userid")%>"> <input
					type="hidden" id="aniid" name="aniid"
					value="<%=request.getParameter("animalId")%>">
				<div class="m-2">
					<strong>받는 분 ID:</strong> <span id="userid"><%=request.getParameter("userid")%></span>
				</div>
				<div class="m-2">
					<strong>동물 ID:</strong> <span id="animalId"><%=request.getParameter("animalId")%></span>
				</div>
				<hr>
			</div>
			<label for="message"></label>
			<textarea id="message" name="message" rows="6" cols="60"
				style="resize: none;"></textarea>
			<br>
			<div class="bg-transparent"
				style="position: fixed; bottom: 0; left: 0; width: 100%; background-color: #f8f9fa; padding: 10px; display: flex; justify-content: space-between;">
				<button type="submit" class="btn btn-primary rounded-pill">메시지
					전송</button>
				<button type="button" onclick="closeMessageWindow()"
					class="border-0 bg-transparent">
					<i class="bi bi-trash3"></i>
				</button>
			</div>
		</form>
	</div>
	<script>
		// URL에서 쿼리 매개변수를 읽어옵니다.
		const urlParams = new URLSearchParams(window.location.search);

		const animalId = urlParams.get("animalId");
		const userid = urlParams.get("userid");

		// 읽어온 데이터를 사용하거나 처리합니다.
		console.log("Animal ID:", animalId);
		console.log("User ID:", userid);

		messageForm.addEventListener("submit", function(event) {
			const message = document.getElementById("message").value;
			const userid = document.getElementById("userid").value;
			const aniid = document.getElementById("aniid").value;
			// 메시지 필드가 비어 있는 경우
			if (message.trim() === "") {
				event.preventDefault(); // 폼 제출을 취소합니다.
				alert("메시지를 입력하세요.");
			} else {
				// 메시지가 비어 있지 않은 경우, 폼을 제출하도록 그대로 진행합니다.
				console.log("Message: " + message);
			}
		});

		function closeMessageWindow() {
			window.close();
		}
	</script>
</body>
</html>
