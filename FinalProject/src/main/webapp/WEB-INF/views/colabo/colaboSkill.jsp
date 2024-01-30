<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>프로젝트 기능분담</title>
<!--   <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" /> -->
  <link rel="stylesheet" href="../../resources/css/colabo/colabo.css" />
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
						<h3>프로젝트 기능분담 페이지 </h3>
						<div>
							<p>~~~~ 프로젝트</p>
							<div style="max-width: 50%;">
								<canvas id="barExample" style="height: 530px; width:800px"></canvas>
							</div>
							<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  기능추가
</button>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticEdit">
  기능수정
</button>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticDelete">
  기능삭제
</button>

<!-- 기능추가 Modal -->   
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">기능추가 인원 정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	      <div class="modal-body">
	      	<h5>인원 선택</h5>
	        <select id="projectPeople" style="width:200px" onclick="getPersonList()" onchange="getPersonValue()">
	        	<option value="" selected>-----인원선택----- </option>
	        </select>
	        <br><br>
	        <h5>기능 입력</h5>
	        <input type="text" style="width:200px" id="inputSkillName" placeholder="기능작성" onkeyup="inputSkillName()">
	        <br><br>
	        <h5>기능 분류 선택</h5>
	        <select id="inputskillCategory" style="width:200px" onchange="inputSkillCategory()">
	        	<option value="" >---기능분류 선택</option>
	        	<option value="back" >back end</option>
	        	<option value="front" >front end</option>
	        </select>
	      </div>
      <hr>
      	  <div >
		      <input class="resultInput" style="width:170px" id="sendName" type="text" placeholder="이메일, 이름" disabled>
		      <input class="resultInput" style="width:170px" id="sendSkillName" type="text" placeholder="구현기능" disabled>
		      <input class="resultInput" id="sendSkillCategory" type="text" placeholder="기능분류" disabled>
	      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="enrollSkillAll()">기능 추가하기</button>
      </div>
    </div>
  </div>
</div>

<!-- 기능수정 Modal -->   
<div class="modal fade" id="staticEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">기능수정 인원 정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	      <div class="modal-body">
	      	<h5>인원 선택</h5>
	        <select id="skillPeople" style="width:250px" onclick="getSkillPerson()" onchange="getSkillValue()">
	        	<option value="" selected>-----인원선택----- </option>
	        </select>
	        <br><br>
	        <h5>기능 퍼센트 설정</h5>
	        <input type="number" style="width:200px" id="inputFullPercent" placeholder="수정 퍼센트 설정" onchange="inputEditPercent()" min="0" max="100" maxlength="3"> 최소 0 최대 100 % 
	        <br><br>
	      </div>
      <hr>
      	  <div>
      	  	<h5>인원 선택</h5>
		      <input class="resultInput" style="width:400px" id="sendEditName" type="text" placeholder="이메일, 이름" disabled>
		      <br><br>
      	  	<h5>구현 부분</h5>
		      <input class="resultInput" style="width:400px" id="sendEditCategory" type="text" placeholder="front,back" disabled>
		      <br><br>
		    <h5>수정할 퍼센트</h5>
		      <input class="resultInput" style="width:250px" id="sendEditFullPercent" type="text" placeholder="수정퍼센트" disabled>
	      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="editSkillAll()">기능 추가하기</button>
      </div>
    </div>
  </div>
</div>

<!-- 기능삭제 Modal -->   
<div class="modal fade" id="staticDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">기능삭제 인원 정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	      <div class="modal-body">
	      	<h5>인원 선택</h5>
	        <select id="skillDeletePeople" style="width:250px" onclick="getSkillDeletePerson()" onchange="getSkillDeleteValue()">
	        	<option value="" selected>-----인원선택----- </option>
	        </select>
	        <br><br>
	      </div>
      <hr>
      	  <div>
      	  	<h5>인원 선택</h5>
		      <input class="resultInput" style="width:300px" id="sendDeleteName" type="text" placeholder="이메일, 이름" disabled>
		      <br><br>
	      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="deleteSkillAll()">기능 삭제하기</button>
      </div>
    </div>
  </div>
</div>













						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    
    
    
    
    <script src="../../resources/js/colabo/colaboSkillChart.js" ></script>
</body>

</html>