
document.addEventListener('DOMContentLoaded', function() {
let pushCount = document.getElementById("pushCount");
let pushDropUl = document.getElementById("pushDropUl");
let pushDeleteAll = document.getElementById("pushDeleteAll");

	$.ajax({
        type:'get',
        url:'/colabo/projectPushReceive.do',
        dataType: "JSON",
        success: function(data){   //요청 성공시 실행될 메서드
			console.log(data[0].pushType);
			console.log(data.length);
//			pushCount.innerHTML=data.length;
			pushCount.innerHTML = data.length;
			
			for(let i =0; i<data.length; i++){
				
				let pushDate = data[i].pushDate.substr(0,16);
				
				let list = document.createElement("li");
					list.value=data[i].projectNo;
					list.style.cursor="pointer";
					list.addEventListener("mouseover", function(){
						list.style.filter="brightness(10%)";
					})
					list.addEventListener("mouseout", function(){
						list.style.filter="brightness(100%)";
					})
					
				let aTag = document.createElement("a");
					aTag.innerHTML= pushDate+"<br>"+"<strong>"+data[i].addMName+"</strong>"+"님의 "+
							"<strong>"+data[i].projectName+" "+data[i].pushContent+"<br>"+data[i].pushType+"</strong>"+
							" 알림이 도착하였습니다.";
				
				let hrTag = document.createElement("hr");
				
				list.addEventListener("click", function(event){
					
					console.log("pushNo 는 : "+ data[i].pushNo);
					$.ajax({
						type: 'post',
						url: '/colabo/changePushType.do',
						data: {
							pushNo: data[i].pushNo
						},
						dataType: "text",
						success: function(data) {   //요청 성공시 실행될 메서드
						},
						error: function() {		 //요청 실패시 에러 확인을 위함
						}
					})
					
					
					
					
					if(confirm("해당페이지로 이동하시겠습니까?")){
						if(data[i].pushType == "진행" || data[i].pushType == "완료"){
							$.ajax({
								type: 'post',
								url: '/colabo/getPushProjectSession.do',
								data: {
									projectNo: list.value
								},
								dataType: "text",
								success: function(data) {   //요청 성공시 실행될 메서드
									
									window.location.href="/colabo/colaboBasicPage";
									
								},
								error: function() {		 //요청 실패시 에러 확인을 위함
								}
							})
							
						}else{
							window.location.href="/colabo/inviteApplyProject";
						}
					}else{
						location.reload(true);
					}
					
					
//					if(confirm("해당페이지로 이동하시겠습니까?")){
//						if(data[i].pushType == "진행" || data[i].pushType == "완료"){
//							window.location.href="/colabo/getPushProjectSession.do?projectNo="+list.value;
//						}else{
//							window.location.href="/colabo/inviteApplyProject";
//						}
//					}
					
					
				})
				
				list.appendChild(aTag);
				pushDropUl.appendChild(list);
				pushDropUl.appendChild(hrTag);
				
				
				
			}
			
			
			
	    },
	    error:function(){		 //요청 실패시 에러 확인을 위함

	    }
	})


	
	
	
})	
	
	
function pushDeleteAll(){
	
	if(confirm("알림을 전체삭제 하시겠습니까")){
		$.ajax({
			type: 'post',
			url: '/colabo/allChangePushType.do',
			data: {
				
			},
			dataType: "text",
			success: function(data) {   //요청 성공시 실행될 메서드
				location.reload(true);
				
			},
			error: function() {		 //요청 실패시 에러 확인을 위함
			}
		})
	}
}	
	
	
	
	
	
	