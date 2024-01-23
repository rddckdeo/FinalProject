document.addEventListener("DOMContentLoaded", function () {
    // 캔버스와 2D 그리기 컨텍스트 가져오기
    var canvas = document.getElementById("myCanvas");
    var context = canvas.getContext("2d");
    var isDrawing = false;
    var currentColor = "black"; // 현재 선 색상

    // 마우스 다운 이벤트 처리
    canvas.addEventListener("mousedown", function (e) {
        // 그림 그리기 시작
        isDrawing = true;

        // 새로운 경로 시작
        context.beginPath();
		
        // 현재 마우스 위치를 시작점으로 설정
        var rect = canvas.getBoundingClientRect();
        context.moveTo(e.clientX - rect.left, e.clientY - rect.top);
        
        // 현재 색상 설정
        context.strokeStyle = currentColor;
    });

    // 마우스 이동 이벤트 처리
    canvas.addEventListener("mousemove", function (e) {
        // 마우스가 클릭된 상태에서만 그림 그리기 수행
        if (!isDrawing) return;

        // 현재 마우스 위치까지 선을 그리기
        var rect = canvas.getBoundingClientRect();
        context.lineTo(e.clientX - rect.left, e.clientY - rect.top);
        
        // 그림 그리기 수행
        context.stroke();
    });

    // 마우스 업 이벤트 처리
    canvas.addEventListener("mouseup", function () {
        // 그림 그리기 종료
        isDrawing = false;
    });

    // 마우스 나감 이벤트 처리
    canvas.addEventListener("mouseout", function () {
        // 그림 그리기 종료
        isDrawing = false;
    });
	
	document.querySelectorAll(".changeSize").forEach(function(size) {
		size.addEventListener("click", function(event) {
			context.lineWidth = event.target.value;
		})
	});

	
	// 모든 버튼에 대한 이벤트 리스너 등록                          - button 각 클래스에대한 요소
	document.querySelectorAll(".changeColor").forEach(function(button) {
	    button.addEventListener("click", function(event) {
	        currentColor = event.target.value;
	    });
	});

    // 이미지 저장 버튼 클릭 시
    document.getElementById("saveBtn").addEventListener("click", function () {
        var image = canvas.toDataURL("image/png"); // 캔버스 이미지를 데이터 URL로 변환
        var link = document.createElement("a"); // 링크 엘리먼트 생성
        link.href = image;
        link.download = "drawing.png"; // 다운로드할 파일 이름 지정
        link.click(); // 가상의 링크 클릭하여 다운로드 수행
    });

    // 전체 지우기 버튼 클릭 시
    document.getElementById("clearBtn").addEventListener("click", function () {
        context.clearRect(0, 0, canvas.width, canvas.height); // 캔버스를 전체적으로 지움
    });
});