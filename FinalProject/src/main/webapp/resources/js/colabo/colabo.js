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