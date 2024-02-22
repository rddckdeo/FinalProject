<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COCO</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="../../../../resources/css/board/common/template.css" />
<link rel="stylesheet"
	href="../../../../resources/css/board/main/main.css" />
<link rel="stylesheet"
	href="../../../../resources/css/board/info/infoBoard.css" />
</head>
<style>
a.disabled {
	pointer-events: none;
	color: gray;
}
.board-card-row {
    position: relative; 
    min-height: 500px; 
}

#freePagination {
    position: absolute; 
    bottom: 0; 
    width: 100%; 
}
</style>
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
				<div class="main-section">
					<div id="swipe-category-div">
						<button id="swipe-category-prevBtn">&lt;</button>
						<div id="main-swipe-category">
							<div id="circles">
								<a class="swipe-category" href="/member/mainForm.do">CoCo</a>
								<div class="swipe-category">QnA</div>
								<div class="swipe-category">3</div>
								<div class="swipe-category">4</div>
								<div class="swipe-category">5</div>
								<div class="swipe-category">6</div>
								<div class="swipe-category">7</div>
								<div class="swipe-category">8</div>
							</div>
						</div>
						<button id="swipe-category-nextBtn">&gt;</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="main-section">
					<div class="container-fluid">
						<div class="container-fluid">


							<div class="card">
								<h1 class="card-project-name">추천 프로젝트</h1>
								<div class="card-body">
									<button id="project-prevBtn"><</button>
									<div class="card-container" id="cards">
										<div class="card-item">
											<img src="" class="card-img-top" alt="...">
											<div class="card-content">
												<h5 class="project-card-title">프로젝트 명 길이ㅣ 테스트 입니다.</h5>
												<div class="card-content-text">
													<p class="projecct-info-text">모집인원 |</p>
													<p class="projecct-info-text">주제 | 주제 길이 테스트
														입니다.주제주제주제주제주제</p>
													<p class="projecct-info-text">기술 스택 | 길이 테스트
														입니다.아아아아아아아아앙</p>
												</div>
												<a href="#" class="btn btn-primary" id="project-detail-btn">프로젝트
													상세보기</a>
											</div>
										</div>
										<div class="card-item">
											<img src="" class="card-img-top" alt="...">
											<div class="card-content">
												<h5 class="project-card-title">프로젝트 명</h5>
												<div class="card-content-text">
													<p class="projecct-info-text">모집인원 |</p>
													<p class="projecct-info-text">주제 |</p>
													<p class="projecct-info-text">기술 스택 |</p>
												</div>
												<a href="#" class="btn btn-primary" id="project-detail-btn">프로젝트
													상세보기</a>
											</div>
										</div>
										<div class="card-item">
											<img src="" class="card-img-top" alt="...">
											<div class="card-content">
												<h5 class="project-card-title">프로젝트 명</h5>
												<div class="card-content-text">
													<p class="projecct-info-text">모집인원 |</p>
													<p class="projecct-info-text">주제 |</p>
													<p class="projecct-info-text">기술 스택 |</p>
												</div>
												<a href="#" class="btn btn-primary" id="project-detail-btn">프로젝트
													상세보기</a>
											</div>
										</div>
										<div class="card-item">
											<img src="" class="card-img-top" alt="...">
											<div class="card-content">
												<h5 class="project-card-title">프로젝트 명</h5>
												<div class="card-content-text">
													<p class="projecct-info-text">모집인원 |</p>
													<p class="projecct-info-text">주제 |</p>
													<p class="projecct-info-text">기술 스택 |</p>
												</div>
												<a href="#" class="btn btn-primary" id="project-detail-btn">프로젝트
													상세보기</a>
											</div>
										</div>
										<div class="card-item">
											<img src="" class="card-img-top" alt="...">
											<div class="card-content">
												<h5 class="project-card-title">프로젝트 명</h5>
												<div class="card-content-text">
													<p class="projecct-info-text">모집인원 |</p>
													<p class="projecct-info-text">주제 |</p>
													<p class="projecct-info-text">기술 스택 |</p>
												</div>
												<a href="#" class="btn btn-primary" id="project-detail-btn">프로젝트
													상세보기</a>
											</div>
										</div>
										<div class="card-item">
											<img src="" class="card-img-top" alt="...">
											<div class="card-content">
												<h5 class="project-card-title">프로젝트 명</h5>
												<div class="card-content-text">
													<p class="projecct-info-text">모집인원 |</p>
													<p class="projecct-info-text">주제 |</p>
													<p class="projecct-info-text">기술 스택 |</p>
												</div>
												<a href="#" class="btn btn-primary" id="project-detail-btn">프로젝트
													상세보기</a>
											</div>
										</div>
									</div>
									<button id="project-nextBtn">></button>
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
							<div class="board-row">

								<!-- 정보 게시판 게시글 -->
								<div class="board-card-row">
									<div>
										<h1 class="card-project-name">정보 게시판</h1>
										<c:choose>
											<c:when test="${not empty infoPosts}">
												<c:forEach var="post" items="${infoPosts}">
													<div class="main-boardList">
														<div class="main-boardList-info">
															<div>
																<a href="#"><img
																	src="../../../..${post.imageFileName}${post.imageFilePath}"
																	alt="" width="30" height="30"
																	class="main-boardList-user-img"></a> <a href="#"
																	class="main-boardList-info-text"><c:out
																		value="${post.nickname}" /> </a>
																<p class="main-boardList-info-text">
																	|
																	<c:out value="${post.infoDate}" />
																</p>
															</div>
															<div class="main-project-comment">
																<img
																	src="../../../../resources/uploads/icon/message.png"
																	alt="" width="20" height="20"
																	class="main-project-comment-text">
																<p class="main-project-comment-text">
																	<c:out value="${post.infoCommentCount}" />
																</p>
															</div>
														</div>
														<div class="main-boardList-title">
															<a href="/info/infoDtail/${post.infoNo}">${post.infoTitle}</a>
														</div>
													</div>
													<div class="card-project-hr-div">
														<hr class="card-project-hr">
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p
													style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
													게시물이 없습니다.</p>
											</c:otherwise>
										</c:choose>


										<!-- 페이지네이션 -->
										<div class="pagination" id="infoPagination">
											<a
												href="/board/?freePage=${freePage}&infoPage=${infoPage - 1 < 1 ? 1 : infoPage - 1}&pageSize=${pageSize}"
												class="${infoPage == 1 ? 'disabled' : ''}">&lt;</a>
											<c:forEach var="i" begin="1" end="${infoPageInfo.maxPage}">
												<c:choose>
													<c:when test="${i == infoPage}">
														<a
															href="/board/?freePage=${freePage}&infoPage=${i}&pageSize=${pageSize}"
															class="active">${i}</a>
													</c:when>
													<c:otherwise>
														<a
															href="/board/?freePage=${freePage}&infoPage=${i}&pageSize=${pageSize}">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<a
												href="/board/?freePage=${freePage}&infoPage=${infoPage + 1 > infoPageInfo.maxPage ? infoPageInfo.maxPage : infoPage + 1}&pageSize=${pageSize}"
												class="${infoPage == infoPageInfo.maxPage ? 'disabled' : ''}">&gt;</a>
										</div>






									</div>
								</div>

								<!-- 자유 게시판 게시글 -->
								<div class="board-card-row">
									<div>
										<h1 class="card-project-name">자유 게시판</h1>
										<c:choose>
											<c:when test="${not empty freePosts}">
												<c:forEach var="post" items="${freePosts}">
													<div class="main-boardList">
														<div class="main-boardList-info">
															<div>
																<a href="#"><img
																	src="../../../..${post.imageFileName}${post.imageFilePath}"
																	alt="" width="30" height="30"
																	class="main-boardList-user-img"></a> <a href="#"
																	class="main-boardList-info-text"><c:out
																		value="${post.nickname}" /> </a>
																<p class="main-boardList-info-text">
																	|
																	<c:out value="${post.freeDate}" />
																</p>

															</div>
															<div class="main-project-comment">
																<img
																	src="../../../../resources/uploads/icon/message.png"
																	alt="" width="20" height="20"
																	class="main-project-comment-text">
																<p class="main-project-comment-text">
																	<c:out value="${post.freeCommentCount}" />
																</p>
															</div>
														</div>
														<div class="main-boardList-title">
															<a href="/info/infoDtail/${post.freeNo}">${post.freeTitle}</a>
														</div>
													</div>
													<div class="card-project-hr-div">
														<hr class="card-project-hr">
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p
													style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
													게시물이 없습니다.</p>
											</c:otherwise>
										</c:choose>



										<div class="pagination" id="freePagination">
											<a
												href="/board/?freePage=${freePage - 1 < 1 ? 1 : freePage - 1}&infoPage=${infoPage}&pageSize=${pageSize}"
												class="${freePage == 1 ? 'disabled' : ''}">&lt;</a>
											<c:forEach var="i" begin="1" end="${freePageInfo.maxPage}">
												<c:choose>
													<c:when test="${i == freePage}">
														<a
															href="/board/?freePage=${i}&infoPage=${infoPage}&pageSize=${pageSize}"
															class="active">${i}</a>
													</c:when>
													<c:otherwise>
														<a
															href="/board/?freePage=${i}&infoPage=${infoPage}&pageSize=${pageSize}">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<a
												href="/board/?freePage=${freePage + 1 > freePageInfo.maxPage ? freePageInfo.maxPage : freePage + 1}&infoPage=${infoPage}&pageSize=${pageSize}"
												class="${freePage == freePageInfo.maxPage ? 'disabled' : ''}">&gt;</a>
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
<script src="../../../../resources/js/board/main/main.js"></script>