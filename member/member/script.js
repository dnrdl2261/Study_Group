function check_ok(){
	if(reg_frm.mem_id.value.length == 0){
		alert("아이디를 써주세요.");
		reg_frm.mem_id.focus();
		return;
	}
	else if(reg_frm.mem_id.value.length < 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_frm.mem_id.focus();
		return;
	}
	else if(reg_frm.mem_pw.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		reg_frm.mem_pw.focus();
		return;
	}	
	else if(reg_frm.mem_pw.value != reg_frm.pw_check.value){
		alert("패스워드가 일치하지 않습니다.");
		reg_frm.pw_check.focus();
		return;
	}	
	else if(reg_frm.mem_name.value.length == 0){
		alert("이름을 써주세요.");
		reg_frm.mem_name.focus();
		return;
	}
	else if(reg_frm.mem_jumin.value.length == 0){
		alert("주민번호를 써주세요.");
		reg_frm.mem_jumin.focus();
		return;
	}
	else if(reg_frm.mem_tel.value.length == 0){
		alert("전화번호를 써주세요.");
		reg_frm.mem_tel.focus();
		return;
	}
	else if(reg_frm.mem_email.value.length == 0){
		alert("Email을 써주세요.");
		reg_frm.mem_email.focus();
		return;
	}
	document.reg_frm.submit();
}

function update_check_ok() {
	if(document.update_form.mem_pw.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		update_form.mem_pw.focus();
		return;
	}
	if(document.update_form.mem_pw.value != document.update_form.pw_check.value){
		alert("패스워드가 일치하지 않습니다.");
		update_form.pw_check.focus();
		return;
	}
	if(document.update_form.mem_email.value.length == 0){
		alert("Email을 써주세요.");
		update_form.mem_email.focus();
		return;
	}
	if(document.update_form.mem_tel.value.length == 0){
		alert("전화번호를 써주세요.");
		update_form.mem_tel.focus();
		return;
	}
	document.update_form.submit();
}