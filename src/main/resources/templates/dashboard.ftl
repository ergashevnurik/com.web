<html>
<head>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://code.highcharts.com/css/highcharts.css" />
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
</head>
<style>
    .chart {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.5);
    }
</style>
<body>
<div class="wrapper">
    <#include "parts/sideNavbar.ftl"/>
    <div class="container-fluid"  style="padding: 0;width: calc(100% - 260px);position: absolute;right: 0;">
        <#include "parts/navbar.ftl"/>
        <div class="container-fluid" style="padding: 0!important;">

            <div class="container mt-4">
                <div id="container" class="chart">

                </div>
                <div id="pie-chart" class="mt-3">

                </div>
            </div>

            <script>
                $(document).ready(
                    function() {
                        $.ajax({
                            url: '/pie-chart',
                            success: function (result) {
                                var series = [];
                                var data = [];

                                for(var i = 0; i < result.length; i++){
                                    var object = {};
                                    object.name = result[i].name.toUpperCase();
                                    object.y = result[i].yaxis;
                                    data.push(object);
                                }
                                var seriesObject = {
                                    name: 'Employees',
                                    colorByPoint: true,
                                    data: data
                                };
                                series.push(seriesObject);
                                console.log(result);
                                drawPieChart(series);
                            }
                        });
                    });

                function drawPieChart(series) {
                    Highcharts.chart('pie-chart', {
                        chart: {
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false,
                            type: 'pie',
                            width: 500,
                        },
                        title: {
                            text: 'Browser market shares in January, 2018'
                        },
                        tooltip: {
                            formatter: function() {
                                return '<strong>'+this.key+': </strong>'+ this.y;
                            }
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: true,
                                    format: '<b>{point.name}</b>: {point.y}'
                                }
                            }
                        },
                        series: series
                    });

                }

            </script>

            <script>
                $(document).ready(
                    function() {
                        $.ajax({
                            url: '/line-chart',
                            success: function (result) {
                                var months = JSON.parse(result).months;
                                var subscribers = JSON.parse(result).subscribers;
                                drawLineChart(months, subscribers);
                            }
                        });
                    });

                function drawLineChart(months, subscribers) {
                    Highcharts.chart('container', {

                        chart: {
                            type: 'line',
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
            </script>

        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>