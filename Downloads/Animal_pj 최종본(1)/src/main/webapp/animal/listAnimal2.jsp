<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API 데이터 출력</title>

<link rel="stylesheet" href="../css/002.css" />
<link rel="stylesheet" href="../css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>
<style>
.pointer-cursor {
	cursor: pointer;
}

#photoContainer img {
	margin-bottom: 20px;
	margin-top: 30px;
}
/* 버튼 스타일 */
.my-button {
	padding: 10px 15px; /* 버튼 내부 패딩 설정 */
	background-color: skyblue; /* 배경색 설정 */
	color: #000000; /* 글자색 설정 */
	border: none; /* 테두리 없애기 */
	border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
	cursor: pointer; /* 포인터 커서 설정 */
	font-size: 15px; /* 글자 크기 설정 */
}

/* 라디오 버튼 스타일 */
.my-radio {
	margin-right: 5px; /* 라디오 버튼 간격 설정 */
	font-size: 20px; /* 글자 크기 설정 */
}

.radio-button-container {
	display: flex;
	align-items: center; /* Vertically align the items */
}

/* Adjust spacing if needed */
.radio-button-container label {
	margin-right: 10px; /* Add spacing between radio buttons and labels */
}

.radio-button-container button {
	margin-left: 10px; /* Add spacing between buttons */
}

.icon-container {
	position: relative;
	display: inline-block; /* 요소를 인라인 블록 요소로 설정하여 텍스트와 아이콘이 옆으로 정렬됩니다. */
	width: 80px;
}

.icon-container img {
	width: 80%;
	height: 80%;
	top: 80%;
}

.icon-container input {
	position: absolute;
}

.icon-container label {
	position: absolute;
	bottom: -35px; /* 아래에 배치 */
	left: 50%; /* 가운데 정렬을 위해 왼쪽 여백 조정 */
	transform: translateX(-50%);
	/* 가운데 정렬을 위해 왼쪽 여백 조정 */
	padding: 3px;
	left: 50%; /* 가운데 정렬을 위해 왼쪽 여백 조정 */
	transform: translateX(-50%);
	transform: translateX(-50%);
}
/* 현재페이지 숨기기 */
#page {
	display: none !important;
}

</style>

<body class="d-flex flex-column min-vh-100 pb-0">
	<!-- 헤더 시작, 밝은 테마 -->
<%@ include file="../css/header.jsp"%>

	<main style="margin-bottom: 200px; text-align: center;">

		<div id="mainTitle">
			<h1 class="mt-5">현재 보호중인 친구들</h1>
			<hr>
			<div class="mb-1" style="display: flex; margin-left: 795px;">
    <!-- 검색 버튼 -->
    <label>
        <div class="icon-container">
            <img src="dog.png" alt="dog" /> <input type="radio"
                class="btn-check" autocomplete="off" id="dogRadio"
                name="animalType" value="개"> <label
                class="btn btn-outline-secondary" style="width: 65px;"
                for="dogRadio" class="my-radio">개</label>
        </div>
    </label> 
    <label>
        <div class="icon-container">
            <img src="cat.png" alt="cat" /> <input type="radio"
                class="btn-check" id="catRadio" autocomplete="off"
                name="animalType" value="고양이" class="my-radio"> <label
                class="btn btn-outline-secondary" style="width: 65px;"
                for="catRadio">고양이</label>
        </div>
    </label> 
    <label>
        <div class="icon-container">
            <img src="ham.png" alt="ham" /> <input type="radio"
                class="btn-check" autocomplete="off" id="othersRadio"
                name="animalType" value="기타"> <label
                class="btn btn-outline-secondary" style="width: 65px;"
                for="othersRadio">기타</label>
        </div>
    </label>

    <!-- 전체 버튼 -->
    <div class="icon-container"> <!-- 여기에 margin-left 스타일을 추가하여 버튼 간격을 조절합니다. -->
        <img src="reset.png" alt="reset" style="height:64px; width: 64px; margin-bottom:3px; " />
        <button id="resetButton" class="btn btn-outline-secondary" style="width: 65px; height:32px; padding:3px;">전체</button>
    </div>
</div>

			<input type="hidden" name=desertionNo id=desertionNo>
			<div id="animalDetails"
				style="width: 1400px; width: 1400px; text-align: left; padding: 15px 30px; margin: 0px auto 0px 280px;"></div>

			<div class="d-flex align-items-center">
				<button id="left"
					style="position: relative; height: 100px; margin-left: 450px; border: 1px solid white; background-color: white;"
					id="prevPageBtn" onclick="prevPageData()">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
						fill="currentColor" class="bi bi-arrow-left-circle-fill"
						viewBox="0 0 16 16">
  						<path
							d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
					</svg>
				</button>

				<!-- 동물 리스트 -->
				<div class="d-flex" id="searchResultsContainer">
					<!-- 검색 결과가 여기에 표시됩니다. -->
				</div>

				<button
					style="height: 100px; border: 1px solid white; background-color: white;"
					id="nextPageBtn" onclick="nextPageData()">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
						fill="currentColor" class="bi bi-arrow-right-circle-fill"
						viewBox="0 0 16 16">
  					<path
							d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
					</svg>
				</button>
			</div>


			<!-- 동물 사진 리스트  -->
			<div id="pagination" style="text-align: center;">
				<div id="photoContainer"
					class="w-full grid grid-cols-2 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-y-3 gap-x-3"></div>
				<span id="page">1</span>

			</div>
			<hr>
		</div>
		<!-- 메인 종료 -->
	</main>
	<!-- 푸터 시작 -->
