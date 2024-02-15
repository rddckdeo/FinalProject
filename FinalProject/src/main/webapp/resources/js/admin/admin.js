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
/*function projectDeleteBtn(no) {
	let status = document.getElementById("status").value;
	let confirmValue = confirm("정말 삭제하시겠습니까?");
	console.log(confirmValue);
	if (confirmValue === true){
		$.ajax({
			url: '/admin/deleteProject.do',
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
}*/