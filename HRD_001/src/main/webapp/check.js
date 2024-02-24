function joinCheck() {
	
	if (document.frm.custname.value.length == 0) {
		alert("회원성명이 입력되지 않았습니다.");
		frm.custname.forcus();
		return false;
	}
	
	if (document.frm.phone.value.length == 0) {
		alert("회원전화가 입력되지 않았습니다.");
		frm.phone.forcus();
		return false;
	}
	
	if (document.frm.address.value.length == 0) {
		alert("회원주소가 입력되지 않았습니다.");
		frm.address.forcus();
		return false;
	}
	
	if (document.frm.joindate.value.length == 0) {
		alert("가입일자가 입력되지 않았습니다.");
		frm.joindate.forcus();
		return false;
	}
	
	if (document.frm.grade.value.length == 0) {
		alert("고객등급이 입력되지 않았습니다.");
		frm.grade.forcus();
		return false;
	}
	
	if (document.frm.city.value.length == 0) {
		alert("도시코드가 입력되지 않았습니다.");
		frm.city.forcus();
		return false;
	}
	
	success();
	return true;
	
}

function success() {
	alert("회원등록이 완료 되었습니다.");
}

function search() {
	window.location = 'list.jsp';
}

function modify() {
	alert("회원정보수정이 완료되었습니다!");
	window.location = "list.jsp";
}