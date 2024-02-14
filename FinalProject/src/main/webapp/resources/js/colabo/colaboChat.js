
var ws = new WebSocket("ws://localhost:80/websocket");

	ws.onopen = (message) => {
 	console.log("WebSocket is open");
	console.log(ws.readyState);
	console.log("JS 오픈 메시지 : " +message)
	processOpen(message)
	}
	ws.onmessage = (message) => {
		console.log("JS 메시지 : " +message)
		processMessage(message)
	}
//	ws.onclose = (message) => {
//		console.log("JS 종료 메시지 : " +message)
//		processClose(message)
//	}

	let textArea;
function sendText(){
//	if(ws.readyState == 3){
//		ws.onopen();
//	}
	console.log("메세지전송 함수 : " +ws.readyState);
	textArea = document.getElementById("textArea");
	let textChat = document.getElementById("textChat");
//	console.log(textArea.value);
	ws.send(textChat.value);
	textChat.value = "";
//	textArea.value = "";
	
}
function processClose(message){
	textArea = document.getElementById("textArea");
//	console.log("open메시지 :" +message);
	textArea.value += message + "\n";
}

function processOpen(message){
	textArea = document.getElementById("textArea");
//	console.log("open메시지 :" +message);
	textArea.value += message + "\n";
}
function processMessage(message){
	textArea = document.getElementById("textArea");
//	console.log("메시지 :" + message);
	textArea.value += message.data + "\n";
}



//function connectArea(){
//	let textArea = document.getElementById("textArea");
//	textArea.innerText = "연결시작됨";
//}