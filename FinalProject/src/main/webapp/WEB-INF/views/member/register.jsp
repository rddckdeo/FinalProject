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
<link href="" rel="stylesheet">

</head>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<div
			class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
			<div class="d-flex align-items-center justify-content-center w-100">
				<div class="row justify-content-center w-100">
					<!-- card 시작 영역 -->
					<div class="col-md-8 col-lg-6 col-xxl-3 divSize marginTop">
						<div class="card mb-0">
							<div class="card-body">
								<p class="text-center1">회원가입</p>
								<form action="/member/register.do" method="post">
									<!-- 아이디 -->
									<div class="mb-3">
										<label for="exampleInputtext1" class="form-label">아이디</label>
										<input type="text" class="form-control" id="exampleInputtext1"
											aria-describedby="textHelp" name="id">
									</div>
									<!-- 실명 -->
									<div class="mb-3">
										<label for="InputName" class="form-label">이름</label> <input
											type="text" class="form-control" id="InputName"
											aria-describedby="textHelp" name="name">
									</div>
									<div class="mb-3">
										<label for="InputNiclname" class="form-label">닉네임</label> <input
											type="text" class="form-control" id="InputNiclname"
											aria-describedby="textHelp" name="nickname">
									</div>
									<!-- Email -->
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Email</label>
										<input type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											name="email">
									</div>
									<!-- 비밀번호 -->
									<div class="mb-4">
										<label for="exampleInputPassword1" class="form-label">비밀번호</label>
										<input type="password" class="form-control"
											id="exampleInputPassword1" name="pwd">
									</div>
									<!-- 비밀번호 재확인 -->
									<div class="mb-4">
										<label for="PasswordCheck" class="form-label">비밀번호 재확인</label>
										<input type="password" class="form-control" id="PasswordCheck"
											name="pwdAgain">
									</div>
									<!--휴대폰 인증 -->
									<div class="mb-4">
										<label for="number" class="form-label">휴대폰</label> <input
											type="text" class="form-control" id="number" name="number">
									</div>
									<!-- 기술스택 선택 -->
									<p class="form-label">희망 직무</p>
									<div class="hopeStack">
										<div class="RegisterSort3">
											<button class="btn btn-outline-secondary m-1 StackButton">프론트
												엔드</button>
											<button class="btn btn-outline-secondary m-1 StackButton">백엔드</button>
											<button class="btn btn-outline-secondary m-1 StackButton">데브옵스</button>
											<button class="btn btn-outline-secondary m-1 StackButton">DBA</button>
										</div>
										<div class="RegisterSort3">
											<button class="btn btn-outline-secondary m-1 StackButton">퍼블리싱</button>
											<button class="btn btn-outline-secondary m-1 StackButton">IOS</button>
											<button class="btn btn-outline-secondary m-1 StackButton">Android</button>
											<button class="btn btn-outline-secondary m-1 StackButton">웹디자인</button>
										</div>
									</div>
									<p class="form-label width100">기술 스택</p>
									<div class="hopeStack2 alignCenter">
										<div class="direction2">
											<p>예제1</p>
											<p>예제1</p>
											<p>예제1</p>
										</div>
										<div
											class="width100 direction2 borderDefault borderRadiusd2 alignCenter justifyCenter">
											<input type="text" class="width70 inputHeight borderNone">
											<img src="/resources/uploads/member/icon/search.svg"
												class="Margin10"></img> <img
												src="/resources/uploads/member/icon/arrow-down.svg"
												class="Margin10"></img>
										</div>
									</div>
									<!-- 약관 동의 -->
									<div class="alignCenter height100 paddingDefault">
										<input type="checkbox" class="RegisterCheckBox">
										<p class="noMargin leftMargin20 font20px">약관 동의</p>
									</div>
									<!-- 회원가입 버튼 -->
									<button type="submit"
										class="btn btn-primary w-100 fs-4 mb-4 rounded-2">회원가입</button>
									<div class="d-flex align-items-center justify-content-center">
										<p class="fs-4 mb-0 fw-bold">이미 회원이신가요?</p>
										<a class="text-primary fw-bold ms-2" href="loginForm.do">로그인</a>
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