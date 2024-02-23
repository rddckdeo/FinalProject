let idFlag = false;
let nicknameFlag = false;
let pwdFlag = false;
let registerFlag = false;

function idCheck() {
	const idInput = document.getElementById("exampleInputtext1").value;
	const checkFont1 = document.getElementById("checkFont1");
	const checkFont2 = document.getElementById("checkFont2");
	$.ajax({
		type: 'get',
		url: '/member/idCheck.do',
		data: {
			idInput: idInput
		},
		dataType: "text",
		success: function(data) {
			if (data !== idInput) { //사용가능할 경우
				checkFont1.style.display = "block";
				checkFont2.style.display = "none";
				idFlag = true;
				formAble();
			  }else if(data === idInput && data !== ''){	// 이미 아이디가 있는 경우
				checkFont2.style.display = "block";
				checkFont1.style.display = "none";
				idFlag = false;
				formAble();
			}else{
				alert("id를 입력해주세요");
				checkFont2.style.display = "none";
				checkFont1.style.display = "none";
				idFlag = false;
				formAble();
			}
		},
		error: function() {
			alert("error");
		}
	})
}
// 닉네임 중복 체크
function nicknameCheck() {
	const nicknameInput = document.getElementById("nicknameInput").value;
	const nicknameFont1 = document.getElementById("nicknameFont1");
	const nicknameFont2 = document.getElementById("nicknameFont2");
	$.ajax({
		type: 'get',
		url: '/member/nicknameCheck.do',
		data: {
			nicknameInput: nicknameInput
		},
		dataType: "text",
		success: function(data) {
			if (data !== nicknameInput) { //사용가능할 경우
				nicknameFont1.style.display = "block";
				nicknameFont2.style.display = "none";
				nicknameFlag = true;
				formAble();
			} else if(data === nicknameInput && data !== ''){	// 이미 아이디가 있는 경우
				nicknameFont2.style.display = "block";
				nicknameFont1.style.display = "none";
				nicknameFlag = false;
				formAble();
			}else{
				alert("별명을 입력해주세요");
				nicknameFont2.style.display = "none";
				nicknameFont1.style.display = "none";
				nicknameFlag = false;
				formAble();
			}
		},
		error: function() {
			alert("error");
		}
	})
}
// 약관 동의 modal창 On
function registerModalOn() {
	const register = document.getElementById("registerModal");
	register.style.display = "block";
	event.preventDefault(); // 이벤트의 기본 동작(여기서는 스크롤 이동)을 막음
}
// 약관 동의 modal창 Off
function registerModalOff() {
	const register = document.getElementById("registerModal");
	const agreeCheck = document.getElementById("agreeCheck");
	let agreeCheck2 = document.getElementById("agreeCheck2");

	if (agreeCheck.checked) {
		agreeCheck2.checked = true;
		registerFlag = true;
		formAble();
	} else if (!agreeCheck.checked) {
		agreeCheck2.checked = false;
		registerFlag = false;
		formAble();
	}

	register.style.display = "none";
	event.preventDefault(); // 이벤트의 기본 동작(여기서는 스크롤 이동)을 막음

}
// password 체크
function pwdCheck() {
	let pwd = document.getElementById("pwd").value;
	let pwdAgain = document.getElementById("pwdAgain").value;
	let pwdCheck = document.getElementById("pwdCheck");
	let pwdCheck2 = document.getElementById("pwdCheck2");

	if (pwd === pwdAgain) {
		// 비밀번호 일치
		pwdCheck.style.display = "block";
		pwdCheck2.style.display = "none";
		pwdFlag = true;
		formAble();
	} else {
		// 비밀번호 불일치
		pwdCheck.style.display = "none";
		pwdCheck2.style.display = "block";
		pwdFlag = false;
		formAble();
	}
}
// 기술 stack 추가
function StackAdd(){
	const create_box = document.getElementById("create_box");
	let stackInput = document.getElementById("stackInput").value.trim();
	const pTag = document.createElement("p");
	let hidden = document.getElementById("hiddenStackValue");
	const btn = document.createElement("button");
	//count값
	const stackHidden = document.getElementById("stackHidden");
	const stackBtnHidden = document.getElementById("stackBtnHidden");
	
	if(stackInput !== ''){
		if(hidden.value === ''){
			pTag.textContent = stackInput;  // 새로 생성한 p 태그의 텍스트 내용 설정
			pTag.classList.add("stackTagStyle"); //생성할 p 태그의 classs 부여
			
			btn.textContent = "X";
			btn.classList.add("stackBtn");
			
			pTag.id = "stackPtag" + stackHidden.value;
			btn.id = "stackBtn" + stackBtnHidden.value;
			
			create_box.appendChild(pTag);   // create_box에 p 태그를 추가
			create_box.appendChild(btn);	// create_box에 button 추가
			
			btn.onclick = function(){
				removeTag2(pTag.id, btn.id);
			}
			
			hidden.value = stackInput;
			document.getElementById("stackInput").value = "";
			stackHidden.value++;
			stackBtnHidden.value++;	
		}else{
			pTag.textContent = stackInput;  // 새로 생성한 p 태그의 텍스트 내용 설정
			pTag.classList.add("stackTagStyle"); //생성할 p 태그의 classs 부여
			
			btn.textContent = "X";
			btn.classList.add("stackBtn");
			
			pTag.id = "stackPtag" + stackHidden.value;
			btn.id = "stackBtn" + stackBtnHidden.value;
			
			create_box.appendChild(pTag);   // create_box에 p 태그를 추가
			create_box.appendChild(btn);	// create_box에 button 추가
			
			btn.onclick = function(){
				removeTag2(pTag.id, btn.id);
			}
			
			hidden.value = hidden.value + "," + stackInput;
			document.getElementById("stackInput").value = "";
			stackHidden.value++;
			stackBtnHidden.value++;	
		}
	}else{
		alert("값을 입력해주세요");
	}
	
}

