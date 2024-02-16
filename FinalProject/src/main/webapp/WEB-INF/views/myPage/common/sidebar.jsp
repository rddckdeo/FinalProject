<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<aside class="left-sidebar">
		<!-- 사이드바 스크롤-->
		<div class="scroll-sidebar alignCenter" data-simplebar>
			<!-- 로고 -->
			<div class="d-flex mb-4 align-items-center justify-content-between">
				<a href="#" class="text-nowrap logo-img ms-0 ms-md-1"> <img src="../dog-4390885_1280.jpg" width="180" alt="">
				</a>
				<div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
					<i class="ti ti-x fs-8"></i>
				</div>
				<!-- 사이드바 네비게이션-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="mb-4 pb-2">
						<!-- 사이트바 정보게시판 -->
						<li class=" sidebarMain"><i class=""><span class="sidebarFont">Home</span></i></li>
						<li class="sidebar-item bottomMargin30"><a class="alignEnd sidebar-link sidebar-link warning-hover-bg" href="mainForm.do" aria-expanded="false"> <span class="aside-icon p-2 bg-light-warning rounded-3"> <i class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">메인 페이지</span>
						</a></li>
						<li class=" sidebarMain"><i class=""><span class="sidebarFont">My Page</span></i></li>
						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link warning-hover-bg" href="mypage.do" aria-expanded="false"> <span class="aside-icon p-2 bg-light-warning rounded-3"> <i class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">프로필</span>
						</a></li>
						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link warning-hover-bg" href="myinfo.do" aria-expanded="false"> <span class="aside-icon p-2 bg-light-warning rounded-3"> <i class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">내 정보</span>
						</a></li>
						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link danger-hover-bg" href="/colabo/myProjectProfile" aria-expanded="false"> <span class="aside-icon p-2 bg-light-danger rounded-3"> <i class="ti ti-alert-circle fs-7 text-danger"></i>
							</span> <span class="hide-menu ms-2 ps-1">내 프로젝트</span>
						</a></li>
						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link danger-hover-bg" href="/colabo/inviteApplyProject" aria-expanded="false"> <span class="aside-icon p-2 bg-light-danger rounded-3"> <i class="ti ti-alert-circle fs-7 text-danger"></i>
							</span> <span class="hide-menu ms-2 ps-1">초대/신청 중인 프로젝트</span>
						</a></li>
						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link success-hover-bg" href="myboard.do" aria-expanded="false"> <span class="aside-icon p-2 bg-light-success rounded-3"> <i class="ti ti-cards fs-7 text-success"></i>
							</span> <span class="hide-menu ms-2 ps-1">내가 작성한 글</span>
						</a></li>
						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link primary-hover-bg" href="mycomment.do" aria-expanded="false"> <span class="aside-icon p-2 bg-light-primary rounded-3"> <i class="ti ti-file-description fs-7 text-primary"></i>
							</span> <span class="hide-menu ms-2 ps-1">내가 작성한 댓글</span>
						</a></li>
					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</div>

	</aside>
</body>
</html>