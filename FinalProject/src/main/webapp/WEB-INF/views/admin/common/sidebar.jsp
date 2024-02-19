<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<aside class="left-sidebar sidebarPosition sidebarColor position">
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar sidebarColor height100per" data-simplebar>
			<div class="d-flex mb-4 align-items-center justify-content-between">
				<div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
					<i class="ti ti-x fs-8"></i>
				</div>
			</div>
			<!-- Sidebar navigation-->
			<nav class="sidebar-nav">
				<ul id="sidebarnav" class="mb-4 pb-2">
					<li class="nav-small-cap"><i class="ti ti-dots nav-small-cap-icon fs-5"></i> <span class="hide-menu">Home</span></li>
					<li class="sidebar-item bottomMargin20"><a class="sidebar-link sidebar-link primary-hover-bg whiteColor" href="adminForm.do" aria-expanded="false"> 
						<span class="hide-menu ms-2 ps-1">Admin Home</span>
					</a></li>
					<li class="sidebar-item bottomMargin20"><a class="sidebar-link sidebar-link primary-hover-bg whiteColor" href="mainForm.do" aria-expanded="false"> 
						<span class="hide-menu ms-2 ps-1">Total Home</span>
					</a></li>
					<li class="nav-small-cap"><i class="ti ti-dots nav-small-cap-icon fs-5"></i> <span class="hide-menu">기능</span></li>
					<li class="sidebar-item bottomMargin20"><a class="sidebar-link sidebar-link warning-hover-bg" href="adminVisit.do" aria-expanded="false">
						<span class="hide-menu ms-2 ps-1">방문자 현황</span>
					</a></li>
					<li class="sidebar-item bottomMargin20"><a class="sidebar-link sidebar-link danger-hover-bg" href="adminMember.do" aria-expanded="false"> 
						<span class="hide-menu ms-2 ps-1">사용자 관리</span>
					</a></li>
					<li class="sidebar-item bottomMargin20"><a class="sidebar-link sidebar-link success-hover-bg" href="adminProject.do" aria-expanded="false"> 
						<span class="hide-menu ms-2 ps-1">프로젝트 관리</span>
					</a></li>
					<li class="sidebar-item bottomMargin20"><a class="sidebar-link sidebar-link primary-hover-bg" href="adminInquiry.do" aria-expanded="false"> 
						<span class="hide-menu ms-2 ps-1">문의 사항</span>
					</a></li>
					<li class="sidebar-item bottomMargin20"><a class="sidebar-link sidebar-link indigo-hover-bg" href="adminBoard.do" aria-expanded="false"> 
						<span class="hide-menu ms-2 ps-1">게시판 현황</span>
					</a></li>
					<li class="sidebar-item bottomMargin20"><a class="sidebar-link sidebar-link primary-hover-bg" href="adminDeclaration.do" aria-expanded="false"> 
						<span class="hide-menu ms-2 ps-1">신고 List</span>
					</a></li>
				</ul>


			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
	</aside>
</body>
</html>