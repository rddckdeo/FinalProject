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
  <link rel="stylesheet" href="../../resources/css/colabo/colaboNotice.css" />
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

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
						<h3> ${sessionScope.getProjectName} 팀 공지작성</h3>
<!-- 						<div style="text-align: right;"> -->
<!-- 							<button style="width:60px; text-align: center;" onclick="enterNoticePage()">글수정</button> -->
<!-- 						</div> -->
						
         <hr>
         <br>

		<form action="/colabo/noticeEnroll.do" method="post" >
			<div class="mb-3 justify-content-center">
				<input type="text" class="form-control"
					name="noticeTitle" id="exampleFormControlInput1" placeholder="제목을 입력하세요.">
			</div>
			<div id="marteditor mb-3 justify-content-center">
				<textarea name="noticeContent" id="editorTxt" class="form-control"
					rows="13" cols="10" placeholder="내용을 입력해주세요"></textarea>
			</div>
			
<!-- 			<input type="file" name="upload"/> -->
			
			<div class="row">
				<div class="col text-center">
					<button type="button" onclick="history.back()" class="btn btn-danger">취소</button>
					<button type="submit" class="btn btn-primary">작성</button>
				</div>
			</div>
		</form>
						
						
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
    
    
    
    
    
    <script src="../../resources/js/colabo/colaboAll.js" ></script>
</body>

</html>