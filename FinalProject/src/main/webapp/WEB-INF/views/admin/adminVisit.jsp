<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>admin</title>
<link href="/resources/css/member/default.css" rel="stylesheet">
<link href="/resources/css/common/styles.min.css" rel="stylesheet">
<link href="/resources/css/admin/admin.css" rel="stylesheet">
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
							<div class="direction2 justifyAround width100 bottomMargin20">

								<span class="direction1">
									<h3 class="iconFont">Day</h3>
									<h3 class="iconFont">10</h3>
								</span> <span class="direction1">
									<h3 class="iconFont">Week</h3>
									<h3 class="iconFont">30</h3>
								</span> <span class="direction1">
									<h3 class="iconFont">Month</h3>
									<h3 class="iconFont">40</h3>
								</span> <span class="direction1">
									<h3 class="iconFont">Total</h3>
									<h3 class="iconFont">50</h3>
								</span>
							</div>

							<div
								class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">방문자 통계</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div
										class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										그래프 들어갈 자리</div>
								</div>



								<!-- Card End -->
							</div>
							<div
								class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">방문자 현황</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div
										class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>방문자</p>
										<ul
											class="direction2 noMargin justifyAround visitPadding borderDefault">
											<li class="li1">No</li>
											<li class="li1">Icon</li>
											<li class="li1">Name</li>
											<li class="li2">ID</li>
											<li class="li1">NickName</li>
											<li class="li2">Login howr</li>
										</ul>
										<ul>

											<li class="borderDefault visitPadding justifyAround"><span
												class="li1">6</span> <span class="li1"><img
													src="../../image/google.png" alt="" class="visitImgSize"></span>
												<span class="li1">김창대</span> <span class="li2">rddckdeo</span>
												<span class="li1">대짬뽕</span> <span class="li2">16:17:52</span>
											</li>
											<li class="borderDefault visitPadding justifyAround"><span
												class="li1">6</span> <span class="li1"><img
													src="../../image/google.png" alt="" class="visitImgSize"></span>
												<span class="li1">김창대</span> <span class="li2">rddckdeo</span>
												<span class="li1">대짬뽕</span> <span class="li2">16:17:52</span>
											</li>
											<li class="borderDefault visitPadding justifyAround"><span
												class="li1">6</span> <span class="li1"><img
													src="../../image/google.png" alt="" class="visitImgSize"></span>
												<span class="li1">김창대</span> <span class="li2">rddckdeo</span>
												<span class="li1">대짬뽕</span> <span class="li2">16:17:52</span>
											</li>
											<li class="borderDefault visitPadding justifyAround"><span
												class="li1">6</span> <span class="li1"><img
													src="../../image/google.png" alt="" class="visitImgSize"></span>
												<span class="li1">김창대</span> <span class="li2">rddckdeo</span>
												<span class="li1">대짬뽕</span> <span class="li2">16:17:52</span>
											</li>
											<li class="borderDefault visitPadding justifyAround"><span
												class="li1">6</span> <span class="li1"><img
													src="../../image/google.png" alt="" class="visitImgSize"></span>
												<span class="li1">김창대</span> <span class="li2">rddckdeo</span>
												<span class="li1">대짬뽕</span> <span class="li2">16:17:52</span>
											</li>
											<li class="borderDefault visitPadding justifyAround"><span
												class="li1">6</span> <span class="li1"><img
													src="../../image/google.png" alt="" class="visitImgSize"></span>
												<span class="li1">김창대</span> <span class="li2">rddckdeo</span>
												<span class="li1">대짬뽕</span> <span class="li2">16:17:52</span>
											</li>


											<div class="pagination">
												<a href="#">&lt;</a> <a href="#" class="active">1</a> <a
													href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a
													href="#">5</a> <a href="#">&gt;</a>
											</div>
										</ul>
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