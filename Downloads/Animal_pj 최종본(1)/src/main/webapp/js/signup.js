
    	document.addEventListener('DOMContentLoaded', function() {
        var userCateSelect = document.querySelector('select[name="usercate"]');
        var shelterInfoRow = document.getElementById('shelter1');

        userCateSelect.addEventListener('change', function() {
            if (userCateSelect.value === '보호소') {
                shelterInfoRow.style.display = 'table-row'; // 보호소 정보 필드 보이기
                document.getElementById('shelter1').style.display = 'table-row';
                document.getElementById('shelter2').style.display = 'table-row';
                document.getElementById('shelter3').style.display = 'table-row';
                document.getElementById('shelter4').style.display = 'table-row';
                document.getElementById('shelter5').style.display = 'table-row';
                document.getElementById('shelter6').style.display = 'table-row';
            } else {
            document.getElementById('shelter1').style.display = 'none';
            document.getElementById('shelter2').style.display = 'none';
            document.getElementById('shelter3').style.display = 'none';
            document.getElementById('shelter4').style.display = 'none';
            document.getElementById('shelter5').style.display = 'none';
            document.getElementById('shelter6').style.display = 'none';
                
            }
        });
    });
    
    function isSame(){
		
		const frh = document.forms[1]
		const userId = frh.userid
		
		if (userId.value == '') {		//텍스트 입력 없으면 ' '
		alert('아이디를 입력해주세요.')
		userId.focus()		
	} else {		
		frh.action = '../account/isSame.jsp'
		frh.submit()		
	}
	
		
	}
    function isSame2(){
		
		const frh = document.forms[1]
		const userNick = frh.usernick
		
		if (userNick.value == '') {		//텍스트 입력 없으면 ' '
		alert('닉네임을 입력해주세요.')
		userId.focus()		
	} else {		
		frh.action = '../account/isSame.jsp'
		frh.submit()		
	}
	
		
	}
    
    
function func_join() { /* '가입하기' 버튼의 onclick 이벤트에 대해 실행하는 함수*/

	/* 자바 스크립트의 변수 선언 키워드 : var, let, const
		 var은 old version 변수 선언 방식
		 const 는 값 변경 불가, 객체 재할당 불가. 일반적으로 요소를 저장하는 변수 형식으로 사용
	*/

	//let re = new RegExp('[a-zA-Z0-9]+@+[a-zA-Z]+\.[a-z]{2,3}');
	let pass = new RegExp('(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]){8,}');
	const frm = document.forms[1]
	const userId = frm.userid
	const userPass = frm.userpass
	const userName = frm.username
	const userNick = frm.usernick
	const userAge = frm.userage
	const userEmail = frm.useremail
	const userPhone = frm.userphone
	const userCity = frm.usercity
	const userCate = frm.usercate
	const shelterName = frm.sheltername
	const shelterCity = frm.sheltercity
	const shelterMax = frm.sheltermax
	const shelterem = frm.shelterem
	const shelterContent = frm.sheltercontent
	const shelterTel = frm.sheltertel
	const sameid = frm.sameidresult
	const samenick = frm.samenickresult

	/* let 은 값 변경 또는 객체 재할당을 할 수 있는 일반적인 변수 */
	let isValid = true		//유효성 통과 여부를 지정하는 변수

	if (userId.value == '') {		//텍스트 입력 없으면 ' '
		alert('아이디는 필수 입력사항 입니다.')
		userId.focus()		/* name 으로 지정된 입력요소가 focus를 찾음*/
		isValid = false
	} else if (sameid.value == '1'){
		alert('사용 불가능한 아이디입니다!')
		userId.focus()
		isValid = false	
	} 
	
	
	else
		if (userPass.value == '') {					//정규 표현식으로 대체 해보기
			alert('비밀번호는 필수 입력사항 입니다.')
			userPass.focus()
			isValid = false
		}
		else
			if (!(pass.test(userPass.value))) {		//정규 표현식으로 대체 해보기
				alert('패스워드는 대문자 1개, 숫자 1개, 특수문자(!@#$%^*+=-) 1개 이상을 포함해야하며, 8자리 이상이여야 합니다.')
				password.focus()
				isValid = false
			}
			else
				if (userName.value == '') {					//정규 표현식으로 대체 해보기
					alert('이름은 필수 입력사항 입니다.')
					userName.focus()
					isValid = false
				}
				else
					if (userNick.value == '') {					//정규 표현식으로 대체 해보기
						alert('닉네임 필수 입력사항 입니다.')
						userNick.focus()
						isValid = false
					}
					else if (samenick.value == '1'){
		alert('사용 불가능한 닉네임입니다!')
		userNick.focus()
		isValid = false	
	} 
					else
						if (userAge.value == '') {					//정규 표현식으로 대체 해보기
							alert('나이는 필수 입력사항 입니다.')
							userAge.focus()
							isValid = false
						}
						else
							if (userEmail.value == '') {					//정규 표현식으로 대체 해보기
								alert('이메일은 필수 입력사항 입니다.')
								userEmail.focus()
								isValid = false
							}
							else
								if (userPhone.value == '') {					//정규 표현식으로 대체 해보기
									alert('전화번호는 필수 입력사항 입니다.')
									userPhone.focus()
									isValid = false
								}
								else
									if (userCity.value == '') {					//정규 표현식으로 대체 해보기
										alert('도시는 필수 입력사항 입니다.')
										userCity.focus()
										isValid = false
									}

	if (isValid) {	//유효성 통과하여 제출
		frm.submit()				//submit
	}
}

