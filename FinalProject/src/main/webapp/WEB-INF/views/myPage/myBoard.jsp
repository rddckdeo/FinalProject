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
									<h1 class="card-project-name bottomMargin20">My Board</h1>
									<!-- card body -->
									<div class="card-body height500 direction1" style="padding-top: 0;">
										<div class="direction1 width100 boxShadow borderDefault bottomMargin20 borderRadiusd2">
											<h1 class="titleText1">자유 게시판</h1>
											<div class="main-boardList bottomBorder">
												<div class="main-boardList-info">
													<div>
														<a href="#"><img src="../../image/naver.png" alt="" width="30" height="30" class="main-boardList-user-img"></a> <a href="#" class="main-boardList-info-text">닉네임</a>
														<p class="main-boardList-info-text">등록일</p>
													</div>
												</div>
												<div class="main-boardList-title">
													<a href="#">제목</a>
												</div>
												<div class="main-boardList-bottm-div">
													<div class="main-boardList-tag">
														<p>#</p>
														<p>#</p>
														<p>#</p>
													</div>
													<div class="main-comment-section">
														<div class="main-project-comment">
															<img src="./image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">조회 수</p>
														</div>
														<div class="main-project-comment">
															<img src="../../image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">댓글 수</p>
														</div>
													</div>
												</div>
											</div>

											<div class="main-boardList bottomBorder">
												<div class="main-boardList-info">
													<div>
														<a href="#"><img src="../../image/naver.png" alt="" width="30" height="30" class="main-boardList-user-img"></a> <a href="#" class="main-boardList-info-text">닉네임</a>
														<p class="main-boardList-info-text">등록일</p>
													</div>
												</div>
												<div class="main-boardList-title">
													<a href="#">제목</a>
												</div>
												<div class="main-boardList-bottm-div">
													<div class="main-boardList-tag">
														<p>#</p>
														<p>#</p>
														<p>#</p>
													</div>
													<div class="main-comment-section">
														<div class="main-project-comment">
															<img src="./image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">조회 수</p>
														</div>
														<div class="main-project-comment">
															<img src="../../image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">댓글 수</p>
														</div>
													</div>
												</div>
											</div>
											<!-- 페이지네이션 -->
											<div class="pagination">
												<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
											</div>
										</div>



										<div class="direction1 width100 boxShadow borderDefault borderRadiusd2">
											<h1 class="titleText1">정보 게시판</h1>

											<!-- board -->
											<div class="main-boardList bottomBorder">
												<div class="main-boardList-info">
													<div>
														<a href="#"><img src="../../image/naver.png" alt="" width="30" height="30" class="main-boardList-user-img"></a> <a href="#" class="main-boardList-info-text">닉네임</a>
														<p class="main-boardList-info-text">등록일</p>
													</div>
												</div>
												<div class="main-boardList-title">
													<a href="#">제목</a>
												</div>
												<div class="main-boardList-bottm-div">
													<div class="main-boardList-tag">
														<p>#</p>
														<p>#</p>
														<p>#</p>
													</div>
													<div class="main-comment-section">
														<div class="main-project-comment">
															<img src="./image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">조회 수</p>
														</div>
														<div class="main-project-comment">
															<img src="../../image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">댓글 수</p>
														</div>
													</div>
												</div>
											</div>

											<div class="main-boardList bottomBorder">
												<div class="main-boardList-info">
													<div>
														<a href="#"><img src="../../image/naver.png" alt="" width="30" height="30" class="main-boardList-user-img"></a> <a href="#" class="main-boardList-info-text">닉네임</a>
														<p class="main-boardList-info-text">등록일</p>
													</div>
												</div>
												<div class="main-boardList-title">
													<a href="#">제목</a>
												</div>
												<div class="main-boardList-bottm-div">
													<div class="main-boardList-tag">
														<p>#</p>
														<p>#</p>
														<p>#</p>
													</div>
													<div class="main-comment-section">
														<div class="main-project-comment">
															<img src="./image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">조회 수</p>
														</div>
														<div class="main-project-comment">
															<img src="../../image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">댓글 수</p>
														</div>
													</div>
												</div>
											</div>

											<div class="main-boardList bottomBorder">
												<div class="main-boardList-info">
													<div>
														<a href="#"><img src="../../image/naver.png" alt="" width="30" height="30" class="main-boardList-user-img"></a> <a href="#" class="main-boardList-info-text">닉네임</a>
														<p class="main-boardList-info-text">등록일</p>
													</div>
												</div>
												<div class="main-boardList-title">
													<a href="#">제목</a>
												</div>
												<div class="main-boardList-bottm-div">
													<div class="main-boardList-tag">
														<p>#</p>
														<p>#</p>
														<p>#</p>
													</div>
													<div class="main-comment-section">
														<div class="main-project-comment">
															<img src="./image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">조회 수</p>
														</div>
														<div class="main-project-comment">
															<img src="../../image/profile/message.png" alt="" width="20" height="20" class="main-project-comment-text">
															<p class="main-project-comment-text">댓글 수</p>
														</div>
													</div>
												</div>
											</div>
											<!-- 페이지네이션 -->
											<div class="pagination">
												<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
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