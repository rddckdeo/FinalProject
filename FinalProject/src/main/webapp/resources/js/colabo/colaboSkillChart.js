document.addEventListener('DOMContentLoaded', function() {

var barExampleChart = null;

let labels = ['최댓값'];
let fulls = [100];
let backgroundColor = ['yellow'];
	$.ajax({
                type:'post',
                url:'/colabo/SkillChart.do',
                dataType: "json",
                success: function(data){   //요청 성공시 실행될 메서드
					
					for(let i =0; i<data.length; i++){
						
						// 이유는 모르겠지만  data.length 는 개수만큼 제대로나오는데 
						// 반복문을 실행했을때 데이터가 4 길이 라고하면 12개까지 나옴 
						
						if(data[i].full == null){
							break;
						}
						labels.push((data[i].memberNames+'-'+data[i].labels));
						fulls.push(data[i].full);
						backgroundColor.push(data[i].backgroundColors);
					}
					barChartGet();
			    },
			    error:function(){		 //요청 실패시 에러 확인을 위함
					barChartGet();
			    }
			})
			
		function barChartGet(){
		const barExample = document.querySelector('#barExample').getContext('2d');
		barExampleChart = new Chart(barExample, {
		        type: 'bar',
		        data: {
		            labels: labels,
		            datasets: [{
		                data: fulls,
		                backgroundColor: backgroundColor,
		                borderColor: backgroundColor,
		                borderWidth: 1,
						label: '전체 퍼센트',
		            }]
		        },
		        options: {
					 events: ['click'],
					responsive: false,
		            plugins: {
		                title: {
		                    display: true,
		                    text: '기능별 달성도',
							font: { // [타이틀 폰트 스타일 변경]
    							family: 'Comic Sans MS',
    							size: 20,
    							weight: 'bold',
    							lineHeight: 1.2,    							
    						},
		                },
		                legend: {
		                    display: true,
		                    position: 'top',
		                },
		            },
					scales: {
    					y: { // [y 축 관련 설정] 
    						min: 0, // [y 축 데이터 설정 0 ~ 30 까지 제한]
    						max: 100,
    						grid: { // [y 축 데이터 시트 배경 선색 표시]
    							drawBorder: false,
    							color: function(context) {
    								if (context.tick.value >= 20) {
    									return 'rgba(0, 0, 255, 0.2)'; // 파랑
    								}
    								else if (context.tick.value < 20 && context.tick.value >= 10) {
    									return 'rgba(255, 0, 0, 0.2)'; // 빨강
    								}
    								else {
    									return 'rgba(0, 0, 0, 0.2)'; // 검정색
    								}    								
    							}
    						},
    						ticks: {
    							color: '#911', // [y 축 폰트 색상 설정]
    							font: { // [y축 폰트 스타일 변경]
    								family: 'Comic Sans MS',
    								size: 15,
    								weight: 'bold',
    								lineHeight: 1.2,   
    							} 
    						}
    					},
    					x: { // [x 축 관련 설정] 
    						ticks: {
    							color: '#911', // [x 축 폰트 색상 설정]
    							font: { // [x축 폰트 스타일 변경]
    								family: 'Comic Sans MS',
    								size: 12,
    								weight: 'bold',
    								lineHeight: 1.2,   
    							} 
    						}
    					}
    				}


		        },
		    });
		}
});


function chartBtn(btnText){
	console.log(btnText);
	
	if(btnText == 'add'){
		
	}else if(btnText == 'edit'){
		
	}else{
		
	}
	
	
	
	
}

