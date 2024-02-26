<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 로딩 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="../../../../resources/css/board/common/template.css" />
<link rel="stylesheet"
	href="../../../../resources/css/board/info/infoBoardDtail.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js"
	integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
.container {
	display: flex;
	justify-content: space-between;
}

.inline-items {
	display: flex;
	align-items: center;
}

.margin-top-bottom {
	margin-top: 20px;
	margin-bottom: 20px;
}

.horizontal-layout {
	display: flex;
	align-items: center;
}

p {
	font-size: 15px;
}

.comment-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.left-items, .right-items {
	display: flex;
	align-items: center;
}

.button-layout {
    display: flex;
    align-items: center;
}
.comment-input{
    border: none;
    border-bottom: 1px solid;
    width: 70%;
    margin-top: 30px;
    margin-bottom: 40px;
    margin-right:10px;
    height:30px;
}
.comment-button{
    color: #fff;
    border-color: #0085db;
    background-color: #0085db;
    transition: all 0.3s ease;
    box-shadow: 0 5px 12px rgba(26, 115, 232, 0.3);
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    padding: 9px 27px 9px 27px;
    border-radius: 7px;
}
</style>
<body data-mNo="${sessionScope.no}" data-free-no="${freeNo}">
	<!-- 전체 구조 -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- 페이지 완쪽 사이드바 영역-->
		<%@ include file="../common/nav.jsp"%>

		<!-- 페이지 오른쪽 컨텐츠 영역 -->
		<div class="body-wrapper">
			<!-- 헤더 영역 -->
			<%@ include file="../common/header.jsp"%>
			<div class="container-fluid"></div>
			<div class="row">
				<div class="categoryNavigation-section">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="categoryNavigation-div">
								<div class="categoryNavigation">
									<p>자유게시판 </p>
									<c:if test="${not empty categoryName}">
										<p>/</p>
										<a href="">${categoryName}</a>
									</c:if>
								</div>
								<div class="button-wrapper">
									<c:choose>
										<c:when test="${no == post.memberNo}">
											<a href="/free/edit/${post.freeNo}" class="board-update-btn">수정하기</a>
											<a data-free-no="${post.freeNo}" id="delete-link"
												class="board-update-btn" onclick="deletePost(event)">삭제</a>
										</c:when>
										<c:otherwise>
											<!-- 신고하기 버튼 -->
											<button id="reportButton" class="board-update-btn">신고하기</button>
										</c:otherwise>
									</c:choose>
									<!-- 신고하기 모달 -->
									<div id="reportModal" class="modal">
										<div class="modal-content">
											<span class="close">&times;</span>
											<h2>신고하기</h2>
											<form id="reportForm">
												<label for="reportType">신고 종류:</label><br> <select
													id="reportType">
													<option value="spam">스팸</option>
													<option value="abuse">욕설</option>
													<option value="falseInfo">허위 정보</option>
												</select><br> <br> <input id="reportSubmitButton"
													type="submit" value="신고하기">
											</form>
										</div>
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
									<div class="main-boardList-info">
										<a href="#"><img
											src="../../../..${post.imageFilePath}${post.imageFileName}"
											alt="프로필" width="30" height="30"
											class="main-boardList-user-img"></a> <p
											class="main-boardList-info-text">${post.nickname}</p>
											<p class="main-boardList-info-text">|</p>
										<p class="main-boardList-info-text">${post.freeDate}</p>
										<img src="../../../../resources/uploads/icon/message.png"
											alt="" width="20" height="20"
											class="main-project-comment-text">
										<p id="commentCount_${post.freeNo}"
											class="main-project-comment-text">${post.freeCommentCount}</p>
										<img src="../../../../resources/uploads/icon/views.png" alt=""
											width="20" height="20" class="main-project-comment-text">
										<p id="viewCount_${post.freeNo}"
											class="main-project-comment-text">${post.freeViews}</p>

									</div>
									<div class="margin-top-bottom horizontal-layout">
										<p style="font-size: 18px"> 제목 | &nbsp;&nbsp;</p>
										<p>${post.freeTitle}</p>
										<!-- 제목 -->
									</div>
									<hr>
									<div class="margin-top-bottom">
										<p>${post.freeContent}</p>
										<!-- 내용 -->
									</div>
									<div class="main-boardList-tag margin-top-bottom">
										<c:if test="${not empty post.freeTag1}">
											<p class="tag-div">#${post.freeTag1}</p>
										</c:if>
										<c:if test="${not empty post.freeTag2}">
											<p class="tag-div">#${post.freeTag2}</p>
										</c:if>
										<c:if test="${not empty post.freeTag3}">
											<p class="tag-div">#${post.freeTag3}</p>
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
										<c:choose>
											<c:when test="${empty sessionScope.no}">
												<p>댓글 기능은 로그인 후 이용 가능합니다.</p>
											</c:when>
											<c:otherwise>
												<div class="comment-registration">
													<input type="text" id="commentContent" class="comment-input"
														placeholder="댓글을 남겨주세요">
													<button id="submitComment" class="comment-button" type="button">등록</button>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="comment-list">
										<p id="no-comment-message"
											${not empty comments ? 'style="display: none;"' : ''}>댓글이
											없습니다.</p>

										<c:forEach items="${comments}" var="comment">
											<div class="comment-row">
												<a href="#"><img
													src="../../../..${post.imageFilePath}${post.imageFileName}"
													alt="프로필" width="30" height="30"
													class="main-boardList-user-img"></a> <a href="#"
													class="main-boardList-info-text">${comment.nickname}</a>
												<p class="main-boardList-info-text">${comment.freeCommentDate}</p>
												<div>
													<a href="JavaScript:void(0);" class="edit-button"
														data-id="${comment.freeCommentNo}"
														data-freeNo="${post.freeNo}" data-toggle="modal"
														data-target="#editModal_${comment.freeCommentNo}">수정</a>

													<!-- 수정하기 모달 -->
													<div class="editModal"
														id="editModal_${comment.freeCommentNo}">
														<div class="modal-content">
															<span class="close">&times;</span>
															<h2>댓글 수정하기</h2>
															<form class="editForm">
																<label for="author">작성자:</label> <input type="text"
																	id="author" value="${comment.nickname}" disabled><br>

																<label for="date">작성일:</label> <input type="text"
																	id="date" value="${comment.freeCommentDate}" disabled><br>
																<label for="editComment">내용:</label>
																<textarea id="editComment">${comment.freeCommentContent}</textarea>
																<br> <input type="submit" value="수정하기">
															</form>
														</div>
													</div>
													<p>|</p>
													<a class="delete-button" data-id="${comment.freeCommentNo}">삭제</a>
													<!-- 신고하기 버튼 -->
													<button class="reportButton"
														data-id="${comment.freeCommentNo}">신고하기</button>

													<!-- 신고하기 모달 -->
													<div class="reportModal"
														id="reportModal_${comment.freeCommentNo}"
														data-id="${comment.freeCommentNo}">
														<div class="modal-content">
															<span class="close" onclick="closeReportModal(this)">&times;</span>
															<h2>신고하기</h2>
															<form class="reportForm"
																onsubmit="submitReportForm(this)">
																<label for="reportType">신고 종류:</label><br> <select
																	class="reportType">
																	<option value="spam">스팸</option>
																	<option value="abuse">욕설</option>
																	<option value="falseInfo">허위 정보</option>
																</select><br> <br> <input class="reportSubmitButton"
																	type="submit" value="신고하기">
															</form>
														</div>
													</div>

												</div>
											</div>
											<div>
												<p class="margin-top-bottom">${comment.freeCommentContent}</p>
												<!-- 댓글 내용 -->
											</div>
											<div class="card-project-hr-div">
												<hr class="card-project-hr">
											</div>
										</c:forEach>


									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var freeNo; // 현재 페이지의 정보글 번호
		
		// 댓글 삭제 
		function deleteComment(button) {
		    var commentId = button.getAttribute('data-id'); 
		    event.preventDefault();

		    var confirmDelete = confirm('정말로 삭제하시겠습니까?');

		    if (confirmDelete) {
		        $.ajax({
		            type: 'POST',
		            url: '/freeComment/deleteComment/' + commentId,
		        }).done(function (response) {
		            alert("댓글이 삭제되었습니다.");
		            location.reload();
		        }).fail(function (error) {
		            alert("댓글 삭제에 실패하였습니다.");
		        });
		    }
		}
		

