<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>프로젝트 그림판</title>
<!--   <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" /> -->
  <link rel="stylesheet" href="../../resources/css/colabo/colabo.css" />
  <style>
        canvas {
            border: 1px solid #000;
            cursor: crosshair;
        }
        button {
            margin: 5px;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
 <%@ include file="./common/colaboSideBar.jsp" %>
    
  	<!--  Main wrapper -->
		<div class="body-wrapper">
			 <%@ include file="./common/colaboHeader.jsp" %>
			<div class="container-fluid">
	<br>
    <!-- 색조정 버튼들 -->
    <button id="black" class="changeColor" value="black" style="background-color:black">검정</button>
    <button id="redBtn" class="changeColor" value="red" style="background-color:red">빨강</button>
    <button id="orangeBtn" class="changeColor" value="orange" style="background-color:orange">주황</button>
    <button id="yellowBtn" class="changeColor" value="yellow" style="background-color:yellow">노랑</button>
    <button id="greenBtn" class="changeColor" value="green" style="background-color:green">초록</button>
    <button id="blueBtn" class="changeColor" value="blue" style="background-color:blue">파랑</button>
	<button id="deleteDraw" class="changeColor" value="#f5f8fb">지우개</button>
	
	브러쉬 크기
	<button class="changeSize" value="1">기본크기</button>
	<button class="changeSize" value="5">중간크기</button>
	<button class="changeSize" value="10">큰크기</button>
	
    <!-- 전체 지우기 버튼 -->
    <button id="clearBtn">전체 지우기</button>
    
    <!-- 이미지 저장 버튼 -->
    <button id="saveBtn">내 PC에 이미지 저장</button>
    
	<button>파일채팅으로 전송하기</button>
	<br>
						<!-- 캔버스 요소 -->
	
    <canvas id="myCanvas" width="800" height="600"></canvas>


			</div>
		</div>
	</div>
    
    
    
    
    
    <script src="../../resources/js/colabo/colabo.js" ></script>
    <script src="../../resources/js/colabo/colaboCanvas.js"></script>
</body>
</html>