// 기능인원추가  가져오기
function getPersonList(){
	let selectProjectPeople = document.getElementById("projectPeople");
	selectProjectPeople.innerText = null;
	$.ajax({
        type:'post',
        url:'/colabo/getProjectMember.do',
        dataType: "json",
        success: function(data){   //요청 성공시 실행될 메서드
			let option=document.createElement("option");
				option.text = '-----인원선택-----';
				option.value = '';
				selectProjectPeople.appendChild(option);
	
			for(let i =0; i<data.length; i++){
				let option=document.createElement("option");
				option.text = data[i].memberEmail+'-'+data[i].memberName;
				option.value = data[i].memberEmail+'-'+data[i].memberName+'-'+data[i].memberNo+'-'+data[i].projectNo;
				selectProjectPeople.appendChild(option);
			}
			
	    },
	    error:function(){		 //요청 실패시 에러 확인을 위함
			alert('다시 시도해주세요');
	    }
	})
}
// 기능삭제 인원 리스트 가져오기
function getSkillDeletePerson(){
	let selectSkillPeople = document.getElementById("skillDeletePeople"); 
	selectSkillPeople.innerText = null;
		$.ajax({
	        type:'post',
	        url:'/colabo/getSkillMember.do',
	        dataType: "json",
	        success: function(data){   //요청 성공시 실행될 메서드
				let option=document.createElement("option");
					option.text = '-----인원선택-----';
					option.value = '';
					selectSkillPeople.appendChild(option);

				console.log(data);
				for(let i =0; i<data.length; i++){
					let option=document.createElement("option");
					option.text = data[i].memberEmail+'-'+data[i].memberName+'-'+data[i].skillName;
					option.value = data[i].memberEmail+'-'+data[i].memberName+'-'+data[i].skillName+'-'+data[i].projectNo;
					selectSkillPeople.appendChild(option);
				}
				
		    },
		    error:function(){		 //요청 실패시 에러 확인을 위함
				alert('다시 시도해주세요');
		    }
		})
}

// 기능삭제 input 에 값넣기 
function getSkillDeleteValue() {
	let selectSkillPeople = document.getElementById("skillDeletePeople").value;
	let sendDeleteName = document.getElementById("sendDeleteName");
	
	sendDeleteName.value = selectSkillPeople;
}

// 기능삭제 
function deleteSkillAll(){
	let splitNameEmail = document.getElementById("sendDeleteName").value.split("-");
	
	console.log(splitNameEmail);
	let sendEmail = splitNameEmail[0];
	let sendSkillName = splitNameEmail[2];
	let sendProjectNo = splitNameEmail[3];
	
	if(sendEditFullPercent != ''){
		$.ajax({
	        type:'post',
	        url:'/colabo/deleteSkillList.do',
	        dataType: "text",
			data: {
				memberEmail: sendEmail,
				pmSkillName: sendSkillName,
				projectNo: sendProjectNo
			},
	        success: function(data){   //요청 성공시 실행될 메서드
				
				if(data == 'success'){
					alert('삭제에 성공하셨습니다. 기능페이지로 이동합니다.');
				}else{
					alert('삭제에 실패하셨습니다. 다시 시도해주세요.');
				}
				
				window.location.href = "/colabo/colaboSkill"
					
		    },
		    error:function(){		 //요청 실패시 에러 확인을 위함
				alert('다시 시도해주세요');
				window.location.href = "/colabo/colaboSkill"
		    }
		})
		
	}else{
		alert("제대로된 퍼센트를 입력해주세요.");
	}
}


// 기능수정 인원 리스트 가져오기
function getSkillPerson(){
	let selectSkillPeople = document.getElementById("skillPeople"); 
	selectSkillPeople.innerText = null;
		$.ajax({
	        type:'post',
	        url:'/colabo/getSkillMember.do',
	        dataType: "json",
	        success: function(data){   //요청 성공시 실행될 메서드
				let option=document.createElement("option");
					option.text = '-----인원선택-----';
					option.value = '';
					selectSkillPeople.appendChild(option);

				console.log(data);
				for(let i =0; i<data.length; i++){
					let option=document.createElement("option");
					option.text = data[i].memberEmail+'-'+data[i].memberName+'-'+data[i].skillName+'-'+data[i].skillCategory;
					option.value = data[i].memberEmail+'-'+data[i].memberName+'-'+data[i].skillName+'-'+data[i].projectNo+'-'+data[i].skillCategory;
					selectSkillPeople.appendChild(option);
				}
				
		    },
		    error:function(){		 //요청 실패시 에러 확인을 위함
				alert('다시 시도해주세요');
		    }
		})
}

// 기능 수정 input 에 값넣기 
function getSkillValue() {
	let selectSkillPeople = document.getElementById("skillPeople").value;
	let sendEditName = document.getElementById("sendEditName");
	
	let sendEditCategory = document.getElementById("sendEditCategory");
	
	sendEditCategory.value = selectSkillPeople.split("-")[4]; 	
	sendEditName.value = selectSkillPeople;
}