/* 		// 댓글 등록
		$("#submitComment").click(function(event) {
			var commentContent = $('#commentContent').val();
			var mNo = $('body').data('mno');
			var freeNo = $('body').data('free-no');

			console.log('commentContent:', commentContent);
			console.log('mNo:', mNo);
			console.log('freeNo:', freeNo);

			if (!commentContent) {
				alert('댓글 내용을 입력해주세요.');
				return;
			}

			$.ajax({
				type : 'POST',
				url : '/freeComment/SubmitRegistr',
				dataType : 'json',
				data : JSON.stringify({
					freeCommentContent : commentContent,
					mNo : mNo,
					freeNo : freeNo
				}),
				contentType : 'application/json; charset=utf-8',
				success : function(response) {
					appendComment(response);
					updateCommentCount(freeNo);

					// 댓글이 없다는 메시지 숨기기
					$('#no-comment-message').hide();
				},
				error : function(err) {
					console.log('댓글 저장에 실패하였습니다: ', err);
				}
			});
		}); */
		
		// 댓글 등록
	    $("#submitComment").click(function (event) {
	        var commentContent = $('#commentContent').val();
	        var mNo = $('body').data('mno');
	        var freeNo = $('body').data('free-no');

	        console.log('commentContent:', commentContent);
	        console.log('mNo:', mNo);
	        console.log('freeNo:', freeNo);

	        if (!commentContent) {
	            alert('댓글 내용을 입력해주세요.');
	            return;
	        }

	        $.ajax({
	            type: 'POST',
	            url: '/freeComment/SubmitRegistr',
	            dataType: 'json',
	            data: JSON.stringify({
	                freeCommentContent: commentContent,
	                mNo: mNo,
	                freeNo: freeNo
	            }),
	            contentType: 'application/json; charset=utf-8',
	            success: function (response) {
	                appendComment(response);
	                updateCommentCount(freeNo);

	                // 댓글이 없다는 메시지 숨기기
	                $('#no-comment-message').hide();
	            },
	            error: function (err) {
	                console.log('댓글 저장에 실패하였습니다: ', err);
	            }
	        });
	    });
		
		// Bootstrap 모달 초기화
		$('.modal').modal({
		    backdrop: 'static',
		    keyboard: false
		});

		// 서버에서 받아온 날짜 형식 변환
		function formatDate(dateString) {
			var months = {
				"1월" : "01",
				"2월" : "02",
				"3월" : "03",
				"4월" : "04",
				"5월" : "05",
				"6월" : "06",
				"7월" : "07",
				"8월" : "08",
				"9월" : "09",
				"10월" : "10",
				"11월" : "11",
				"12월" : "12"
			};

			var dateParts = dateString.split(" ");
			var month = months[dateParts[1]]; 
			var day = ("0" + dateParts[1].replace(',', '')).slice(-2);
			var year = dateParts[2];
			var formattedDate = year + '-' + month + '-' + day;

			return formattedDate;
		}

		function appendComment(comment) {
			var formattedDate = formatDate(comment.freeCommentDate);

			var now = new Date();
			var year = now.getFullYear();
			var month = ("0" + (now.getMonth() + 1)).slice(-2);
			var day = ("0" + now.getDate()).slice(-2);

			console.log('formattedDate:', formattedDate);
			console.log('month:', month);

			var commentRow = '<div class="comment-row">'
					+ '<a href="#"><img src="../../../../resources/uploads/member/기본프로필.png" alt="프로필" width="30" height="30"'
		        + ' class="main-boardList-user-img"></a> <a href="#"'
		        + ' class="main-boardList-info-text">'
					+ comment.freeCommentWriter
					+ '</a>'
					+ '<p class="main-boardList-info-text">'
					+ formattedDate
					+ '</p>'
					+ '<div>'
					+ '<a href="#">수정</a><p>|</p> <a class="delete-button" data-id="' + comment.freeCommentNo + '">삭제</a>'
					+ '</div>' + '</div>' + '<div>' + '<p>'
					+ comment.freeCommentContent + '</p>' + '</div>'
					+ '<div class="card-project-hr-div">'
					+ '<hr class="card-project-hr">' + '</div>';

			$(".comment-list").append(commentRow); // 댓글 목록의 맨 아래에 추가
			$('#commentContent').val(''); //댓글 등록하고 나면 input에 작성한거 지움 
		}

		// 댓글 등록 후에 댓글 수 업데이트
		 function updateCommentCount(freeNo) {
        $.ajax({
            type: 'POST',
            url: '/freeComment/updateCommentCount/' + freeNo,
            success: function (response) {
                var commentCountElementId = "commentCount_" + freeNo;
                var commentCountElement = document.getElementById(commentCountElementId);

                if (commentCountElement) {
                    commentCountElement.innerText = response;
                }
            },
            error: function (error) {
                console.log("댓글 수 업데이트 실패: " + error);
            }
        });
    }



		//조회수 증가 
		$(document).ready(function() {
			var freeNo = $('body').data('free-no');
			console.log('freeNo: ', freeNo);

			var views = $('#viewCount_' + freeNo).text();
			console.log('조회수: ', views);
		});

		//게시글 삭제 
	function deletePost(event) {
	        event.preventDefault();

	        var freeNo = event.target.dataset.freeNo;

	        var confirmDelete = confirm('정말로 삭제하시겠습니까?');
	        if (confirmDelete) {
	            $.ajax({
	                url: '/free/deletePost',
	                type: 'POST',
	                data: {
	                    'freeNo': freeNo
	                },
	                success: function (response) {
	                    if (response.success) {
	                        alert(response.message);
	                        window.location.href = response.redirectUrl;
	                    } else {
	                        alert(response.message);
	                    }
	                },
	                error: function (xhr, status, error) {
	                    alert('게시글 삭제에 실패하였습니다: ' + error);
	                }
	            });
	        }
	    }
	</script>
	<script>
	//게시글 신고하기 
    var modal = document.getElementById("reportModal");
    var btn = document.getElementById("reportButton");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function () {
        modal.style.display = "block";
    }

    span.onclick = function () {
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    document.getElementById('reportForm').addEventListener('submit', function (e) {
        e.preventDefault();

        var reportType = document.getElementById('reportType').value;
        var freeNo = document.body.dataset.freeNo;
        var mNo = document.body.dataset.mNo;

        var data = {
            declarationType: 'free',
            boardNo: freeNo,
            mNo: mNo,
            declarationContent: reportType
        };

        if (confirm("신고하시겠습니까?")) {
            fetch('/free/report', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            })
                .then(response => {
                    if (response.ok) {
                        modal.style.display = "none";
                        alert("성공적으로 전송되었습니다.");
                        console.log('Success:', data);
                    } else {
                        throw new Error('Network response was not ok');
                    }
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        }
    });
    
    window.onload = function() {
        var editButtons = document.querySelectorAll('.edit-button');
        var reportButtons = document.querySelectorAll('.reportButton');
        var closeButtons = document.querySelectorAll('.close');
        var reportForms = document.querySelectorAll('.reportForm');
        var editForms = document.querySelectorAll('.editSubmitButton');

        editButtons.forEach(function(button) {
            button.setAttribute('onclick', 'openEditModal(this)');
        });

        reportButtons.forEach(function(button) {
            button.setAttribute('onclick', 'openReportModal(this)');
        });

        closeButtons.forEach(function(button) {
            button.setAttribute('onclick', 'closeModal(this)');
        });

        reportForms.forEach(function(form) {
            form.setAttribute('onsubmit', 'submitReportForm(this)');
        });

        editForms.forEach(function(form) {
            form.setAttribute('onsubmit', 'submitEditForm(this)');
        });
    }

    //댓글 수정하기 
    function openEditModal(button) {
        var commentId = button.getAttribute('data-id'); //수정버튼 데이터(댓글 넘버)
        var modal = document.querySelector('#editModal_' + commentId); 
        modal.style.display = "block";
        
    }

    function closeEditModal(button) {
        var modal = button.closest('.editModal');
        modal.style.display = "none";
    }

    function submitEditForm(form) {
        event.preventDefault(); //새로고침 방지

        var freeCommentNo = form.querySelector('#freeCommentNo').value; //freeCommentNo id가져올거임 
        var commentContent = form.querySelector('.editComment').value;  //editComment 클래스 가져올거이
        
        console.log(form); // form 요소가 올바르게 전달되었는지 확인
        console.log(form.querySelector('.editComment')); // .editComment 요소가 존재하는지 확인
        console.log(form.querySelector('.editComment').value); // .editComment 요소의 값 확인

        if (!commentContent || !commentContent.trim()) { 
            alert("내용을 입력해주세요.");
            return; 
        } 
        
        var data = {
        	    freeCommentNo: freeCommentNo,
        	    freeCommentContent: freeCommentContent
        	};

        if(confirm("댓글을 수정하시겠습니까?")) {
            fetch('/freeComment/updateComment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            })
            .then(response => {
                if(response.ok) {
                    form.closest('.editModal').style.display = "none";  
                    alert("성공적으로 수정되었습니다.");
                    location.reload();
                    console.log('Success:', data);
                } else {
                    throw new Error('오류 발생');
                }
            })
            .catch((error) => {
                console.error('Error:', error);
            });
        }
    }

    /* 댓글 신고하기 */
    function openReportModal(button) {
        var commentId = button.dataset.id;
        var modal = document.querySelector('#reportModal_' + commentId);
        modal.style.display = "block";
    }

    function closeReportModal(button) {
        var modal = button.closest('.reportModal');
        modal.style.display = "none";
    }

    function submitReportForm(form) {
        event.preventDefault();

        var commentId = form.closest('.reportModal').dataset.id;
        var reportType = form.querySelector('.reportType').value;
        var mNo = document.body.dataset.mNo;
        
        var data = {
            declarationType: 'freeComment',
            boardNo: commentId, 
            mNo: mNo,
            declarationContent: reportType
        };

        if(confirm("신고하시겠습니까?")) {
            fetch('/freecomment/reportComment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            })
            .then(response => {
                if(response.ok) {
                    form.closest('.reportModal').style.display = "none";  // 팝업 닫기
                    alert("성공적으로 전송되었습니다.");
                    console.log('Success:', data);
                } else {
                    throw new Error('오류 났으으음');
                }
            })
            .catch((error) => {
                console.error('Error:', error);
            });
        }
    }
    
</script>
</body>
</html>
