<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<div class="direction1 justifyAround width100 bottomMargin20">
								<div class="direction2 justifyAround width100 bottomMargin20">
									<span class="direction1">
										<h3 class="iconFont">Total</h3>
										<h3 class="iconFont">40</h3>
									</span> <span class="direction1">
										<h3 class="iconFont">Declaration (Day)</h3>
										<h3 class="iconFont">10</h3>
									</span> <span class="direction1">
										<h3 class="iconFont">Declaration (Month)</h3>
										<h3 class="iconFont">30</h3>
									</span> <span class="direction1">
										<h3 class="iconFont">Blind</h3>
										<h3 class="iconFont">30</h3>
									</span> <span class="direction1">
										<h3 class="iconFont">Complete</h3>
										<h3 class="iconFont">30</h3>
									</span>

								</div>
							</div>

							<div
								class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">게시판 신고</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div
										class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>게시판 신고</p>
										<ul
											class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">게시판 이름</span>
											<span class="li4">작성자</span>
											<span class="li4">신고자</span>
											<span class="li2">신고 날짜</span>
											<span class="li2">처리 여부</span>
											<span class="li2"> <span class="Margin10">삭제</span> <span
												class="Margin10">정지</span>
											</span>
										</ul>
										<ul>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">나는 문어당~</span>
												<span class="li4">김창대</span> <span class="li4">이희수</span> <span
												class="li2">24.01.25</span> <span class="li2">N</span> <span
												class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">나는 문어당~</span>
												<span class="li4">김창대</span> <span class="li4">이희수</span> <span
												class="li2">24.01.25</span> <span class="li2">N</span> <span
												class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">나는 문어당~</span>
												<span class="li4">김창대</span> <span class="li4">이희수</span> <span
												class="li2">24.01.25</span> <span class="li2">N</span> <span
												class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">나는 문어당~</span>
												<span class="li4">김창대</span> <span class="li4">이희수</span> <span
												class="li2">24.01.25</span> <span class="li2">N</span> <span
												class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">나는 문어당~</span>
												<span class="li4">김창대</span> <span class="li4">이희수</span> <span
												class="li2">24.01.25</span> <span class="li2">N</span> <span
												class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">나는 문어당~</span>
												<span class="li4">김창대</span> <span class="li4">이희수</span> <span
												class="li2">24.01.25</span> <span class="li2">N</span> <span
												class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
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
								<p class="font20px subP whiteColor">User 신고</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div
										class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>User 신고</p>
										<ul
											class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">신고 제목</span>
											<span class="li4">피신고자</span>
											<span class="li4">신고자</span>
											<span class="li2">신고 날짜</span>
											<span class="li2">처리 여부</span>
											<span class="li2"> <span class="Margin10">삭제</span> <span
												class="Margin10">정지</span>
											</span>
										</ul>
										<ul>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">불법 유저
													신고합니다.</span> <span class="li4">박창대</span> <span class="li4">강나영</span>
												<span class="li2">24.01.25</span> <span class="li2">N</span>
												<span class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">불법 유저
													신고합니다.</span> <span class="li4">박창대</span> <span class="li4">강나영</span>
												<span class="li2">24.01.25</span> <span class="li2">N</span>
												<span class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">불법 유저
													신고합니다.</span> <span class="li4">박창대</span> <span class="li4">강나영</span>
												<span class="li2">24.01.25</span> <span class="li2">N</span>
												<span class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">불법 유저
													신고합니다.</span> <span class="li4">박창대</span> <span class="li4">강나영</span>
												<span class="li2">24.01.25</span> <span class="li2">N</span>
												<span class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">불법 유저
													신고합니다.</span> <span class="li4">박창대</span> <span class="li4">강나영</span>
												<span class="li2">24.01.25</span> <span class="li2">N</span>
												<span class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<li
												class="borderDefault visitPadding justifyAround boardLiSize">
												<span class="li1">5</span> <span class="li3">불법 유저
													신고합니다.</span> <span class="li4">박창대</span> <span class="li4">강나영</span>
												<span class="li2">24.01.25</span> <span class="li2">N</span>
												<span class="li2 ">
													<button class="deleteBtn rightMargin10">삭제</button>
													<button class="deleteBtn">정지</button>
											</span>
											</li>
											<div class="pagination">
												<a href="#">&lt;</a> <a href="#" class="active">1</a> <a
													href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a
													href="#">5</a> <a href="#">&gt;</a>
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
</body>
</html>