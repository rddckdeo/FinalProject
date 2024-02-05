<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
							<!-- admin Main -->
							<div class="adminMain bottomMargin20 direction1 borderDefault">
								<p class="font30px paddingDefault">Summary</p>
								<div class="direction2 justifyAround">
									<span class="direction1"> <img src="/resources/uploads/member/icon/door-open-fill.svg" alt="" class="iconItem"> <small class="iconSmall">전체 방문자</small>
										<h3 class="iconFont">11</h3>
									</span> <span class="direction1"> <img src="/resources/uploads/member/icon/clipboard2-check.svg" alt="" class="iconItem"> <small class="iconSmall">전체 게시글</small>
										<h3 class="iconFont">35</h3>
									</span> <span class="direction1"> <img src="/resources/uploads/member/icon/box.svg" alt="" class="iconItem"> <small class="iconSmall">전체 프로젝트</small>
										<h3 class="iconFont">5</h3>
									</span> <span class="direction1"> <img src="/resources/uploads/member/icon/cloud.svg" alt="" class="iconItem"> <small class="iconSmall">전체 문의사항</small>
										<h3 class="iconFont">20</h3>
									</span> <span class="direction1"> <img src="/resources/uploads/member/icon/free-icon-siren-7437833.png" alt="" class="iconItem"> <small class="iconSmall">전체 신고 수</small>
										<h3 class="iconFont">3</h3>
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
										<ul>
											<li class="borderDefault visitPadding justifyAround"><span class="li1">5</span> <img src="../../image/google.png" alt="" class="visitImgSize"> <span class="li2">김창대</span> <span class="li2">16:17:52</span></li>
											<li class="borderDefault visitPadding justifyAround"><span class="li1">4</span> <img src="../../image/profile/user4.jpg" alt="" class="visitImgSize"> <span class="li2">김창대</span> <span class="li2">16:17:52</span></li>
											<li class="borderDefault visitPadding justifyAround"><span class="li1">3</span> <img src="../../image/profile/user1.jpg" alt="" class="visitImgSize"> <span class="li2">김창대</span> <span class="li2">16:17:52</span></li>
											<li class="borderDefault visitPadding justifyAround"><span class="li1">2</span> <img src="../../image/profile/user2.jpg" alt="" class="visitImgSize"> <span class="li2">김창대</span> <span class="li2">16:17:52</span></li>
											<li class="borderDefault visitPadding justifyAround"><span class="li1">1</span> <img src="../../image/profile/user3.jpg" alt="" class="visitImgSize"> <span class="li2">김창대</span> <span class="li2">16:17:52</span></li>

											<div class="pagination">
												<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
											</div>
										</ul>
									</div>
									<div class="subCard2 boxShadow borderDefault backWhite borderRadiusd2">
										<p>방문자 통계</p>
										<div>그래프 들어갈 자리</div>

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
											<ul>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">4</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">3</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">2</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">1</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>

												<div class="pagination">
													<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
												</div>
											</ul>
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
											<ul>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">4</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">3</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">2</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>
												<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">1</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자</span> <span class="li2">16:17:52</span></li>

												<div class="pagination">
													<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
												</div>
											</ul>
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
	</div>

</body>
</html>