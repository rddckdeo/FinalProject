document.addEventListener('DOMContentLoaded', function() {
	
	
	// 페이지 로딩 시 사이드바 에 현재 참여중인 프로젝트들 목록 나오게 
	
	$.ajax({
        type:'post',
        url:'/colabo/getProjectList.do',
        dataType: "text",
		data: JSON.stringify(obj),
		contentType: 'application/json; charset=utf-8',
		
        success: function(data){   //요청 성공시 실행될 메서드
	        console.log("데이터 지우기 성공");
			alert('삭제' + data);
			console.log(data);
	    },
	    error:function(){		 //요청 실패시 에러 확인을 위함
	        console.log("통신에러");
	    }
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});