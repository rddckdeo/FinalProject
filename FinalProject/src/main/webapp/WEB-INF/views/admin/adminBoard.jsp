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
	<!-- header 영역 -->
	<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>
	<!-- 카드 영역  -->
	<div class="cardSize2 mainCard">
		<div class="row">
			<div class="main-section">
				<div class="container-fluid">
					<div class="container-fluid">
						<!-- Card 안쪽 -->
						<div class="card cardSize2 alignCenter">
							<!-- 제목 -->
							<p class="font30px bottomMargin20 topMargin20">Board</p>
							<!-- 시작 -->
							<div class="direction2 justifyEve width100">
								<a href="/admin/adminBoard.do?status=info&cpage=1" class="card1 backColor1 direction1">
									<h1 class="fontTitle">정보게시판</h1>
									<h3 class="fontContent">금일 작성 : 00</h3>
								</a>
								<a href="/admin/adminBoard.do?status=infoComment&cpage=1" class="card1 backColor2 direction1">
									<h1 class="fontTitle">정보게시판 댓글</h1>
									<h3 class="fontContent">금일 작성 : 00</h3>
								</a>
								<a href="/admin/adminBoard.do?status=free&cpage=1" class="card1 backColor3 direction1">
									<h1 class="fontTitle">자유게시판</h1>
									<h3 class="fontContent">금일 작성 : 00</h3>
								</a>
								<a href="/admin/adminBoard.do?status=freeComment&cpage=1" class="card1 backColor4 direction1">
									<h1 class="fontTitle">자유게시판 댓글</h1>
									<h3 class="fontContent">금일 작성 : 00</h3>
								</a>
							</div>
							<!-- 게시판 시작 -->
							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">List</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<div class="direction2 justifyBet">
											<p>게시판</p>
										</div>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<li class="li1">No</li>
											<li class="li1">작성자</li>
											<li class="li3">제목</li>
											<li class="li1">ID</li>
											<li class="li2">작성 날짜</li>
											<li class="li1">삭제</li>
										</ul>
										<ul class="visitUlSize">
											<c:forEach var="item" items="${totalList}">
												<li class="borderDefault visitPadding justifyAround">
	                                                <span class="li1">${item.no}</span>
	                                                <span class="li1">${item.name}</span>
	                                                <span class="li3">${item.title}</span>
	                                                <span class="li1">${item.id}</span>
	                                                <span class="li2">${item.inDate}</span>
	                                                <span class="li1"><button value="${item.no}" class="deleteBtn" onclick="deleteBtn(this.value)">삭제</button></span>
	                                            </li>
                                            </c:forEach>
										</ul>
										<div class="pagination">
											<c:choose>
												<c:when test="${pi1.cpage eq 1}">
													<a class="Margin5 borderRadius3 paginationBtn" href="#">&lt;</a> 
												</c:when>
												<c:otherwise>
													<a class="Margin5 borderRadius3 paginationBtn" href="adminMember.do?status=total&cpage=${pi1.cpage-1}">&lt;</a> 
												</c:otherwise>
											</c:choose>
												
											<c:forEach var="page" begin="${pi1.startPage}" end="${pi1.endPage}">
												<a class="Margin5 borderRadius3 paginationBtn" href="adminMember.do?status=total&cpage=${page}">${page}</a>
											</c:forEach>
												
											<c:choose>
												<c:when test="${pi1.cpage eq pi1.maxPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
												</c:when>
												<c:otherwise>
													<a class="Margin5 borderRadius3 paginationBtn" href="adminMember.do?status=total&cpage=${pi1.cpage + 1}">&gt;</a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
							<!-- 게시판 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>