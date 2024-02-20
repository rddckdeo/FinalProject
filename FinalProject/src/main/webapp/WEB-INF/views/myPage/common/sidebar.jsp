<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.footer_li {
    display: flex;
    justify-content: center; /* 가운데 정렬 */
    width: 100%; /* 전체 넓이를 채우도록 설정 */
    text-align: center; /* 가운데 정렬 */
}
.footer_li > p{
	margin-left:5px;
	margin-right:5px;
}

</style>
<body>
	<aside class="left-sidebar">
		<!-- 사이드바 스크롤-->
		<div class="scroll-sidebar alignCenter" data-simplebar>
			<!-- 로고 -->
			<div class="d-flex mb-4 align-items-center justify-content-between">
<!-- 				<a href="/member/mainForm.do" class="text-nowrap logo-img ms-0 ms-md-1"> <img
					src="../../../resources/uploads/icon/cocoLogo.png" width="180" alt="logo">
				</a> -->
				<div
					class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
					id="sidebarCollapse">
					<i class="ti ti-x fs-8"></i>
				</div>
				<!-- 사이드바 네비게이션-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="mb-4 pb-2">
						<li><a href=""></a></li>
						<!-- 사이드바 협업툴 바로가기-->
						<li class="sidebar-item"><span
							class="aside-icon p-2 bg-light-primary rounded-3"> <a
								href="" id="cooperation-btn" class="btn btn-primary">협업툴
									바로가기</a>
						 <a
								href="/board/" id="cooperation-btn" class="btn btn-primary">게시판
									바로가기</a>
						</span></li>
						<!-- 사이트바 정보게시판 -->
						<li class=" sidebarMain"><i class=""><span
								class="sidebarFont">Home</span></i></li>
						<li class="sidebar-item bottomMargin30"><a
							class="alignEnd sidebar-link sidebar-link warning-hover-bg"
							href="mainForm.do" aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-warning rounded-3"> <i
									class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">메인 페이지</span>
						</a></li>
						<li class=" sidebarMain"><i class=""><span
								class="sidebarFont">My Page</span></i></li>
						<li class="sidebar-item bottomMargin10"><a
							class="alignEnd sidebar-link sidebar-link warning-hover-bg"
							href="mypage.do" aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-warning rounded-3"> <i
									class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">프로필</span>
						</a></li>
						<li class="sidebar-item bottomMargin10"><a
							class="alignEnd sidebar-link sidebar-link warning-hover-bg"
							href="myinfo.do" aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-warning rounded-3"> <i
									class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">내 정보 수정</span>
						</a></li>

						<li class="sidebar-item bottomMargin10"><a
							class="alignEnd sidebar-link sidebar-link danger-hover-bg"
							href="myproject.do" aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-danger rounded-3"> <i
									class="ti ti-alert-circle fs-7 text-danger"></i>

						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link danger-hover-bg" href="/colabo/myProjectProfile" aria-expanded="false"> <span class="aside-icon p-2 bg-light-danger rounded-3"> <i class="ti ti-alert-circle fs-7 text-danger"></i>

							</span> <span class="hide-menu ms-2 ps-1">내 프로젝트</span>
						</a></li>

						<li class="sidebar-item bottomMargin10"><a
							class="alignEnd sidebar-link sidebar-link success-hover-bg"
							href="myboard.do" aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-success rounded-3"> <i
									class="ti ti-cards fs-7 text-success"></i>

						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link danger-hover-bg" href="/colabo/inviteApplyProject" aria-expanded="false"> <span class="aside-icon p-2 bg-light-danger rounded-3"> <i class="ti ti-alert-circle fs-7 text-danger"></i>
							</span> <span class="hide-menu ms-2 ps-1">초대/신청 중인 프로젝트</span>
						</a></li>
						<li class="sidebar-item bottomMargin10"><a class="alignEnd sidebar-link sidebar-link success-hover-bg" href="myboard.do" aria-expanded="false"> <span class="aside-icon p-2 bg-light-success rounded-3"> <i class="ti ti-cards fs-7 text-success"></i>

							</span> <span class="hide-menu ms-2 ps-1">내가 작성한 글</span>
						</a></li>
						<li class="sidebar-item bottomMargin10"><a
							class="alignEnd sidebar-link sidebar-link primary-hover-bg"
							href="mycomment.do" aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-primary rounded-3"> <i
									class="ti ti-file-description fs-7 text-primary"></i>
							</span> <span class="hide-menu ms-2 ps-1">내가 작성한 댓글</span>
						</a>
						</li>
					</ul>
					<li class="footer_li">
						<a>개인정보처리방침</a> <p> | </p><a>이용약관</a><p> | </p><a href="/mypage/inquiry.do">문의사항</a>
					</li>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</div>

	</aside>
</body>
</html>