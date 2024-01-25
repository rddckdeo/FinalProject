<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="row">
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
                <div id="profit">
                	<div style="max-width: 80%;">
						<canvas id="pieExample"></canvas>
					</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="row">
              <div class="col-lg-12 col-sm-6">
                <!-- Yearly Breakup -->
                <div class="card overflow-hidden">
                  <div class="card-body p-4">
                    <h5 class="card-title mb-10 fw-semibold">Traffic Distribution</h5>
                    <div class="row align-items-center">
                      <div class="col-7">
                        <h4 class="fw-semibold mb-3">$36,358</h4>
                        <div class="d-flex align-items-center mb-2">
                          <span
                            class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
                            <i class="ti ti-arrow-up-left text-success"></i>
                          </span>
                          <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                          <p class="fs-3 mb-0">last year</p>
                        </div>
                        <div class="d-flex align-items-center">
                          <div class="me-3">
                            <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2">Oragnic</span>
                          </div>
                          <div>
                            <span class="round-8 bg-danger rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2">Refferal</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-5">
                        <div class="d-flex justify-content-center">
                          <div id="grade"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12 col-sm-6">
                <!-- Monthly Earnings -->
                <div class="card">
                  <div class="card-body">
                    <div class="row alig n-items-start">
                      <div class="col-8">
                        <h5 class="card-title mb-10 fw-semibold"> Product Sales</h5>
                        <h4 class="fw-semibold mb-3">$6,820</h4>
                        <div class="d-flex align-items-center pb-1">
                          <span
                            class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
                            <i class="ti ti-arrow-down-right text-danger"></i>
                          </span>
                          <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                          <p class="fs-3 mb-0">last year</p>
                        </div>
                      </div>
                      <div class="col-4">
                        <div class="d-flex justify-content-end">
                          <div
                            class="text-white bg-danger rounded-circle p-7 d-flex align-items-center justify-content-center">
                            <i class="ti ti-currency-dollar fs-6"></i>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="earning"></div>
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
                  <h5 class="mb-0 fw-bold">팀원 및 맡은 임무</h5>

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
                        <th scope="col">Profile</th>
                        <th scope="col">Hour Rate</th>
                        <th scope="col">Extra classes</th>
                        <th scope="col">Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <div class="d-flex align-items-center">
                            <div class="me-4">
                              <img
                                src="../assets/images/profile/user1.jpg"
                                width="50"
                                class="rounded-circle"
                                alt=""
                              />
                            </div>

                            <div>
                              <h6 class="mb-1 fw-bolder">Mark J. Freeman</h6>
                              <p class="fs-3 mb-0">Prof. English</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="fs-3 fw-normal mb-0">$150/hour</p>
                        </td>
                        <td>
                          <p class="fs-3 fw-normal mb-0 text-success">
                            +53
                          </p>
                        </td>
                        <td>
                          <span
                            class="badge bg-light-success rounded-pill text-success px-3 py-2 fs-3"
                            >Available</span
                          >
                        </td>
                      </tr>

                      <tr>
                        <td>
                          <div class="d-flex align-items-center">
                            <div class="me-4">
                              <img
                                src="../assets/images/profile/user2.jpg"
                                width="50"
                                class="rounded-circle"
                                alt=""
                              />
                            </div>

                            <div>
                              <h6 class="mb-1 fw-bolder">Nina R. Oldman</h6>
                              <p class="fs-3 mb-0">Prof. History</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="fs-3 fw-normal mb-0">$150/hour</p>
                        </td>
                        <td>
                          <p class="fs-3 fw-normal mb-0 text-success">
                            +68
                          </p>
                        </td>
                        <td>
                          <span
                            class="badge bg-light-primary rounded-pill text-primary px-3 py-2 fs-3"
                            >In Class</span
                          >
                        </td>
                      </tr>

                      <tr>
                        <td>
                          <div class="d-flex align-items-center">
                            <div class="me-4">
                              <img
                                src="../assets/images/profile/user3.jpg"
                                width="50"
                                class="rounded-circle"
                                alt=""
                              />
                            </div>

                            <div>
                              <h6 class="mb-1 fw-bolder">Arya H. Shah</h6>
                              <p class="fs-3 mb-0">Prof. Maths</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="fs-3 fw-normal mb-0">$150/hour</p>
                        </td>
                        <td>
                          <p class="fs-3 fw-normal mb-0 text-success">
                            +94
                          </p>
                        </td>
                        <td>
                          <span
                            class="badge bg-light-danger rounded-pill text-danger px-3 py-2 fs-3"
                            >Absent</span
                          >
                        </td>
                      </tr>

                      <tr>
                        <td>
                          <div class="d-flex align-items-center">
                            <div class="me-4">
                              <img
                                src="../assets/images/profile/user4.jpg"
                                width="50"
                                class="rounded-circle"
                                alt=""
                              />
                            </div>

                            <div>
                              <h6 class="mb-1 fw-bolder">June R. Smith</h6>
                              <p class="fs-3 mb-0">Prof. Arts</p>
                            </div>
                          </div>
                        </td>
                        <td>
                          <p class="fs-3 fw-normal mb-0">$150/hour</p>
                        </td>
                        <td>
                          <p class="fs-3 fw-normal mb-0 text-success">
                            +27
                          </p>
                        </td>
                        <td>
                          <span
                            class="badge bg-light-warning rounded-pill text-warning px-3 py-2 fs-3"
                            >On Leave</span
                          >
                        </td>
                      </tr>
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