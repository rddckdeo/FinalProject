<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>프로젝트 생성</title>
<!--   <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" /> -->
  <link rel="stylesheet" href="../../resources/css/colabo/colabo.css" />
  
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
				<div class="row">
					<div class="card w-100" style="width:70%; height:70%;">
						<h3>내 진행중인 프로젝트 목록</h3>
						<div>
							<p>~~~~ 프로젝트</p>
							<div style="max-width: 40%;">
								<canvas id="pieExample"></canvas>
							</div>
							<input type="text">
							<ul> 프로젝트 인원
								<li>홍길동</li>
								<li>냥냥냥</li>
								<li>김김김</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    
    
    
    
    <script src="../../resources/js/colabo/colabo.js" ></script>
</body>

</html>