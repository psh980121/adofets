<%@page import="org.iclass.dto.AdoptDto"%>
<%@page import="org.iclass.dao.usersDao"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.animalDao"%>
<%@page import="com.oreilly.servlet.DaemonHttpServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양요청</title>

<style>
table {
	border-collapse: collapse; /* 테이블 셀 테두리를 합칩니다. */
	width: 100%; /* 표의 전체 너비를 100%로 설정합니다. */
	border: 1px solid #ddd; /* 외곽선 스타일과 색상을 설정합니다. */
}

th, td {
	border: 1px solid #ddd; /* 셀 테두리 스타일과 색상을 설정합니다. */
	padding: 8px; /* 셀 안의 여백을 설정합니다. */
	text-align: center; /* 셀 내용을 가운데 정렬합니다. */
}

main img {
	width: 100px; /* 이미지의 가로 크기를 조정합니다. */
	height: 100px; /* 이미지의 세로 크기를 조정합니다. */
}

.reserve-button, .reject-button {
	padding: 5px 10px; /* 버튼 내용의 여백을 설정합니다. */
	cursor: pointer; /* 마우스 커서를 포인터로 변경합니다. */
}
</style>

<link rel="stylesheet" href="../css/002.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

<body class="d-flex flex-column min-vh-100 pb-0">

	<!-- 헤더 시작, 밝은 테마 -->
<%@ include file="../css/adheader.jsp"%>
	<section class="py-5 text-center container">
					<img alt="" src="dogSnack.png" style ="width:1300px; height:550px;">
			</section>

	<!-- 메인 시작 -->
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-bottom: 200px;">

		<h1>입양요청확인</h1>

		<div class="border border-primary rounded"
			style="width: 1252px; padding: 10px;">

			<div class="table-responsive small">


				<%
				List<AdoptDto> list = animalDao.getInstance().infoAdopt();
				%>

				<table class="table table-striped table-hover table-sm"
					style="width: 1230px;">
					<thead>
						<tr>
							<th scope="col" style="text-align: center;">동물 사진</th>
							<th scope="col" style="text-align: center;">유기번호</th>
							<th scope="col" style="text-align: center;">방문예약날짜</th>
							<th scope="col" style="text-align: center;">동물 ID</th>
							<th scope="col" style="text-align: center;">사용자 ID</th>
							<th scope="col" style="text-align: center;">사용자 전화번호</th>
							<th scope="col" style="text-align: center;">확인여부</th>
						</tr>
					</thead>
					<%
					usersDao dao = usersDao.getInstance();
					for (AdoptDto item : list) {
						String desertionNo = item.getAniid(); // desertionNo를 동적으로 설정합니다.
					%>
					<tbody>
						<tr>

							<td><img src="<%=item.getFilename()%>" alt='' width='100'
								height='100'></td>
							<td><%=item.getAdoptidx()%></td>
							<td><%=item.getAdoptdate()%></td>
							<td><%=item.getAniid()%></td>
							<td><%=item.getUserid()%></td>
							<td><%=dao.selectuserPhone(item.getUserid())%></td>
							<td>
								<button class="reserve-button"
        data-animal-id="<%=item.getAniid()%>"
        data-user-id="<%=item.getUserid()%>"
        onclick="openPopup('<%=item.getUserid()%>', '<%=item.getAniid()%>')">예약</button>
								<button class="reject-button" onclick="cancleAdopt('<%=item.getAdoptidx()%>')">취소</button>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 메인 종료 -->
<!--페이지네이션 -->
<%
    int currentPage = 1; // 현재 페이지 번호
    int recordsPerPage = 10; // 페이지당 표시할 레코드 수
    int totalRecords = list.size(); // 총 레코드 수

    // URL 매개변수로부터 현재 페이지 번호를 가져옵니다.
    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        currentPage = Integer.parseInt(pageParam);
    }

    // 페이지당 레코드 수에 따라 총 페이지 수를 계산합니다.
    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

    // 현재 페이지 번호가 유효한 범위 내에 있는지 확인하고 조정합니다.
    if (currentPage < 1) {
        currentPage = 1;
    } else if (currentPage > totalPages) {
        currentPage = totalPages;
    }

    // 현재 페이지에 표시할 레코드 범위를 계산합니다.
    int startRecord = (currentPage - 1) * recordsPerPage;
    int endRecord = Math.min(startRecord + recordsPerPage, totalRecords);
%>

	</main>
	<!-- 푸터 시작 -->
<%@ include file="../css/footer.jsp"%>

<script type="text/javascript">
const reserveButtons = document.querySelectorAll(".reserve-button");
const rejectButtons = document.querySelectorAll(".reject-button");

// 예약잡기 버튼 클릭 시 메시지 입력 대화 상자 표시
function openPopup(userid, animalId) {
	 console.log(animalId)
	 console.log(userid)
    
	 const popupWindow = window.open('sendReserveMessage.jsp?animalId='+animalId+'&userid='+userid, "MessagePopup", "width=500,height=400");
    
    // 팝업 창을 엽니다.
    console.log(animalId)
    console.log(userid)
}

// 거절하기 버튼 클릭 시 메시지 입력 대화 상자 표시

function cancleAdopt(animalIdx) {
	    const message = prompt("취소 메시지를 입력하세요:");
	    if (message !== null) {
            location.href = 'deleteAdopt.jsp?aniidx='+ animalIdx+ '&message=' + message;
            console.log(animalIdx)
            console.log(message)
}
}

</script>
<script type="text/javascript" src = "${pageContext.request.contextPath}/js/islogin.js">	</script>	
</body>
</html>
