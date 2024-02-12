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
					<!-- width 설정 (min-width 500설정)-->
					<div class="col-md-8 col-lg-6 col-xxl-3 minWidth500">
						<!-- margin-bottom 0 설정 -->
						<div class="card mb-0">

							<div class="card-body">
								<form action="/member/login.do" method="post" >
									<div class="alignCenter direction1">
										<h1 class="defaultColor">CoCo</h1>
										<h3 class="defaultColor small15">Collaboration Code</h3>
									</div>
									<!-- id칸 -->
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">ID</label>
										<input type="text" class="form-control"
											id="exampleInputEmail1" name="id" aria-describedby="emailHelp">
									</div>
									<!-- password 칸 -->
									<div class="mb-4">
										<label for="exampleInputPassword1" class="form-label">Password</label>
										<input type="password" class="form-control"
											id="exampleInputPassword1" name="pwd">
									</div>

									<div
										class="d-flex align-items-center justify-content-between mb-4">
										<div class="form-check"></div>
										<a class="text-primary fw-bold" href="#">비밀번호를 잊었나요?</a>
									</div>
									<button type="submit" class="btn btn-primary w-100 fs-4 mb-4 rounded-2">로그인</button>
									<div class="d-flex align-items-center justify-content-center">
										<p class="fs-4 mb-0 fw-bold">아직 회원이 아니신가요?</p>
										<a class="text-primary fw-bold ms-2" href="registerForm.do">회원가입</a>
									</div>
									<div class="justifyCenter">
										<p>로봇이 아닙니다.(API 삽입 예정)</p>
									</div>
									<div class="sortDiv">
										<p class="snsLogin borderDefault borderRadiusd paddingDefault">SNS
											로그인</p>
										<div class="sortDiv2">
											<img src="/resources/uploads/member/icon/kakaotalk.png" alt="" class="imageSize">
											<img src="/resources/uploads/member/icon/google.png" alt="" class="imageSize">
											<img src="/resources/uploads/member/icon/naver.png" alt="" class="imageSize">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>