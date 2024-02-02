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
	<!-- header 영역 -->
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
							<p class="font30px bottomMargin20 topMargin20">Board</p>
							<!-- 시작 -->
							<div class="direction1 justifyAround width100 bottomMargin20">
								<!-- 구분 문자 -->
								<span class="alignCenter leftMargin40">
									<h1 class="font20px ">정보게시판</h1>
								</span>
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
								<span class="alignCenter leftMargin40">
									<h1 class="font20px">자유게시판</h1>
								</span>
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
							</div>

							<div
								class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">정보게시판</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div
										class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>최신 정보게시판</p>
										<ul
											class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">문의 제목</span>
											<span class="li4">작성자</span>
											<span class="li2">작성 시간</span>
											<span class="li2">삭제</span>
										</ul>
										<ul>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
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
							<div
								class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">자유게시판</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div
										class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>최신 자유게시판</p>
										<ul
											class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">문의 제목</span>
											<span class="li4">작성자</span>
											<span class="li2">작성 시간</span>
											<span class="li2">삭제</span>
										</ul>
										<ul>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">게시글
													어쩌구저쩌구 이것저것 적어보자 으아아앙</span> <span class="li4">김창대</span> <span
												class="li2">16:17:52</span> <span class="li2">
													<button class="deleteBtn">삭제</button>
											</span>
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