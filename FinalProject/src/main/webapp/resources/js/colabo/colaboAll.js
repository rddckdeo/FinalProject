

function enterNoticePage() {
	window.location.href = "/colabo/enterNoticePage";
}


function enterEdit(noticeNo) {
	window.location.href = "/colabo/enterNoticeEdit?noticeNo="+noticeNo;
}

function deleteNotice(noticeNo){
	$.ajax({
			url: '/colabo/noticeDelete.do',
			type: 'post',
			data: {
				noticeNo: noticeNo
			},
			success: function(data) {
				if(data === "success"){
					alert("삭제성공");
					window.location.href = "/colabo/colaboNotice"
				}else{
					alert("삭제실패");
				}
				
				
			},
			error: function(err) {

			}
		});
}
































