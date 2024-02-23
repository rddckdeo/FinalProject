<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>admin</title>
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
							<p class="font30px bottomMargin20 topMargin20">Project</p>
							<!-- 시작 -->
							<div class="direction1 justifyAround width100 bottomMargin20">
								<div class="direction2 justifyAround width100 bottomMargin20">
									<span class="direction1">
										<h3 class="iconFont">Create Project</h3>
										<h3 class="iconFont">${np}</h3>
									</span> <span class="direction1">
										<h3 class="iconFont">Start Project</h3>
										<h3 class="iconFont">${sp}</h3>
									</span> <span class="direction1">
										<h3 class="iconFont">Complete Project</h3>
										<h3 class="iconFont">${ep}</h3>
									</span>
								</div>
							</div>

							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">모집 프로젝트</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>모집 프로젝트</p>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">프로젝트 이름</span>
											<span class="li2">참가 인원</span>
											<span class="li2">생성 날짜</span>
											<span class="li2">프로젝트 기간</span>
											<span class="li2">삭제</span>
										</ul>
										<ul class="visitUlSize">
											<c:forEach var="item" items="${newProjectList}">
												<li class="borderDefault visitPadding justifyAround boardLiSize">
													<span class="li1">${item.no}</span> 
													<span class="li3">${item.name}</span> 
													<span class="li2">${item.personCount}</span>
													<span class="li2">${item.startDate}</span>
													<span class="li2">${item.period}</span> 
													<span class="li2">
														<button value='{"no": "${item.no}", "status": "n"}' class="deleteBtn" onclick="projectDeleteBtn(this.value)">삭제</button>
													</span>
												</li>
											</c:forEach>
										</ul>
											<div class="pagination">
												<c:choose>
													<c:when test ="${pi1.cpage eq 1}">
														<a href="#" class="Margin5 borderRadius3 paginationBtn">&lt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=n&cpage=${pi1.cpage-1}">&lt;</a>
													</c:otherwise>
												</c:choose>
												<c:forEach var="page" begin="${pi1.startPage}" end="${pi1.endPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=n&cpage=${page}" class="active">${page}</a>
												</c:forEach>
												<c:choose>
													<c:when test="${pi1.cpage eq pi1.maxPage}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=n&cpage=${pi1.cpage + 1}">&gt;</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								<!-- Card End -->
							</div>
							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">진행중인 프로젝트</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>진행중인 프로젝트</p>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">프로젝트 이름</span>
											<span class="li2">참가 인원</span>
											<span class="li2">생성 날짜</span>
											<span class="li2">프로젝트 기간</span>
											<span class="li2">삭제</span>
										</ul>
										<ul class="visitUlSize">
											<c:forEach var="item" items="${startProjectList}">
												<li class="borderDefault visitPadding justifyAround boardLiSize">
													<span class="li1">${item.no}</span> 
													<span class="li3">${item.name}</span> 
													<span class="li2">${item.personCount}</span> 
													<span class="li2">${item.startDate}</span> 
													<span class="li2">${item.period}</span> 
													<span class="li2">
														<button value='{"no": "${item.no}", "status": "c"}' class="deleteBtn" onclick="projectDeleteBtn(this.value)">삭제</button>
													</span>
												</li>
											</c:forEach>
										</ul>
										<div class="pagination">
											<c:choose>
												<c:when test ="${pi2.cpage eq 1}">
													<a href="#" class="Margin5 borderRadius3 paginationBtn">&lt;</a>
												</c:when>
												<c:otherwise>
													<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=s&cpage=${pi2.cpage-1}">&lt;</a>
												</c:otherwise>
											</c:choose>
											<c:forEach var="page" begin="${pi2.startPage}" end="${pi2.endPage}">
												<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=s&cpage=${page}" class="active">${page}</a>
											</c:forEach>
											<c:choose>
												<c:when test="${pi2.cpage eq pi2.maxPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
												</c:when>
												<c:otherwise>
													<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=s&cpage=${pi2.cpage + 1}">&gt;</a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<!-- Card End -->
								</div>
							</div>
							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">완료된 프로젝트</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>완료된 프로젝트</p>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">프로젝트 이름</span>
											<span class="li2">참가 인원</span>
											<span class="li2">생성 날짜</span>
											<span class="li2">프로젝트 기간</span>
											<span class="li2">삭제</span>
										</ul>
										<ul class="visitUlSize">
											<c:forEach var="item" items="${endProjectList}">
												<li class="borderDefault visitPadding justifyAround boardLiSize">
													<span class="li1">${item.no}</span>
													<span class="li3">${item.name}</span>
													<span class="li2">${item.personCount}</span>
													<span class="li2">${item.startDate}</span>
													<span class="li2">${item.period}</span>
													<span class="li2">
														<button value='{"no": "${item.no}", "status": "y"}' class="deleteBtn" onclick="projectDeleteBtn(this.value)">삭제</button>
													</span>
												</li>
											</c:forEach>
										</ul>
										<div class="pagination">
											<c:choose>
												<c:when test ="${pi3.cpage eq 1}">
													<a href="#" class="Margin5 borderRadius3 paginationBtn">&lt;</a>
												</c:when>
												<c:otherwise>
													<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=e&cpage=${pi3.cpage-1}">&lt;</a>
												</c:otherwise>
											</c:choose>
											<c:forEach var="page" begin="${pi3.startPage}" end="${pi3.endPage}">
												<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=e&cpage=${page}" class="active">${page}</a>
											</c:forEach>
											<c:choose>
												<c:when test="${pi3.cpage eq pi3.maxPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
												</c:when>
												<c:otherwise>
													<a class="Margin5 borderRadius3 paginationBtn" href="adminProject.do?status=e&cpage=${pi3.cpage + 1}">&gt;</a>
												</c:otherwise>
											</c:choose>
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
	</div>
</body>
</html>