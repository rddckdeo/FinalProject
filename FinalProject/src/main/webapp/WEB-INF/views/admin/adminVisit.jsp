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
							<p class="font30px bottomMargin20 topMargin20">방문자 현황</p>
							<div class="direction2 justifyAround width100 bottomMargin20">

								<span class="direction1">
									<h3 class="iconFont">Day</h3>
									<h3 class="iconFont">${day}</h3>
								</span> <span class="direction1">
									<h3 class="iconFont">Week</h3>
									<h3 class="iconFont">${week}</h3>
								</span> <span class="direction1">
									<h3 class="iconFont">Month</h3>
									<h3 class="iconFont">${month}</h3>
								</span> <span class="direction1">
									<h3 class="iconFont">Total</h3>
									<h3 class="iconFont">${total}</h3>
								</span>
							</div>

							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">방문자 통계</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<canvas id="bar-chart-horizontal" width="600" height="200" style="max-height:350px;"></canvas>
										<script>
											new Chart(document.getElementById("bar-chart-horizontal"), {
										    type: 'horizontalBar',
										    data: {
										      labels: ["","today", "week", "month", "total"],
										      datasets: [
										        {
										          label: "Population (millions)",
										          backgroundColor: ["#3e95cd","#3e95cd","#c45850","#3cba9f","#8e5ea2"],
										          data: [0,${day},${week},${month},${total}]
										        }
										      ]
										    },
										    options: {
										      legend: { display: false },
										      title: {
										        display: true,
										        text: '방문자 통계'
										      }
										    }
										});
										</script>
									</div>
								</div>



								<!-- Card End -->
							</div>
							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">방문자 현황</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>방문자</p>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<li class="li1">No</li>
											<li class="li1">Icon</li>
											<li class="li1">Name</li>
											<li class="li2">ID</li>
											<li class="li1">NickName</li>
											<li class="li0">Login howr</li>
											<li class="li0">Login Day</li>
										</ul>
										<ul class="visitUlSize">
											<!-- 방문자 현황 -->
											<c:forEach var="item" items="${visitList}">
												<li class="borderDefault visitPadding justifyAround">
													<span class="li1">${item.no}</span> 
													<span class="li1">
														<img src="${item.path}${item.picture}" alt="" class="visitImgSize">
													</span> 
													<span class="li1">${item.name}</span>
													<span class="li2">${item.id}</span> 
													<span class="li1">${item.nickname}</span> 
													<span class="li0">${item.loginDate}</span>
													<span class="li0">${item.loginDay}</span>
												</li>
											</c:forEach>
										</ul>
											<div class="pagination">
												<c:choose>
													<c:when test ="${piVisit.cpage eq 1}">
														<a href="#" class="Margin5 borderRadius3 paginationBtn">&lt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminVisit.do?cpage=${piVisit.cpage-1}">&lt;</a>
													</c:otherwise>
												</c:choose>
												<c:forEach var="page" begin="${piVisit.startPage}" end="${piVisit.endPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="adminVisit.do?cpage=${page}" class="active">${page}</a>
												</c:forEach>
												<c:choose>
													<c:when test="${piVisit.cpage eq piVisit.maxPage}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminVisit.do?cpage=${piVisit.cpage + 1}">&gt;</a>
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