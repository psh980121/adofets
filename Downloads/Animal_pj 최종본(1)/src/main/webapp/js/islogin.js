function write() {
		let yn
		if('${user.userid}'==''){
			yn=confirm('1:1문의는 로그인이 필요합니다. 로그인 하시겠습니까?')
			if(yn) location.href='login.jsp?back=q'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
		}else{
			location.href='http://localhost:8081/Animal_pj/question/Question.jsp'
		}
	}
	
		