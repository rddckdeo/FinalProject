<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="/WEB-INF/views/myPage/common/head.jsp"%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
</head>
<style>
.custom-file-upload input[type="file"] {
	display: none;
}

.custom-file-upload label {
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
}

.custom-file-upload #file-name {
	margin-left: 10px;
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
			<div class="cardSize">
				<div class="row">
					<div class="main-section">
						<div class="container-fluid">
							<div class="container-fluid">
								<!-- Card 안쪽 -->
								<div class="card">
									<h1 class="card-project-name bottomMargin20">내 정보 수정하기</h1>
									<!-- card body -->
									<div class="card-body height500 direction1"
										style="padding-top: 0;">

										<form>

											<div>
												<div class="custom-file-upload">
													<img src="${sessionScope.path}${sessionScope.picture}"
														alt="Profile picture" class="profileImg"> <input
														type="file" id="file-input"
														onchange="handleFileInput(event)"> <label
														for="file-input">파일 선택</label> <span id="file-name">파일을
														선택해주세요.</span>
												</div>
											</div>
											<!-- 소개글 -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="intro" class="leftMargin20">소개글 :</label> <input
													type="text" id="intro" name="intro" value="${intro}"
													placeholder="소개글이 없습니다. 소개글을 입력해주세요.">
											</div>
											<!-- ID -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="id" class="leftMargin20">ID :</label> <input
													type="text" id="id" name="id" value="${id}" readonly>
											</div>
											<!-- 이름 -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="name" class="leftMargin20">이름 :</label> <input
													type="text" id="name" name="name" value="${name}" readonly>
											</div>
											<!-- 닉네임 -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="nickname" class="leftMargin20">닉네임 :</label> <input
													type="text" id="nickname" name="nickname"
													value="${nickname}">
											</div>
											<!-- E-mail -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="email" class="leftMargin20">E-mail :</label> <input
													type="email" id="email" name="email" value="${email}">
											</div>
											<!-- 휴대폰 번호 -->
											<div class="myInfo direction2 alignCenter bottomMargin20">
												<label for="number" class="leftMargin20">휴대폰 번호 :</label> <input
													type="tel" id="number" name="number" value="${number}">
											</div>

											<h1 class="font20px bottomMargin20">희망직무 및 기술스택</h1>
											<div class="myInfo bottomMargin20 padding30">
												<div class="hopeItems">
													<c:forEach var="hopeItem" items="${hopeList}">
														<div class="direction2">
															<p class="infoStack defaultMargin">${hopeItem}
																<button class="deleteButton" data-item="${hopeItem}">X</button>
															</p>
														</div>
													</c:forEach>
												</div>
												<input type="text" id="newHopeItem">
												<button type="button" id="addHopeItemButton">등록</button>

												<div class="stackItems">
													<c:forEach var="stackItem" items="${stackList}">
														<div class="direction2">
															<p class="infoStack defaultMargin">${stackItem}
																<button class="deleteButton" data-item="${stackItem}">X</button>
															</p>
														</div>
													</c:forEach>
												</div>
												<input type="text" id="newStackItem">
												<button type="button" id="addStackItemButton">등록</button>
											</div>


											<!-- 저장 버튼 -->
											<button type="submit" class="btn btn-primary"
												onclick="return confirmSave()">저장</button>
											<a href="/mypage/myinfo.do" onclick="return confirmCancel()">취소</a>
										</form>
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
<script>

let hopeList1111= "";
let stackList1111= "";

