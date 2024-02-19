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
									<h1 class="card-project-name bottomMargin20">내 정보</h1>
									<!-- card body -->
									<div class="card-body height500 direction1"
										style="padding-top: 0;">
										<div>
											<img src="${sessionScope.path}${sessionScope.picture}"
												alt="Profile picture" class="profileImg">
										</div>
										<!-- id -->
										<div class="myInfo direction2 alignCenter bottomMargin20">
											<p class="leftMargin20">소개글 :</p>
											<c:choose>
												<c:when test="${!empty intro}">
													<p class="leftMargin20">${intro}</p>
												</c:when>
												<c:otherwise>
													<p class="leftMargin20">소개글이 없습니다. 소개글을 작성해주세요.</p>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- id -->
										<div class="myInfo direction2 alignCenter bottomMargin20">
											<p class="leftMargin20">ID :</p>
											<p class="leftMargin20">${id}</p>
										</div>
										<!-- id -->
										<div class="myInfo direction2 alignCenter bottomMargin20">
											<p class="leftMargin20">이름 :</p>
											<p class="leftMargin20">${name}</p>
										</div>
										<!-- id -->
										<div class="myInfo direction2 alignCenter bottomMargin20">
											<p class="leftMargin20">닉네임 :</p>
											<p class="leftMargin20">${nickname}</p>
										</div>
										<!-- id -->
										<div class="myInfo direction2 alignCenter bottomMargin20">
											<p class="leftMargin20">E-mail :</p>
											<p class="leftMargin20">${email}</p>
										</div>
										<!-- id -->
										<div class="myInfo direction2 alignCenter bottomMargin20">
											<p class="leftMargin20">휴대폰 번호 :</p>
											<p class="leftMargin20">${number}</p>
										</div>
										<h1 class="font20px bottomMargin20">희망직무 및 기술스택</h1>
										<div class="myInfo bottomMargin20 padding30">
											<c:forEach var="hopeItem" items="${hopeList}">
												<div class="direction2">
													<p class="infoStack defaultMargin">${hopeItem}</p>
												</div>
											</c:forEach>
											<c:forEach var="stackItem" items="${stackList}">
												<div class="direction2">
													<p class="infoStack defaultMargin">${stackItem}</p>
												</div>
											</c:forEach>
										</div>
										<a class="btn btn-outline-secondary"
											href="/mypage/editProfile.do">수정하기</a>


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