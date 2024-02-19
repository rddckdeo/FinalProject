
let allPercent = document.getElementById("allPercent");
let frontPercent = document.getElementById("frontPercent");
let backPercent = document.getElementById("backPercent");

var barExampleChart = null;

let labels = ['전체달성도', 'front 달성도', 'back 달성도']; // 전체달성도, 부분별 달성도   (front back)
let fulls = [];
let backgroundColor = ['yellow', 'blue', 'green'];

$.ajax({
	type: 'post',
	url: '/colabo/allSkillChart.do',
	dataType: "json",
	success: function(data) {   //요청 성공시 실행될 메서드

		console.log(data);
		if (data.allResult == null) {
			data.allResult = 0;
		}
		if (data.front == null) {
			data.front = 0;
		}
		if (data.back == null) {
			data.back = 0;
		}

		fulls.push(data.allResult);
		fulls.push(data.front);
		fulls.push(data.back);

		allPercent.innerHTML = Math.ceil(data.allResult) + " % 입니다.";
		frontPercent.innerHTML = Math.ceil(data.front) + " % 입니다.";
		backPercent.innerHTML = Math.ceil(data.back) + " % 입니다.";

		barChartGet();
	},
	error: function() {		 //요청 실패시 에러 확인을 위함
		barChartGet();
	}
})

function barChartGet() {
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
				label: '전체 달성도',
			}]
		},
		options: {
			events: ['click'],
			responsive: false,
			plugins: {
				title: {
					display: true,
					text: '프로젝트 전체 달성도',
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




document.addEventListener('DOMContentLoaded', function() {
	var events = [];
	$.ajax({
		type: 'post',
		url: '/colabo/schedule.do',
		dataType: "json",
		success: function(data) {   //요청 성공시 실행될 메서드

			for (let i = 0; i < data.length; i++) {
				var eventData = {
					title: data[i].title,
					start: data[i].start,
					end: data[i].end
				};
				events.push(eventData);
				eventData = {};
			}
			createCalendar()
		},
		error: function() {		 //요청 실패시 에러 확인을 위함
			createCalendar()
		}
	})

	function createCalendar() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			contentHeight: 700,
			expandRows: true, // 화면에 맞게 높이 재설정
			slotMinTime: '08:00', // Day 캘린더에서 시작 시간
			slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
			headerToolbar: {
			},
			initialView: 'timeGridDay', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
			editable: true, // 수정 가능?
			selectable: true, // 달력 일자 드래그 설정가능
			nowIndicator: true, // 현재 시간 마크
			dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			locale: 'ko', // 한국어 설정
			eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트     
				console.log(obj);
			},
			eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
				console.log(obj);
			},
			eventRemove: function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
				console.log(obj);
			},

			// 이벤트 
			events: events
		});
		calendar.render();
	}


});


function selectEmailMember() {
	let selectMemberInput = document.getElementById("selectMemberInput").value;
	let inviteListUl = document.getElementById("inviteListUl");

	inviteListUl.textContent = "";


	$.ajax({
		type: 'post',
		url: '/colabo/selectEmailMember.do',
		data: {
			selectText: selectMemberInput
		},
		dataType: "json",
		success: function(data) {   //요청 성공시 실행될 메서드
			console.log(data);
			//			inviteListUl.removeAttribute();
			for (let i = 0; i < data.length; i++) {
				let list = document.createElement("li");
				list.textContent = data[i].memberEmail + '-' + data[i].memberName;
				list.value = data[i].memberNo;
				inviteListUl.appendChild(list);

				let inviteBtn = document.createElement("button");
				inviteBtn.value = data[i].memberNo;
				inviteBtn.textContent = data[i].memberName + '님 초대';
				inviteBtn.setAttribute('type', 'button');
				inviteBtn.setAttribute('class', 'btn btn-outline-primary');
				inviteBtn.addEventListener("click", function() {
					// 동적으로 생성된 리스트에 버튼을누르면 해당 멤버의 idx 값을 가져옴
					// 이걸로 채팅구현 후 초대메시지 보내기 로직추가
					console.log(inviteBtn.value);
					
					if(confirm("초대하시겠습니까?")){
						$.ajax({
							type: 'post',
							url: '/colabo/inviteProject.do',
							data: {
								memberNo:inviteBtn.value
							},
							dataType: "text",
							success: function(data) {   //요청 성공시 실행될 메서드
								if(data == "success"){
									alert("초대에 성공하였습니다.");
								}else{
									alert("초대에 실패하였습니다.");
								}
							},
							error: function() {		 //요청 실패시 에러 확인을 위함
							}
						})
					}


				})


				inviteListUl.appendChild(inviteBtn);

			}


		},
		error: function() {		 //요청 실패시 에러 확인을 위함
		}
	})


}


function projectTypeBtn(projectType, projectNo) {
	console.log("프로젝트넘버는 : " + projectNo);

	if (projectType == '프로젝트진행' || projectType == '프로젝트완료') {


		if (confirm(projectType + "을(를) 진행하시겠습니까? 다시 되돌릴수없습니다.")) {

			$.ajax({
				type: 'post',
				url: '/colabo/changeProjectType.do',
				data: {
					no: projectNo,
					stateKor: projectType
				},
				dataType: "text",
				success: function(data) {   //요청 성공시 실행될 메서드

					if (data == 'success') {
						alert("수정에 성공하였습니다.")
					} else {
						alert("수정에 실패하였습니다.")
					}

					window.location.href = "/colabo/colaboBasicPage";

				},
				error: function() {		 //요청 실패시 에러 확인을 위함
				}
			})

		}
	} else {
		alert("다시 시도해주세요");
	}

}


















