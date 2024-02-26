<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/admin/common/head.jsp"%>
</head>

<body class="bodyBackColor">
	<%@ include file="/WEB-INF/views/admin/common/sidebar.jsp"%>
	<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>
	<!-- 카드 영역  -->
	<div class="cardSize mainCard">
		<div class="row">
			<div class="main-section">
				<div class="container-fluid">
					<div class="container-fluid">
						<!-- Card 안쪽 -->
						<div class="card cardSize alignCenter">
							<!-- 제목 -->
							<p class="font30px bottomMargin20 topMargin20">Declaration</p>
							<!-- 시작 -->
							<div class="direction1 justifyAround width100 bottomMargin20 alignCenter">
								<div class="direction2 justifyEve width100">
								<a href="/admin/adminDeclaration.do?status=today&cpage=1" class="card1 backColor1 direction1">
									<h1 class="fontTitle">금일 신고</h1>
									<h3 class="fontContent">${deTodayCount}</h3>
								</a>
								<a href="/admin/adminDeclaration.do?status=noneBlind&cpage=1" class="card1 backColor2 direction1">
									<h1 class="fontTitle">미처리 신고</h1>
									<h3 class="fontContent">${noneBlindCount}</h3>
								</a>
								<a href="/admin/adminDeclaration.do?status=blind&cpage=1" class="card1 backColor3 direction1">
									<h1 class="fontTitle">처리 신고</h1>
									<h3 class="fontContent">${blindCount}</h3>
								</a>
								<a href="/admin/adminDeclaration.do?status=total&cpage=1" class="card1 backColor4 direction1">
									<h1 class="fontTitle">Total</h1>
									<h3 class="fontContent">${deTotalCount}</h3>
								</a>
							</div>
							<input type="hidden" value="${status}" id="status">
							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">게시판 신고</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>게시판 신고</p>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">신고 내용</span>
											<span class="li4">Type</span>
											<span class="li4">신고자</span>
											<span class="li2">신고 날짜</span>
											<span class="li2">처리 여부</span>
<!-- 											<span class="li2"> <span class="li2">처리</span></span> -->
										</ul>
										<ul class="visitUlSize">
											<c:forEach var="item" items="${list}">
												<li class="borderDefault visitPadding justifyAround boardLiSize" onclick="declarationModal(${item.declarationNo})">
													<span class="li1">${item.declarationNo}</span>
													<span class="li3">${item.declarationContent}</span>
													<span class="li4">${item.declarationType}</span>
													<span class="li4">${item.declarationWriter}</span>
													<span class="li2">${item.declarationDate}</span>
													<span class="li2">${item.declarationWithdrawal}</span>
													
													<!-- modal 창 -->
													<div class="adminDeclarationModal direction1" id="declarationModal${item.declarationNo}">
											            <button class="exitBtn" onclick="declarationCloseModal()">X</button>
														<div class="modalCard">
															<div class="direction2 justifyAround">
																<h1 class="font1">작성 날짜 : ${item.declarationDate}</h1>
																<h1 class="font1">블라인드 여부 : ${item.declarationWithdrawal}</h1>
																<h1 class="font1">작성자 : ${item.declarationWriter}</h1>
															</div>
															<div class="width100 direction1 alignCenter">
																<div class="width100">
																	<h1 class="font3">Content</h1>
																</div>
																<div class="textContent">${item.declarationContent}</div>
															</div>
															<div class="justifyEnd">
																<span class="li2 ">
																	<button class="deleteBtn rightMargin10" onclick="declarationBlind('${item.declarationNo}')">블라인드</button>
																	<button class="deleteNoneBtn" onclick="declarationNoneBlind('${item.declarationNo}')">철회</button>
																</span>
															</div>
														</div>
													</div>
												</li>
											</ul>
											</c:forEach>
											<div class="pagination">
												<c:choose>
													<c:when test="${pi.cpage eq 1}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&lt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminDeclaration.do?status=${status}&cpage=${pi.cpage-1}">&lt;</a>
													</c:otherwise>
												</c:choose>

												<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="adminDeclaration.do?status=${status}&cpage=${page}">${page}</a>
												</c:forEach>

												<c:choose>
													<c:when test="${pi.cpage eq pi.maxPage}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminDeclaration.do?status=${status}&cpage=${pi.cpage + 1}">&gt;</a>
													</c:otherwise>
												</c:choose>
											</div>
									</div>
								</div>
								<!-- Card End -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>