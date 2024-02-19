<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
													<c:when test="${not empty freePosts}">
														<c:forEach var="freePost" items="${freePosts}">
															<div class="main-boardList-info">
																<div>
																	<a href="#"> <img
																		src="${sessionScope.path}${sessionScope.picture}"
																		alt="" width="30" height="30"
																		class="main-boardList-user-img">
																	</a> <a href="#" class="main-boardList-info-text">aa</a>
																	<p class="main-boardList-info-text">${freePost.freeDate}</p>
																</div>
															</div>
															<div class="main-boardList-title">
																<a href="#">${freePost.freeTitle}</a>
															</div>
															<div class="main-boardList-bottm-div">
																<div class="main-boardList-tag">
																	<div class="main-boardList-tag">
																		<!-- 태그 출력 -->
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
																</div>
																<div class="main-comment-section">
																	<div class="main-project-comment">
																		<img src="../../../../resources/uploads/icon/views.png" alt=""
																			width="20" height="20"
																			class="main-project-comment-text">
																		<p class="main-project-comment-text">${freePost.freeViews}
																			</p>
																	</div>
																	<div class="main-project-comment">
																		<img src="../../../../resources/uploads/icon/message.png" alt=""
																			width="20" height="20"
																			class="main-project-comment-text">
																		<p class="main-project-comment-text">댓글 수</p>
																	</div>
																</div>
															</div>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<div class="no-posts-message">
															<p>등록된 게시글이 없습니다.</p>
														</div>
													</c:otherwise>
												</c:choose>


												<!-- 프리게시판 페이지 네이션 -->
												<c:if test="${totalFreePages > 1}">
													<div class="pagination" id="freePagination">
														<div>
															<c:set var="prevFreePage"
																value="${freePage - 1 < 1 ? 1 : freePage - 1}" />
															<a
																href="/myPage/myBoard?freePage=${prevFreePage}&infoPage=${infoPage}&pageSize=${pageSize}"
																class="${freePage == 1 ? 'disabled' : ''}">&lt;</a>
															<c:forEach var="i" begin="1" end="${totalFreePages}">
																<c:choose>
																	<c:when test="${i == freePage}">
																		<a
																			href="/myPage/myBoard?freePage=${i}&infoPage=${infoPage}&pageSize=${pageSize}"
																			class="active">${i}</a>
																	</c:when>
																	<c:otherwise>
																		<a
																			href="/myPage/myBoard?freePage=${i}&infoPage=${infoPage}&pageSize=${pageSize}">${i}</a>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<c:set var="nextFreePage"
																value="${freePage + 1 > totalFreePages ? totalFreePages : freePage + 1}" />
															<a
																href="/myPage/myBoard?freePage=${nextFreePage}&infoPage=${infoPage}&pageSize=${pageSize}"
																class="${freePage == totalFreePages ? 'disabled' : ''}">&gt;</a>
														</div>
													</div>
												</c:if>
	</div>



												<div
													class="direction1 width100 boxShadow borderDefault borderRadiusd2">
													<h1 class="titleText1">정보 게시판</h1>

													<!-- board -->
													<div class="main-boardList bottomBorder">


														<c:choose>
															<c:when test="${not empty infoPosts}">
																<c:forEach var="infoPost" items="${infoPosts}">
																	<div class="main-boardList-info">
																		<div>
																			<a href="#"> <img
																				src="${sessionScope.path}${sessionScope.picture}"
																				alt="" width="30" height="30"
																				class="main-boardList-user-img"></a> <a href="#"
																				class="main-boardList-info-text">aa</a>
																			<p class="main-boardList-info-text">${infoPost.infoDate}</p>
																		</div>
																	</div>
																	<div class="main-boardList-title">
																		<a href="#">${infoPost.infoTitle}</a>
																	</div>
																	<div class="main-boardList-bottm-div">
																		<div class="main-boardList-tag">
																			<!-- 태그 출력 -->
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
																				<img src="../../../../resources/uploads/icon/views.png" alt=""
																					width="20" height="20"
																					class="main-project-comment-text">
																				<p class="main-project-comment-text">${infoPost.infoViews}
																					</p>
																			</div>
																			<div class="main-project-comment">
																				<img src="../../../../resources/uploads/icon/message.png" alt=""
																					width="20" height="20"
																					class="main-project-comment-text">
																				<p class="main-project-comment-text">${infoPost.infoCommentCount}
																					댓글 수</p>
																			</div>
																		</div>
																	</div>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<div class="no-posts-message">
																	<p>등록된 게시글이 없습니다.</p>
																</div>
															</c:otherwise>
														</c:choose>

														<!-- 정보게시판 페이지 네이션 -->
														<c:if test="${totalInfoPages > 1}">
															<div class="pagination" id="infoPagination">
																<div>
																	<c:set var="prevInfoPage"
																		value="${infoPage - 1 < 1 ? 1 : infoPage - 1}" />
																	<a
																		href="/myPage/myBoard?freePage=${freePage}&infoPage=${prevInfoPage}&pageSize=${pageSize}"
																		class="${infoPage == 1 ? 'disabled' : ''}">&lt;</a>
																	<c:forEach var="i" begin="1" end="${totalInfoPages}">
																		<c:choose>
																			<c:when test="${i == infoPage}">
																				<a
																					href="/myPage/myBoard?freePage=${freePage}&infoPage=${i}&pageSize=${pageSize}"
																					class="active">${i}</a>
																			</c:when>
																			<c:otherwise>
																				<a
																					href="/myPage/myBoard?freePage=${freePage}&infoPage=${i}&pageSize=${pageSize}">${i}</a>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																	<c:set var="nextInfoPage"
																		value="${infoPage + 1 > totalInfoPages ? totalInfoPages : infoPage + 1}" />
																	<a
																		href="/myPage/myBoard?freePage=${freePage}&infoPage=${nextInfoPage}&pageSize=${pageSize}"
																		class="${infoPage == totalInfoPages ? 'disabled' : ''}">&gt;</a>
																</div>
															</div>
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