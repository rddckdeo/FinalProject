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
margin-top:40px;
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
	<!-- 페이지 완쪽 사이드바 영역-->
	<aside class="left-sidebar">
		<!-- 사이드바 스크롤-->
		<div class="scroll-sidebar" data-simplebar>
			<!-- 로고 -->
			<div class="d-flex mb-4 align-items-center justify-content-between">
				<a href="/member/mainForm.do" class="text-nowrap logo-img ms-0 ms-md-1"> <img
					src="../../../../resources/uploads/icon/cocoLogo.png" width="180"
					alt="">
				</a>
				<div
					class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
					id="sidebarCollapse">
					<i class="ti ti-x fs-8"></i>
				</div>
				<!-- 사이드바 네비게이션-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="mb-4 pb-2">
						<li><a href="/member/mainForm.do"></a></li>
						<!-- 사이드바 협업툴 바로가기-->
						<li class="sidebar-item"><a href="/colabo"
							id="cooperation-btn" class="btn btn-primary"
							style="margin: 15px 0px 0px 20px;" onclick="return checkLogin()">협업툴
								바로가기</a><a href="/board/" id="cooperation-btn"
							class="btn btn-primary href-div"
							style="margin: 20px 0px 0px 20px;">게시판 바로가기</a></li>
						<!-- 사이드바 정보게시판 -->
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-5"></i> <span
							class="hide-menu">정보게시판</span></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link warning-hover-bg"
							href="/info/category?name=programming&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-warning rounded-3"> <i
									class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">프로그래밍 언어</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link danger-hover-bg"
							href="/info/category?name=framework&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-danger rounded-3"> <i
									class="ti ti-alert-circle fs-7 text-danger"></i>
							</span> <span class="hide-menu ms-2 ps-1">프레임워크 및 라이브러리</span>
						</a></li>

						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link success-hover-bg"
							href="/info/category?name=database&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-success rounded-3"> <i
									class="ti ti-cards fs-7 text-success"></i>
							</span> <span class="hide-menu ms-2 ps-1">데이터베이스</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link primary-hover-bg"
							href="/info/category?name=webDev&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-primary rounded-3"> <i
									class="ti ti-file-description fs-7 text-primary"></i>
							</span> <span class="hide-menu ms-2 ps-1">웹 개발</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=mobileDev&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">모바일 개발</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=machineLearning&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">기계 학습 / 인공지능</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=cloud&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">클라우드 & 서버</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=devTools&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">개발 도구</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=portfolio&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">프로젝트 & 포트폴리오</span>
						</a></li>

						<!-- 사이트바 자유게시판 -->
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-5"></i> <span
							class="hide-menu">자유게시판</span></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link warning-hover-bg"
							href="/free/category?name=daily&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-warning rounded-3"> <i
									class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">일상 이야기</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link danger-hover-bg"
							href="/free/category?name=informationy&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-danger rounded-3"> <i
									class="ti ti-alert-circle fs-7 text-danger"></i>
							</span> <span class="hide-menu ms-2 ps-1">정보 공유</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link success-hover-bg"
							href="/free/category?name=hobby&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-success rounded-3"> <i
									class="ti ti-cards fs-7 text-success"></i>
							</span> <span class="hide-menu ms-2 ps-1">취미 공유</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link primary-hover-bg"
							href="/free/category?name=review&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-primary rounded-3"> <i
									class="ti ti-file-description fs-7 text-primary"></i>
							</span> <span class="hide-menu ms-2 ps-1">추천 & 리뷰</span>
						</a></li>
					</ul>
					<li class="footer_li"><a>개인정보처리방침</a>
						<p>|</p>
						<a>이용약관</a>
				</nav>
			</div>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
	</aside>
</body>
</html>
<script>
	function checkLogin() {
		// 세션에 no가 없을때(비로그인)
<%if (session.getAttribute("no") == null) {%>
	alert('로그인 후 이용해주세요.');
		location.href = '/member/loginForm.do'; // 로그인 페이지로 리다이렉트
		return false;
<%} else {%>
	return true;
<%}%>
	}
</script>