let position = 0;
    const moveSize = 120;

    // 오른쪽 버튼 클릭 이벤트
    document.getElementById("swipe-category-nextBtn").onclick = function () {
        const circles = document.getElementById("circles");

        // 원들의 총 개수를 계산
        const totalCircles = circles.getElementsByClassName("swipe-category").length;

        if (position < totalCircles - 4) {
            position++;
            circles.style.transform = `translateX(-${position * moveSize}px)`;
        }
    }

    // 왼쪽 버튼 클릭 이ㅡ벤트
    document.getElementById("swipe-category-prevBtn").onclick = function () {
        const circles = document.getElementById("circles");

        if (position > 0) {
            position--;
            circles.style.transform = `translateX(-${position * moveSize}px)`;
        }
    }



const cardContainer = document.querySelector('.card-container');
    const prevBtn = document.querySelector('#project-prevBtn');
    const nextBtn = document.querySelector('#project-nextBtn');

    let scrollAmount = 0;

    function swipeCard(direction) {
        direction === 'next' ? scrollAmount += 273 : scrollAmount -= 273;

        if (scrollAmount < 0) {
            scrollAmount = 0;
        }

        if (scrollAmount > cardContainer.scrollWidth) {
            scrollAmount = cardContainer.scrollWidth;
        }

        cardContainer.scrollTo({
            top: 0,
            left: scrollAmount,
            behavior: 'smooth'
        });
    }

    prevBtn.addEventListener('click', () => swipeCard('prev'));
    nextBtn.addEventListener('click', () => swipeCard('next'));