window.onload = function() {
    var hopeList = <c:out value="${sessionScope.hopeList}" />;
    var stackList = <c:out value="${sessionScope.stackList}" />; 

    const profileForm = document.querySelector("form");

    hopeList.forEach(function(hopeItem) {
        var hiddenInput = document.createElement("input");
        hiddenInput.type = "hidden";
        hiddenInput.name = "hope[]";
        hiddenInput.value = hopeItem;
        profileForm.appendChild(hiddenInput);
    });
    
    stackList.forEach(function(stackItem) {
        var hiddenInput = document.createElement("input");
        hiddenInput.type = "hidden";
        hiddenInput.name = "stack[]";
        hiddenInput.value = stackItem;
        profileForm.appendChild(hiddenInput);
    });

    console.log(Array.from(profileForm.elements).filter(element => element.name === 'hope[]').map(element => element.value));
    console.log(Array.from(profileForm.elements).filter(element => element.name === 'stack[]').map(element => element.value));

    Array.from(document.getElementsByClassName("deleteButton")).forEach(function(deleteButton) {
        deleteButton.addEventListener("click", function() {
            var itemValue = deleteButton.getAttribute('data-item');
            Array.from(profileForm.elements).forEach(function(element) {
                if (element.name === 'hope[]' && element.value === itemValue || element.name === 'stack[]' && element.value === itemValue) {
                    element.remove();
                }
            });
            deleteButton.parentElement.parentElement.remove();
			hopeList = Array.from(profileForm.elements).filter(element => element.name === 'hope[]').map(element => element.value);
			stackList = Array.from(profileForm.elements).filter(element => element.name === 'stack[]').map(element => element.value);
            console.log(Array.from(profileForm.elements).filter(element => element.name === 'hope[]').map(element => element.value));
            console.log(Array.from(profileForm.elements).filter(element => element.name === 'stack[]').map(element => element.value));
        });
    }); 

  //항목 추가 
		document.getElementById("addHopeItemButton").addEventListener("click", function(event) {
			event.preventDefault();
			var newHopeItem = document.getElementById("newHopeItem").value;
			if (newHopeItem) {
								var direction2Div = document
										.createElement("div");
								var pTag = document.createElement("p");
								var deleteButton = document
										.createElement("button");

								direction2Div.classList.add("direction2");

								pTag.textContent = newHopeItem;
								pTag.classList
										.add("infoStack", "defaultMargin");

								deleteButton.textContent = "X";
								deleteButton.classList.add("deleteButton");
								deleteButton.setAttribute('data-item',
										newHopeItem);
			
								deleteButton.addEventListener("click", function() {
								    var itemValue = deleteButton.getAttribute('data-item');
								    Array.from(profileForm.elements).forEach(function(element) {
								        if (element.name === 'stack[]' && element.value === itemValue) {
								            element.remove();
								        }
								    });
								    direction2Div.remove();

								hopeList1111 = Array.from(profileForm.elements).filter(element => element.name === 'hope[]').map(element => element.value);
								    console.log(Array.from(profileForm.elements).filter(element => element.name === 'stack[]').map(element => element.value));
								});

								pTag.appendChild(deleteButton);
								direction2Div.appendChild(pTag);

								document.getElementsByClassName("hopeItems")[0]
										.appendChild(direction2Div);

								var hiddenInput = document
										.createElement("input");
								hiddenInput.type = "hidden";
								hiddenInput.name = "hope[]";
								hiddenInput.value = newHopeItem;
								profileForm.appendChild(hiddenInput);

								document.getElementById("newHopeItem").value = "";
								console.log(Array.from(profileForm.elements).filter(element => element.name === 'hope[]').map(element => element.value));
			}
						});

		//항목 추가 
		document.getElementById("addStackItemButton").addEventListener("click", function(event) {
			event.preventDefault();
			var newStackItem = document.getElementById("newStackItem").value;
			if (newStackItem) {
				var direction2Div = document.createElement("div");
				var pTag = document.createElement("p");
				var deleteButton = document.createElement("button");

				direction2Div.classList.add("direction2");

				pTag.textContent = newStackItem;
				pTag.classList.add("infoStack", "defaultMargin");

				deleteButton.textContent = "X";
				deleteButton.classList.add("deleteButton");
				deleteButton.setAttribute('data-item', newStackItem);
				
				deleteButton.addEventListener("click", function() {
					var itemValue = deleteButton.getAttribute('data-item');
					Array.from(profileForm.elements).forEach(function(element) {
						if (element.name === 'stack[]' && element.value === itemValue) {
							element.remove();
						}
					});
					direction2Div.remove();

				stackList1111 = Array.from(profileForm.elements).filter(element => element.name === 'stack[]').map(element => element.value);
					console.log(Array.from(profileForm.elements).filter(element => element.name === 'stack[]').map(element => element.value));
				});

				pTag.appendChild(deleteButton);
				direction2Div.appendChild(pTag);

				document.getElementsByClassName("stackItems")[0].appendChild(direction2Div);

				var hiddenInput = document.createElement("input");
				hiddenInput.type = "hidden";
				hiddenInput.name = "stack[]";
				hiddenInput.value = newStackItem;
				profileForm.appendChild(hiddenInput);

				document.getElementById("newStackItem").value = "";
				
			}
		});
}
	/* 취소버튼  */
	function confirmCancel() {
		var confirmResult = confirm("취소하시면 작성된 내용이 사라집니다. 취소하시겠습니까?");
		return confirmResult;
	}


	/* 프로필 이미지 변경 */
	function handleFileInput(e) {
		  	        
		try {
			var fileName = e.target.value.split(/(\\|\/)/g).pop();
			console.log("Selected file: ", fileName);
			document.getElementById("file-name").textContent = fileName ? fileName
					: "파일을 선택해주세요.";

			if (e.target.files.length > 0) {
				// 이미지 미리보기 업데이트
				var reader = new FileReader();
				reader.onload = function(e) {
					console.log("FileReader onload event fired");
					document.querySelector(".profileImg").src = e.target.result;
				}
				reader.onerror = function(e) {
					console.error("에러남: ", e);
				}
				reader.readAsDataURL(e.target.files[0]);
			}
		} catch (error) {
			console.error("에러남 : ", error);
		}
	}
	/* 저장버튼 */
	function confirmSave() {
		console.log("asdasdadasd");
		console.log(hopeList1111);
		console.log(stackList1111);
/* 		console.log(Array.from(profileForm.elements).filter(element => element.name === 'hope[]').map(element => element.value));
		console.log(Array.from(profileForm.elements).filter(element => element.name === 'stack[]').map(element => element.value));
		 *//* console.log(fileName); */
		console.log(document.getElementById('nickname').value);
		console.log(document.getElementById('number').value);

	/*	
    var confirmResult = confirm("저장하시겠습니까?");
    if (confirmResult) {
        var hopeItems = Array.from(profileForm.elements).filter(element => element.name === 'hope[]').map(element => element.value);
        var stackItems = Array.from(profileForm.elements).filter(element => element.name === 'stack[]').map(element => element.value);
        console.log(hopeItems);
 */        
    /*     $.ajax({
            type:'post',
            url:'/mypage/editProfile',
        	data: {
          	  hope: hopeItems,
              stack: stackItems,
              imageFileName: fileName,
              imageFilePath : '/resources/uploads/member/',
              nickname: document.getElementById('nickname').value,
              email: document.getElementById('email').value,
              number: document.getElementById('number').value
        },
            dataType: "text",
            success: function(data){   //요청 성공시 실행될 메서드
            console.log('Success:', data);
                 alert('데이터가 성공적으로 저장되었습니다!');
         },
         error:function(error){       //요청 실패시 에러 확인을 위함
           console.error('Error:', error);
              alert('데이터 저장 중에 오류가 발생했습니다.');
         }
     }) */
	   /*  return confirmResult; */
	
		/* } */
	}
</script>