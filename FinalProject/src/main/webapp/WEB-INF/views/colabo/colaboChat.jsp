<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="/resources/js/colabo/colaboChat.css" rel="stylesheet" type="text/css">
</head>
<body>
<script src="/resources/js/colabo/colaboChat.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

	<input type="text" class="textChat" id="textChat" placeholder="텍스트입력">
	<button class="sendBtn" id="sendBtn" onclick="sendText()">전송</button>
	<button class="sendBtn" id="removeBtn" onclick="closeConnect()">연결끊기</button>
<div class="mainDiv" id="mainDiv">
	<textarea id ="textArea" rows="10" cols="50" readonly="true"></textarea>
	
	
	
</div>

</body>
</html>