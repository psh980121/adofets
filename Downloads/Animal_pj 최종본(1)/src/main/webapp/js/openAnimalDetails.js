
function adoptAnimal() {
	// 세션에 저장한 데이터 불러오기
	const selectedItemJSON = sessionStorage.getItem('selectedItem');
	console.log(selectedItemJSON);
	if (selectedItemJSON) {
		const selectedItem = JSON.parse(selectedItemJSON);

		// form 엘리먼트를 생성합니다.
		const form = document.createElement('form');
		form.action = '../animal/saveToSession.jsp'; // 데이터를 전송할 서버 스크립트 URL을 지정합니다.
		form.method = 'POST'; // HTTP POST 메소드를 사용합니다. 

		// 필요한 정보를 <input> 요소로 추가합니다.
		const desertionNoInput = document.createElement('input');
		desertionNoInput.type = 'hidden'; // 숨김 필드로 설정합니다.
		desertionNoInput.name = 'desertionNo'; // 서버 스크립트에서 사용할 필드명을 지정합니다.
		desertionNoInput.value = selectedItem.desertionNo; // 값을 설정합니다.
		form.appendChild(desertionNoInput);

		const careNmInput = document.createElement('input');
		careNmInput.type = 'hidden';
		careNmInput.name = 'careNm';
		careNmInput.value = selectedItem.careNm;
		form.appendChild(careNmInput);

		const careAddrInput = document.createElement('input');
		careAddrInput.type = 'hidden';
		careAddrInput.name = 'careAddr';
		careAddrInput.value = selectedItem.careAddr;
		form.appendChild(careAddrInput);

		const popfileInput = document.createElement('input');
		popfileInput.type = 'hidden';
		popfileInput.name = 'popfile';
		popfileInput.value = selectedItem.popfile;
		form.appendChild(popfileInput);

		const ageInput = document.createElement('input');
		ageInput.type = 'hidden';
		ageInput.name = 'age';
		ageInput.value = selectedItem.age;
		form.appendChild(ageInput);

		const careTelInput = document.createElement('input');
		careTelInput.type = 'hidden';
		careTelInput.name = 'careTel';
		careTelInput.value = selectedItem.careTel;
		form.appendChild(careTelInput);

		const chargeNmInput = document.createElement('input');
		chargeNmInput.type = 'hidden';
		chargeNmInput.name = 'chargeNm';
		chargeNmInput.value = selectedItem.chargeNm;
		form.appendChild(chargeNmInput);

		const filenameInput = document.createElement('input');
		filenameInput.type = 'hidden';
		filenameInput.name = 'filename';
		filenameInput.value = selectedItem.filename;
		form.appendChild(filenameInput);

		const happenDtInput = document.createElement('input');
		happenDtInput.type = 'hidden';
		happenDtInput.name = 'happenDt';
		happenDtInput.value = selectedItem.happenDt;
		form.appendChild(happenDtInput);

		const processStateInput = document.createElement('input');
		processStateInput.type = 'hidden';
		processStateInput.name = 'processState';
		processStateInput.value = selectedItem.processState;
		form.appendChild(processStateInput);

		const kindCdInput = document.createElement('input');
		kindCdInput.type = 'hidden';
		kindCdInput.name = 'kindCd';
		kindCdInput.value = selectedItem.kindCd;
		form.appendChild(kindCdInput);

		const neuterYnInput = document.createElement('input');
		neuterYnInput.type = 'hidden';
		neuterYnInput.name = 'neuterYn';
		neuterYnInput.value = selectedItem.neuterYn;
		form.appendChild(neuterYnInput);

		const noticeEdtInput = document.createElement('input');
		noticeEdtInput.type = 'hidden';
		noticeEdtInput.name = 'noticeEdt';
		noticeEdtInput.value = selectedItem.noticeEdt;
		form.appendChild(noticeEdtInput);

		const noticeSdtInput = document.createElement('input');
		noticeSdtInput.type = 'hidden';
		noticeSdtInput.name = 'noticeSdt';
		noticeSdtInput.value = selectedItem.noticeSdt;
		form.appendChild(noticeSdtInput);

		const officetelInput = document.createElement('input');
		officetelInput.type = 'hidden';
		officetelInput.name = 'officetel';
		officetelInput.value = selectedItem.officetel;
		form.appendChild(officetelInput);

		const orgNmInput = document.createElement('input');
		orgNmInput.type = 'hidden';
		orgNmInput.name = 'orgNm';
		orgNmInput.value = selectedItem.orgNm;
		form.appendChild(orgNmInput);

		const sexCdInput = document.createElement('input');
		sexCdInput.type = 'hidden';
		sexCdInput.name = 'sexCd';
		sexCdInput.value = selectedItem.sexCd;
		form.appendChild(sexCdInput);

		const specialMarkInput = document.createElement('input');
		specialMarkInput.type = 'hidden';
		specialMarkInput.name = 'specialMark';
		specialMarkInput.value = selectedItem.specialMark;
		form.appendChild(specialMarkInput);


		const weightInput = document.createElement('input');
		weightInput.type = 'hidden';
		weightInput.name = 'weight';
		weightInput.value = selectedItem.weight;
		form.appendChild(weightInput);

		// 폼을 현재 페이지에 추가하고 자동으로 제출합니다.
		document.body.appendChild(form);
		form.submit();
		console.log(selectedItem);
	} else {
		console.log('세션 데이터가 없습니다.');
	}
}
function goBack() {
	const animalDetails = document.getElementById('animalDetails');
	animalDetails.innerHTML = '';
	animalDetails.style.border = "none"; // border를 제거하는 스타일 추가
}



let isClicked = false;

function rotate() {
	const img = document.getElementById("img");

	if (!isClicked) {
		img.style.transform = "rotate(90deg)";
		isClicked = true;
	} else {
		img.style.transform = "rotate(0deg)";
		isClicked = false;
	}
}
