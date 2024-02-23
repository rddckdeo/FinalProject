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
			  <div class="card w-100">
				<div class="form-style-5" style="height:1200px">
					<form action="/colabo/projectEnroll.do" method="post" enctype="multipart/form-data">
						<fieldset>
							<legend>
								<span class="number">1</span>${sessionScope.getProjectName} 팀 프로젝트 생성자 정보
							</legend>
							<input type="hidden" name="memberNo" value="${list.memberNo}">
							<input type="text" name="memberName" value="${list.memberName}" readonly>
							<input type="email" name="memberEmail" value="${list.memberEmail}" readonly>
							
						</fieldset>
						<fieldset>
							<legend>
								<span class="number">2</span> 프로젝트 정보
							</legend>
							<div style="width:100px; height:100px;">
								<p>이미지 업로드</p>
								<input type="file" name="upload">
							</div>
							<input type="text" name="subject" id="projectSubject" onchange="nullCheckBtn()" placeholder="프로젝트 주제" maxlength="30">
							<input type="text" name="name" id="projectName" onchange="nullCheckBtn()" placeholder="프로젝트 이름" maxlength="30">
							<textarea name="detail" id="projectContent" onchange="nullCheckBtn()" placeholder="프로젝트 설명" maxlength="150"></textarea>
							<label for="useStackName">사용기술스택 입력</label>
							<input type="text" name="stack" id="useStackName" onchange="nullCheckBtn()" placeholder="사용할 기술스택" maxlength="50">
							
							<label for="projectPerson">프로젝트 전체인원 입력</label>
							<input type="number" name="personCount" id="projectPerson" onchange="nullCheckBtn()" onkeyup="checkNumber()" placeholder="프로젝트 인원 ( 명 )"  min="1" max="10" maxlength="2">
							
							<label for="projectTerm">프로젝트 진행기간 입력</label>
							<input type="number" name="period" id="projectTerm" onchange="nullCheckBtn()" onkeyup="checkNumber()" placeholder="프로젝트 기간 ( 달 )"  min="1" max="12" maxlength="2">
							
						</fieldset>
						<input type="submit" name="stateKor" id="projectSubmit" value="프로젝트생성" disabled>
					</form>
				</div>
			</div>
			</div>
			</div>
		</div>
    </div>
    
    
    <script src="../../resources/js/colabo/colaboProject.js" ></script>
</body>

</html>