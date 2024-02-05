document.addEventListener('DOMContentLoaded', function() {

var barExampleChart = null;

let labels = []; // 전체달성도, 부분별 달성도   (front back)
let fulls = [];
let backgroundColor = ['yellow','blue','green'];
	$.ajax({
                type:'post',
                url:'/colabo/getProjectNameNumberList.do',
                dataType: "json",
                success: function(data){   //요청 성공시 실행될 메서드
					
					console.log(data);
//					if(data.allResult == null){
//						data.allResult = 0;
//					}
//					if(data.front == null){
//						data.front = 0;
//					}
//					if(data.back == null){
//						data.back = 0;
//					}
					for(let i = 0; i<data.length; i++){
						labels.push(data[i].projectName+'-프로젝트');
						fulls.push(data[i].allResult);
						
					}
					
//					allPercent.innerHTML= Math.ceil(data.allResult) + " % 입니다.";
//					frontPercent.innerHTML = Math.ceil(data.front) + " % 입니다.";
//					backPercent.innerHTML = Math.ceil(data.back) + " % 입니다."; 
					
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
						label: '전체 달성도',
		            }]
		        },
		        options: {
					 events: ['click'],
					responsive: false,
		            plugins: {
		                title: {
		                    display: true,
		                    text: '참여중인 프로젝트 달성도',
							font: { // [타이틀 폰트 스타일 변경]
    							family: 'Comic Sans MS',
    							size: 20,
    							weight: 'bold',
    							lineHeight: 1.2,    							
    						},
		                },
		                legend: {
		                    display: false,
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










