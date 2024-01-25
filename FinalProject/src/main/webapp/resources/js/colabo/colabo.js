const pieExample = document.querySelector('#pieExample').getContext('2d');
const pieExampleChart = new Chart(pieExample, {
        type: 'pie',
        data: {
            labels: ['Red', 'Blue', 'Green'],
            datasets: [{
                data: [20, 30, 50],
                backgroundColor: [
                    'rgba(255, 0, 0, 0.5)', 
                    'rgba(0, 0, 255, 0.5)', 
                    'rgba(48, 255, 93, 0.5)'
                    ],
                borderColor: [
                    'rgba(255, 0, 0, 1)', 
                    'rgba(0, 0, 255, 1)', 
                    'rgba(48, 255, 93, 1)'
                    ],
                borderWidth: 1
            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: '~~~프로젝트'
                },
                legend: {
                    display: true,
                    position: 'right'
                }
            }
        }
    });




document.addEventListener('DOMContentLoaded', function() {
		var events = [];
		$.ajax({
                type:'post',
                url:'/colabo/schedule.do',
                dataType: "json",
                success: function(data){   //요청 성공시 실행될 메서드
					
					for(let i =0; i<data.length; i++){
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
			    error:function(){		 //요청 실패시 에러 확인을 위함
					createCalendar()
			    }
			})
		
	function createCalendar(){
		console.log("events  는 : "+ events);
       var calendarEl = document.getElementById('calendar');
       var calendar = new FullCalendar.Calendar(calendarEl, {
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
		eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
			console.log(obj);
		},
		
		// 이벤트 
        events: events
       });
       calendar.render();
	}
	
	
 });



















