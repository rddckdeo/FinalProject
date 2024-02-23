<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="../../../../resources/css/board/common/template.css" />
<link rel="stylesheet"
	href="../../../../resources/css/board/info/infoBoard.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
</head>
<style>
a.disabled {
	pointer-events: none;
	color: gray;
}
</style>
<body>
	<!-- 전체 구조 -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- 페이지 완쪽 사이드바 영역-->
		<jsp:include page="../common/nav.jsp" />

		<!-- 페이지 오른쪽 컨텐츠 영역 -->
		<div class="body-wrapper">
			<!-- 헤더 영역 -->
			<jsp:include page="../common/header.jsp" />
			<div class="container-fluid">
				<!-- 검색창 -->
				<jsp:include page="../common/search.jsp" />
			</div>
			<div class="row">
				<div class="categoryNavigation-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="categoryNavigation-div">
								<div class="categoryNavigation">
									<p>정보게시판</p>
									<c:if test="${not empty categoryName}">
										<p>|</p>
										<p>${categoryName}</p>
									</c:if>
								</div>
								<div class="button-wrapper">
									<a href="/info/registr" class="board-update-btn"
										onclick="return checkLogin()">작성하기</a>

									<form id="sortForm" action="/info/category" method="get">
										<li class="nav-item dropdown">
											<button class="nav-link dropdown-toggle toggle-btn"
												id="dropdownMenuButton" role="button"
												data-bs-toggle="dropdown" aria-expanded="false">
												<img class="sort-img"
													src="../../../../resources/uploads/icon/Sort.png"
													alt="정렬 이미지">
											</button>
											<ul class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<li><a class="dropdown-item"
													onclick="submitSortForm('date')">최신순</a></li>
												<li><a class="dropdown-item"
													onclick="submitSortForm('comments')">댓글순</a></li>
												<li><a class="dropdown-item"
													onclick="submitSortForm('views')">조회순</a></li>
											</ul>
										</li> <input id="sortType" type="hidden" name="sortType">
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="main-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="card">
								<h1 class="card-project-name">정보게시판</h1>

								<c:choose>
									<c:when test="${empty posts}">
										<p
											style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
											게시물이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<!-- 게시글 -->
										<c:forEach var="post" items="${posts}">

											<div class="main-boardList">
												<c:choose>
													<c:when test="${post.infoBlind eq 'Y'}">
														<div class="main-boardList-info">
															<p>블라인드 처리된 글입니다.</p>
														</div>
													</c:when>
													<c:otherwise>


														<div class="main-boardList-info">

															<div>
																<img
																	src="../../../..${post.imageFileName}${post.imageFilePath}"
																	alt="프로필" width="30" height="30">

																<p class="main-boardList-info-text">${post.nickname}</p>
																<p class="main-boardList-info-text">|</p>
																<p class="main-boardList-info-text">${post.infoDate}</p>

															</div>

														</div>

														<div class="main-boardList-title">
															<a href="/info/infoDtail/${post.infoNo}">${post.infoTitle}</a>
														</div>

														<div class="main-boardList-bottm-div">

															<div class="main-boardList-tag">

																<c:if test="${not empty post.infoTag1}">
																	<p class="tag-div">#${post.infoTag1}</p>
																</c:if>

																<c:if test="${not empty post.infoTag2}">
																	<p class="tag-div">#${post.infoTag2}</p>
																</c:if>

																<c:if test="${not empty post.infoTag3}">
																	<p class="tag-div">#${post.infoTag3}</p>
																</c:if>

															</div>

															<div class="main-comment-section">

																<div class="main-project-comment">
																	<img
																		src="../../../../resources/uploads/icon/message.png"
																		alt="message" width="20" height="20"
																		class="main-project-comment-text">
																	<p class="main-project-comment-text">${post.commentCount}</p>
																</div>

																<div class="main-project-comment">
																	<img src="../../../../resources/uploads/icon/views.png"
																		alt="message" width="20" height="20"
																		class="main-project-comment-text">
																	<p class="main-project-comment-text">
																		${post.infoViews}</p>
																</div>

															</div>

														</div>
													</c:otherwise>
												</c:choose>
											</div>

											<div class="card-project-hr-div">
												<hr class="card-project-hr">
											</div>

										</c:forEach>

									</c:otherwise>
								</c:choose>

								<!-- 페이지네이션 -->
								<div class="pagination" id="pagination">
									<div>
										<c:if test="${totalPosts > 0}">
											<a
												href="/info/category?name=${categoryName}&sortType=${sortType}&page=${currentPage - 1}"
												class="${currentPage == 1 ? 'disabled' : ''}">&lt;</a>

											<c:forEach var="i" begin="1" end="${totalPages}">
												<c:choose>
													<c:when test="${i == currentPage}">
														<a
															href="/info/category?name=${categoryName}&sortType=${sortType}&page=${i}"
															class="active">${i}</a>
													</c:when>
													<c:otherwise>
														<a
															href="/info/category?name=${categoryName}&sortType=${sortType}&page=${i}">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>

											<a
												href="/info/category?name=${categoryName}&sortType=${sortType}&page=${currentPage + 1}"
												class="${currentPage == totalPages ? 'disabled' : ''}">&gt;</a>
										</c:if>
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
<script>
	$(document).ready(function() {

		//정렬 클릭 막기 
		$('#dropdownMenuButton').click(function(e) {
			e.preventDefault();
			e.stopPropagation();
		});

		$('.dropdown-menu a').click(function() {
			var type = $(this).data('type');
			$('#sortType').val(type);
		});

		// URL에서 정렬 옵션 가져오기
		var urlParams = new URLSearchParams(window.location.search);
		var sortType = urlParams.get('sortType') || 'views'; // 첫 페이지 로드시 기본 정렬 옵션은 조회순

		// 페이지 이동 링크에 현재 정렬 옵션 추가
		$('a.page-link').each(function() {
			var href = $(this).attr('href');
			var url = new URL(href, window.location.origin);
			url.searchParams.set('sortType', sortType);
			$(this).attr('href', url.toString());
		});

		// 정렬 옵션에 따른 텍스트 설정
		var sortText;
		switch (sortType) {
		case 'date':
			sortText = '최신순';
			break;
		case 'comments':
			sortText = '댓글순';
			break;
		case 'views':
			sortText = '조회순';
			break;
		default:
			sortText = '정렬';
		}

		// '정렬' 텍스트 대신 사용자가 선택한 정렬 옵션 텍스트 노출
		$('.toggle-btn').append(sortText);

		// 정렬 옵션 클릭 이벤트
		$('.dropdown-item').on('click', function() {
			var clickedSortType = $(this).text();
			switch (clickedSortType) {
			case "최신순":
				sortType = 'date';
				break;
			case "댓글순":
				sortType = 'comments';
				break;
			case "조회순":
				sortType = 'views';
				break;
			default:
				sortType = 'date';
			}

			// 클릭한 정렬 옵션을 URL에 반영
			urlParams.set('sortType', sortType);
			window.location.search = urlParams.toString();
		});
	});
</script>

<script>
	function checkLogin() {
		// 세션에 no가 없을때(비로그인)
<%if (session.getAttribute("no") == null) {%>
	alert('로그인 후 이용해주세요.');
		location.href = '/member/loginForm.do'; // 로그인 페이지로 리다이렉트
		return false;
<%} else {%>
	return true;
<%}%>
	}
</script>




</html>