function stackEnter(){
	if(event.keyCode === 13){
		const create_box = document.getElementById("create_box");
	let stackInput = document.getElementById("stackInput").value.trim();
	const pTag = document.createElement("p");
	let hidden = document.getElementById("hiddenStackValue");
	const btn = document.createElement("button");
	//count값
	const stackHidden = document.getElementById("stackHidden");
	const stackBtnHidden = document.getElementById("stackBtnHidden");
	
	if(stackInput !== ''){
		if(hidden.value === ''){
			pTag.textContent = stackInput;  // 새로 생성한 p 태그의 텍스트 내용 설정
			pTag.classList.add("stackTagStyle"); //생성할 p 태그의 classs 부여
			
			btn.textContent = "X";
			btn.classList.add("stackBtn");
			
			pTag.id = "stackPtag" + stackHidden.value;
			btn.id = "stackBtn" + stackBtnHidden.value;
			
			create_box.appendChild(pTag);   // create_box에 p 태그를 추가
			create_box.appendChild(btn);	// create_box에 button 추가
			
			btn.onclick = function(){
				removeTag2(pTag.id, btn.id);
			}
			
			hidden.value = stackInput;
			document.getElementById("stackInput").value = "";
			stackHidden.value++;
			stackBtnHidden.value++;	
		}else{
			pTag.textContent = stackInput;  // 새로 생성한 p 태그의 텍스트 내용 설정
			pTag.classList.add("stackTagStyle"); //생성할 p 태그의 classs 부여
			
			btn.textContent = "X";
			btn.classList.add("stackBtn");
			
			pTag.id = "stackPtag" + stackHidden.value;
			btn.id = "stackBtn" + stackBtnHidden.value;
			
			create_box.appendChild(pTag);   // create_box에 p 태그를 추가
			create_box.appendChild(btn);	// create_box에 button 추가
			
			btn.onclick = function(){
				removeTag2(pTag.id, btn.id);
			}
			
			hidden.value = hidden.value + "," + stackInput;
			document.getElementById("stackInput").value = "";
			stackHidden.value++;
			stackBtnHidden.value++;	
		}
	}else{
		alert("값을 입력해주세요");
	}
	
	}
}

function hopeAdd(){
	const create_box = document.getElementById("create_box2"); // 부모요소
	let hopeInput = document.getElementById("hopeInput").value.trim();
	const pTag = document.createElement("p");
	let hidden = document.getElementById("hopeStackValue");
	const btn = document.createElement("button");
	const hopeHidden = document.getElementById("hopeHidden");
	const hopeBtnHidden = document.getElementById("hopeBtnHidden");
	
	if(hopeInput !== ''){
		if(hidden.value === ''){
			pTag.textContent = hopeInput;  // 새로 생성한 p 태그의 텍스트 내용 설정
			pTag.classList.add("stackTagStyle"); //생성할 p 태그의 classs 부여
			
			btn.textContent = "X";
			btn.classList.add("stackBtn");
			
			pTag.id = "ptag" + hopeHidden.value;
			btn.id = "btn" + hopeBtnHidden.value;
			
			create_box.appendChild(pTag);   // create_box에 p 태그를 추가
			create_box.appendChild(btn);	// create_box에 button 추가
			
			btn.onclick = function(){
				removeTag(pTag.id, btn.id);
			}
			
			hidden.value = hopeInput;
			document.getElementById("hopeInput").value = "";
			hopeHidden.value++;
			hopeBtnHidden.value++;
		}else{
			pTag.textContent = hopeInput;  // 새로 생성한 p 태그의 텍스트 내용 설정
			pTag.classList.add("stackTagStyle"); //생성할 p 태그의 classs 부여
			
			btn.textContent = "X";
			btn.classList.add("stackBtn");
			
			pTag.id = "ptag" + hopeHidden.value;
			btn.id = "btn" + hopeBtnHidden.value;
			
			create_box.appendChild(pTag);   // create_box에 p 태그를 추가
			create_box.appendChild(btn);	// create_box에 button 추가
			
			btn.onclick = function(){
				removeTag(pTag.id, btn.id);
			}
			
			hidden.value = hidden.value + "," + hopeInput;
			document.getElementById("hopeInput").value = "";
			hopeHidden.value++;
			hopeBtnHidden.value++;
		}
	}else{
		alert("값을 입력해주세요");
	}
}

