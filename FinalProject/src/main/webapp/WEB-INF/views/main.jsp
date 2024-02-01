<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/member/login.css" rel="stylesheet">
<link href="/resources/css/member/default.css" rel="stylesheet">
<link href="/resources/css/common/styles.min.css" rel="stylesheet">

</head>
<body>

	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<div
			class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
			<!-- align-items : center -->
			<div class="d-flex align-items-center justify-content-center w-100">
				<!-- justify-content : center -->
				<div class="row justify-content-center w-100">
					<!-- width 설정 (min-width 1200설정)-->
					<div class="col-md-8 col-lg-6 col-xxl-3 minWidth1200">
						<!-- margin-bottom 0 설정 ((height 600 설정)) -->
						<div class="card mb-0 height600">
							<c:choose>
								<c:when test="${!empty no}">
									<div class="logoutDiv">
										<a class="logoutAtag" href="logout.do">로그아웃</a>							
									</div>
								</c:when>
								<c:otherwise>
									<div class="logoutDiv">
	
									</div>
								</c:otherwise>
							</c:choose>
							<div class="direction1 alignCenter">
								<p class="mainTitleFont noMargin topMargin20">COCO</p>
								<p class="subTitleFont">Collaboration Code</p>
									<c:choose>
										<c:when test="${empty sessionScope.id}">
											<a href="loginForm.do">Login하러 가기</a>										
										</c:when>
										<c:otherwise>
											<span>${name}님 환영합니다.</span>
										</c:otherwise>
									</c:choose>
							</div>
							<div class="card-body alignCenter justifyCenter noPadding">
								<div>
									<button class="totalBtn Margin20 borderRadiusd backBlue2">
										협업 홈페이지 <br> <small class="small15">협업으로 바로가기~</small>
									</button>
									<button class="totalBtn Margin20 borderRadiusd backRed2">
										게시판 홈페이지 <br> <small class="small15">게시판으로 바로가기~</small>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>