<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="../../../../resources/css/board/common/template.css" />
<link rel="stylesheet"
	href="../../../../resources/css/board/info/infoRegistr.css" />
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>
</head>
<style>
#mainText{
	width: 100%;
    height: 100px;
    padding: 5px 10px 5px 10px;
    border-radius: 7px;
    border: 1px solid #adb5bd;
}
</style>
<body>
	<!-- 전체 구조 -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- 페이지 완쪽 사이드바 영역-->
		<%@ include file="/WEB-INF/views/myPage/common/sidebar.jsp"%>
		<!-- 페이지 오른쪽 컨텐츠 영역 -->
		<div class="body-wrapper">
			<!-- 헤더 영역 -->
			<%@ include file="/WEB-INF/views/myPage/common/header.jsp"%>

			<div class="container-fluid">
				<h1 class="card-project-name">문의 사항 등록</h1>
			</div>
			<form action="/mypage/inquirySubmitRegistr" method="post" id="submitForm">
				<div class="row">
					<div class="main-section">
						<div class="container-fluid">
							<div class="container-fluid">
								<div class="card">
									<div class="main-boardList">
										<div>
											<p class="form-lable">제목</p>
											<input type="text" name="infoTitle" class="form-input"
												placeholder="제목을 입력해주세요">
										</div>

										<div>
										<p class="form-lable">문의 내용</p>
											<textarea name="mainText" id="mainText" placeholder="문의 내용을 입력해주세요"></textarea>

										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="button-wrapper">
						<a href="#" onclick="history.back();" class="board-update-btn">취소하기</a>
						<button type="submit" id="submit" class="board-update-btn">등록하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

</html>

<script>
document.querySelector('input[name="infoTitle"]').addEventListener('keydown', function(e) {
    if (e.key === 'Enter') {
        e.preventDefault();
    }
});
</script>