function hopeEnter(){
	if(event.keyCode === 13){
		const create_box = document.getElementById("create_box2"); // 부모요소
	let hopeInput = document.getElementById("hopeInput").value.trim();
	const pTag = document.createElement("p");
	let hidden = document.getElementById("hopeStackValue");
	const btn = document.createElement("button");
	const hopeHidden = document.getElementById("hopeHidden");
	const hopeBtnHidden = document.getElementById("hopeBtnHidden");
	
	if(hopeInput !== ''){
		if(hidden.value === ''){
			pTag.textContent = hopeInput;  // 새로 생성한 p 태그의 텍스트 내용 설정
			pTag.classList.add("stackTagStyle"); //생성할 p 태그의 classs 부여
			
			btn.textContent = "X";
			btn.classList.add("stackBtn");
			
			pTag.id = "ptag" + hopeHidden.value;
			btn.id = "btn" + hopeBtnHidden.value;
			
			create_box.appendChild(pTag);   // create_box에 p 태그를 추가
			create_box.appendChild(btn);	// create_box에 button 추가
			
			btn.onclick = function(){
				removeTag(pTag.id, btn.id);
			}
			
			hidden.value = hopeInput;
			document.getElementById("hopeInput").value = "";
			hopeHidden.value++;
			hopeBtnHidden.value++;
		}else{
			pTag.textContent = hopeInput;  // 새로 생성한 p 태그의 텍스트 내용 설정
			pTag.classList.add("stackTagStyle"); //생성할 p 태그의 classs 부여
			
			btn.textContent = "X";
			btn.classList.add("stackBtn");
			
			pTag.id = "ptag" + hopeHidden.value;
			btn.id = "btn" + hopeBtnHidden.value;
			
			create_box.appendChild(pTag);   // create_box에 p 태그를 추가
			create_box.appendChild(btn);	// create_box에 button 추가
			
			btn.onclick = function(){
				removeTag(pTag.id, btn.id);
			}
			
			hidden.value = hidden.value + "," + hopeInput;
			document.getElementById("hopeInput").value = "";
			hopeHidden.value++;
			hopeBtnHidden.value++;
		}
	}else{
		alert("값을 입력해주세요");
	}
	}
}

function removeTag(tagId, btnId) {
    let removeTag = document.getElementById(tagId);
    let removeBtnTag = document.getElementById(btnId);
    if (removeTag && removeBtnTag) {
        removeTag.remove();
		removeBtnTag.remove();
    }
	updateHiddenValue();
}

function removeTag2(tagId, btnId) {
    let removeTag = document.getElementById(tagId);
    let removeBtnTag = document.getElementById(btnId);
    if (removeTag && removeBtnTag) {
        removeTag.remove();
		removeBtnTag.remove();
    }
	updateHiddenValue2();
}

function updateHiddenValue(){
	const create_box = document.getElementById("create_box2");
	const hidden = document.getElementById("hopeStackValue");
	
	const pTags = create_box.querySelectorAll("p");
	hidden.value = Array.from(pTags).map(tag => tag.textContent).join(",");
}

function updateHiddenValue2(){
	const create_box = document.getElementById("create_box");
	const hidden = document.getElementById("hiddenStackValue");
	
	const pTags = create_box.querySelectorAll("p");
	hidden.value = Array.from(pTags).map(tag => tag.textContent).join(",");
}

// 전화번호 합치기
function submitData(){
	let num1 = document.getElementById("number1").value;
	let num2 = document.getElementById("number2").value;
	let num3 = document.getElementById("number3").value;
	let number = num1 + num2 + num3;
	let TotalNum = document.getElementById("TotalNum");
	
	TotalNum.value = number;
	
	
	/*$.ajax({
		type: 'post',
		url: '/member/register.do',
		data: {
			number: number
		},
		dataType: "text",
		success: function() {
			
		},
		error: function() {
			alert("error");
		}
	})*/
}

function formAble(){
	let formBtn = document.getElementById("registerFormBtn");
	let formTag = document.getElementById("formTag");
	if(idFlag === true && pwdFlag === true && registerFlag === true && nicknameFlag === true){
		formBtn.disabled = false;
		formTag.onsubmit = function(){
			return true;
		}
	}else{
		formBtn.disabled = true;
		formTag.onsubmit = function(){
			return false;
		}
	}
}