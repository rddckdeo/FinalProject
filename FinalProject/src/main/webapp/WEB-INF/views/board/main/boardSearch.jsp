<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="../../../../resources/css/board/common/template.css" />
<link rel="stylesheet"
	href="../../../../resources/css/board/main/search.css" />

<body>
	<!-- 전체 구조 -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<jsp:include page="../common/nav.jsp" />

		<!-- 페이지 오른쪽 컨텐츠 영역 -->
		<div class="body-wrapper">
			<!-- 헤더 영역 -->
			<jsp:include page="../common/header.jsp" />
			<div class="container-fluid">
				<!-- 검색창 -->
				<jsp:include page="../common/search.jsp" />
			</div>
			<div class="row">

				<div class="container-fluid">
					<div class="container-fluid">
						<p class="search-text">''에 대한 검색결과 입니다.</p>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="categoryNavigation-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="categoryNavigation-div">

								<div class="button-wrapper">
									<a
										href="/Users/kangnayoung/front/COCO/views/infoBoard/infoBoardRegistration.html"
										class="board-update-btn">작성하기</a>

									<li class="nav-item dropdown">
										<button class="nav-link dropdown-toggle toggle-btn" href="#"
											id="dropdownMenuButton" role="button"
											data-bs-toggle="dropdown" aria-expanded="false">
											<img class="sort-img" src="../../../../resources/uploads/icon/Sort.png"
												alt=""> 정렬 </ㅠ>
											<ul class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<li><a class="dropdown-item" href="#">최신순</a></li>
												<li><a class="dropdown-item" href="#">댓글순</a></li>
												<li><a class="dropdown-item" href="#">조회순</a></li>
											</ul>
									</li>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="main-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="card">
								<h1 class="card-project-name">정보 게시판</h1>
								<!-- 게시글 -->
								<div class="main-boardList">
									<div class="main-boardList-info">
										<div>
											<a href="#"><img src="../../../dog-4390885_1280.jpg"
												alt="" width="30" height="30"
												class="main-boardList-user-img"></a> <a href="#"
												class="main-boardList-info-text">닉네임</a>
											<p class="main-boardList-info-text">|</p>
											<p class="main-boardList-info-text">등록일</p>
										</div>

									</div>
									<div class="main-boardList-title">
										<a
											href="file:///Users/kangnayoung/front/COCO/views/infoBoard/infoBoardDtail.html">제목</a>
									</div>
									<div class="main-boardList-bottm-div">

										<div class="main-boardList-tag">
											<p>#</p>
											<p>#</p>
											<p>#</p>
										</div>
										<div class="main-comment-section">
											<div class="main-project-comment">
												<img src="./image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">조회 수</p>
											</div>
											<div class="main-project-comment">
												<img src="../../image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">댓글 수</p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-project-hr-div">
									<hr class="card-project-hr">
								</div>
								<!-- 게시글 -->
								<div class="main-boardList">
									<div class="main-boardList-info">
										<div>
											<a href="#"><img src="../../../dog-4390885_1280.jpg"
												alt="" width="30" height="30"
												class="main-boardList-user-img"></a> <a href="#"
												class="main-boardList-info-text">닉네임</a>
											<p class="main-boardList-info-text">|</p>
											<p class="main-boardList-info-text">등록일</p>
										</div>

									</div>
									<div class="main-boardList-title">제목</div>
									<div class="main-boardList-bottm-div">

										<div class="main-boardList-tag">
											<p>#</p>
											<p>#</p>
											<p>#</p>
										</div>
										<div class="main-comment-section">
											<div class="main-project-comment">
												<img src="./image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">조회 수</p>
											</div>
											<div class="main-project-comment">
												<img src="../../image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">댓글 수</p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-project-hr-div">
									<hr class="card-project-hr">
								</div>
								<!-- 게시글 -->
								<div class="main-boardList">
									<div class="main-boardList-info">
										<div>
											<a href="#"><img src="../../../dog-4390885_1280.jpg"
												alt="" width="30" height="30"
												class="main-boardList-user-img"></a> <a href="#"
												class="main-boardList-info-text">닉네임</a>
											<p class="main-boardList-info-text">|</p>
											<p class="main-boardList-info-text">등록일</p>
										</div>

									</div>
									<div class="main-boardList-title">제목</div>
									<div class="main-boardList-bottm-div">

										<div class="main-boardList-tag">
											<p>#</p>
											<p>#</p>
											<p>#</p>
										</div>
										<div class="main-comment-section">
											<div class="main-project-comment">
												<img src="./image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">조회 수</p>
											</div>
											<div class="main-project-comment">
												<img src="../../image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">댓글 수</p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-project-hr-div">
									<hr class="card-project-hr">
								</div>
								<!-- 게시글 -->
								<div class="main-boardList">
									<div class="main-boardList-info">
										<div>
											<a href="#"><img src="../../../dog-4390885_1280.jpg"
												alt="" width="30" height="30"
												class="main-boardList-user-img"></a> <a href="#"
												class="main-boardList-info-text">닉네임</a>
											<p class="main-boardList-info-text">|</p>
											<p class="main-boardList-info-text">등록일</p>
										</div>

									</div>
									<div class="main-boardList-title">제목</div>
									<div class="main-boardList-bottm-div">

										<div class="main-boardList-tag">
											<p>#</p>
											<p>#</p>
											<p>#</p>
										</div>
										<div class="main-comment-section">
											<div class="main-project-comment">
												<img src="./image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">조회 수</p>
											</div>
											<div class="main-project-comment">
												<img src="../../image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">댓글 수</p>
											</div>
										</div>
									</div>
								</div>
								<!-- 페이지네이션 -->
								<div class="pagination">
									<a href="#">&lt;</a> <a href="#" class="active">1</a> <a
										href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
									<a href="#">&gt;</a>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="main-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="card">
								<h1 class="card-project-name">자유 게시판</h1>
								<!-- 게시글 -->
								<div class="main-boardList">
									<div class="main-boardList-info">
										<div>
											<a href="#"><img src="../../../dog-4390885_1280.jpg"
												alt="" width="30" height="30"
												class="main-boardList-user-img"></a> <a href="#"
												class="main-boardList-info-text">닉네임</a>
											<p class="main-boardList-info-text">|</p>
											<p class="main-boardList-info-text">등록일</p>
										</div>

									</div>
									<div class="main-boardList-title">
										<a
											href="file:///Users/kangnayoung/front/COCO/views/infoBoard/infoBoardDtail.html">제목</a>
									</div>
									<div class="main-boardList-bottm-div">

										<div class="main-boardList-tag">
											<p>#</p>
											<p>#</p>
											<p>#</p>
										</div>
										<div class="main-comment-section">
											<div class="main-project-comment">
												<img src="./image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">조회 수</p>
											</div>
											<div class="main-project-comment">
												<img src="../../image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">댓글 수</p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-project-hr-div">
									<hr class="card-project-hr">
								</div>
								<!-- 게시글 -->
								<div class="main-boardList">
									<div class="main-boardList-info">
										<div>
											<a href="#"><img src="../../../dog-4390885_1280.jpg"
												alt="" width="30" height="30"
												class="main-boardList-user-img"></a> <a href="#"
												class="main-boardList-info-text">닉네임</a>
											<p class="main-boardList-info-text">|</p>
											<p class="main-boardList-info-text">등록일</p>
										</div>

									</div>
									<div class="main-boardList-title">제목</div>
									<div class="main-boardList-bottm-div">

										<div class="main-boardList-tag">
											<p>#</p>
											<p>#</p>
											<p>#</p>
										</div>
										<div class="main-comment-section">
											<div class="main-project-comment">
												<img src="./image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">조회 수</p>
											</div>
											<div class="main-project-comment">
												<img src="../../image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">댓글 수</p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-project-hr-div">
									<hr class="card-project-hr">
								</div>
								<!-- 게시글 -->
								<div class="main-boardList">
									<div class="main-boardList-info">
										<div>
											<a href="#"><img src="../../../dog-4390885_1280.jpg"
												alt="" width="30" height="30"
												class="main-boardList-user-img"></a> <a href="#"
												class="main-boardList-info-text">닉네임</a>
											<p class="main-boardList-info-text">|</p>
											<p class="main-boardList-info-text">등록일</p>
										</div>

									</div>
									<div class="main-boardList-title">제목</div>
									<div class="main-boardList-bottm-div">

										<div class="main-boardList-tag">
											<p>#</p>
											<p>#</p>
											<p>#</p>
										</div>
										<div class="main-comment-section">
											<div class="main-project-comment">
												<img src="./image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">조회 수</p>
											</div>
											<div class="main-project-comment">
												<img src="../../image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">댓글 수</p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-project-hr-div">
									<hr class="card-project-hr">
								</div>
								<!-- 게시글 -->
								<div class="main-boardList">
									<div class="main-boardList-info">
										<div>
											<a href="#"><img src="../../../dog-4390885_1280.jpg"
												alt="" width="30" height="30"
												class="main-boardList-user-img"></a> <a href="#"
												class="main-boardList-info-text">닉네임</a>
											<p class="main-boardList-info-text">|</p>
											<p class="main-boardList-info-text">등록일</p>
										</div>

									</div>
									<div class="main-boardList-title">제목</div>
									<div class="main-boardList-bottm-div">

										<div class="main-boardList-tag">
											<p>#</p>
											<p>#</p>
											<p>#</p>
										</div>
										<div class="main-comment-section">
											<div class="main-project-comment">
												<img src="./image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">조회 수</p>
											</div>
											<div class="main-project-comment">
												<img src="../../image/profile/message.png" alt="" width="20"
													height="20" class="main-project-comment-text">
												<p class="main-project-comment-text">댓글 수</p>
											</div>
										</div>
									</div>
								</div>
								<!-- 페이지네이션 -->
								<div class="pagination">
									<a href="#">&lt;</a> <a href="#" class="active">1</a> <a
										href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
									<a href="#">&gt;</a>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>