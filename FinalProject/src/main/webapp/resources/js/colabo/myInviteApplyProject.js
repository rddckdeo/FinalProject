

function projectConfirm(confirmText,projectNo){
	
	if(confirmText == '참가' || confirmText == '거절'){
		
		$.ajax({
				type: 'post',
				url: '/colabo/inviteConfirm.do',
				data: {
					confirmText: confirmText,
					projectNo: projectNo
				},
				dataType: "text",
				success: function(data) {   //요청 성공시 실행될 메서드
					
				if(confirmText == '참가'){
					if (data == 'success') {
						alert("프로젝트 참가에 성공하였습니다.")
					} else {
						alert("프로젝트 참가에 실패하였습니다.")
					}

					window.location.href = "/colabo/inviteApplyProject";
					
				}else if(confirmText == '거절'){
					if (data == 'success') {
						alert("프로젝트 거절완료.")
					} else {
						alert("프로젝트 거절실패.")
					}

					window.location.href = "/colabo/inviteApplyProject";
					
				}

				},
				error: function() {		 //요청 실패시 에러 확인을 위함
				}
			})
		
	}
}

function projectApply(projectNo,memberNo){
		$.ajax({
				type: 'post',
				url: '/colabo/applyProject.do',
				data: {
					projectNo: projectNo,
					applyMNo: memberNo
				},
				dataType: "text",
				success: function(data) {   //요청 성공시 실행될 메서드
					
					if(data == 'success'){
						alert("프로젝트 참가신청이 완료되었습니다.");
					}else{
						alert("프로젝트 참가신청에 실패하였습니다.");
					}

			window.location.href = "/board/";
					

				},
				error: function() {		 //요청 실패시 에러 확인을 위함
				}
			})
}

function receiveProjectConfirm(confirmText,projectNo,memberNo){
	console.log(confirmText);
	console.log(projectNo);
	console.log(memberNo);
}



