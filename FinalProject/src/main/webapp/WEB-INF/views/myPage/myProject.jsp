<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>profile</title>
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>
</head>

<body>
	<!-- 전체 구조 -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
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
									<h1 class="card-project-name bottomMargin20">My Project</h1>
									<!-- card body -->
									<div class="card-body height500 direction1" style="padding-top: 0;">

										<!-- 참여한 프로젝트 -->
										<div class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
											<h1 class="bottomMargin20">참여한 프로젝트</h1>
											<div class="direction2 scrollbar">
												<!-- 개별 Card -->
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top" alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top" alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top" alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top" alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
											</div>
										</div>
										<!-- 진행중인 프로젝트 -->
										<div class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
											<h1 class="bottomMargin20">진행중인 프로젝트</h1>
											<div class="direction2 scrollbar">
												<!-- 개별 Card -->
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top" alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top" alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top" alt="...">
													<div class="card-content">
														<h5 class="card-title">프로젝트 이름</h5>
														<p class="card-text height100">프로젝트 설명이 들어갈 자리</p>
														<a href="#" class="btn btn-primary">세부사항</a>
													</div>
												</div>
												<div class="card-item">
													<img src="../../image/profile/포메.jpg" class="card-img-top" alt="...">
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