window.addEventListener('scroll', function() {
	localStorage.setItem('scrollPosition', window.scrollY);
});
window.addEventListener('load', function() {
	var scrollPosition = localStorage.getItem('scrollPosition');
	if (scrollPosition !== null) {
		window.scrollTo(0, parseInt(scrollPosition));
	}
});
function deleteBtn(no) {
	$.ajax({
		url: '/admin/deleteMember.do',
		type: 'POST', // type의 값이 'post'가 아니라 'POST'여야 합니다.
		data: { no: no }, // 삭제할 항목의 번호를 데이터로 전송합니다.
		success: function(response) {

			if (response === "success") {
				alert("성공적으로 삭제되었습니다.");
				location.reload(true);
			} else {
				alert("삭제에 실패했습니다.");
			}
		},
		error: function(error) {
			console.log('Error:', error);
		}
	});
}

function deleteCancel(no) {
	console.log(no);
	$.ajax({
		url: '/admin/deleteCancel.do',
		type: 'POST',
		data: { no: no },
		success: function(response) {
			if (response === "success") {
				alert("성공적으로 취소되었습니다.");
				location.reload(true);
			} else {
				alert("취소되지 않았습니다.");
			}
		},
		error: function(error) {
			console.log('Error:', error);
		}
	})
}

// admin board delete
function boardDeleteBtn(no) {
	let status = document.getElementById("status").value;
	let confirmValue = confirm("정말 삭제하시겠습니까?");
	console.log(confirmValue);
	if (confirmValue === true){
		$.ajax({
			url: '/admin/deleteBoard.do',
			type: 'POST',
			data: {
				boardNo: no,
				status: status
			},
			success: function(response) {
				if (response === 1){
					alert("성공적으로 삭제되었습니다.");
					location.reload(true);
				} else {
					alert("삭제에 실패하였습니다.");
				}
			}
		})
	}
}
//admin Project Delete
//admin Project Delete
function projectDeleteBtn(value) {
	let data = JSON.parse(value);
	let projectNo = data.no; // 여기서 no를 projectNo로 수정
	let status = data.status;
	
	let confirmValue = confirm("정말 삭제하시겠습니까? 삭제한 데이터는 복구할 수 없습니다.");
	console.log(confirmValue);
	if (confirmValue === true){
		$.ajax({
			url: '/admin/deleteProject.do',
			type: 'POST',
			data: {
				projectNo: projectNo, // 여기서도 변수명을 projectNo로 수정
				status: status
			},
			success: function(response) {
				if (response === 1){
					alert("성공적으로 삭제되었습니다.");
					location.reload(true);
				} else {
					alert("삭제에 실패하였습니다.");
				}
			}
		})
	}
}
window.addEventListener('click', function(event) {
    let modalId = event.target.closest('.adminBoardModal').id;
    let modalStatus = document.getElementById(modalId);
    if (event.target.classList.contains('exitBtn')) {
        modalStatus.style.display = 'none';
    }
});

function modalToggle(no) {
    let modalId = "modal" + no; // 고유한 ID 생성
    let modalStatus = document.getElementById(modalId);
    modalStatus.style.display = 'flex';
}

function modalSub(no){
	let answerInput = document.getElementById("answerInput" + no).value;
	$.ajax({
		url: '/admin/adminBoardEnroll.do',
		type: 'POST',
		data: { 
			no: no,
			content : answerInput
			},
		success: function(response) {
			if (response === 1) {
				alert("답변이 저장되었습니다.");
				location.reload(true);
			} else {
				alert("Error");
			}
		},
		error: function(error) {
			console.log('Error:', error);
		}
	})
}

function modaldelete(no){
	$.ajax({
		url: '/admin/adminBoardDelete.do',
		type: 'POST',
		data: { 
			no: no
			},
		success: function(response) {
			if (response === 1) {
				alert("삭제가 완료되었습니다.");
				location.reload(true);
			} else {
				alert("Error");
			}
		},
		error: function(error) {
			console.log('Error:', error);
		}
	})
}

function declarationModal(no) {
    let modalId = "declarationModal" + no; // 고유한 ID 생성
    let modalStatus = document.getElementById(modalId);
    modalStatus.style.display = 'flex';
}

function declarationCloseModal(){
	location.reload(true);
}

function declarationBlind(no){
	$.ajax({
		url: '/admin/declarationBlind.do',
		type: 'POST',
		data: { 
			no: no
			},
		success: function(response) {
			if (response === 1) {
				alert("블라인드 처리가 되었습니다.");
				location.reload(true);
			} else {
				alert("Error");
			}
		},
		error: function(error) {
			console.log('Error:', error);
		}
	})
}

function declarationNoneBlind(no){
	$.ajax({
		url: '/admin/declarationNoneBlind.do',
		type: 'POST',
		data: { 
			no: no
			},
		success: function(response) {
			if (response === 1) {
				alert("철회되었습니다.");
				location.reload(true);
			} else {
				alert("Error");
			}
		},
		error: function(error) {
			console.log('Error:', error);
		}
	})
}