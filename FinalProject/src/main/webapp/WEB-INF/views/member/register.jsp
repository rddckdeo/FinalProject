<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link href="/resources/css/member/login.css" rel="stylesheet">
<link href="/resources/css/member/default.css" rel="stylesheet">
<link href="/resources/css/common/styles.min.css" rel="stylesheet">
<script src="/resources/js/member/register.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
					<!-- modal -->
					<div class="registerModal" id="registerModal">
						<div class="registerModal2 scrollBar">
							<p>회원가입 약관</p>
							<div class="leftMargin20">
								<p>1. 약관의 목적 본 약관은 회원(이하 "회원" 또는 "이용자"라 함)이 [coco]에서 제공하는
									서비스(이하 "서비스")를 이용함에 있어 필요한 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.</p>
								<p>2. 회원가입 및 이용계약의 성립 본 서비스를 이용하고자 하는 자(이하 "가입 신청자")는 회원가입
									양식에서 요구하는 필수 정보를 기입한 후 가입을 신청하여야 합니다. 가입 신청자는 반드시 본 약관을 읽고
									동의하여야 하며, 본 약관에 동의한 경우에만 회원으로 등록됩니다. 가입 신청자의 회원가입 신청에 대하여는 회사의
									확인 후 이용계약이 성립됩니다.</p>
								<p>3. 개인정보 보호 회사는 회원의 개인정보를 [개인정보 처리 방침]에 따라 보호합니다. 회원은
									개인정보를 최신 및 정확한 상태로 유지해야 하며, 회사는 회원이 제공한 정보의 정확성을 확인할 권리가 있습니다.
								</p>
								<p>4. 서비스 이용 회원은 본 서비스를 이용함에 있어 관련 법령, 본 약관 및 회사의 안내에 따라야
									합니다. 회원은 본 서비스를 부정한 목적이나 방법으로 이용해서는 안됩니다.</p>
								<p>5. 서비스의 제한 및 중단 회사는 다음 각 호의 어느 하나에 해당하는 경우 서비스의 전부 또는 일부를
									제한하거나 중단할 수 있습니다. 회원이 본 약관을 위반한 경우 기술상 또는 업무상의 이유로 서비스 제공이 어렵다고
									판단되는 경우 기타 합리적인 사유가 있는 경우</p>
								<p>6. 책임의 한계와 면책 회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지 등 불가항력적인 사유로
									인한 서비스 제공 중단에 대해 책임을 지지 않습니다. 회원은 자신의 부주의나 회원 본인에 의한 정보 누락 등으로
									인한 손해에 대해 책임을 집니다.</p>
								<p>7. 약관의 변경 회사는 약관을 변경할 권리를 갖습니다. 약관이 변경되는 경우 변경 사항을 공지사항으로
									게시하며, 변경된 약관은 게시한 날로부터 효력이 발생합니다.</p>
								<p>8. 기타 본 약관에 명시되지 않은 사항은 관련 법령 및 회사의 개별 정책에 따릅니다. 본 약관은
									대한민국 법률에 따라 규정되며, 회원과 회사 간에 발생한 분쟁에 대해 소송이 제기될 경우 대한민국 법원을
									관할법원으로 합니다.</p>

								<div class="width100 direction2 justifyEnd">
									동의 <input type="checkbox" class="Margin10" id="agreeCheck">
								</div>

								<div class="width100 direction2 justifyCenter">
									<button class="Margin10 defaultBtn"
										onclick="registerModalOff()">확인</button>
								</div>
							</div>


						</div>
					</div>
					<div class="col-md-8 col-lg-6 col-xxl-3 divSize marginTop">
						<div class="card mb-0">
							<div class="card-body">
								<p class="text-center1">회원가입</p>
								<form action="/member/register.do" method="post" onsubmit="return false" id="formTag">
									<!-- 아이디 -->
									<div class="mb-3">
										<div class="direction1">
											<label for="exampleInputtext1" class="form-label">아이디</label>
											<div class="direction2">
												<input type="text" class="form-control width90"
													id="exampleInputtext1" aria-describedby="textHelp"
													name="id" placeholder="아이디를 입력해주세요" required>
												<button class="font12px checkBtn" onclick="idCheck()">중복체크</button>
											</div>
											<p class="checkText idCheckFont1" id="checkFont1">사용 가능한
												아이디입니다.</p>
											<p class="checkText idCheckFont2" id="checkFont2">이미 아이디가
												있습니다.</p>
										</div>
									</div>
									<!-- 실명 -->
									<div class="mb-3">
										<label for="InputName" class="form-label">이름</label> <input
											type="text" class="form-control" id="InputName"
											aria-describedby="textHelp" name="name"
											placeholder="이름을 입력해주세요" required>
									</div>
									<!-- 닉네임 -->
									<div class="mb-3">
										<div class="direction1">
											<label for="exampleInputtext1" class="form-label">닉네임</label>
											<div class="direction2">
												<input type="text" class="form-control width90"
													id="nicknameInput" aria-describedby="textHelp"
													name="nickname" placeholder="별명을 입력해주세요" required>
												<button class="font12px checkBtn" onclick="nicknameCheck()">중복체크</button>
											</div>
											<p class="checkText idCheckFont1" id="nicknameFont1">사용
												가능한 별명입니다.</p>
											<p class="checkText idCheckFont2" id="nicknameFont2">이미
												별명이 있습니다.</p>
										</div>
									</div>
									<!-- Email -->
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Email</label>
										<input type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											name="email" placeholder="이메일을 입력해주세요" required>
									</div>
									<!-- 비밀번호 -->
									<div class="mb-4">
										<label for="password" class="form-label">비밀번호</label>
										<input type="password" class="form-control" id="pwd"
											name="pwd" placeholder="비밀번호를 입력해주세요" required>
									</div>
									<!-- 비밀번호 재확인 -->
									<div class="mb-3">
										<div class="direction1">
											<label for="pwdAgain" class="form-label">비밀번호 재확인</label>
											<div class="direction2">
												<input type="password" class="form-control" id="pwdAgain"
													name="pwdAgain" placeholder="비밀번호를 입력해주세요" required
													oninput="pwdCheck()">
											</div>
											<p class="checkText idCheckFont1" id="pwdCheck">비밀번호가
												일치합니다.</p>
											<p class="checkText idCheckFont2" id="pwdCheck2">비밀번호가
												일치하지 않습니다.</p>
										</div>
									</div>
									<!--휴대폰 인증 -->
									<div class="mb-4">
										<label for="number" class="form-label">휴대폰</label> 
										<div class="direction2">
											<input type="text" class="form-control phoneInput" id="number1" name="number1" required>
											<b class="alignCenter rightMargin20">-</b>
											<input type="text" class="form-control phoneInput" id="number2" name="number2" required>
											<b class="alignCenter rightMargin20">-</b>
											<input type="text" class="form-control phoneInput" id="number3" name="number3" required onkeyup="submitData()">
											<input type="hidden" name="number" id="TotalNum">
										</div>
									</div>
									<!-- 희망 직무 -->
									<p class="form-label width100">희망 직무</p>
									<div class="hopeStack2 alignCenter scrollBar">
										<div class="width100 direction2 borderDefault borderRadiusd2 alignCenter justifyAround ">
											<input type="text" class="width70 inputHeight borderNone" id="hopeInput" onkeyup="hopeEnter(event)">
											<input type="hidden" id="hopeStackValue" name="hope">
											<img src="/resources/uploads/member/icon/Enter.svg"
												class="Margin10 cursorPointer" onclick="hopeAdd()"></img> 
											<input type="hidden" id="hopeHidden" value="0">
											<input type="hidden" id="hopeBtnHidden" value="0">
										</div>
										<div class="direction2 alignCenter" id="create_box2">
										
										</div>
									</div>
									<!-- 기술 스택 -->
									<p class="form-label width100">기술 스택</p>
									<div class="hopeStack2 alignCenter scrollBar">
										<div class="width100 direction2 borderDefault borderRadiusd2 alignCenter justifyAround ">
											<input type="text" class="width70 inputHeight borderNone" id="stackInput" onkeyup="stackEnter(event)">
											<input type="hidden" id="hiddenStackValue" name="stack">
											<img src="/resources/uploads/member/icon/Enter.svg"
												class="Margin10 cursorPointer" onclick="StackAdd()"></img> 
											<input type="hidden" id="stackHidden" value="0">
											<input type="hidden" id="stackBtnHidden" value="0">
										</div>
										<div class="direction2 alignCenter" id="create_box">
											
										</div>
									</div>
									<!-- 약관 동의 -->
									<div class="alignCenter height60 paddingDefault bottomMargin10">
										<button class="displayNone" onclick="registerModalOn()"
											id="registerBox"></button>
										<label
											class="noMargin leftMargin20 font20px cursorPointer alignCenter noMargin"
											for="registerBox"> <input type="checkbox"
											class="RegisterCheckBox pointerNone" id="agreeCheck2">
											<b class="leftMargin10 font16px">약관 동의</b>
										</label>
									</div>
									<!-- 회원가입 버튼 -->
									<button type="submit" id="registerFormBtn"
										class="btn btn-primary w-100 fs-4 mb-4 rounded-2" disabled>회원가입</button>
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