function inputEditPercent() {
	let inputFullPercent = document.getElementById("inputFullPercent").value;
	let sendEditFullPercent = document.getElementById("sendEditFullPercent");
	
	if(inputFullPercent <= 100 && inputFullPercent >=0){
		sendEditFullPercent.value = inputFullPercent;
	}else{
		alert("0이상 100 이하의 수를 입력하세요.");
		sendEditFullPercent.value = '';
	}
}

// edit Skill 제출값  서버로 이동
function editSkillAll() {
	let splitNameEmail = document.getElementById("sendEditName").value.split("-");
	let sendEditFullPercent = document.getElementById("sendEditFullPercent").value;
	
	console.log(splitNameEmail);
	let sendEmail = splitNameEmail[0];
	let sendSkillName = splitNameEmail[2];
	let sendProjectNo = splitNameEmail[3];
	
	if(sendEditFullPercent != ''){
		$.ajax({
	        type:'post',
	        url:'/colabo/editSkillList.do',
	        dataType: "text",
			data: {
				memberEmail: sendEmail,
				pmSkillName: sendSkillName,
				projectNo: sendProjectNo,
				pmSkillFull: sendEditFullPercent
			},
	        success: function(data){   //요청 성공시 실행될 메서드
				
				if(data == 'success'){
					alert('수정에 성공하셨습니다. 기능페이지로 이동합니다.');
				}else{
					alert('수정에 실패하셨습니다. 다시 시도해주세요.');
				}
				
				window.location.href = "/colabo/colaboSkill"
					
		    },
		    error:function(){		 //요청 실패시 에러 확인을 위함
				alert('다시 시도해주세요');
				window.location.href = "/colabo/colaboSkill"
		    }
		})
		
	}else{
		alert("제대로된 퍼센트를 입력해주세요.");
	}
}




// 기능추가 input 에 값들 집어넣기 
function getPersonValue(){
	let selectProjectPeople = document.getElementById("projectPeople").value;
	let sendName = document.getElementById("sendName");
	
	sendName.value = selectProjectPeople;
	
	console.log(sendName.value);
	
	console.log(selectProjectPeople);
}

function inputSkillName() {
	let inputSkillName = document.getElementById("inputSkillName").value;
	let sendSkillName = document.getElementById("sendSkillName");
	
	sendSkillName.value = inputSkillName;
}


function inputSkillCategory(){
	let inputSkillCategory = document.getElementById("inputskillCategory").value;
	let sendSkillCategory = document.getElementById("sendSkillCategory");
	
	sendSkillCategory.value = inputSkillCategory;
	
}


// 기능추가 Skill 제출값  서버로 이동
function enrollSkillAll() {
	let splitNameEmail = document.getElementById("sendName").value.split("-");
	let sendSkillName = document.getElementById("sendSkillName").value;
	let sendSkillCategory = document.getElementById("sendSkillCategory").value;
	
	let sendEmail = splitNameEmail[0];
	let sendName = splitNameEmail[1];
	let sendMemberNo = splitNameEmail[2];
	let sendProjectNo = splitNameEmail[3];
	
	$.ajax({
        type:'post',
        url:'/colabo/enrollSkillList.do',
        dataType: "text",
		data: {
			memberName: sendName,
			memberEmail: sendEmail,
			pmSkillName: sendSkillName,
			pmSkillCategory: sendSkillCategory,
			memberNo: sendMemberNo,
			projectNo: sendProjectNo
		},
        success: function(data){   //요청 성공시 실행될 메서드
			
			if(data == 'success'){
				alert('등록에 성공하셨습니다. 기능페이지로 이동합니다.');
			}else{
				alert('등록에 실패하셨습니다. 다시 시도해주세요.');
			}
			
			window.location.href = "/colabo/colaboSkill"
				
	    },
	    error:function(){		 //요청 실패시 에러 확인을 위함
			alert('다시 시도해주세요');
			window.location.href = "/colabo/colaboSkill"
	    }
	})
	
	
	
}

















