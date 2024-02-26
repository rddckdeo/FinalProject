<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>my Invite/Apply Project</title>
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
                           <h1 class="card-project-name bottomMargin20">My Invite/Apply Project</h1>
                           <!-- card body -->
                           <div class="card-body height500 direction1" style="padding-top: 0;">

                     <!-- 초대받은 프로젝트 -->
                     <div class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
                        <h1 class="bottomMargin20">초대받은 프로젝트</h1>
                        <div class="direction2 scrollbar">
                        <c:set var="InviteCount" value="0"></c:set>
                           <!-- 개별 Card -->
                           <c:if test="${!empty InviteList}">
                              <c:forEach var="item" items="${InviteList}">
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
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectInvite${InviteCount}">승인여부</button>
<!-- 프로젝트정보 Modal -->   
<div class="modal fade" id="projectInvite${InviteCount}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
        <button type="button" class="btn btn-primary" onclick="projectConfirm('참가',${item.no})">참가하기</button>
        <button type="button" class="btn btn-primary" onclick="projectConfirm('거절',${item.no})">거절하기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
                                 </div>
                              </div>
      <c:set var="InviteCount" value="${InviteCount+1}"></c:set>
                              </c:forEach>
                           </c:if>
                           
                           
                        </div>
                     </div>
                     <!-- 신청중인 프로젝트 -->
                     <div class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
                        <h1 class="bottomMargin20">신청중인 프로젝트</h1>
                        <div class="direction2 scrollbar">
                        <c:set var="ApplyCount" value="0"></c:set>
                           <!-- 개별 Card -->
                           <c:if test="${!empty ApplyList}">
                              <c:forEach var="item" items="${ApplyList}">
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
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectApply${ApplyCount}">상세보기</button>
<!-- 프로젝트정보 Modal -->   
<div class="modal fade" id="projectApply${ApplyCount}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
                                 </div>
                              </div>
      <c:set var="ApplyCount" value="${ApplyCount+1}"></c:set>
                              </c:forEach>
                           </c:if>
                           
                           
                        </div>
                     </div>
                     <div class="width100 height200 padding30 boxShadow borderDefault bottomMargin20">
                        <h1 class="bottomMargin20">신청받은 프로젝트</h1>
                        <div class="direction2 scrollbar">
                        <c:set var="receiveCount" value="0"></c:set>
                           <!-- 개별 Card -->
                           <c:if test="${!empty receiveApplyList}">
                              <c:forEach var="item" items="${receiveApplyList}">
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
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#projectReceive${receiveCount}">신청인원 상세 정보</button>
<!-- 프로젝트정보 Modal -->   
<div class="modal fade" id="projectReceive${receiveCount}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">신청인원 상세 정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
         <div class="modal-body">
         
         <h3><strong>1. 신청인원 이름</strong></h3>
         <h5>${item.memberName}</h5>
         <br>
         <h3><strong>2. 신청인원 닉네임</strong></h3>
         <h5>${item.memberNickname}</h5>
         <br>
         <h3><strong>3. 신청인원 연락처</strong></h3>
         <h5>${item.memberPhone}</h5>
         <br>
         <h3><strong>4. 신청인원 희망직무</strong></h3>
         <h5>${item.memberHope}</h5>
         <br>
         <h3><strong>5. 신청인원 기술스택</strong></h3>
         <h5>${item.memberStack}</h5>
         
         </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-primary" onclick="receiveProjectConfirm('승인',${item.no},${item.memberNo})">승인하기</button>
        <button type="button" class="btn btn-primary" onclick="receiveProjectConfirm('거절',${item.no},${item.memberNo})">거절하기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
                                 </div>
                              </div>
      <c:set var="receiveCount" value="${receiveCount+1}"></c:set>
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
      </div>
   </div>
   
<script src="../../resources/js/colabo/myInviteApplyProject.js" ></script>
</body>
</html>