<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>profile</title>
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>
<link rel="stylesheet"
	href="../../../../resources/css/board/common/template.css" />
</head>

<body>
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- 페이지 완쪽 사이드바 영역-->
		<%@ include file="/WEB-INF/views/myPage/common/sidebar.jsp"%>
		<!-- 페이지 오른쪽 컨텐츠 영역 -->
		<div class="body-wrapper">
			<!-- 헤더 영역 -->
			<jsp:include page="./../board/common/header.jsp" />
			<div class="cardSize">
				<div class="row">
					<div class="main-section">
						<div class="container-fluid">
							<div class="container-fluid">
								<!-- Card 안쪽 -->
								<div class="card">
									<h1 class="card-project-name">Profile</h1>
									<!-- card body -->
									<div class="card-body height500 direction1"
										style="padding-top: 0;">
										<!-- 프로필 이미지, 이름, 희망 직무 등 -->
										<div
											class="justifyCenter width100 height200 direction2 padding30 ">
											<img src="${sessionScope.path}${sessionScope.picture}"
												alt="Profile picture" class="profileImg">
											<div class="width100 height200 direction2 padding30">
												<div class="profileP justifyCenter direction1">
													<p class="bottomMargin20">이름 :</p>
													<p class="bottomMargin20">희망 직무 :</p>
													<p class="bottomMargin20">기술 스택 :</p>
												</div>
												<div class="profileP justifyCenter direction1">
													<p class="bottomMargin20 leftMargin20">${sessionScope.name}</p>
													<c:choose>
														<c:when test="${!empty hope}">
															<p class="bottomMargin20 leftMargin20">${hope}</p>
														</c:when>
														<c:otherwise>
															<p class="bottomMargin20 leftMargin20">희망 직무가 비어있습니다.</p>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${!empty stack}">
															<p class="bottomMargin20 leftMargin20">${stack}</p>
														</c:when>
														<c:otherwise>
															<p class="bottomMargin20 leftMargin20">기술 스택이 비어있습니다.</p>
														</c:otherwise>
													</c:choose>


												</div>
											</div>
										</div>
										<!-- 소개 -->
										<div
											class="width100 padding30 height200 boxShadow borderDefault bottomMargin20">
											<h1>소개글</h1>
											<c:choose>
														<c:when test="${!empty intro}">
															<p class="small15">${intro}</p>
														</c:when>
														<c:otherwise>
															<p class="small15">소개글이 없습니다.</p>
														</c:otherwise>
													</c:choose>
											
										</div>
										<!-- 참여한 프로젝트 -->
										<div
											class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
											<h1 class="bottomMargin20">참여한 프로젝트</h1>
											<div class="direction2 scrollbar">
												<!-- 개별 Card -->
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top"
														alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top"
														alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top"
														alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top"
														alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
											</div>
										</div>
										<!-- 진행중인 프로젝트 -->
										<div
											class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
											<h1 class="bottomMargin20">진행중인 프로젝트</h1>
											<div class="direction2 scrollbar">
												<!-- 개별 Card -->
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top"
														alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top"
														alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top"
														alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top"
														alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
											</div>
										</div>
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
		var error = "${error}";
		if (error === "true") {
			alert("회원 정보가 없습니다.");
		}
	}
</script>
