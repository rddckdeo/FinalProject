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
										<h3 class="iconFont">10</h3>
									</span> <span class="direction1">
										<h3 class="iconFont">Start Project</h3>
										<h3 class="iconFont">30</h3>
									</span> <span class="direction1">
										<h3 class="iconFont">Complete Project</h3>
										<h3 class="iconFont">40</h3>
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
										<ul>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">Colaboration Code</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>



											<div class="pagination">
												<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
											</div>
										</ul>
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
											<span class="li4">팀장</span>
											<span class="li2">참가 인원</span>
											<span class="li2">생성 날짜</span>
											<span class="li2">프로젝트 기간</span>
											<span class="li2">삭제</span>
										</ul>
										<ul>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">Colaboration Code</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>



											<div class="pagination">
												<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
											</div>
										</ul>
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
											<span class="li4">팀장</span>
											<span class="li2">참가 인원</span>
											<span class="li2">생성 날짜</span>
											<span class="li2">프로젝트 기간</span>
											<span class="li2">삭제</span>
										</ul>
										<ul>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">Colaboration Code</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>
											<li class="borderDefault visitPadding justifyAround boardLiSize"><span class="li1">5</span> <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span class="li2">4명</span> <span class="li2">24.01.25</span> <span class="li2">1 Month</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span></li>



											<div class="pagination">
												<a href="#">&lt;</a> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">&gt;</a>
											</div>
										</ul>
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