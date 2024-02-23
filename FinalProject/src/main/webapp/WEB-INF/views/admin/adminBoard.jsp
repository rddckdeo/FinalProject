<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/admin/common/head.jsp"%>
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
									<h3 class="fontContent">금일 작성 : ${info}</h3>
								</a>
								<a href="/admin/adminBoard.do?status=infoComment&cpage=1" class="card1 backColor2 direction1">
									<h1 class="fontTitle">정보게시판 댓글</h1>
									<h3 class="fontContent">금일 작성 : ${infoComment}</h3>
								</a>
								<a href="/admin/adminBoard.do?status=free&cpage=1" class="card1 backColor3 direction1">
									<h1 class="fontTitle">자유게시판</h1>
									<h3 class="fontContent">금일 작성 : ${free}</h3>
								</a>
								<a href="/admin/adminBoard.do?status=freeComment&cpage=1" class="card1 backColor4 direction1">
									<h1 class="fontTitle">자유게시판 댓글</h1>
									<h3 class="fontContent">금일 작성 : ${freeComment}</h3>
								</a>
							</div>
							<!-- 게시판 시작 -->
							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
							<input type="hidden" value="${status}" id="status">
								<c:choose>
									<c:when test="${empty title}">
										<p class="font20px subP whiteColor">버튼을 클릭해주세요</p>
									</c:when>
									<c:otherwise>
										<p class="font20px subP whiteColor">${title}</p>
									</c:otherwise>
								</c:choose>
								<div class="direction2 justifyAround alignCenter height80per">
									
											<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
												<div class="direction2 justifyBet">
													<p>게시판</p>
												</div>
												<c:choose>
												    <c:when test="${status eq 'infoComment' || status eq 'freeComment'}">
												        <!-- 댓글 목록 -->
												        <ul class="direction2 noMargin justifyAround visitPadding borderDefault">
												            <li class="li1">댓글 No</li>
												            <li class="li1">게시글 No</li>
												            <li class="li1">작성자</li>
												            <li class="li1">ID</li>
												            <li class="li3">내용</li>
												            <li class="li2">작성 날짜</li>
												            <li class="li1">삭제</li>
												        </ul>
												        <ul class="visitUlSize">
												            <c:forEach var="item" items="${list}">
												                <li class="borderDefault visitPadding justifyAround">
												                    <span class="li1">${item.commentNo}</span>
												                    <span class="li1">${item.boardNo}</span>
												                    <span class="li1">${item.name}</span>
												                    <span class="li1">${item.id}</span>
												                    <span class="li3">${item.content}</span>
												                    <span class="li2">${item.date}</span>
												                    <span class="li1"><button value="${item.commentNo}" class="deleteBtn" onclick="boardDeleteBtn(this.value)">삭제</button></span>
												                    
												                </li>
												            </c:forEach>
												        </ul>
												    </c:when>
												    <c:otherwise>
												        <!-- 게시글 목록 -->
												        <ul class="direction2 noMargin justifyAround visitPadding borderDefault">
												            <li class="li1">No</li>
												            <li class="li1">작성자</li>
												            <li class="li3">제목</li>
												            <li class="li1">ID</li>
												            <li class="li2">작성 날짜</li>
												            <li class="li1">삭제</li>
												        </ul>
												        <ul class="visitUlSize">
												            <c:forEach var="item" items="${list}">
												                <li class="borderDefault visitPadding justifyAround">
												                    <span class="li1">${item.boardNo}</span>
												                    <span class="li1">${item.name}</span>
												                    <span class="li3">${item.title}</span>
												                    <span class="li1">${item.id}</span>
												                    <span class="li2">${item.date}</span>
												                    <span class="li1"><button value="${item.boardNo}" class="deleteBtn" onclick="boardDeleteBtn(this.value)">삭제</button></span>
												                </li>
												            </c:forEach>
												        </ul>
												    </c:otherwise>
												</c:choose>
												<div class="pagination">
													<c:choose>
														<c:when test="${pi.cpage eq 1}">
															<a class="Margin5 borderRadius3 paginationBtn" href="#">&lt;</a> 
														</c:when>
														<c:otherwise>
															<a class="Margin5 borderRadius3 paginationBtn" href="adminBoard.do?status=${status}&cpage=${pi.cpage-1}">&lt;</a> 
														</c:otherwise>
													</c:choose>
														
													<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
														<a class="Margin5 borderRadius3 paginationBtn" href="adminBoard.do?status=${status}&cpage=${page}">${page}</a>
													</c:forEach>
														
													<c:choose>
														<c:when test="${pi.cpage eq pi.maxPage}">
															<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
														</c:when>
														<c:otherwise>
															<a class="Margin5 borderRadius3 paginationBtn" href="adminBoard.do?status=${status}&cpage=${pi.cpage + 1}">&gt;</a>
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