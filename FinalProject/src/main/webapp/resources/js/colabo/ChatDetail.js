let memberName = "";
let memberEmail = "";
let memberInfo = "";

// localStorage 에 저장한 채팅방 고유의 아이디와 보내는사람의 이름과 이메일을 저장하기위한변수
let roomId = "";
let sender = "";

// 채팅방 들어갔을때 이름을 가져오기위한 변수
let roomName = "";

	$.ajax({
	    type:'post',
	    url:'/colabo/getMemberInfo.do',
	    dataType: "JSON",
		async: false,
	    success: function(data){   //요청 성공시 실행될 메서드
			memberName = data.memberName;
			memberEmail = data.memberEmail;
		 	memberInfo = memberName+"-"+memberEmail;
		console.log("멤버 이름 이메일 합친값 : " + memberInfo);
	        findAllRoom();
			console.log("멤버가져오는 ajax 입니다 : 멤버이름 이메일 : "+ memberName + memberEmail);
			console.log("ajax 실행중 ㅇ입니ㅏ!!!!");
			
			
			
			console.log("roomId 는   :  : "+roomId);
	    },
	    error:function(){		 //요청 실패시 에러 확인을 위함
	        findAllRoom();
	    }
	})
			
			
	console.log("ajax 다음코드 실행중징!@!@!@$!@$!@$");


		
		
function getRoomSender(){
	roomId = localStorage.getItem('wschat.roomId');
	sender = localStorage.getItem('wschat.sender');
	console.log("getRoomSender 함수 roomId : "+ roomId);
	console.log("getRoomSender 함수 sender : "+ sender);
	
}
    

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
            li.setAttribute('data-roomName', item.roomName);
			console.log("셋팅되는 roomId 는 : "+item.roomId);
            roomList.appendChild(li);

			li.onclick = (event) => {
				console.log("roomName 은 : "+roomName);
	        var target = event.target;
				console.log("타겟상태값 : "+ target.getAttribute('data-roomid'));
				console.log("event 방 이름은  : "+target.getAttribute('data-roomName'));
            var enterRoom = confirm('방에 들어가시겠습니까?');
	            if (enterRoom) {
				console.log("멤버이름 이메일은 : "+memberInfo);
                localStorage.setItem('wschat.sender', memberInfo);
                localStorage.setItem('wschat.roomId', target.getAttribute('data-roomid'));
                location.href = '/chat/room/enter?roomId='+target.getAttribute('data-roomid')+'&roomName='+target.getAttribute('data-roomName');
				getRoomSender()
	            }
	        }
			
        });
    });
}				





		
		
			
			

