let initialUrl;

window.onload = function() {
	// 초기 페이지 로드 시 초기 상태 표시 및 데이터 로딩
	loadPageData(1);
	// 초기 URL을 저장
	initialUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}`;
};

const xhr = new XMLHttpRequest();
const photoContainer = document.getElementById('photoContainer');
let itemsPerPage = 25;
let itemsPerRow = 4;
let totalRows = 4;
let todayFormatted;
let tenDaysAgoFormatted;
let items = []; // 데이터를 저장할 테이블
let url; // URL 변수를 선언

function loadPageData(page, url) {
	if (page == null || page == '')
		page = 1;
	const today = new Date(); // 현재 날짜 가져오기
	const tenDaysAgo = new Date(today);
	tenDaysAgo.setDate(today.getDate() - 10); // 현재 날짜로부터 10일 전 계산

	// 날짜 포맷 YYYYMMDD로 변환
	todayFormatted = formatDate(today);
	tenDaysAgoFormatted = formatDate(tenDaysAgo);

	// URL을 동적으로 생성합니다.
	if (url == null || url == '') {
		// 검색하지 않은 경우 upkind 매개 변수를 제외한 URL 생성
		url = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=${page}`;
	}
	xhr.open('GET', url);
	xhr.send();
	xhr.onload = function() {
		if (xhr.status == 200) {
			let response = JSON.parse(xhr.response);
			if (response.response.body && response.response.body.items && response.response.body.items.item) {
				items = response.response.body.items.item;
				const totalCount = response.response.body.totalCount;
				console.log('10일간의 데이터 수:', totalCount);
				displayInitialItems();
				// 페이지를 추가하는 버튼을 생성합니다.
			} else {
				console.log('API로부터 데이터가 비어 있습니다.');
				alert('마지막 페이지 입니다');
			}
		}
	};
}
function formatDate(date) {
	const year = date.getFullYear();
	const month = (date.getMonth() + 1).toString().padStart(2, '0');
	const day = date.getDate().toString().padStart(2, '0');
	return `${year}${month}${day}`;
}


function displayItems() {
	// 이미지 컨테이너 초기화
	photoContainer.innerHTML = '';

	// Bootstrap 그리드 컨테이너 생성
	let container = document.createElement('div');
	container.classList.add('container');

	for (let row = 0; row < totalRows; row++) {
		// Bootstrap 그리드 로우 생성
		let rowElement = document.createElement('div');
		rowElement.classList.add('row');

		for (let i = 0; i < itemsPerRow; i++) {
			let itemIndex = (row * itemsPerRow) + i;
			if (itemIndex < items.length) {
				let item = items[itemIndex];
				let photoUrl = item.popfile;
				let infoText = `${item.age}<br>${item.kindCd}<p>&nbsp;</p>`;


				// Bootstrap 그리드 컬럼 생성
				let colElement = document.createElement('div');
				colElement.classList.add('col-md-3'); // 한 줄에 4개의 이미지를 표시하도록 설정

				// 이미지 엘리먼트 생성
				let imgElement = document.createElement('img');
				imgElement.src = photoUrl;
				imgElement.width = 200;
				imgElement.height = 250;
				imgElement.classList.add('pointer-cursor');


				let linkElement = document.createElement('a');
				linkElement.href = 'guideAdopt.jsp'; // 이 부분을 원하는 JSP 페이지의 주소로 변경

				// 이미지를 링크에 추가
				linkElement.appendChild(imgElement);
				
				// 정보 엘리먼트 생성
				let infoElement = document.createElement('div');
				infoElement.classList.add('info-text');
				infoElement.innerHTML = infoText; // HTML 내용 설정

				// 컬럼에 이미지와 정보를 추가
				colElement.appendChild(imgElement);
				colElement.appendChild(infoElement);

				// 로우에 컬럼을 추가
				rowElement.appendChild(colElement);

				imgElement.addEventListener('click', function() {
				location.href = 'animal/guideAdopt.jsp'
				});
			}
		}
		// 컨테이너에 로우를 추가
		container.appendChild(rowElement);
	}

	// 페이지에 컨테이너를 추가
	photoContainer.appendChild(container);
}



function displayInitialItems() {
	displayItems(); // 초기 페이지 로드 시 데이터 표시
}






