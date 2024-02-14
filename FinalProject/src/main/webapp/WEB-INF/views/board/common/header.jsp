<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<header>
	<div class="row">
		<div class="main-section-header">
			<div class="header-icon">
				<nav class="navbar navbar-expand-lg">
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="#" id="header-bell"
								data-bs-toggle="dropdown" aria-expanded="false"> <img
									src="../../../../resources/uploads/icon/bell.png" alt=""
									width="35" height="35" class="rounded-circle"> <span
									class="notification-counter">3</span> <!-- 알림 카운트를 표시 -->
							</a>
								<div
									class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
									aria-labelledby="header-bell">
									<div class="message-body">
										<c:choose>
											<c:when test="${sessionScope.no != null}">
												<!-- 로그인한 사용자용 알림 -->
												<a href="javascript:void(0)"
													class="d-flex align-items-center gap-2 dropdown-item">
													<i class="ti ti-user fs-6"></i>
													<p class="mb-0 fs-3">알림 1</p>
												</a>
												<a href="javascript:void(0)"
													class="d-flex align-items-center gap-2 dropdown-item">
													<i class="ti ti-mail fs-6"></i>
													<p class="mb-0 fs-3">알림 2</p>
												</a>
												<a href="javascript:void(0)"
													class="d-flex align-items-center gap-2 dropdown-item">
													<i class="ti ti-list-check fs-6"></i>
													<p class="mb-0 fs-3">알림 3</p>
												</a>
												<!-- 여기에 알림 목록을 추가 -->
											</c:when>
											<c:otherwise>
												<!-- 비로그인 사용자용 알림 -->
												<a href="/member/loginForm.do">로그인 후 알림을 확인할 수 있습니다.</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div></li>








							<a href="#" target="_blank" id="header-chat"><img
								src="../../../../resources/uploads/icon/message.png" alt=""
								width="31" height="31"></a>
							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="#" id="drop2"
								data-bs-toggle="dropdown" aria-expanded="false"> <img src=""
									alt="" width="35" height="35" class="rounded-circle">
							</a>
								<div
									class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
									aria-labelledby="drop2">
									<div class="message-body">
										<c:choose>
											<c:when test="${sessionScope.no != null}">
												<!-- 로그인한 사용자용 헤더 -->
												<a href="javascript:void(0)"
													class="d-flex align-items-center gap-2 dropdown-item">
													<i class="ti ti-user fs-6"></i>
													<p class="mb-0 fs-3">내 프로필</p>
												</a>
												<a href="javascript:void(0)"
													class="d-flex align-items-center gap-2 dropdown-item">
													<i class="ti ti-mail fs-6"></i>
													<p class="mb-0 fs-3">마이페이지</p>
												</a>
												<a href="javascript:void(0)"
													class="d-flex align-items-center gap-2 dropdown-item">
													<i class="ti ti-list-check fs-6"></i>
													<p class="mb-0 fs-3">내 프로젝트</p>
												</a>
												<a href="/member/logout.do"
													class="btn btn-outline-primary mx-3 mt-2 d-block shadow-none">Logout</a>
											</c:when>
											<c:otherwise>
												<!-- 비로그인 사용자용 헤더 -->
												<a href="/member/loginForm.do">로그인 후 이용가능합니다.</a>
											</c:otherwise>
										</c:choose>

									</div>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