// 채팅방 생성시  버튼안누르고 엔터누를때 생성하기
	function enterCreateRoom(event){
            if (event.keyCode === 13) {
                createRoom();
            }
		
	}

		


 // 채팅방 생성
    function createRoom() {
        roomName = document.getElementById('room_name').value;
        if (roomName === '') {
            alert('방 제목을 입력해 주십시요.');
            return;
        }
		roomName += "-"+memberInfo;
		
		// URL 에 쿼리스트링으로 된것 찾음  없으면 null 로 나옴
		// append 쿼리스트링에 값 넣기
        var params = new URLSearchParams();
        params.append('name', roomName);
		
//		$.ajax({
//		    type:'post',
//		    url:'/chat/room',
//		    dataType: "JSON",
//			data: {
//				name: roomName
//			},
//			async: false,
//		    success: function(response){   //요청 성공시 실행될 메서드
//				console.log("반환되는 생성여부관련 내용은 : "+response);
//                alert(response.data.roomName + '방 개설에 성공하였습니다.');
//                document.getElementById('room_name').value = '';
//                findAllRoom();
//		    },
//		    error:function(response){		 //요청 실패시 에러 확인을 위함
//		        console.log("개설실패 내용은 : "+response);
//                alert('채팅방 개설에 실패하였습니다.');
//		    }
//		})
		
        axios.post('/chat/room', params)
            .then(function (response) {
				console.log("반환되는 생성여부관련 내용은 : "+response);
                alert(response.data.roomName + '방 개설에 성공하였습니다.');
                document.getElementById('room_name').value = '';
                findAllRoom();
            })
            .catch(function (response) {
				console.log("개설실패 내용은 : "+response);
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



// 로컬 스토리지에서 방 정보와 사용자 정보를 가져옵니다.
console.log("넘어오는 roomId 는 : "+roomId);
console.log("localStorage : "+localStorage);

// WebSocket 및 Stomp 클라이언트 초기화
var sock = new SockJS("/stomp/chat");
var ws = Stomp.over(sock);
var reconnect = 0;

// 채팅방 정보를 조회하여 화면에 표시하는 함수
//function findRoom() {
//    axios.get('/chat/room/' + roomId).then(response => {
//        // 서버에서 받아온 채팅방 정보를 화면의 'roomName' 요소에 표시
//        document.getElementById('roomName').innerText = response.data.name;
//    });
//}
	


// 채팅 메시지를 화면에 표시하는 함수
function recvMessage(recv) {
    // 부모 요소 가져오기
    var chatList = document.getElementById("chat");

    // scrollToBottom 함수를 사용하여 스크롤을 가장 아래로 이동합니다.
    function scrollToBottom() {
        chatList.scrollTop = chatList.scrollHeight;
    }

    // 새로운 li 요소 생성
    var newLi = document.createElement("li");
    newLi.className = "me";

    // entete div 생성
    var enteteDiv = document.createElement("div");
    enteteDiv.className = "entete";

    // 현재 시간을 '년-월-일-시-분' 형식으로 포맷하는 함수
    function formatDateToCustomString(date) {
        const year = date.getFullYear();
        const month = (date.getMonth() + 1).toString().padStart(2, '0');
        const day = date.getDate().toString().padStart(2, '0');
        const hours = date.getHours().toString().padStart(2, '0');
        const minutes = date.getMinutes().toString().padStart(2, '0');

        return `${year}-${month}-${day} ${hours}:${minutes}`;
    }

    // 현재 시간을 가져와서 포맷팅
    const currentDate = new Date();
    const formattedDate = formatDateToCustomString(currentDate);

    // h3 요소 생성 및 설정
    var h3Time = document.createElement("h3");
    h3Time.textContent = formattedDate;

    // h2 요소 생성 및 설정
    var h2Name = document.createElement("h2");
    h2Name.textContent = "-" + recv.sender;

    // span 요소 생성 및 설정
    var spanStatus = document.createElement("span");
    spanStatus.className = "status blue";

    // enteteDiv에 h3, h2, span 추가
    enteteDiv.appendChild(h3Time);
    enteteDiv.appendChild(h2Name);
    enteteDiv.appendChild(spanStatus);

    // triangle div 생성
    var triangleDiv = document.createElement("div");
    triangleDiv.className = "triangle";

    // message div 생성 및 설정
    var messageDiv = document.createElement("div");
    messageDiv.className = "message";
    messageDiv.textContent = recv.sender + ' - ' + recv.message;

    // newLi에 enteteDiv, triangleDiv, messageDiv 추가
    newLi.appendChild(enteteDiv);
    newLi.appendChild(triangleDiv);
    newLi.appendChild(messageDiv);

    // chatList에 newLi 추가
    chatList.appendChild(newLi);

    // 스크롤을 가장 아래로 이동
    scrollToBottom();
}

// 서버와 WebSocket 연결
function connect() {
	getRoomSender();
    ws.connect({}, function(frame) {
		console.log("frame 에 들어있는것  connect 부분 : "+ frame);
        // 채팅방 구독
        ws.subscribe("/sub/chat/room/" + roomId, message => {
			console.log("보내는 메세지는 : "+ message);
            var recv = JSON.parse(message.body);
            recvMessage(recv);
        });

        // 입장 메시지 전송
        ws.send("/pub/chat/message", {}, JSON.stringify({
            type: 'ENTER',
            roomId: roomId,
            sender: sender
        }));
    }, error => {
        // 연결 실패 시 재시도
        if (reconnect++ <= 5) {
            setTimeout(() => {
                console.log("connection reconnect");
                sock = new SockJS("/stomp/chat");
                ws = Stomp.over(sock);
                connect();
            }, 10 * 1000);
        }
    });
}



 // 메시지를 전송하는 함수
function sendMessage(event) {
	getRoomSender();
    // 엔터 키가 아니면 무시
    if (event && event.keyCode !== 13) {
        return;
    }
	
    // 입력된 메시지 가져오기
    var message = document.getElementById("messageInput").value;
	
	console.log("입력된 메시지 입니다@!!@$!@$!@ : "+ message);
	console.log("텍스트에리어에  roomId 입니다 !@!!@ : "+ roomId);
	console.log("텍스트에리어에  sender 입니다 !@!!@ : "+ sender);
    // WebSocket을 통해 메시지 전송
    ws.send("/pub/chat/message", {}, JSON.stringify({
        type: 'TALK',
        roomId: roomId,
        sender: sender,
        message: message
    }));

    // 입력 필드 초기화
    document.getElementById('messageInput').value = '';
}





//    findRoom();
    connect();





