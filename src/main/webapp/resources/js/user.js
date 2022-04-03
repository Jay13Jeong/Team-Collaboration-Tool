//회원가입 유효성 검사

function validSignChk() {
	var regEmail = new RegExp('^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$');
	var regPwd = new RegExp('^[a-zA-Z0-9]{6,}$');

	if (!regEmail.test($('#uemail').val())) {
		alert("올바른 이메일을 입력해주세요");
		$('#uemail').val('');
		$('#uemail').focus();
		return;
	} else if ($('#uname').val() == "") {
		alert("이름을 입력해주세요");
		$("#uname").focus();
		return;
	} else if (!regPwd.test($('#upwd').val())) {
		alert("비밀번호는 영어대/소문자, 숫자를 이용하여 6글자 이상 입력해야합니다");
		$('#upwd').val('');
		$('#upwd').focus();
		return;
	} else if ($('#upwd').val() != $('#pwdchk').val()) {
		alert("비밀번호가 일치하지 않습니다");
		$('#pwdchk').val("");
		$('#pwdchk').focus();
		return;
	} else if (($('#toschk').is(":checked")) == false) {
		alert("이용약관동의 체크해주세요");
		return;
	} else {
		$('#signForm').submit();
	}

}

function pmemlist(){
	$.ajax({
		url : "pmlist.do",
		type : "post",
		contentType : "application/json; charset=utf-8;",
		dataType : "Json",
		success : function(data) {
			var values = $("#pmlistBox").html();

			var values = $("#pmlistBox").html("");
			for ( var i in data) {
				values += '<tr>'
						+ '<td colspan="2" style="padding:0px;left:5%">'
						+ '<img class="thumbnail circle" src="'
						+ data[i].uimg
						+ '">'
						+ '</td> <td class="align-middle my-6 ">'
						+ data[i].uname
						+ '</td> <td class="align-middle">'
						+ data[i].uemail
						+ '</td> <td class="align-middle">'
						+ data[i].uphone
						+ '</td> <td class="align-middle">'
						+ data[i].ugroup
						+ '</td> <td class="align-middle">'
						+ data[i].urole
						+ '</td> <td class="mcode d-none">'
						+ data[i].ucode
						+ '</td><th class="align-middle"><select class="prole btn-light show-tick w-75" onchange="roleChange()">'
						+ '<option name="opt1" value="2"'
				if (data[i].pjadmin == '2') {
					values += 'selected'
				}
				values += '>일반회원</option>'
						+ '<option name="opt1" value="1"'
				if (data[i].pjadmin == '1') {
					values += 'selected'
				}
				values += '>관리자</option>'
						+ '<option name="opt1" value="3"'
				if (data[i].pjadmin == '3') {
					values += 'selected'
				}
				values += '>이용중지</option>'
						+ '</select></th>'

			}

			$('#pmlistBox').html(values);
		},
		error : function(request, status, errorData) {
		}
	});
}
$('#pmember-tab').on('click',function() {
	pmemlist();
});

/*
 * $('#npmember-tab').on('click',function(){ $.ajax({ url:"invtlist.do",
 * type:"post", contentType:"application/json; charset=utf-8;", dataType:"Json",
 * success: function(data){ alert('a');
 * 
 * var values = $("#nmlistBox").html(); var values = $("#nmlistBox").html("");
 * for(var i in data){ values += '<tr>' + '<td class="align-middle d-none">' +
 * data[i].invtkey + '<td class="align-middle">' + data[i].invtemail +'</td><td class="align-middle">' +
 * data[i].exprtdate +'</td><td class="align-middle"><input type="button"
 * class="btn btn-sm btn-outline-primary" value="재전송"' + 'onclick="invtagain()"></td>' +'<td class="align-middle"><input
 * type="button" class="btn btn-sm btn-danger" value="초대 취소"' +
 * 'onclick="invtcancle()"></td></tr>' }
 * 
 * 
 * $('#nmlistBox').html(values); }, error: function(request, status, errorData){
 * alert('hh'); } }); });
 */

function invtlist() {
	$
			.ajax({
				url : "invtlist.do",
				type : "post",
				contentType : "application/json; charset=utf-8;",
				dataType : "Json",
				success : function(data) {

					var values = $("#nmlistBox").html();
					var values = $("#nmlistBox").html("");
					for ( var i in data) {
						values += '<tr>'
								+ '<td class="align-middle d-none">'
								+ data[i].invtkey
								+ '<td class="align-middle">'
								+ data[i].invtemail
								+ '</td><td class="align-middle">'
								+ data[i].exprtdate
								+ '</td><td class="align-middle"><input type="button" class="btn btn-sm btn-outline-primary" value="재전송"'
								+ 'onclick="invtagain()"></td>'
								+ '<td class="align-middle"><input type="button" class="btn btn-sm btn-danger" value="초대 취소"'
								+ 'onclick="invtcancle()"></td></tr>'
					}

					$('#nmlistBox').html(values);
				},
				error : function(request, status, errorData) {
					alert('hh');
				}
			});
}

function roleChange() {

	var tr = $(event.target).parent().parent().eq(0);
	var td = tr.children();
	var data = {
		'ucode' : td.eq(6).text(),
		'pjadmin' : $(event.target).val()
	}

	$.ajax({
		url : "chnrole.do",
		type : "post",
		data : data,
		success : function() {
			alert('변경되었습니다');
		},
		error : function() {
			alert('실패');
		}

	});
}

function invtcancle() {

	var ele = $(event.target);
	if (ele.val() == '재전송') {
		ele.removeClass('btn-danger');
		ele.addClass('btn-outline-dark');
		ele.prop('disabled', true);
		ele.val('재전송완료');
	}

	var tr = $(event.target).parent().parent().eq(0);
	var td = tr.children();
	$.ajax({
		url : "invtcancle.do",
		type : "post",
		data : {
			'invtkey' : td.eq(0).text()
		},
		success : function() {
			invtlist();
		},
		error : function() {
			invtlist();
		}

	});
}
