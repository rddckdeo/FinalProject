<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="../.././resources/js/colabo/colaboHeaderPush.js" ></script>
<header class="app-header">
      <nav class="navbar navbar-expand-lg">
         <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <div class="dropdown">
               <span target="_blank" id="header-bell dropdownMenuLink" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><img src="/resources/uploads/member/icon/profile/bell.png" alt="" width="33" height="33">
               <span id="pushCount" class="notification-counter" style="margin-right:20px"></span>
               </span>
               <ul id="pushDropUl" class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="dropdownMenuLink"  style="overflow:scroll; height:400px; width:240px">
<!-- 			    <li><a class="dropdown-item" href="#">Action</a></li> -->
			  <button id="pushDeleteAll" class="btn btn-outline-primary mx-3 mt-2 d-block shadow-none" onclick="pushDeleteAll()">알림 전체삭제</button><hr>
			  </ul>
              </div>
               <li class="nav-item dropdown"><a class="nav-link nav-icon-hover" href="#" id="drop2" data-bs-toggle="dropdown" aria-expanded="false"> <img src="${sessionScope.path}${sessionScope.picture}" alt="" width="35" height="35" class="rounded-circle">
               </a>
                  <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                     <div class="message-body">
                        <a href="/mypage/mypage.do" class="d-flex align-items-center gap-2 dropdown-item"> <i class="ti ti-user fs-6"></i>
                           <p class="mb-0 fs-3">내 프로필</p>
                        </a> <a href="/mypage/myinfo.do" class="d-flex align-items-center gap-2 dropdown-item"> <i class="ti ti-mail fs-6"></i>
                           <p class="mb-0 fs-3">마이페이지</p>
                        </a> <a href="/colabo/myProjectProfile" class="d-flex align-items-center gap-2 dropdown-item"> <i class="ti ti-list-check fs-6"></i>
                           <p class="mb-0 fs-3">내 프로젝트</p>
                        </a> <a href="/member/logout.do" class="btn btn-outline-primary mx-3 mt-2 d-block shadow-none">Logout</a>
                     </div>
                  </div></li>
            </ul>
         </div>
      </nav>
   </header>
			<!--  Header End -->
			