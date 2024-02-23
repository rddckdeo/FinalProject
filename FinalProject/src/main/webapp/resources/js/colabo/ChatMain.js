let memberName = "";
let memberEmail = "";
let memberInfo = "";

document.addEventListener('DOMContentLoaded', function () {

        var roomNameInput = document.getElementById('room_name');
        roomNameInput.addEventListener('keyup', function (event) {
            if (event.keyCode === 13) {
                createRoom();
            }
        });
		
		$.ajax({
                type:'post',
                url:'/colabo/getMemberInfo.do',
                dataType: "JSON",
                success: function(data){   //요청 성공시 실행될 메서드
					memberName = data.memberName;
					memberEmail = data.memberEmail;
				 	memberInfo = memberName+"-"+memberEmail;
			        findAllRoom();
			    },
			    error:function(){		 //요청 실패시 에러 확인을 위함
			        findAllRoom();
			    }
			})

    });

    function findAllRoom() {
        axios.get('/chat/rooms').then(function (response) {
            var roomList = document.getElementById("roomList");
			roomList.textContent = "";
            response.data.forEach(function (item) {
                var li = document.createElement("li");
				
				var div = document.createElement("div");
				
				var h2 = document.createElement("h2");
				h2.textContent = item.roomName;
				
				var h3 = document.createElement("h3");
				h3.textContent = "online  ";
				
				var span = document.createElement("span");
				span.className = "status green"; // green orange 있음
				
				h3.appendChild(span);
				
				li.appendChild(div);
				li.appendChild(h2);
				li.appendChild(h3);
				
				li.style.border = '1px solid white';
                li.setAttribute('data-roomid', item.roomId);
				console.log("셋팅되는 roomId 는 : "+item.roomId);
                roomList.appendChild(li);

				li.onclick = (event) => {
		        var target = event.target;
	            var enterRoom = confirm('방에 들어가시겠습니까?');
		            if (enterRoom) {
					console.log("멤버이름 이메일은 : "+memberInfo);
	                localStorage.setItem('wschat.sender', memberInfo);
	                localStorage.setItem('wschat.roomId', target.getAttribute('data-roomid'));
	                location.href = '/chat/room/enter/' + target.getAttribute('data-roomid');
		            }
		        }
				
            });
        });
    }

    function createRoom() {
        var roomName = document.getElementById('room_name').value;
        if (roomName === '') {
            alert('방 제목을 입력해 주십시요.');
            return;
        }
		roomName += "-"+memberInfo;
        var params = new URLSearchParams();
        params.append('name', roomName);

        axios.post('/chat/room', params)
            .then(function (response) {
                alert(response.data.roomName + '방 개설에 성공하였습니다.');
                document.getElementById('room_name').value = '';
                findAllRoom();
            })
            .catch(function (response) {
                alert('채팅방 개설에 실패하였습니다.');
            });
    }

//    function enterRoom(event) {
//        var target = event.target;
//        if (target.tagName === 'li') {
//            var sender = prompt('대화명을 입력해 주세요.');
//            if (sender !== '') {
//                localStorage.setItem('wschat.sender', sender);
//                localStorage.setItem('wschat.roomId', target.getAttribute('data-roomid'));
//                location.href = '/chat/room/enter/' + target.getAttribute('data-roomid');
//            }
//        }
//    }