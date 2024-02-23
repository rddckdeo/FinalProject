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
	href="../../../../resources/css/board/info/infoBoardEdit.css" />
	<link rel="stylesheet"
	href="../../../../resources/css/board/common/CkEditor5.css" />

<script
	src="https://cdn.ckeditor.com/ckeditor5/41.0.0/super-build/ckeditor.js"></script>
</head>
<body>
	<form action="/info/updatePost" method="post">
		<input type="hidden" name="infoNo" value="${post.infoNo}">
		<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
			data-navbarbg="skin6" data-sidebartype="full"
			data-sidebar-position="fixed" data-header-position="fixed">
			<jsp:include page="../common/nav.jsp" />
			<div class="body-wrapper">
				<jsp:include page="../common/header.jsp" />
				<div class="container-fluid">
					<h1 class="card-project-name">게시글 수정</h1>
				</div>
				<div class="row">
					<div class="main-section">
						<div class="container-fluid">
							<div class="container-fluid">
								<div class="card">
									<div class="main-boardList">
										<div>
											<p class="form-lable">제목</p>
											<input type="text" class="form-input" name="infoTitle"
												value="${post.infoTitle}" placeholder="제목을 입력해주세요">
										</div>
										<div>
											<p class="form-lable">카테고리</p>
											<select id="category" name="infoCategory" class="form-input">
												<option value="programming"
													${'programming' == post.infoCategory ? 'selected="selected"' : ''}>프로그래밍
													언어</option>
												<option value="framework"
													${'framework' == post.infoCategory ? 'selected="selected"' : ''}>프레임워크
													및 라이브러리</option>
												<option value="database"
													${'database' == post.infoCategory ? 'selected="selected"' : ''}>데이터베이스</option>
												<option value="webDev"
													${'webDev' == post.infoCategory ? 'selected="selected"' : ''}>웹개발</option>
												<option value="mobileDev"
													${'mobileDev' == post.infoCategory ? 'selected="selected"' : ''}>모바일
													개발</option>
												<option value="machineLearning"
													${'machineLearning' == post.infoCategory ? 'selected="selected"' : ''}>기계학습
													/ 인공지능</option>
												<option value="cloud"
													${'cloud' == post.infoCategory ? 'selected="selected"' : ''}>클라우드
													& 서버</option>
												<option value="devTools"
													${'devTools' == post.infoCategory ? 'selected="selected"' : ''}>개발
													도구</option>
												<option value="portfolio"
													${'portfolio' == post.infoCategory ? 'selected="selected"' : ''}>프로젝트
													& 포트폴리오</option>
											</select>

										</div>
										<div>
											<p class="form-lable">본문</p>
											<textarea name="infoContent" id="editor">${post.infoContent}</textarea>
										</div>
										<div>
											<!-- 숨겨진 필드로 에디터의 데이터를 전송 -->
											<input type="hidden" name="infoContent" id="editorData">
											<p class="form-lable">태그</p>
											<div class="form-tag-div">
												<c:forEach var="tag" items="${tags}" varStatus="loop">
													<p class="form-input-tag-text">#</p>

													<input type="text" name="infoTag${loop.index + 1}"
														class="form-input-tag" value="${tag}"
														placeholder="태그를 입력해주세요">
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="button-wrapper">
						<a href="#" onclick="cancelAndBack(event)"
							class="board-update-btn">취소하기</a>
						<button type="submit" id="submit" class="board-update-btn"
							onclick="onSubmitClick(event)">수정하기</button>

					</div>
				</div>
			</div>
		</div>
	</form>

	
</body>
<script>

    window.onload = function() {
        var saved = "${post.infoCategory}"; 
        var selectElement = document.getElementById("category"); 

        for (var i = 0; i < selectElement.options.length; i++) {
            if (selectElement.options[i].value == saved) { 
                selectElement.options[i].selected = true; 
                break;
            }
        }
    

    let editor;
          CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
            toolbar: {
                    items: [
                        'heading', '|',
                        'bold', 'italic', 'strikethrough', 'underline', 'code', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'alignment', '|',
                        '-',
                        'link', 'uploadImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                        'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },
             heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                    ]
                },
               placeholder: '내용을 입력해주세요.',
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
            fontSize: {
                    options: [ 10, 12, 14, 'default', 18, 20, 22 ],
                    supportAllValues: true
                },
             htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
          htmlEmbed: {
                    showPreviews: true
                },
         link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
              mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
             removePlugins: [
               'AIAssistant',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
               'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
               'MathType',
               'SlashCommand',
                    'Template',
                    'DocumentOutline',
                    'FormatPainter',
                    'TableOfContents',
                    'PasteFromOfficeEnhanced',
                    'CaseChange'
                ]
          }).then(newEditor => {
              editor = newEditor;
          }).catch(error => {
              console.error(error);
          });

          
         

       // 수정 버튼 클릭 시
          document.querySelector('#submit').removeEventListener('click', onSubmitClick);
          document.querySelector('#submit').addEventListener('click', function(event) {
              onSubmitClick(event, editor);
          });
      }

      function onSubmitClick(event, editor) {
          const title = document.querySelector('input[name="infoTitle"]').value;
          const category = document.querySelector('#category').value;
          const editorData = editor.getData().trim(); 

          if (!title) {
              alert('제목을 작성해주세요.');
              event.preventDefault();
              return;
          }
          if (!category) {
              alert('카테고리를 선택해주세요.');
              event.preventDefault();
              return;
          }
          if (!editorData) {
              alert('내용을 작성해주세요.');
              event.preventDefault();
              return;
          }

          const shouldSubmit = window.confirm("수정하시겠습니까?");
          if (!shouldSubmit) {
              event.preventDefault();
              return;
          }
      }




 // 취소하기 버튼 클릭 시
function cancelAndBack(event) {
    event.preventDefault(); 
    var confirmed = confirm('작성 중인 내용이 사라집니다. 정말로 취소하시겠습니까?');
    if (confirmed) {
        history.back();
    }
}
</script>