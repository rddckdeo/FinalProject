<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>profile</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  

</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<!-- 전체 구조 -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
		<!-- 페이지 완쪽 사이드바 영역-->
		<%@ include file="/WEB-INF/views/myPage/common/sidebar.jsp"%>
		<!-- 페이지 오른쪽 컨텐츠 영역 -->
		<div class="body-wrapper">
			<!-- 헤더 영역 -->
			<%@ include file="/WEB-INF/views/myPage/common/header.jsp"%>
			<div class="cardSize">
				<div class="row">
					<div class="main-section">
						<div class="container-fluid">
							<div class="container-fluid">
								<!-- Card 안쪽 -->
								<div class="card">
									<h1 class="card-project-name bottomMargin20">My Project</h1>
									<!-- card body -->
									<div class="card-body height500 direction1" style="padding-top: 0;">

							<!-- 참여한 프로젝트 -->
							<div class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
								<h1 class="bottomMargin20">참여한 프로젝트</h1>
								<div class="direction2 scrollbar">
								<c:set var="Ncount" value="0"></c:set>
									<!-- 개별 Card -->
									<c:if test="${!empty NList}">
										<c:forEach var="item" items="${NList}">
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
												<h5 class="card-title">${item.name} 프로젝트</h5>
												<p class="card-text height100">${item.detail}</p>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectN${Ncount}">상세보기</button>
<!-- 프로젝트정보 Modal -->   
<div class="modal fade" id="projectN${Ncount}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
	      <h3><strong>4. 프로젝트 시작일</strong></h3>
	      <h5>${item.startDate}</h5>
	      
	      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
											</div>
										</div>
		<c:set var="Ncount" value="${Ncount+1}"></c:set>
										</c:forEach>
									</c:if>
									
									
								</div>
							</div>
							<!-- 진행중인 프로젝트 -->
							<div class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
								<h1 class="bottomMargin20">진행중인 프로젝트</h1>
								<div class="direction2 scrollbar">
								<c:set var="Ccount" value="0"></c:set>
									<!-- 개별 Card -->
									<c:if test="${!empty CList}">
										<c:forEach var="item" items="${CList}">
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
												<h5 class="card-title">${item.name} 프로젝트</h5>
												<p class="card-text height100">${item.detail}</p>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectC${Ccount}">상세보기</button>
<!-- 프로젝트정보 Modal -->   
<div class="modal fade" id="projectC${Ccount}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
	      <h3><strong>4. 프로젝트 시작일</strong></h3>
	      <h5>${item.startDate}</h5>
	      
	      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
											</div>
										</div>
		<c:set var="Ccount" value="${Ccount+1}"></c:set>
										</c:forEach>
									</c:if>
									
									
								</div>
							</div>
							<!-- 완료된 프로젝트 -->
							<div class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
								<h1 class="bottomMargin20">완료된 프로젝트</h1>
								<div class="direction2 scrollbar">
								<c:set var="Ycount" value="0"></c:set>
								
									<!-- 개별 Card -->
									<c:if test="${!empty YList}">
										<c:forEach var="item" items="${YList}">
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
												<h5 class="card-title">${item.name} 프로젝트</h5>
												<p class="card-text height100">${item.detail}</p>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectY${Ycount}">상세보기</button>
<!-- 프로젝트정보 Modal -->   
<div class="modal fade" id="projectY${Ycount}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
	      <h3><strong>4. 프로젝트 시작일</strong></h3>
	      <h5>${item.startDate}</h5>
	      
	      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>											</div>
										</div>
		<c:set var="Ycount" value="${Ycount+1}"></c:set>
										
										</c:forEach>
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
		</div>
	</div>
</body>
</html>