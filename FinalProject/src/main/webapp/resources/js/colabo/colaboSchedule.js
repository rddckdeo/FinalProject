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
       var calendarEl = document.getElementById('calendar');
       var calendar = new FullCalendar.Calendar(calendarEl, {
		 expandRows: true, // 화면에 맞게 높이 재설정
		 slotMinTime: '08:00', // Day 캘린더에서 시작 시간
		 slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
		 headerToolbar: {
			left: 'prev,next today',    // 캘린더 왼쪽 버튼, 오늘로 가기  
	        center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
		 },
         initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
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
		select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
			var title = prompt('할일 작성 :');
			if (title && title.length < 20) {
				calendar.addEvent({
				title: title,
				start: arg.start,
				end: arg.end,
				allDay: arg.allDay
			})
			
			$.ajax({
                type:'post',
                url:'/colabo/scheduleEnroll.do',
                dataType: "text",
				data: {
					title: title,
					start: arg.start,
					end: arg.end
				},
                success: function(data){   //요청 성공시 실행될 메서드
			        console.log("데이터 넣기 통신성공");
			    },
			    error:function(){		 //요청 실패시 에러 확인을 위함
			        console.log("통신에러");
			    }
			})
			
			
			}
			// 선택 해제
			calendar.unselect()
		 },
			eventClick: function (info){
                if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까 ?")){
                    // 확인 클릭 시
                    info.event.remove();

					var obj = new Object();     // Json 을 담기 위해 Object 선언
	                obj.title = info.event.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
	                obj.start = info.event.start.toString(); // 시작
	                obj.end = info.event.end.toString(); // 끝
					
			
					$.ajax({
		                type:'post',
		                url:'/colabo/scheduleDelete.do',
		                dataType: "text",
						data: JSON.stringify(obj),
						contentType: 'application/json; charset=utf-8',
						
		                success: function(data){   //요청 성공시 실행될 메서드
					        console.log("데이터 지우기 성공");
							alert('삭제' + data);
					    },
					    error:function(){		 //요청 실패시 에러 확인을 위함
					        console.log("통신에러");
					    }
					})
                }
				
//				var deleteSchedule = {
//					title: info.event.title,
//					start: info.event.start,
//					end: info.event.end
//				}
//				var events = new Array(); // Json 데이터를 받기 위한 배열 선언
//                var obj = new Object();     // Json 을 담기 위해 Object 선언
//                obj.title = info.event.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
//                obj.start = info.event.start.toString(); // 시작
//                obj.end = info.event.end.toString(); // 끝
//                events.push(obj);
                },
		
		// 이벤트 
        events: events
       });
       calendar.render();
	}
	
	
 });