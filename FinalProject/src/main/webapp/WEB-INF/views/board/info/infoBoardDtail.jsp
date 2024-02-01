<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="../../../../resources/css/board/common/template.css" />
<link rel="stylesheet"
	href="../../../../resources/css/board/info/infoBoardDtail.css" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js"
	integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body data-infono="${post.infoNo}">
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
			<div class="container-fluid"></div>
			<div class="row">
				<div class="categoryNavigation-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="categoryNavigation-div">
								<div class="categoryNavigation">
									<a href="">정보게시판 </a>
									<c:if test="${not empty categoryName}">
										<p>/</p>
										<a href="">${categoryName}</a>
									</c:if>
								</div>
								<div class="button-wrapper">
									<a href="/info/edit/${post.infoNo}" class="board-update-btn">수정하기</a>

									<a href="#" class="delete-link">삭제</a>
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
								<div class="main-boardList">
									<div class="main-boardList-info">
										<a href="#"><img src="" alt="" width="30" height="30"
											class="main-boardList-user-img"></a> <a href="#"
											class="main-boardList-info-text">${post.nickname}</a>
										<p class="main-boardList-info-text">${post.infoDate}</p>

										<img src="../../image/profile/message.png" alt="" width="20"
											height="20" class="main-project-comment-text">
										<p class="main-project-comment-text">${post.commentCount}</p>
										<img src="../../image/profile/message.png" alt="" width="20"
											height="20" class="main-project-comment-text">
										<p class="main-project-comment-text">${post.infoViews}</p>
									</div>
									<div>
										<p>${post.infoTitle}</p>
										<!-- 제목 -->
									</div>
									<div>
										<p>${post.infoContent}</p>
										<!-- 내용 -->
									</div>
									<div class="main-boardList-tag">
										<c:if test="${post.infoTag1 != null && !empty post.infoTag1}">
											<p class="tag-div">#${post.infoTag1}</p>
										</c:if>
										<c:if test="${post.infoTag2 != null && !empty post.infoTag2}">
											<p class="tag-div">#${post.infoTag2}</p>
										</c:if>
										<c:if test="${post.infoTag3 != null && !empty post.infoTag3}">
											<p class="tag-div">#${post.infoTag3}</p>
										</c:if>

									</div>
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
								<div class="main-boardList">
									<div class="comment-registration">
										<div class="comment-registration">
											<input type="text" id="commentContent"
												placeholder="댓글을 남겨주세요">
											<button id="submitComment" type="button">등록</button>
										</div>
									</div>
									<div class="comment-list">
									<c:choose>
										<c:when test="${comments eq null or comments.isEmpty()}">
											<p>댓글이 없습니다.</p>
										</c:when>
										<c:otherwise>
											<c:forEach items="${comments}" var="comment">
												<div class="comment-row">

													<a href="#"><img src="." alt="" width="30" height="30"
														class="main-boardList-user-img"></a> <a href="#"
														class="main-boardList-info-text">${comment.nickname}</a>
													<p class="main-boardList-info-text">${comment.infoCommentDate}</p>

													<div>
														<a href="#">수정 | </a> <a href="#">삭제</a>
													</div>
												</div>
												<div>
													<p>${comment.infoCommentContent}</p>
													<!-- 댓글 내용 -->
												</div>
								<div class="card-project-hr-div">
									<hr class="card-project-hr">
								</div>
								</c:forEach>
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
</body>
</html>
<script>
$(".delete-link").click(function(e){
    e.preventDefault();
    
    var infoNo = ${post.infoNo}; 
    
    $.ajax({
        url: '/info/deletePost',
        type: 'post',
        data: {
            infoNo: infoNo
        },
        success: function(response) {

            if(response.success) {
                alert(response.message);  
                window.location.href = response.redirectUrl;  
            } 
           
            else {
                alert(response.message); 
            }
        },
        error: function(xhr, status, error) {
            alert("요청 실패: " + error);
        }
    });
});
</script>
<script>
$(document).off('click', '#submitComment').on('click', '#submitComment', function(event) {
    var commentContent = $('#commentContent').val();
 
    var infoNo = ${infoNo};
    
    var userInfo = JSON.parse(localStorage.getItem('userInfo'));
    var nickname = userInfo.nickname;
    
    console.log('infoNo:', infoNo); 
    
	if (!commentContent) {
		alert('댓글 내용을 입력해주세요.');
		return;
	}

	var obj = new Object();
	obj.infoCommentContent = commentContent;
	obj.infoNo = infoNo;
	obj.mNo = 1; 
	obj.nickname = nickname;

	$.ajax({
		type : 'POST',
		url : '/comment/SubmitRegistr',
		data : JSON.stringify(obj),
		contentType : 'application/json',
		success : function(response) {
		    console.log("ㄹㄹㄹㄹ"+response);  
		    appendComment(response);
		},
		error : function(err) {
			console.log('댓글 저장에 실패하였습니다: ', err);
		}
	});
});

function appendComment(comment) {
    var commentRow = '<div class="comment-row">'
        + '<a href="#"><img src="." alt="" width="30" height="30"'
        + ' class="main-boardList-user-img"></a> <a href="#"'
        + ' class="main-boardList-info-text">' + comment.nickname + '</a>'  
        + '<p class="main-boardList-info-text">' + comment.infoCommentDate  + '</p>' 
        + '<div>'
        + '<a href="#">수정 | </a> <a href="#">삭제</a>'
        + '</div>'
        + '</div>'
        + '<div>'
        + '<p>' + comment.infoCommentContent + '</p>'
        + '</div>'
        + '<div class="card-project-hr-div">'
        + '<hr class="card-project-hr">'
        + '</div>';

    $(".comment-list").append(commentRow);
}



/* 조회수 증가 */
/* $(document).ready(function() {
    var infoNo = $('body').data('info-no');

    $.ajax({
        type : 'POST',
        url : '/info/increaseViewCount',
        data : JSON.stringify({infoNo: infoNo}),
        contentType : 'application/json',
        success : function() {
            console.log('조회수 증가 성공');  
        },
        error : function(err) {
            console.log('조회수 증가 실패: ', err);
        }
    });
}); */

 

</script>


