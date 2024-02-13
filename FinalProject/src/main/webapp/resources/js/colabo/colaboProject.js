



function checkNumber(){
	let projectPerson = document.getElementById("projectPerson");
	let projectTerm = document.getElementById("projectTerm");
	if(projectPerson.value <1 || projectPerson.value >10){
		projectPerson.value = 1;
	}
	if(projectTerm.value <1 || projectTerm.value >12){
		projectTerm.value = 1;
	}
}

function nullCheckBtn(){
	let projectSubject = document.getElementById("projectSubject");
	let projectName = document.getElementById("projectName");
	let projectContent = document.getElementById("projectContent");
	let useStackName = document.getElementById("useStackName");
	let projectPerson = document.getElementById("projectPerson");
	let projectTerm = document.getElementById("projectTerm");
	
	let projectSubmitBtn = document.getElementById("projectSubmit");
	
	if(projectSubject.value != "" && projectName != "" && projectContent != ""
		 &&useStackName != "" && projectPerson != "" && projectTerm != "" ){
			projectSubmitBtn.disabled = false;
	}else{
		projectSubmitBtn.disabled = true;
	}
	
	
}