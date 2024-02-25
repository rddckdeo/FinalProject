<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>COCO</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	<link rel="stylesheet" href="../../../../resources/css/board/common/template.css" />
	<link rel="stylesheet" href="../../../../resources/css/board/main/main.css" />
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<!-- 전체 구조 -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

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
				<div class="main-section">
					<div id="swipe-category-div">
						<button id="swipe-category-prevBtn">&lt;</button>
						<div id="main-swipe-category">
							<div id="circles">
								<a class="swipe-category"
									href="/member/mainForm.do">CoCo</a>
								<div class="swipe-category">QnA</div>
								<div class="swipe-category">3</div>
								<div class="swipe-category">4</div>
								<div class="swipe-category">5</div>
								<div class="swipe-category">6</div>
								<div class="swipe-category">7</div>
								<div class="swipe-category">8</div>
							</div>
						</div>
						<button id="swipe-category-nextBtn">&gt;</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="main-section">
					<div class="container-fluid">
						<div class="container-fluid">


							<div class="card">
								<h1 class="card-project-name">추천 프로젝트</h1>
								<div class="card-body">
									<button id="project-prevBtn"><</button>
									<div class="card-container" id="cards">
							<c:set var="NProjectCount" value="0"></c:set>
							<c:forEach var="item" items="${NProjectList}">
								<div class="card-item">
									<c:choose>
										<c:when test="${!empty item.uploadName}">
											<img src="/resources/uploads/colabo/project/${item.uploadName}" style= height:180px class="card-img-top" alt="...">
										</c:when>
										<c:otherwise>
											<img src="/resources/uploads/colabo/project/기본이미지.jpg" style= height:180px class="card-img-top" alt="...">
										</c:otherwise>
									</c:choose>
									<div class="card-content">
										<h5 class="project-card-title">프로젝트 명 | ${item.name}</h5>
										<div class="card-content-text">
											<p class="projecct-info-text">모집인원 | ${item.personCount}</p>
											<p class="projecct-info-text">주제 | ${item.subject}</p>
											<p class="projecct-info-text">기술 스택 | ${item.stack}</p>
										</div>
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#project${NProjectCount}">상세보기/참여신청</button>
									</div>
								</div>
<!-- 프로젝트정보 Modal -->   
<div class="modal fade" id="project${NProjectCount}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 상세 정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	      <div class="modal-body">
	      
	      <h3><strong>1. 프로젝트 주제</strong></h3>
	      <h5>${item.subject}</h5>
	      <br>
	      <h3><strong>2. 프로젝트 이름</strong></h3>
	      <h5>${item.name}</h5>
	      <br>
	      <h3><strong>3. 프로젝트 설명</strong></h3>
	      <h5>${item.detail}</h5>
	      <br>
	      <h3><strong>4. 프로젝트 기술스택</strong></h3>
	      <h5>${item.stack}</h5>
	      <br>
	      <h3><strong>5. 프로젝트 시작일</strong></h3>
	      <h5>${item.startDate}</h5>
	      
	      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onclick="projectApply(${item.no},${item.memberNo})">신청하기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
		<c:set var="NProjectCount" value="${NProjectCount+1}"></c:set>
							</c:forEach>
							
									</div>
									<button id="project-nextBtn">></button>
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
							<div class="board-row">

								<!-- 정보 게시판 게시글 -->
								<div class="board-card-row">
									<div>
										<h1 class="card-project-name">정보 게시판</h1>
										<c:choose>
											<c:when test="${not empty infoPosts}">
												<c:forEach var="post" items="${infoPosts}">
													<div class="main-boardList">
														<div class="main-boardList-info">
															<div>
																<a href="#"><img src="../../../../resources/uploads/member/기본프로필.png"
																	alt="" width="30" height="30"
																	class="main-boardList-user-img"></a> <a href="#"
																	class="main-boardList-info-text"><c:out
																		value="${post.nickname}" /> </a>
																<p class="main-boardList-info-text">
																	 | <c:out value="${post.infoDate}" />
																</p>
															</div>
															<div class="main-project-comment">
																<img src="../../../../resources/uploads/icon/message.png" alt="" width="20"
																	height="20" class="main-project-comment-text">
																<p class="main-project-comment-text">
																	<c:out value="${post.infoCommentCount}" />
																</p>
															</div>
														</div>
														<div class="main-boardList-title">
															<a href="/info/infoDtail/${post.infoNo}">${post.infoTitle}</a>
														</div>
													</div>
													<div class="card-project-hr-div">
														<hr class="card-project-hr">
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p
													style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
													게시물이 없습니다.</p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

								<!-- 자유 게시판 게시글 -->
								<div class="board-card-row">
									<div>
										<h1 class="card-project-name">자유  게시판</h1>
										<c:choose>
											<c:when test="${not empty freePosts}">
												<c:forEach var="post" items="${freePosts}">
													<div class="main-boardList">
														<div class="main-boardList-info">
															<div>
																<a href="#"><img src="../../../../resources/uploads/member/기본프로필.png"
																	alt="" width="30" height="30"
																	class="main-boardList-user-img"></a> <a href="#"
																	class="main-boardList-info-text"><c:out
																		value="${post.nickname}" /> </a>
																<p class="main-boardList-info-text">
																	 | <c:out value="" />
																</p>
															</div>
															<div class="main-project-comment">
																<img src="../../../../resources/uploads/icon/message.png" alt="" width="20"
																	height="20" class="main-project-comment-text">
																<p class="main-project-comment-text">
																	<c:out value="${post.freeCommentCount}" />
																</p>
															</div>
														</div>
														<div class="main-boardList-title">
															<a href="/info/infoDtail/${post.freeNo}">${post.freeTitle}</a>
														</div>
													</div>
													<div class="card-project-hr-div">
														<hr class="card-project-hr">
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p
													style="text-align: center; font-size: 18px; margin: 10px 0px 10px 0px;">등록된
													게시물이 없습니다.</p>
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
<script src="../../../../resources/js/colabo/myInviteApplyProject.js" ></script>

</body>
</html>
<script src="../../../../resources/js/board/main/main.js"></script>