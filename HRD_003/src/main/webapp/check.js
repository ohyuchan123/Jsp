function addCheck(){
	if(frm.resvno.value.length==0){
		frm.resvno.focus();
		alert("예약번호가 입력되지 않았습니다.");
		return false;
	}
	else if(frm.empno.value.length==0){
		frm.empno.focus();
		alert("사원번호가 입력되지 않았습니다.");
		return false;
	}
	else if(frm.resvdate.value.length==0){
		frm.resvdate.focus();
		alert("근무일자가 입력되지 않았습니다.");
		return false;
	}
	else if(frm.seatno.value.length==0){
		frm.seatno.focus();
		alert("좌석번호가 입력되지 않았습니다.");
		return false;
	}
	else
		alert("좌석예약정보가 등록되었습니다.");
	document.frm.submit();
	return true;
}

function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
}

function search(){
	if(frm2.empno.value.length==0){
		alert("사원번호가 입력되지 않았습니다!");
		frm2.empno.focus();
		return false;
	}
	else{
		document.frm2.submit();
		return true;
	}
}