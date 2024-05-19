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

                // Bootstrap 그리드 컬럼 생성
                let colElement = document.createElement('div');
                colElement.classList.add('col-md-3'); // 한 줄에 4개의 이미지를 표시하도록 설정

                // 이미지 엘리먼트 생성
                let imgElement = document.createElement('img');
                imgElement.src = photoUrl;
                imgElement.width = 200;
                imgElement.height = 250;
                imgElement.classList.add('pointer-cursor');
               

                // 링크 엘리먼트 생성
                let linkElement = document.createElement('a');
                linkElement.href = 'javascript:animalDetail("' + item.desertionNo + '")';

                // 이미지를 링크에 추가
                linkElement.appendChild(imgElement);

                // 컬럼에 링크를 추가
                colElement.appendChild(linkElement);

                // 로우에 컬럼을 추가
                rowElement.appendChild(colElement);

                imgElement.addEventListener('click', function() {
                    console.log(item);
                });
            }
        }

        // 컨테이너에 로우를 추가
        container.appendChild(rowElement);
    }

    // 페이지에 컨테이너를 추가
    photoContainer.appendChild(container);
    document.getElementById('searchResultsContainer').appendChild(photoContainer);
}


function displayInitialItems() {
	displayItems(); // 초기 페이지 로드 시 데이터 표시
}



function prevPageData() {
    const page = document.getElementById("page");
    let currentPage = parseInt(page.innerHTML); // 현재 페이지 번호를 정수로 가져옵니다.
    currentPage = currentPage > 1 ? currentPage - 1 : 1; // 이전 페이지로 이동합니다. 최소 페이지 번호는 1입니다.

    const kindRadio = document.querySelector('input[name="animalType"]:checked');
    let kindCode;

    if (!kindRadio) {
        // 동물 종류를 선택하지 않은 경우 기본 URL로 데이터 로딩
        const newUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=${currentPage}`;
        // URL을 동적으로 생성합니다.

        // 수정된 URL로 데이터를 로드합니다.
        page.innerHTML = currentPage; // 현재 페이지 번호 업데이트
        loadPageData(currentPage, newUrl); // 데이터를 로드합니다.
    } else {
        const kindValue = kindRadio.value;
        // 현재 선택한 동물 종류에 따라 kind 값을 설정합니다.
        if (kindValue === "개") {
            kindCode = dogCode;
        } else if (kindValue === "고양이") {
            kindCode = catCode;
        } else if (kindValue === "기타") {
            kindCode = otherCode;
        }
        const newUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=${currentPage}&upkind=${kindCode}`;
        // URL을 동적으로 생성합니다.

        // 수정된 URL로 데이터를 로드합니다.
        page.innerHTML = currentPage; // 현재 페이지 번호 업데이트
        loadPageData(currentPage, newUrl); // 데이터를 로드합니다.
    }
}

function nextPageData() {
	const page = document.getElementById("page");
	const currentPage = parseInt(page.innerHTML); // 현재 페이지 번호를 정수로 가져옵니다.
	const kindRadio = document.querySelector('input[name="animalType"]:checked');
	let kindCode;

	if (!kindRadio) {
		// 동물 종류를 선택하지 않은 경우 기본 URL로 데이터 로딩
		const newUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=${currentPage + 1}`;
		// URL을 동적으로 생성합니다.

		// 수정된 URL로 데이터를 로드합니다.
		page.innerHTML = currentPage + 1; // 다음 페이지로 이동합니다.
		loadPageData(currentPage + 1, newUrl); // 데이터를 로드합니다.
	} else {
		const kindValue = kindRadio.value;
		// 현재 선택한 동물 종류에 따라 kind 값을 설정합니다.
		if (kindValue === "개") {
			kindCode = dogCode;
		} else if (kindValue === "고양이") {
			kindCode = catCode;
		} else if (kindValue === "기타") {
			kindCode = otherCode;
		}
		const newUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=${currentPage + 1}&upkind=${kindCode}`;
		// URL을 동적으로 생성합니다.

		// 수정된 URL로 데이터를 로드합니다.
		page.innerHTML = currentPage + 1; // 다음 페이지로 이동합니다.
		loadPageData(currentPage + 1, newUrl); // 데이터를 로드합니다.
	}
}


const catCode = 422400;
const dogCode = 417000;
const otherCode = 429900;
let currentAnimalType = ""; // 현재 선택된 동물 종류를 저장하는 변수


dogRadio.addEventListener('click', handleRadioClick);
catRadio.addEventListener('click', handleRadioClick);
othersRadio.addEventListener('click', handleRadioClick);


function handleRadioClick() {
  document.getElementById('page').innerHTML = 1;
  // 라디오 버튼에서 선택한 동물의 종류에 따라 kind 값을 설정합니다.
  let kindCode;
  const kindRadio = document.querySelector('input[name="animalType"]:checked');

  if (kindRadio) {
    const kindValue = kindRadio.value;
    // 현재 선택한 동물 종류에 따라 kind 값을 설정합니다.
    if (kindValue === "개") {
      kindCode = dogCode;
    } else if (kindValue === "고양이") {
      kindCode = catCode;
    } else if (kindValue === "기타") {
      kindCode = otherCode;
    }
    
    // 현재 선택된 동물 종류를 업데이트
    currentAnimalType = kindValue;
  } else {
    // 라디오 버튼이 선택되지 않은 경우 동물 종류 초기화
    currentAnimalType = "";
  }

  // URL을 동적으로 생성합니다.
  const newUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=1&upkind=${kindCode}`;

  // 수정된 URL로 데이터를 로드하고 첫 페이지를 표시합니다.
  loadPageData(1, newUrl);
  window.scrollTo(0, 800);
}


const radioButtons = document.querySelectorAll('input[name="animalType"]');
radioButtons.forEach(function(radioButton) {
  radioButton.addEventListener('click', function() {
    // 다른 라디오 버튼을 disabled 상태로 만듭니다.
    radioButtons.forEach(function(radio) {
      if (radio !== radioButton) {
        radio.disabled = true;
      }
    });
  });
});

document.getElementById('resetButton').addEventListener('click', function() {
  // 페이지 번호를 1로 초기화합니다.
  document.getElementById('page').innerHTML = 1;

  // 라디오 버튼 선택도 초기화합니다.
  radioButtons.forEach(function(radioButton) {
    radioButton.checked = false;
    radioButton.disabled = false; // 라디오 버튼을 활성화합니다.
  });

  // 검색 결과를 초기 상태로 되돌립니다.
  loadPageData(1, initialUrl);
});
