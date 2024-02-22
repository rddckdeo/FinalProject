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

</style>
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
									<h1 class="card-project-name bottomMargin20">My Board</h1>
									<!-- card body -->
									<div class="card-body height500 direction1"
										style="padding-top: 0;">
										<div
											class="direction1 width100 boxShadow borderDefault bottomMargin20 borderRadiusd2">
											<h1 class="titleText1">자유 게시판</h1>
											<div class="main-boardList bottomBorder">

												<!-- 게시글  -->
												<c:choose>
													<c:when test="${empty freePosts}">
														<p
															style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
															게시물이 없습니다.</p>
													</c:when>
													<c:otherwise>
														<!-- 게시글 -->
														<c:forEach var="freePost" items="${freePosts}">

															<div class="main-boardList">

																<div class="main-boardList-info">

																	<div>
																		<img src="${sessionScope.path}${sessionScope.picture}"
																			alt="프로필" width="30" height="30">

																		<p class="main-boardList-info-text">작성일 :
																			${freePost.freeDate}</p>

																	</div>

																</div>

																<div class="main-boardList-title">
																	<a href="/free/freeDtail/${freePost.freeNo}">${freePost.freeTitle}</a>
																</div>

																<div class="main-boardList-bottm-div">

																	<div class="main-boardList-tag">

																		<c:if test="${not empty freePost.freeTag1}">
																			<p>#${freePost.freeTag1}</p>
																		</c:if>
																		<c:if test="${not empty freePost.freeTag2}">
																			<p>#${freePost.freeTag2}</p>
																		</c:if>
																		<c:if test="${not empty freePost.freeTag3}">
																			<p>#${freePost.freeTag3}</p>
																		</c:if>

																	</div>

																	<div class="main-comment-section">

																		<div class="main-project-comment">
																			<img
																				src="../../../../resources/uploads/icon/message.png"
																				alt="message" width="20" height="20"
																				class="main-project-comment-text">
																			<p class="main-project-comment-text">${freePost.freeCommentCount}</p>
																		</div>

																		<div class="main-project-comment">
																			<img
																				src="../../../../resources/uploads/icon/views.png"
																				alt="message" width="20" height="20"
																				class="main-project-comment-text">
																			<p class="main-project-comment-text">
																				${freePost.freeViews}</p>
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
												<div class="pagination" id="freePagination">
													<a
														href="/mypage/myboard.do/?freePage=${freePage - 1 < 1 ? 1 : freePage - 1}&infoPage=${infoPage}"
														class="${freePage == 1 ? 'disabled' : ''}">&lt;</a>
													<c:forEach var="i" begin="1" end="${freePageInfo.maxPage}">
														<c:choose>
															<c:when test="${i == freePage}">
																<a
																	href="/mypage/myboard.do/?freePage=${i}&infoPage=${infoPage}"
																	class="active">${i}</a>
															</c:when>
															<c:otherwise>
																<a
																	href="/mypage/myboard.do/?freePage=${i}&infoPage=${infoPage}">${i}</a>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<a
														href="/mypage/myboard.do/?freePage=${freePage + 1 > freePageInfo.maxPage ? freePageInfo.maxPage : freePage + 1}&infoPage=${infoPage}"
														class="${freePage == freePageInfo.maxPage ? 'disabled' : ''}">&gt;</a>
												</div>

											</div>
										</div>


										<div
											class="direction1 width100 boxShadow borderDefault borderRadiusd2">
											<h1 class="titleText1">정보 게시판</h1>

											<!-- board -->
											<div class="main-boardList bottomBorder">
												<c:choose>
													<c:when test="${empty freePosts}">
														<p
															style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
															게시물이 없습니다.</p>
													</c:when>
													<c:otherwise>
														<!-- 게시글 -->
														<c:forEach var="infoPost" items="${infoPosts}">

															<div class="main-boardList">

																<div class="main-boardList-info">

																	<div>
																		<img src="${sessionScope.path}${sessionScope.picture}"
																			alt="프로필" width="30" height="30">

																		<p class="main-boardList-info-text">작성일 :
																			${infoPost.infoDate}</p>

																	</div>

																</div>

																<div class="main-boardList-title">
																	<a href="/info/infoDtail/${infoPost.infoNo}">${infoPost.infoTitle}</a>
																</div>

																<div class="main-boardList-bottm-div">

																	<div class="main-boardList-tag">

																		<c:if test="${not empty infoPost.infoTag1}">
																			<p>#${infoPost.infoTag1}</p>
																		</c:if>
																		<c:if test="${not empty infoPost.infoTag2}">
																			<p>#${infoPost.infoTag2}</p>
																		</c:if>
																		<c:if test="${not empty infoPost.infoTag3}">
																			<p>#${infoPost.infoTag3}</p>
																		</c:if>

																	</div>

																	<div class="main-comment-section">

																		<div class="main-project-comment">
																			<img
																				src="../../../../resources/uploads/icon/message.png"
																				alt="message" width="20" height="20"
																				class="main-project-comment-text">
																			<p class="main-project-comment-text">${infoPost.infoCommentCount}</p>
																		</div>

																		<div class="main-project-comment">
																			<img
																				src="../../../../resources/uploads/icon/views.png"
																				alt="message" width="20" height="20"
																				class="main-project-comment-text">
																			<p class="main-project-comment-text">
																				${infoPost.infoViews}</p>
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

												<!-- 정보게시판 페이지 네이션 -->
												<div class="pagination" id="infoPagination">
													<a
														href="/mypage/myboard.do/?freePage=${freePage}&infoPage=${infoPage - 1 < 1 ? 1 : infoPage - 1}"
														class="${infoPage == 1 ? 'disabled' : ''}">&lt;</a>
													<c:forEach var="i" begin="1" end="${infoPageInfo.maxPage}">
														<c:choose>
															<c:when test="${i == infoPage}">
																<a
																	href="/mypage/myboard.do/?freePage=${freePage}&infoPage=${i}"
																	class="active">${i}</a>
															</c:when>
															<c:otherwise>
																<a
																	href="/mypage/myboard.do/?freePage=${freePage}&infoPage=${i}">${i}</a>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<a
														href="/mypage/myboard.do/?freePage=${freePage}&infoPage=${infoPage + 1 > infoPageInfo.maxPage ? infoPageInfo.maxPage : infoPage + 1}"
														class="${infoPage == infoPageInfo.maxPage ? 'disabled' : ''}">&gt;</a>
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