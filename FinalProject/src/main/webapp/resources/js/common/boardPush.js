window.addEventListener('load', function(){
    $.ajax({
        url: "/boardPush/pushList.do",
        type:"GET",
        success: function(response){
            console.log(response);
			let div = document.getElementById('boardPushDiv');
			let divTitle = document.getElementById('boardPushTitle');
			
            if(response.length !== 0){
				// 알림 갯수 및 새로고침 버튼
				let pTitle = document.createElement('p');
				pTitle.textContent = '현재 알림 수' + "   " + response.length;
				pTitle.classList = 'pTitle';
				let img = document.createElement('img');
				img.src = "/resources/uploads/icon/arrow-clockwise.svg";
				img.classList = 'imgStyle';
				
				img.onclick = function(){
					location.reload(true);
				}
				
				divTitle.appendChild(pTitle);
				divTitle.appendChild(img);
				
				response.forEach(function(pushDTO){
					// a태그 생성
					let a = document.createElement('a');
					a.classList.add('d-flex' ,'align-items-center' ,'gap-2', 'dropdown-item','direction2', 'justifyCenter');
					a.style.cursor = 'pointer';
					a.href = "boardPush.do";
					// p태그 생성
					let p = document.createElement('p');
					p.classList.add('mb-0', 'fs-3', 'pushFont');
					if(pushDTO.pushType === 'comment'){
						p.textContent = '게시글에 댓글이 달렸습니다.';					
					}else if(pushDTO.pushType === 'blind'){
						p.textContent = '작성한 글이 Blind 처리 되었습니다..';					
					}else if(pushDTO.pushType === 'inquiry'){
						p.textContent = '문의 답변이 도착하였습니다.';		
					}
					
					if(pushDTO.pushCheck === 'N'){
						let span = document.createElement('span');
						span.classList.add('newSpan');
						
						a.appendChild(span);
					}else{
						let span = document.createElement('span');
						span.classList.add('checkSpan');
						
						a.appendChild(span);
					}
					// '대짬뽕'님께서 댓글을 작성하였습니다.
					// 특정 컨텐츠가 blind 처리 되었습니다.
					// 문의사항 답변이 도착하였습니다.
					
					//상속 관계 생성
					a.appendChild(p);
					div.appendChild(a);
				})
			}else{
				let a = document.createElement('a');
				a.classList.add('d-flex' ,'align-items-center' ,'gap-2', 'dropdown-item','direction2');
				let p = document.createElement('p');
				p.classList.add('mb-0', 'fs-3');
				p.textContent = '알림이 없습니다.';
				a.appendChild(p);
				div.appendChild(a);
			}
			
        },
        error: function(error){
            console.log('Error', error);
        }
    });
	 $.ajax({
        url: "/boardPush/pushNoneViewCount.do",
        type:"GET",
        success: function(response){
			let span = document.getElementById('viewCountSpan');
			let spanCount = document.createElement('span');
			spanCount.textContent = response;
			span.appendChild(spanCount);
		}
	})
});
