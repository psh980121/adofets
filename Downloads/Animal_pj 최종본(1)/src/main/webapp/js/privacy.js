

function privacy(){
	var f1 = document.getElementById('form1')
	var f2 = document.getElementById('form2')

if(! f1.checked || ! f2.checked){
	alert('필수사항입니다.')
} else {
	location.href = 'adoptreq.jsp'
}
	
}