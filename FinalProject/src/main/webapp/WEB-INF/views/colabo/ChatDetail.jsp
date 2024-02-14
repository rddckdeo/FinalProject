<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>Websocket ChatRoom</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/dist/css/bootstrap.min.css">
    <style>
/*         #app [v-cloak] { */
/*             display: none; */
/*         } */
    </style>
      <link rel="stylesheet" href="/resources/css/colabo/ChatDetail.css" />
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js" integrity="sha512-hsqWiVBsPC5Hz9/hy5uQX6W6rEtBjtI8vyOAR4LAFpZAbQjJ43uIdmKsA7baQjM318sf8BBqrMkcWsfSsaWCNg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="/resources/js/colabo/ChatDetail.js" ></script>
</head>
<body>

<div id="container">
	<div id="divBox">
	<aside>
		<header>
	        <div class="input-group-append">
				 <input type="text" class="form-control" id="room_name" onkeyup="enterCreateRoom(event)" style="height:40px; width:160px" placeholder="채팅방 생성">
	            <button class="btn btn-primary" type="button" onclick="createRoom()">방생성</button>
	        </div>
		</header>
		<ul id="roomList" >
			
		</ul>
	</aside>
	<main>
		<header>
			<div>
				<h2 id="chatHeaderH2">참여중인 채팅방 </h2>
				<h3>${roomName} 입니다.</h3>
			</div>
		</header>
		<ul id="chat">
		
		</ul>
		<footer>
			<textarea class="form-control" id="messageInput" onkeypress="sendMessage(event)" placeholder="Type your message"></textarea>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png" alt="">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png" alt="">
       		<a href="#">Send</a>
		</footer>
	</main>
	</div>
</div>



<!-- <div id="app"> -->
<!--     <div> -->
<!--         <h2 id="roomName">방이름</h2> -->
<!--     </div> -->
<!--     <div class="input-group"> -->
<!--         <div class="input-group-prepend"> -->
<!--             <label class="input-group-text">내용</label> -->
<!--         </div> -->
<!--         <input type="text" class="form-control" id="messageInput" onkeypress="sendMessage(event)"> -->
<!--         <div class="input-group-append"> -->
<!--             <button class="btn btn-primary" type="button" onclick="sendMessage(event)">보내기</button> -->
<!--         </div> -->
<!--     </div> -->
<!--     <ul class="list-group" id="messageList"></ul> -->
<!--     <div></div> -->
<!-- </div> -->
<!-- JavaScript -->


</body>
</html>