<%@ include file="../css/footer.jsp"%>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/openAnimalAPI.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/openAnimalDetails.js"></script>
	
	<script type="text/javascript">
	function animalDetail(desertionNo) {
		const animalDetails = document.getElementById('animalDetails');
		animalDetails.innerHTML = '';

		for (let i = 0; i < items.length; i++) {
			if (items[i].desertionNo === desertionNo) {
				let yn
				const selectedItem = items[i];
				sessionStorage.setItem('selectedItem', JSON.stringify(selectedItem));
				// selectedItem을 사용하여 동물 정보를 동적으로 생성
				if (selectedItem) {
					const animalDetails = document.getElementById('animalDetails');
					animalDetails.classList.add('row'); // Bootstrap 그리드 컨테이너로 설정
					animalDetails.style.borderBottom = '1px solid black';

					// 이미지 표시 부분 (왼쪽에 배치)
					const imageContainer = document.createElement('div');
					imageContainer.classList.add('col-md-6', 'order-mb-4'); // Bootstrap 그리드 클래스 및 순서 설정
					imageContainer.style.position = 'relative';

					const image = document.createElement('img');
					image.src = selectedItem.popfile;
					image.alt = '동물 이미지';
					image.setAttribute('id', 'img');
					image.width = '570';
					image.height = '570';
					imageContainer.appendChild(image);
					image.style.objectFit = 'cover';

					const rotateButton = document.createElement('button');
					rotateButton.textContent = "90°";
					rotateButton.setAttribute('id', 'rotate');
					rotateButton.classList.add("btn", "btn-dark");
					rotateButton.style.position = 'absolute';
					rotateButton.style.border = 'none';
					rotateButton.style.width = '66px';
					rotateButton.style.top = '93%';
					rotateButton.style.left = '89%';
					rotateButton.onclick = rotate;
					imageContainer.appendChild(rotateButton);

					const icon = document.createElement('i');
					icon.classList.add("bi", "bi-arrow-clockwise");
					rotateButton.appendChild(icon);

					// 동물 상세 정보 부분 (오른쪽에 배치)
					const infoContainer = document.createElement('div');
					infoContainer.classList.add('col-md-6', 'order-mb-4'); // Bootstrap 그리드 클래스 및 순서 설정
					infoContainer.style.width = '500px';
					infoContainer.style.marginLeft = '100px';
					infoContainer.style.fontFamily = 'Arial, Helvetica, sans-serif';

					const htmlContent = "<h2>상세프로필</h2>" +
						"<p>유기번호: " + selectedItem.desertionNo + "</p>" +
						"<p>나이: " + selectedItem.age + "</p>" +
						"<p>발생일자: " + selectedItem.happenDt + "</p>" +
						"<p>품종: " + selectedItem.kindCd + "</p>" +
						"<p>중성화여부: " + selectedItem.neuterYn + "</p>" +
						"<p>특이사항: " + selectedItem.specialMark + "</p>" +
						"<p>무게: " + selectedItem.weight + "</p>" +
						"<p>보호소이름: " + selectedItem.careNm + "</p>" +
						"<p>보호소주소: " + selectedItem.careAddr + "</p>" +
						"<p>보호소전화: " + selectedItem.careTel + "</p>";

					infoContainer.innerHTML = htmlContent;

					// "입양신청하기" 버튼 추가
					const adoptButton = document.createElement('button');
					adoptButton.textContent = "입양신청하기";
					adoptButton.classList.add("btn", "btn-outline-success", "mx-5"); // Bootstrap 버튼 클래스 추가
					adoptButton.type = "button";
					infoContainer.appendChild(adoptButton);
					adoptButton.onclick = login;

					// "뒤로가기" 버튼 추가
					const goBackButton = document.createElement('button');
					goBackButton.textContent = "뒤로가기";
					goBackButton.classList.add("btn", "btn-outline-danger"); // Bootstrap 버튼 클래스 추가
					goBackButton.type = "button";
					goBackButton.onclick = goBack; // 버튼 클릭 시 goBack 함수 실행
					infoContainer.appendChild(goBackButton);

					// 이미지와 정보 컨테이너를 추가
					/*animalDetails.innerHTML = ''; // 기존 내용 초기화*/
					animalDetails.appendChild(imageContainer);
					animalDetails.appendChild(infoContainer);

					window.scrollTo(0, 200);
					// 입양 신청 시 필요한 정보를 세션에 저장
				} else {
					// 해당 동물 정보가 없는 경우 처리
					const animalDetails = document.getElementById('animalDetails');
					animalDetails.innerHTML = "<p>해당하는 동물 정보가 없습니다.</p>";
				}

				break;
			}
		}
	}
	
	function login() {
		if('${user.userid}'==''){
			yn=confirm('입양 신청은 로그인이 필요합니다. 로그인 하시겠습니까?')
			if(yn) location.href='../login.jsp?back=a'
		}
		else {
			adoptAnimal()
		}
	}

	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
		
	</script>
	<script type="text/javascript" src = "${pageContext.request.contextPath}/js/islogin.js">	</script>
</body>
</html>