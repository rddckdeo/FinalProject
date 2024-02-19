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
							<p class="font30px bottomMargin20 topMargin20">Admin</p>
							<div class="direction2 justifyAround width100 bottomMargin20">

								<span class="direction1">
                                    <h3 class="iconFont font20px">New User ( Day )</h3>
                                    <h3 class="iconFont">${newUserDay}</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont font20px">New User ( Month )</h3>
                                    <h3 class="iconFont">${newUserMonth}</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont font20px">New User ( Year )</h3>
                                    <h3 class="iconFont">${newUserYear}</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont">Total User</h3>
                                    <h3 class="iconFont">${newUserTotal}</h3>
                                </span>
							</div>

							<div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
								<p class="font20px subP whiteColor">전체 멤버</p>
								<div class="direction2 justifyAround alignCenter height80per">
									<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
										<div class="direction2 justifyBet">
											<p>전체 멤버</p>
											<span>멤버 이름 : <input type="text" class="searchInput" id="searchMember"><button onclick="searchMember.do">검색</button></span>
										</div>
										<ul class="direction2 noMargin justifyAround visitPadding borderDefault">
											<span class="li1">No</span>
											<span class="li1">image</span>
											<span class="li1">이름</span>
											<span class="li1">ID</span>
											<span class="li1">별명</span>
											<span class="li2">가입 날짜</span>
											<span class="li1">구분</span>
											<span class="li1">삭제</span>
										</ul>
										<ul class="visitUlSize">
											<c:forEach var="item" items="${totalList}">
												<li class="borderDefault visitPadding justifyAround">
	                                                <span class="li1">${item.no}</span>
	                                                <span class="li1">
	                                                	<img src="${item.path}${item.picture}" alt="" class="visitImgSize">
	                                                </span>
	                                                <span class="li1">${item.name}</span>
	                                                <span class="li1">${item.id}</span>
	                                                <span class="li1">${item.nickname}</span>
	                                                <span class="li2">${item.inDate}</span>
	                                                <span class="li1">${item.type}</span>
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
							<div class="subCard direction2 justifyBet">
								<div class="subCard3 boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
									<p class="font20px subP whiteColor">금일 신규 가입</p>
									<div class="direction2 justifyAround alignCenter height80per">
										<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
											<p>금일 신규 가입</p>
											<ul class="noMargin">
												<li class="direction2 noMargin justifyAround visitPadding borderDefault">
													<span class="li1">No</span>
													<span class="li2">ID</span>
													<span class="li2">가입 시간</span>
													<span class="li2">삭제</span>
												</li>
											</ul>
											<ul class ="ulSize">
												<c:forEach var="item2" items="${newUserList}">
													<li class="borderDefault visitPadding justifyAround boardLiSize">
														<span class="li1">${item2.no}</span>
		                                                <span class="li2">${item2.id}</span>
		                                                <span class="li2">${item2.inDate}</span>
		                                                <span class="li2">
		                                                	<button value="${item2.no}" class="deleteBtn" onclick="deleteBtn(this.value)">삭제</button>
		                                                </span>
													</li>
												</c:forEach>
											</ul>
											<div class="pagination">
												<c:choose>
													<c:when test="${pi2.cpage eq 1}">
														<a href="#">&lt;</a>
													</c:when>
													<c:otherwise>
														<a href="adminMember.do?status=newUser&cpage=${pi2.cpage-1}">&lt;</a>
													</c:otherwise>
												</c:choose>
												<c:forEach var="page2" begin="${pi2.startPage}" end="${pi2.endPage}">
													<a href="adminMember.do?status=newUser&cpage=${page2}">${page2}</a>
												</c:forEach>
												<c:choose>
													<c:when test="${pi2.cpage eq pi2.maxPage}">
														<a href="#">&gt;</a>
													</c:when>
													<c:otherwise>
														<a href="adminMember.do?status=newUser&cpage=${pi2.cpage + 1}">&gt;</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
								<div class="subCard3 boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
									<p class="font20px subP whiteColor">탈퇴 인원</p>
									<div class="direction2 justifyAround alignCenter height80per">
										<div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
											<p>탈퇴 인원</p>
											<ul class="noMargin">
												<li class="direction2 noMargin justifyAround visitPadding borderDefault">
													<span class="li1">No</span>
													<span class="li2">ID</span>
													<span class="li2">가입 시간</span>
													<span class="li2">삭제</span>
												</li>
											</ul>
											<ul class ="ulSize">
												<c:forEach var="item3" items="${deleteList}">
													<li class="borderDefault visitPadding justifyAround boardLiSize">
														<span class="li1">${item3.no}</span>
		                                                <span class="li2">${item3.id}</span>
		                                                <span class="li2">${item3.inDate}</span>
		                                                <span class="li2">
		                                                	<button value="${item3.no}" class="deleteBtn" onclick="deleteCancel(this.value)">취소</button>
		                                                </span>
													</li>
												</c:forEach>
											</ul>
											<div class="pagination">
												<c:choose>
													<c:when test="${pi3.cpage eq 1}">
														<a href="#">&lt;</a>
													</c:when>
													<c:otherwise>
														<a href="adminMember.do?status=delete&cpage=${pi3.cpage - 1}">&lt;</a>
													</c:otherwise>
												</c:choose>
												<c:forEach var="page3" begin="${pi3.startPage}" end="${pi3.endPage}">
													<a href="adminMember.do?status=delete&cpage=${page3}" class="active">${page3}</a>
												</c:forEach>
												<c:choose>
													<c:when test="${pi3.cpage eq pi3.maxPage}">
														<a href="#">&gt;</a>
													</c:when>
													<c:otherwise>
														<a href="adminMember.do?status-delete&cpage=${pi3.cpage + 1}">&gt;</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
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
</html>