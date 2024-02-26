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
	href="../../../../resources/css/board/info/infoRegistr.css" />
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>
</head>
<style>
#mainText {
	width: 100%;
	height: 100px;
	padding: 5px 10px 5px 10px;
	border-radius: 7px;
	border: 1px solid #adb5bd;
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
			<jsp:include page="./../board/common/header.jsp" />

			<div class="container-fluid">
				<h1 class="card-project-name">문의 내용</h1>
			</div>

			<div class="row">
				<div class="main-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="card">
								<div class="main-boardList">

									<div>
										<div
											style="display: flex; align-items: center; justify-content: space-between;">
											<!-- 이미지와 작성일 가로 정렬 -->
											<div style="display: flex; align-items: center;  margin-bottom:23px;margin-top:15px;">
												<img src="../../..${imageFilePath}${imageFileName}"
													alt="프로필" width="30" height="30" style="margin-right:5px;">
												<p class="main-boardList-info-text">작성일 :
													${inquiry.inDate}</p>
											</div>

											<div style="display: flex; flex-direction: column;">
												<div
													style="display: flex; justify-content: space-between; align-items: center;">
													<div style="display: flex; align-items: center;">
														<img src="../../../../resources/uploads/icon/message.png"
															alt="message" width="20" height="20"
															class="main-project-comment-text" style="margin-right:10px;">
														<c:choose>
															<c:when test="${inquiry.answer eq 'N'}">
																<p class="main-project-comment-text" style="margin-right:10px;">답변 미등록</p>
															</c:when>
															<c:when test="${inquiry.answer eq 'Y'}">
																<p class="main-project-comment-text" style="margin-right:10px;">답변 완료</p>
															</c:when>
														</c:choose>
													</div>

													<div style="display: flex; align-items: center; margin-right:10px;">
														<img src="../../../../resources/uploads/icon/views.png"
															alt="message" width="20" height="20" style="margin-right:10px;"
															class="main-project-comment-text">
														<p class="main-project-comment-text">${inquiry.view}</p>
													</div>
												</div>


											</div>

										</div>

										<p class="form-lable" style="margin-bottom:23px;">제목</p>
										<p style="margin-bottom:18px;">${inquiry.title}</p>

										<div>
											<p class="form-lable" style="margin-bottom:23px;">문의 내용</p>
											<p style="margin-bottom:18px;">${inquiry.content}</p>
										</div>
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
									<div class="main-boardList">
										<div>
											<p class="form-lable">답변 내용</p>
											<c:choose>
												<c:when test="${inquiry.answer eq 'N'}">
													<p>아직 답변이 등록되지 않았습니다.</p>
												</c:when>
												<c:when test="${inquiry.answer eq 'Y'}">
													<p>등록일</p>
													<p>${inquiry.answerDate}</p>
													<p>답변 내용</p>
													<p>${inquiry.answerContent}</p>
												</c:when>
											</c:choose>
										</div>


									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="button-wrapper">
						<a href="#" onclick="history.back();" class="board-update-btn">뒤로가기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

</html>
