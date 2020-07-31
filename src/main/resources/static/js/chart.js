$.ajax({
    url: dashboard,
    success: function (result) {
        var months = JSON.parse(result).months;
        var subscribers = JSON.parse(result).subscribers;
        drawLineChart(months, subscribers);
    }
})

function drawLineChart(months, subscribers) {
    Highcharts.chart('container', {

        chart: {
            type: 'line',
            width: 500
        },

        title: {
            text: 'Line Chart'
        },

        tooltip: {
            formatter: function() {
                return '<strong>' + this.x + ': </strong>' + this.y;
            }
        },

        xAxis: {
            categories: months
        },

        series: [{
            data: subscribers
        }]
    });
}
