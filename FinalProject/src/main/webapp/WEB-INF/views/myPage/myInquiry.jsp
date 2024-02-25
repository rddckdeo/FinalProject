<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>profile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="../../../../resources/css/board/common/template.css" />
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>
<link rel="stylesheet"
	href="../../../../resources/css/board/info/infoBoard.css" />
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
			<div class="container-fluid"></div>
			<div class="cardSize">
				<div class="row">
					<div class="categoryNavigation-section">
						<div class="container-fluid">
							<div class="container-fluid">
								<div class="categoryNavigation-div">
									<div class="button-wrapper">
										<a href="/mypage/inquiryRegistr.do" class="board-update-btn">문의
											사항 작성하기</a>


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
									<h1 class="card-project-name">문의 게시판</h1>

									<c:choose>
										<c:when test="${empty inquiries}">
											<p
												style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
												문의가 없습니다.</p>
										</c:when>
										<c:otherwise>
											<!-- 게시글 -->
											<c:forEach var="inquiry" items="${inquiries}">

												<div class="main-boardList">

													<div class="main-boardList-info">

														<div>
															<img
																src="../../..${inquiry.imageFilePath}${inquiry.imageFileName}"
																alt="프로필" width="30" height="30">

															<p class="main-boardList-info-text">${inquiry.name}</p>
															<p class="main-boardList-info-text">|</p>
															<p class="main-boardList-info-text">${inquiry.inDate}
															</p>

														</div>

													</div>

													<div class="main-boardList-title">
														<a href="/mypage/inquiryDtail/${inquiry.no}">${inquiry.title}</a>
													</div>

													<div class="main-boardList-bottm-div">

														<div class="main-comment-section">

															<div class="main-project-comment">
																<img
																	src="../../../../resources/uploads/icon/message.png"
																	alt="message" width="20" height="20"
																	class="main-project-comment-text">
																<p class="main-project-comment-text">
																	<c:choose>
																		<c:when test="${inquiry.answer eq 'Y'}">답변이 등록되었습니다.</c:when>
																		<c:otherwise>답변이 등록되지 않았습니다.</c:otherwise>
																	</c:choose>
																</p>
															</div>


															<div class="main-project-comment">
																<img src="../../../../resources/uploads/icon/views.png"
																	alt="message" width="20" height="20"
																	class="main-project-comment-text">
																<p class="main-project-comment-text">
																	${inquiry.view}</p>
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
