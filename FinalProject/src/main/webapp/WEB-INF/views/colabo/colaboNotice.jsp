<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>프로젝트 생성</title>
<!--   <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" /> -->
  <link rel="stylesheet" href="../../resources/css/colabo/colabo.css" />
  <link rel="stylesheet" href="../../resources/css/colabo/colaboNotice.css" />
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

<!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
 <%@ include file="./common/colaboSideBar.jsp" %>
    
  	<!--  Main wrapper -->
		<div class="body-wrapper">
			 <%@ include file="./common/colaboHeader.jsp" %>
			<div class="container-fluid">
				<div class="row">
					<div class="card w-100" style="width:70%; height:70%;">
						<h3> ${projectName} 팀 공지게시판</h3>
						<div style="text-align: right;">
							<button class="btn btn-outline-primary" style="width:150px; text-align: center; type:button;" onclick="enterNoticePage()">글작성</button>
						</div>
						<table>
						    <thead>
						      <tr>
						        <th>번호</th>
						        <th>프로젝트 이름</th>
						        <th>작성자이름</th>
						        <th>게시글 제목</th>
						        <th>게시글 내용</th>
						        <th>게시글 작성일</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:choose>
						    	<c:when test="${empty list}">
						    		<tr>
					           			<td colspan="6">
					           				<h3>등록된 글이 없습니다.</h3>
					           			</td>
					           		</tr>
						    	</c:when>
						    	<c:otherwise>
						    		<c:forEach var="item" items="${list}">
								      <tr onclick="location.href='/colabo/noticeDetail.do?noticeNo=${item.noticeNo}'">
								        <td>${row}</td>
								        <td>${item.name}</td>
								        <td>${item.memberName}</td>
								        <td>${item.noticeTitle}</td>
								        <td>${item.noticeContent}</td>
								        <td>${item.noticeDate}</td>
								      </tr>
								      <c:set var="row" value="${row-1}"></c:set>
						    		</c:forEach>
						    	</c:otherwise>
						    </c:choose>
					    </tbody>
					  </table>
					  
					  <nav aria-label="Page navigation example ">
              <ul class="pagination justify-content-center">
              
              <c:choose>  
              		<c:when test="${pi.cpage eq 1}">
		                <li class="page-item">
		                  <a class="page-link" href="#" aria-label="Previous">
		                    <span aria-hidden="true">&laquo;</span>
		                  </a>
		                </li>
              		</c:when>
              		<c:otherwise> 
              			<li class="page-item">
		                  <a class="page-link" href="/colabo/colaboNotice?cpage=${pi.cpage-1}" aria-label="Previous">
		                    <span aria-hidden="true">&laquo;</span>
		                  </a>
		                </li>
              		</c:otherwise>
              </c:choose>  
              	
              	<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
                	<li class="page-item"><a class="page-link" href="/colabo/colaboNotice?cpage=${page}">${page}</a></li>
                </c:forEach>
                
               	<c:choose>
	               	<c:when test="${pi.cpage eq pi.maxPage}">
		                <li class="page-item">
		                  <a class="page-link" href="#" aria-label="Next">
		                    <span aria-hidden="true">&raquo;</span>
		                  </a>
		                </li>
		            </c:when>
		            <c:otherwise>
		            	<li class="page-item">
		                  <a class="page-link" href="/colabo/colaboNotice?cpage=${pi.cpage+1}" aria-label="Next">
		                    <span aria-hidden="true">&raquo;</span>
		                  </a>
		                </li>
		            </c:otherwise>
                </c:choose>
              </ul>
            </nav>
						
					</div>
				</div>
			</div>
		</div>
	</div>
    
    
    
    
    
    <script src="../../resources/js/colabo/colaboAll.js" ></script>
</body>

</html>