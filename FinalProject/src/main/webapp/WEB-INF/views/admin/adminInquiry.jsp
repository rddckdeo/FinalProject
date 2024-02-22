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
	<div class="cardSize mainCard">
		<div class="row">
			<div class="main-section">
				<div class="container-fluid">
					<div class="container-fluid">
						<!-- Card 안쪽 -->
						<div class="card cardSize alignCenter">
							<p class="font30px bottomMargin20 topMargin20">문의 사항</p>
							<!-- 시작 -->
							<div class="direction2 justifyEve width100">
								<a href="/admin/adminInquiry.do?status=incom&cpage=1" class="card1 backColor4 direction1">
									<h1 class="fontTitle">Incomplete List</h1>
									<h3 class="fontContent">Incomplete : ${incomCount}</h3>
								</a> <a href="/admin/adminInquiry.do?status=com&cpage=1" class="card1 backColor1 direction1">
									<h1 class="fontTitle">Complete List</h1>
									<h3 class="fontContent">Complete : ${comCount}</h3>
								</a> <a href="/admin/adminInquiry.do?status=total&cpage=1" class="card1 backColor3 direction1">
									<h1 class="fontTitle">Total List</h1>
									<h3 class="fontContent">total : ${totalCount}</h3>
								</a>
							</div>
							<input type="hidden" value="${status}" id="status">
							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
									<p class="font20px subP whiteColor">${title}</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<p>미완료 문의</p>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li3">문의 제목</span>
											<span class="li4">작성자</span>
											<span class="li2">작성 시간</span>
											<span class="li2">답변 여부</span>
										</ul>
										<ul class="visitUlSize">
											<c:forEach var="item" items="${list}">
											    <li value="${item.no}" class="borderDefault visitPadding justifyAround boardLiSize" onclick="modalToggle(${item.no})">
											        <span class="li1">${item.no}</span>
											        <span class="li3">${item.title}</span>
											        <span class="li4">${item.name}</span>
											        <span class="li2">${item.inDate}</span>
											        <span class="li2">${item.answer}</span>
											        <!-- modal -->
											        <div class="adminBoardModal direction1" id="modal${item.no}">
											            <button class="exitBtn" onclick="modalToggle(${item.no})">X</button>
														<div class="modalCard">
															<div class="direction2 justifyAround">
																<h1 class="font1">작성 날짜 : ${item.inDate}</h1>
																<h1 class="font1">답변 여부 : ${item.answer}</h1>
																<h1 class="font1">작성자 : ${item.name}</h1>
															</div>
															<div class="width100 direction1 alignCenter">
																<div class="width100">
																	<h1 class="font2">Title</h1>						
																</div>
																<div class="textTitle">${item.title}</div>
																<div class="width100">
																	<h1 class="font3">Content</h1>
																</div>
																<div class="textContent">${item.content}</div>
															</div>
																<div class="width100 justifyCenter">
																	<textarea id="answerInput${item.no}" type="text" class="answerInput"></textarea>
																</div>
															<div class="justifyEnd">
																<button class="defaultBtn btnMargin2" id="answerSub" onclick="modalSub('${item.no}')">제출</button>
																<button class="defaultBtn btnMargin1" onclick="modaldelete('${item.no}')">삭제</button>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
											<div class="pagination">
												<c:choose>
													<c:when test="${pi.cpage eq 1}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&lt;</a> 
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminInquiry.do?status=${status}&cpage=${pi.cpage-1}">&lt;</a> 
													</c:otherwise>
												</c:choose>
													
												<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
													<a class="Margin5 borderRadius3 paginationBtn" href="adminInquiry.do?status=${status}&cpage=${page}">${page}</a>
												</c:forEach>
													
												<c:choose>
													<c:when test="${pi.cpage eq pi.maxPage}">
														<a class="Margin5 borderRadius3 paginationBtn" href="#">&gt;</a>
													</c:when>
													<c:otherwise>
														<a class="Margin5 borderRadius3 paginationBtn" href="adminInquiry.do?status=${status}&cpage=${pi.cpage + 1}">&gt;</a>
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