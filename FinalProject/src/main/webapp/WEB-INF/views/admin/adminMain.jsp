<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/admin/common/head.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js">></script>
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
							<p class="font30px bottomMargin20 topMargin20">Admin</p>
							<!-- admin Main -->
							<div class="adminMain bottomMargin20 direction1 borderDefault">
								<p class="font30px paddingDefault">Summary</p>
								<div class="direction2 justifyAround">
									<span class="direction1"> <img src="/resources/uploads/member/icon/door-open-fill.svg" alt="" class="iconItem"> <small class="iconSmall">전체 방문자</small>
										<h3 class="iconFont">${visitCount}</h3>
									</span> <span class="direction1"> <img src="/resources/uploads/member/icon/clipboard2-check.svg" alt="" class="iconItem"> <small class="iconSmall">전체 게시글</small>
										<h3 class="iconFont">${totalBoard}</h3>
									</span> <span class="direction1"> <img src="/resources/uploads/member/icon/box.svg" alt="" class="iconItem"> <small class="iconSmall">전체 프로젝트</small>
										<h3 class="iconFont">${projectCount}</h3>
									</span> <span class="direction1"> <img src="/resources/uploads/member/icon/cloud.svg" alt="" class="iconItem"> <small class="iconSmall">전체 문의사항</small>
										<h3 class="iconFont">${boardCount}</h3>
									</span> <span class="direction1"> <img src="/resources/uploads/member/icon/free-icon-siren-7437833.png" alt="" class="iconItem"> <small class="iconSmall">전체 신고 수</small>
										<h3 class="iconFont">${deCount}</h3>
									</span>
								</div>

							</div>
							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">방문자 현황</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard2 boxShadow borderDefault backWhite borderRadiusd2">
										<p>금일 방문자</p>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<li class="li1">No</li>
											<li class="li1">icon</li>
											<li class="li2">Name</li>
											<li class="li2">Login howr</li>
										</ul>
										<ul class="ulSize">
											<c:choose>
												<c:when test="${!empty visitList}">
													<c:forEach var="item" items="${visitList}">
														<li class="borderDefault visitPadding justifyAround"><span class="li1">${item.no}</span> <img src="${item.path}${item.picture}" alt="" class="visitImgSize"> <span class="li2">${item.name }</span> <span class="li2">${item.loginDate}</span></li>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li class="borderDefault visitPadding justifyAround"><span>게시글이 없습니다.</span></li>
												</c:otherwise>
											</c:choose>
										</ul>
										<!-- pagination -->
										<!-- 죄측 화살표 -->
										<div class="pagination alignCenter">
											<c:choose>
												<c:when test="${pi1.cpage eq 1}">
													<a class="Margin5 borderRadius3 paginationBtn" href="#">&lt;</a>
												</c:when>
												<c:otherwise>
													<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=visit&cpage=${pi1.cpage-1}">&lt;</a>
												</c:otherwise>
											</c:choose>

											<c:forEach var="page" begin="${pi1.startPage}" end="${pi1.endPage}">
												<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=visit&cpage=${page}">${page}</a>
											</c:forEach>

											<c:choose>
												<c:when test="${pi1.cpage eq pi1.maxPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
												</c:when>
												<c:otherwise>
													<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=visit&cpage=${pi1.cpage + 1}">&gt;</a>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- paging 처리 -->
									</div>
									<div class="subCard2 boxShadow borderDefault backWhite borderRadiusd2" style="display:flex; justify-content:center;">
										<canvas id="doughnut-chart" width="250" height="140" style="max-width: 600px;"></canvas>
										<script>
											new Chart(document.getElementById("doughnut-chart"), {
											    type: 'doughnut',
											    data: {
											      labels: ["today", "week", "month", "total"],
											      datasets: [
											        {
											          label: "Population (millions)",
											          backgroundColor: ["#FFA07A", "#ADD8E6","#FFDAB9","#6A5ACD"],
											          data: [${day},${week},${month},${visitCount}]
											        }
											      ]
											    },
											    options: {
											      title: {
											        display: true,
											        text: '방문자 통계'
											      }
											    }
											});
										</script>
									</div>
								</div>
							</div>

							<div class="subCard direction2 justifyBet">
								<div class="subCard3 boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
									<p class="font20px subP whiteColor">정보 게시판</p>
									<div class="direction2 justifyAround alignCenter height80per">
										<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
											<p>최신 정보글</p>
											<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
												<li class="li1">No</li>
												<li class="li3">게시글 이름</li>
												<li class="li4">Creation time</li>
											</ul>
											<ul class="ulSize">
												<c:forEach var="item2" items="${infotList}">
													<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">${item2.infoNo}</span> <span class="li3">${item2.infoTitle}</span> <span class="li2">${item2.infoDate}</span></li>
												</c:forEach>
											</ul>
											<div class="pagination">
												<c:choose>
													<c:when test="${pi2.cpage eq 1}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&lt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=info&cpage=${pi2.cpage-1}">&lt;</a>
													</c:otherwise>
												</c:choose>

												<c:forEach var="page" begin="${pi2.startPage}" end="${pi2.endPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=info&cpage=${page}">${page}</a>
												</c:forEach>

												<c:choose>
													<c:when test="${pi2.cpage eq pi2.maxPage}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=info&cpage=${pi2.cpage + 1}">&gt;</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
								<div class="subCard3 boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
									<p class="font20px subP whiteColor">자유 게시판</p>
									<div class="direction2 justifyAround alignCenter height80per">
										<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
											<p>최신 정보글</p>
											<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
												<li class="li1">No</li>
												<li class="li3">게시글 이름</li>
												<li class="li4">Creation time</li>
											</ul>
											<ul class="ulSize">
												<c:forEach var="item3" items="${freeList}">
													<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">${item3.infoNo}</span> <span class="li3">${item3.infoTitle}</span> <span class="li2">${item3.infoDate}</span></li>
												</c:forEach>
											</ul>
											<div class="pagination">
												<c:choose>
													<c:when test="${pi3.cpage eq 1}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&lt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=free&cpage=${pi3.cpage-1}">&lt;</a>
													</c:otherwise>
												</c:choose>

												<c:forEach var="page" begin="${pi3.startPage}" end="${pi3.endPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=free&cpage=${page}">${page}</a>
												</c:forEach>

												<c:choose>
													<c:when test="${pi3.cpage eq pi3.maxPage}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminForm.do?status=free&cpage=${pi3.cpage + 1}">&gt;</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
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
</body>
</html>