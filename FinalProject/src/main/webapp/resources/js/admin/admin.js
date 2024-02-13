function deleteBtn(no) {
    console.log(no);

    $.ajax({
        url: '/admin/deleteMember.do',
        type: 'POST', // type의 값이 'post'가 아니라 'POST'여야 합니다.
        data: { no: no }, // 삭제할 항목의 번호를 데이터로 전송합니다.
        success: function(response) {
            
			if(response === "success"){
				alert("성공적으로 삭제되었습니다.");
				window.location.href = "/admin/adminMember.do";
			}else{
				alert("삭제에 실패했습니다.");
			}
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
}

function deleteCancel(no){
	console.log(no);
	$.ajax({
		url: '/admin/deleteCancel.do',
		type: 'POST',
		data: {no:no},
		success: function(response){
			if(response === "success"){
				alert("성공적으로 취소되었습니다.");
				window.location.href = "/admin/adminMember.do";
			}else{
				alert("취소되지 않았습니다.");
			}
		},
		error: function(error){
			console.log('Error:', error);
		}
	})
}