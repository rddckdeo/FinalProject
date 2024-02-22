<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>profile</title>
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>
<link rel="stylesheet" href="../../../../resources/css/board/common/template.css" />
</head>
<body>
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
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
								<h1 class="card-project-name bottomMargin20">My Push</h1>
								<!-- card body -->
								<div class="card-body height500 direction1" style="padding-top: 0;">
									<!-- card -->
									<div class="direction1 width100 boxShadow borderDefault bottomMargin20 borderRadiusd2">
										<h1 class="titleText1">알림 모음</h1>
										<!-- content -->
											<c:forEach var ="item" items="${pushList}">
												<c:choose>
													<c:when test="${item.pushType eq 'comment'}">
														<!-- 게시글 댓글 알림 -->
														<div class="main-commentList bottomBorder padding20px">
															<div class="justifyBet">
																<span class="marginLR pushFont1">알림 제목 : ${item.pushWriter}님께서 게시글에 답변을 남겼습니다.</span>
																<span class="marginLR pushFont1">알림 시간 : ${item.pushIndate}</span>
															</div>
															<div class="justifyBet">
																<span class="marginLR pushFont2">알림 작성자 : ${item.pushWriter}</span>
																<span class="marginLR pushFont2">게시글 종류 : ${item.boardType}</span>
															</div>
															<div class="marginLR pushFont2">댓글 내용 : ${item.pushContent}</div>
														</div>
													</c:when>
													<c:when test="${item.pushType eq 'inquiry'}">
														<div class="main-commentList bottomBorder padding20px">
															<!-- 문의 답변 처리 -->
															<div class="justifyBet">
																<span class="marginLR pushFont1"> 알림 제목 : 문의 주신 내용에 답변이 도착하였습니다.</span>
																<span class="marginLR pushFont1">알림 시간 = ${item.pushIndate}</span>
															</div>
															<div class="marginLR pushFont2">게시글 제목 : ${item.pushContent}</div>
														</div>
													</c:when>
													<c:when test="${item.pushType eq 'blind'}">
														<div class="main-commentList bottomBorder padding20px">
															<!-- 게시글 blind 처리 -->
															<div class="justifyBet">
																<span class="marginLR pushFont1"> 알림 제목 : 해당 게시글이 신고를 통해 blind처리 되었습니다.</span>
																<span class="marginLR pushFont1">알림 시간 = ${item.pushIndate}</span>
															</div>
															<div class="marginLR pushFont2">게시글 제목 : ${item.pushContent}</div>
														</div>
													</c:when>
												</c:choose>
											</c:forEach>
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