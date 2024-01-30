<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!doctype html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>협업툴 메인페이지</title>
<!--   <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" /> -->
  <link rel="stylesheet" href="../../resources/css/colabo/colabo.css" />
  
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) --> 
   <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  
  <!-- fullcalendar CDN --> 
   <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' /> 
   <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script> 
   <!-- fullcalendar 언어 CDN --> 
   <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  
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
        <!--  Row 1 -->
        <div class="row" style="width:1700px">
          <div class="col-lg-8 d-flex align-items-strech">
            <div class="card w-100">
              <div class="card-body">
                <div class="d-flex align-items-center justify-content-between mb-10">
                  <div class="">
                    <h5 class="card-title fw-semibold">작업 진행도</h5>
                  </div>
                  <div class="dropdown">
                    <button
                      id="dropdownMenuButton1"
                      data-bs-toggle="dropdown"
                      aria-expanded="false"
                      class="rounded-circle btn-transparent rounded-circle btn-sm px-1 btn shadow-none"
                    >
                      <i class="ti ti-dots-vertical fs-7 d-block">ㅁㄴㅇㅁㄴㅇㅁㄴㅇ</i>
                    </button>
                    <ul
                      class="dropdown-menu dropdown-menu-end"
                      aria-labelledby="dropdownMenuButton1"
                    >
                      <li><a class="dropdown-item" href="#">Action</a></li>
                      <li>
                        <a class="dropdown-item" href="#">Another action</a>
                      </li>
                      <li>
                        <a class="dropdown-item" href="#"
                          >Something else here</a
                        >
                      </li>
                    </ul>
                  </div>
                </div>
                <div id="profit" style="text-aline:center">
                	<div >
						<canvas id="barExample" style="width: 500px; height: 500px; display:inline; float:left;"></canvas>
						<div style="float:left; margin-left:100px; margin-top:100px;">
							<h4>전체 진행도</h4>
							<p class="fs-3 fw-normal mb-0 text-success" id="allPercent" style="display:block;">asdasd</p>
							<br><br>
							<h4>front 진행도</h4>
							<p class="fs-3 fw-normal mb-0 text-success" id="frontPercent" style="display:block;">asdasd</p>
							<br><br>
							<h4>back 진행도</h4>
							<p class="fs-3 fw-normal mb-0 text-success" id="backPercent" style="display:block;">asdasd</p>
						</div>
					</div>
                </div>
                <div>
<!--                 	<div style="max-width: 30%;"> -->
<!-- 						<canvas id="pieExample"></canvas> -->
<!-- 					</div> -->
                </div>
                
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <div class="mb-4">
                  <h5 class="card-title fw-semibold">일일 프로젝트 계획</h5>
                  
                  	<div id="calendar"></div>
                  
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-8 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <div
                  class="d-flex mb-4 justify-content-between align-items-center"
                >
                  <h5 class="mb-0 fw-bold">팀원정보</h5>

                  <div class="dropdown">
                    <button
                      id="dropdownMenuButton1"
                      data-bs-toggle="dropdown"
                      aria-expanded="false"
                      class="rounded-circle btn-transparent rounded-circle btn-sm px-1 btn shadow-none"
                    >
                      <i class="ti ti-dots-vertical fs-7 d-block"></i>
                    </button>
                    <ul
                      class="dropdown-menu dropdown-menu-end"
                      aria-labelledby="dropdownMenuButton1"
                    >
                      <li><a class="dropdown-item" href="#">Action</a></li>
                      <li>
                        <a class="dropdown-item" href="#">Another action</a>
                      </li>
                      <li>
                        <a class="dropdown-item" href="#"
                          >Something else here</a
                        >
                      </li>
                    </ul>
                  </div>
                </div>

                <div class="table-responsive" data-simplebar>
                  <table
                    class="table table-borderless align-middle text-nowrap"
                  >
                    <thead>
                      <tr>
                        <th scope="col">팀원 이름</th>
                        <th scope="col">팀원 이메일</th>
                        <th scope="col">팀 가입일</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test="${empty list}">
                    			<tr>
				           			<td colspan="3">
				           				<h3 class="text-center">등록된 글이 없습니다.</h3>
				           			</td>
				           		</tr>
                    		</c:when>
                    		<c:otherwise>
		                     <c:forEach var="item" items="${list}">
			                      <tr>
			                      	<td class="mb-1 fw-bolder">${item.memberName}</td>
			                      	<td class="fs-3 fw-normal mb-0 text-success">${item.memberEmail}</td>
			                      	<td class="badge bg-light-success rounded-pill text-success px-3 py-2 fs-3">${item.teamEnrollDate}</td>
			                      </tr>
							 </c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="py-6 px-6 text-center">
          <p class="mb-0 fs-4"> 프로젝트 페이지 입니다. <a href="https://adminmart.com/" target="_blank" class="pe-1 text-primary text-decoration-underline">AdminMart.com</a></p>
        </div>
      </div>
    </div>
    </div>
    
    
    
    <script src="../../resources/js/colabo/colabo.js" ></script>
    
</body>

</html>