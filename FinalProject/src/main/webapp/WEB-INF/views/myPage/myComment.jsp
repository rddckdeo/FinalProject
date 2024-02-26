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
			<jsp:include page="./../board/common/header.jsp" />
				<div class="row">
					<div class="main-section">
						<div class="container-fluid">
							<div class="container-fluid">
								<!-- Card 안쪽 -->
								<div class="card">
									<h1 class="card-project-name bottomMargin20">My Comment</h1>
									<!-- card body -->
									<div class="card-body height500 direction1"
										style="padding-top: 0;">
										<!-- card -->
										<div
											class="direction1 width100 boxShadow borderDefault bottomMargin20 borderRadiusd2">
											<h1 class="titleText1">댓글 모음</h1>

											<!-- infoComment 모음 -->
											<div class="main-commentList bottomBorder bottomPadding10">
											<p>정보 게시판 댓글</p>
												<c:if test="${not empty infoComment}">
													<c:forEach var="infoCommentItem" items="${infoComment}">
														<div class="main-boardList-info">
															<div class="direction1 commentCard">
																<div class="direction2 alignCenter bottomMargin10">
																	<img
																		src="${pageContext.request.contextPath}${infoCommentItem.imageFilePath}/${infoCommentItem.imageFileName}"
																		alt="" width="30" height="30"
																		class="main-boardList-user-img commentItem">
																	<p class="main-boardList-info-text commentItem">닉네임:
																		${infoCommentItem.infoCommentWriter}</p>
																	<p class="main-boardList-info-text commentItem">등록일:
																		${infoCommentItem.infoCommentDate}</p>
																	<a href="/info/infoDtail/${infoCommentItem.infoNo}" class="main-boardList-info-text commentItem">게시글
																		제목: ${infoCommentItem.infoTitle}</a>
																</div>
																<div class="direction2">
																	<a href="/info/infoDtail/${infoCommentItem.infoNo}" class="commentItem">댓글 내용:
																		${infoCommentItem.infoCommentContent}</a>
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>

												<c:if test="${empty infoComment}">
													<p class="no-comments-message">등록된 댓글이 없습니다.</p>
												</c:if>
											</div>

											<!-- freeComment 모음 -->
											<div class="main-commentList bottomBorder bottomPadding10">
											<p>자유 게시판 댓글</p>
												<c:if test="${not empty freeComment}">
													<c:forEach var="freeCommentItem" items="${freeComment}">
														<div class="main-boardList-info">
															<div class="direction1 commentCard">
																<div class="direction2 alignCenter bottomMargin10">
																	<img
																		src="${pageContext.request.contextPath}${freeCommentItem.imageFilePath}/${freeCommentItem.imageFileName}"
																		alt="" width="30" height="30"
																		class="main-boardList-user-img commentItem">
																	<p class="main-boardList-info-text commentItem">닉네임: ${freeCommentItem.freeCommentWriter}</p>
																	<p class="main-boardList-info-text commentItem">등록일:
																		${freeCommentItem.freeCommentDate}</p>
																	<a href="/free/freeDtail/${freeCommentItem.freeNo}">게시글
																		제목: ${freeCommentItem.freeTitle}</a>
																</div>
																<div class="direction2">
																	<a class="commentItem" href="/free/freeDtail/${freeCommentItem.freeNo}">댓글 내용:
																		${freeCommentItem.freeCommentContent}</a>
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>

												<c:if test="${empty freeComment}">
													<p class="no-comments-message">등록된 댓글이 없습니다.</p>
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
		</div>
</body>
</html>