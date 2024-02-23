/*// login.js

// reCaptcha callback 함수
var onloadCallback = function() {
	console.log("grecaptcha is ready!");
};

// 폼 전송 전 검증 함수
function formAble() {
	// reCaptcha 검증
	var response = grecaptcha.getResponse();
	if (response.length == 0) {
		// reCaptcha가 확인되지 않았을 경우
		Swal.fire({
			icon: 'error',
			title: '로봇 확인',
			text: '로봇이 아님을 확인하세요.',
		});
		return false;
	}

	// 아이디와 비밀번호 검증 로직 추가
	var idInput = $("#exampleInputEmail1").val().trim();
	var pwdInput = $("#exampleInputPassword1").val().trim();
	if (idInput === '' || pwdInput === '') {
		// 아이디 또는 비밀번호가 입력되지 않았을 경우
		Swal.fire({
			icon: 'info',
			title: '입력 오류',
			text: '아이디와 비밀번호를 입력해주세요',
		});
		return false;
	}

	// 추가적인 검증 로직
	// ...

	return true; // 모든 검증 통과
}

function undisabled() {
	let recaptchaDiv = document.getElementById("recaptchaDiv");
	let id = document.getElementById("exampleInputEmail1").value.trim();
	let pwd = document.getElementById("exampleInputPassword1").value.trim();

	if (id !== '' && pwd !== '') {
		recaptchaDiv.style.display = 'block';
		return true;
	} else {
		Swal.fire({
			icon: 'info',
			title: '입력 오류',
			text: '아이디와 비밀번호를 입력해주세요',
		});
		return false;
	}
}

$(function() {
	$('#formTag').submit(function(event) {
		// 폼 제출을 막습니다.
		event.preventDefault();

		if (undisabled()) {
			// reCaptcha 검증
			$.ajax({
				url: '/recaptcha/VerifyRecaptcha',
				type: 'post',
				data: {
					recaptcha: $("#g-recaptcha-response").val()
				},
				success: function(data) {
					switch (data) {
						case 0:
							console.log("자동 가입 방지 봇 통과");

							// 폼 검증 및 제출
							$.ajax({
								url: '/member/login.do',
								type: 'post',
								data: $('#formTag').serialize(),
								success: function(response) {
									console.log(response);

									// 로그인 성공 시 SweetAlert로 메시지 띄우기
									Swal.fire({
										icon: 'success',
										title: '로그인 성공',
										text: '환영합니다!',
									}).then(function() {
										// SweetAlert의 확인 버튼이 클릭되면 페이지 이동
										window.location.href = "/member/mainForm.do";
									});
								},
								error: function(error) {
									console.error(error);
								}
							});
							break;
						case 1:
							// 로봇 확인 실패 시
							Swal.fire({
								icon: 'error',
								title: '로봇 확인',
								text: '로봇이 아님을 확인하세요.',
							});
							break;
						default:
							// 그 외 오류
							Swal.fire({
								icon: 'error',
								title: '오류',
								text: '자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : ' + Number(data) + ']',
							});
							break;
					}
				}
			});
		}
	});
});*/


function home(){
	window.location.href = "/member/mainForm.do";
}
