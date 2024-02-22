<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
a.disabled {
	pointer-events: none;
	color: gray;
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
				<div class="container-fluid">
					<div class="container-fluid">
						<p class="search-text">"${query}" 에 대한 검색결과 입니다.</p>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="categoryNavigation-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="categoryNavigation-div">

								<c:if test="${!empty infoPosts}">
									<p>정보 게시판에서 ${totalInfoPosts} 개의 결과를 찾았습니다.</p>
								</c:if>

								<div class="button-wrapper">
									<a href="/info/registr" class="board-update-btn"
										onclick="return checkLogin()">게시글 작성</a>
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
								<c:choose>
									<c:when test="${infoPosts == null || infoPosts.size() == 0}">
										<p
											style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
											게시물이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<!-- 게시글 -->
										<c:forEach var="post" items="${infoPosts}">

											<div class="main-boardList">
												<div class="main-boardList-info">
													<div>
														<a href="#"><img
															src="../../../..${post.imageFilePath}${post.imageFileName}"
															alt="프로필" width="30" height="30"
															class="main-boardList-user-img"></a>
														<p class="main-boardList-info-text">${post.nickname}</p>
														<p class="main-boardList-info-text">|</p>
														<p class="main-boardList-info-text">${post.infoDate}</p>
													</div>

												</div>
												<div class="main-boardList-title">
													<a href="/info/infoDtail/${post.infoNo}">${post.infoTitle}</a>
												</div>

												<div class="main-boardList-bottm-div">

													<div class="main-boardList-tag">
														<c:if
															test="${post.infoTag1 != null && !empty post.infoTag1}">
															<p class="tag-div">#${post.infoTag1}</p>
														</c:if>
														<c:if
															test="${post.infoTag2 != null && !empty post.infoTag2}">
															<p class="tag-div">#${post.infoTag2}</p>
														</c:if>
														<c:if
															test="${post.infoTag3 != null && !empty post.infoTag3}">
															<p class="tag-div">#${post.infoTag3}</p>
														</c:if>
													</div>

													<div class="main-comment-section">
														<div class="main-project-comment">
															<img src="../../../../resources/uploads/icon/message.png"
																alt="message" width="20" height="20"
																class="main-project-comment-text">
															<p class="main-project-comment-text">${post.commentCount}</p>
														</div>
														<div class="main-project-comment">
															<img src="../../../../resources/uploads/icon/views.png"
																alt="views" width="20" height="20"
																class="main-project-comment-text">
															<p class="main-project-comment-text">${post.infoViews}</p>
														</div>
													</div>
												</div>
											</div>
											<div class="card-project-hr-div">
												<hr class="card-project-hr">
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>

								<!-- 페이지네이션 -->
								<div class="pagination" id="pagination">
									<div>
									<c:if test="${totalFreePages > 0}">
										<a
											href="/board/search?query=${query}&freePage=${freePage}&infoPage=${infoPage - 1 < 1 ? 1 : infoPage - 1}&pageSize=${pageSize}"
											class="${infoPage == 1 ? 'disabled' : ''}">&lt;</a>
										<c:forEach var="i" begin="1" end="${totalInfoPages}">
											<c:choose>
												<c:when test="${i == infoPage}">
													<a
														href="/board/search?query=${query}&freePage=${freePage}&infoPage=${i}&pageSize=${pageSize}"
														class="active">${i}</a>
												</c:when>
												<c:otherwise>
													<a
														href="/board/search?query=${query}&freePage=${freePage}&infoPage=${i}&pageSize=${pageSize}">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<a
											href="/board/search?query=${query}&freePage=${freePage}&infoPage=${infoPage + 1 > totalInfoPages ? totalInfoPages : infoPage + 1}&pageSize=${pageSize}"
											class="${infoPage == totalInfoPages ? 'disabled' : ''}">&gt;</a>
										</c:if>
									</div>
								</div>



							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="categoryNavigation-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="categoryNavigation-div">

								<c:if test="${!empty freePosts}">
									<p>자유 게시판에서 ${totalFreePosts} 개의 결과를 찾았습니다.</p>
								</c:if>

								<div class="button-wrapper">
									<a href="/free/registr" class="board-update-btn"
										onclick="return checkLogin()">게시글 작성</a>

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
								<c:choose>
									<c:when test="${empty freePosts}">
										<p
											style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
											게시물이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<!-- 게시글 -->
										<c:forEach var="post" items="${freePosts}">

											<div class="main-boardList">
												<div class="main-boardList-info">
													<div>
														<a href="#"><img
															src="../../../..${post.imageFilePath}${post.imageFileName}"
															alt="프로필" width="30" height="30"
															class="main-boardList-user-img"></a>
														<p class="main-boardList-info-text">${post.nickname}</p>
														<p class="main-boardList-info-text">|</p>
														<p class="main-boardList-info-text">${post.freeDate}</p>
													</div>
												</div>
												<div class="main-boardList-title">
													<a href="/free/freeDtail/${post.freeNo}">${post.freeTitle}</a>
												</div>

												<div class="main-boardList-bottm-div">

													<div class="main-boardList-tag">
														<c:if
															test="${post.freeTag1 != null && !empty post.freeTag1}">
															<p class="tag-div">#${post.freeTag1}</p>
														</c:if>
														<c:if
															test="${post.freeTag2 != null && !empty post.freeTag2}">
															<p class="tag-div">#${post.freeTag2}</p>
														</c:if>
														<c:if
															test="${post.freeTag3 != null && !empty post.freeTag3}">
															<p class="tag-div">#${post.freeTag3}</p>
														</c:if>
													</div>

													<div class="main-comment-section">
														<div class="main-project-comment">
															<img src="../../../../resources/uploads/icon/message.png"
																alt="message" width="20" height="20"
																class="main-project-comment-text">
															<p class="main-project-comment-text">${post.freeCommentCount}</p>
														</div>
														<div class="main-project-comment">
															<img src="../../../../resources/uploads/icon/views.png"
																alt="views" width="20" height="20"
																class="main-project-comment-text">
															<p class="main-project-comment-text">${post.freeViews}</p>
														</div>
													</div>
												</div>
											</div>
											<div class="card-project-hr-div">
												<hr class="card-project-hr">
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>

								<!-- 페이지네이션 -->
								<div class="pagination" id="pagination">
									<div>
										<c:if test="${totalFreePages > 0}">
											<a
												href="/board/search?query=${query}&freePage=${freePage - 1 < 1 ? 1 : freePage - 1}&infoPage=${infoPage}&pageSize=${pageSize}"
												class="${freePage == 1 ? 'disabled' : ''}">&lt;</a>
											<c:forEach var="i" begin="1" end="${totalFreePages}">
												<c:choose>
													<c:when test="${i == freePage}">
														<a
															href="/board/search?query=${query}&freePage=${i}&infoPage=${infoPage}&pageSize=${pageSize}"
															class="active">${i}</a>
													</c:when>
													<c:otherwise>
														<a
															href="/board/search?query=${query}&freePage=${i}&infoPage=${infoPage}&pageSize=${pageSize}">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<a
												href="/board/search?query=${query}&freePage=${freePage + 1 > totalFreePages ? totalFreePages : freePage + 1}&infoPage=${infoPage}&pageSize=${pageSize}"
												class="${freePage == totalFreePages ? 'disabled' : ''}">&gt;</a>
										</c:if>
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
	function checkLogin() {
		// 세션에 no가 없을때(비로그인)
<%if (session.getAttribute("no") == null) {%>
	alert('로그인 후 이용해주세요.');
		location.href = '/member/loginForm.do'; // 로그인 페이지로 리다이렉트
		return false;
<%} else {%>
	return true;
<%}%>
	}
</script>
