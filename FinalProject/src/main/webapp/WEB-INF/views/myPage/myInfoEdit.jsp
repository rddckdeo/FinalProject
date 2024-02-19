<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>
</head>
<body>
	<!-- 전체 구조 -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- 페이지 완쪽 사이드바 영역-->
		<%@ include file="/WEB-INF/views/myPage/common/sidebar.jsp"%>
		<!-- 페이지 오른쪽 컨텐츠 영역 -->
		<div class="body-wrapper">
			<!-- 헤더 영역 -->
			<%@ include file="/WEB-INF/views/myPage/common/header.jsp"%>
			<div class="cardSize">
				<div class="row">
					<div class="main-section">
						<div class="container-fluid">
							<div class="container-fluid">
								<!-- Card 안쪽 -->
								<div class="card">
									<h1 class="card-project-name bottomMargin20">내 정보 수정하기</h1>
									<!-- card body -->
									<div class="card-body height500 direction1"
										style="padding-top: 0;">
										<!-- Form -->
										<!-- 										<form action="/mypage/editProfile" method="post"
											enctype="multipart/form-data"> -->
										<form>
											<!-- Profile picture -->
											<div>
												<img src="${sessionScope.path}${sessionScope.picture}"
													alt="Profile picture" class="profileImg"> <input
													type="file" name="imageFile" />
											</div>
											<!-- 소개글 -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="intro" class="leftMargin20">소개글 :</label> <input
													type="text" id="intro" name="intro" value="${intro}"
													placeholder="소개글이 없습니다. 소개글을 입력해주세요.">
											</div>
											<!-- ID -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="id" class="leftMargin20">ID :</label> <input
													type="text" id="id" name="id" value="${id}" readonly>
											</div>
											<!-- 이름 -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="name" class="leftMargin20">이름 :</label> <input
													type="text" id="name" name="name" value="${name}" readonly>
											</div>
											<!-- 닉네임 -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="nickname" class="leftMargin20">닉네임 :</label> <input
													type="text" id="nickname" name="nickname"
													value="${nickname}">
											</div>
											<!-- E-mail -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="email" class="leftMargin20">E-mail :</label> <input
													type="email" id="email" name="email" value="${email}">
											</div>
											<!-- 휴대폰 번호 -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="number" class="leftMargin20">휴대폰 번호 :</label> <input
													type="tel" id="number" name="number" value="${number}">
											</div>

											<h1 class="font20px bottomMargin20">희망직무 및 기술스택</h1>
											<div class="myInfo bottomMargin20 padding30">
												<div class="hopeItems">
													<c:forEach var="hopeItem" items="${hopeList}">
														<div class="direction2">
															<p class="infoStack defaultMargin">${hopeItem}
																<button class="deleteButton" data-item="${hopeItem}">X</button>
															</p>
														</div>
													</c:forEach>
												</div>
												<input type="text" id="newHopeItem">
												<button type="button" id="addHopeItemButton">등록</button>

												<div class="stackItems">
													<c:forEach var="stackItem" items="${stackList}">
														<div class="direction2">
															<p class="infoStack defaultMargin">${stackItem}
																<button class="deleteButton" data-item="${stackItem}">X</button>
															</p>
														</div>
													</c:forEach>
												</div>
												<input type="text" id="newStackItem">
												<button type="button" id="addStackItemButton">등록</button>
											</div>


											<!-- 저장 버튼 -->
											<button type="submit" class="btn btn-primary">저장</button>
											<button onclick="history.back()" class="btn btn-primary">취소</button>
										</form>
									</div>
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
<script>
	window.onload = function() {
		Array.from(document.getElementsByClassName("deleteButton")).forEach(
				function(deleteButton) {
					deleteButton.addEventListener("click", function() {
						var itemValue = deleteButton.getAttribute('data-item');
						Array.from(profileForm.elements).forEach(
								function(element) {
									if (element.name === 'hope[]'
											&& element.value === itemValue) {
										element.remove();
									}
								});
						deleteButton.parentElement.parentElement.remove();
					});
				});

		const profileForm = document.querySelector("form");

		profileForm.querySelector('input[type="file"]').addEventListener(
				"change",
				function() {
					profileForm.querySelector('.profileImg').src = URL
							.createObjectURL(this.files[0]);
				});

		document
				.getElementById("addHopeItemButton")
				.addEventListener(
						"click",
						function(event) {
							event.preventDefault();
							var newHopeItem = document
									.getElementById("newHopeItem").value;
							if (newHopeItem) {
								var direction2Div = document
										.createElement("div");
								var pTag = document.createElement("p");
								var deleteButton = document
										.createElement("button");

								direction2Div.classList.add("direction2");

								pTag.textContent = newHopeItem;
								pTag.classList
										.add("infoStack", "defaultMargin");

								deleteButton.textContent = "X";
								deleteButton.classList.add("deleteButton");
								deleteButton.setAttribute('data-item',
										newHopeItem);
								deleteButton
										.addEventListener(
												"click",
												function() {
													var itemValue = deleteButton
															.getAttribute('data-item');
													Array
															.from(
																	profileForm.elements)
															.forEach(
																	function(
																			element) {
																		if (element.name === 'hope[]'
																				&& element.value === itemValue) {
																			element
																					.remove();
																		}
																	});
													direction2Div.remove();
												});

								pTag.appendChild(deleteButton);
								direction2Div.appendChild(pTag);

								document.getElementsByClassName("hopeItems")[0]
										.appendChild(direction2Div);

								var hiddenInput = document
										.createElement("input");
								hiddenInput.type = "hidden";
								hiddenInput.name = "hope[]";
								hiddenInput.value = newHopeItem;
								profileForm.appendChild(hiddenInput);

								document.getElementById("newHopeItem").value = "";
							}
						});

		document
				.getElementById("addStackItemButton")
				.addEventListener(
						"click",
						function(event) {
							event.preventDefault();
							var newStackItem = document
									.getElementById("newStackItem").value;
							if (newStackItem) {
								var direction2Div = document
										.createElement("div");
								var pTag = document.createElement("p");
								var deleteButton = document
										.createElement("button");

								direction2Div.classList.add("direction2");

								pTag.textContent = newStackItem;
								pTag.classList
										.add("infoStack", "defaultMargin");

								deleteButton.textContent = "X";
								deleteButton.classList.add("deleteButton");
								deleteButton.setAttribute('data-item',
										newStackItem);
								deleteButton
										.addEventListener(
												"click",
												function() {
													var itemValue = deleteButton
															.getAttribute('data-item');
													Array
															.from(
																	profileForm.elements)
															.forEach(
																	function(
																			element) {
																		if (element.name === 'stack[]'
																				&& element.value === itemValue) {
																			element
																					.remove();
																		}
																	});
													direction2Div.remove();
												});

								pTag.appendChild(deleteButton);
								direction2Div.appendChild(pTag);

								document.getElementsByClassName("stackItems")[0]
										.appendChild(direction2Div);

								var hiddenInput = document
										.createElement("input");
								hiddenInput.type = "hidden";
								hiddenInput.name = "stack[]";
								hiddenInput.value = newStackItem;
								profileForm.appendChild(hiddenInput);

								document.getElementById("newStackItem").value = "";
							}
						});

		profileForm.addEventListener("submit", function(event) {
			event.preventDefault();

			if (confirm('수정하시겠습니까?')) {
				var formData = new FormData(profileForm);
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '/mypage/editProfile', true);

				xhr.onload = function() {
					if (xhr.status === 200) {
						alert('수정되었습니다.');
						window.location.href = '/mypage/mypage.do';
					} else {
						alert('수정에 실패하였습니다. 다시 시도해주세요.');
					}
				};

				xhr.send(formData);
			}
		});
	}
</script>