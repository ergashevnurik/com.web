<html>
<head>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/98a25c3e70.js" crossorigin="anonymous"></script>
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
<body>
<div class="wrapper">
    <#include "parts/sideNavbar.ftl"/>
    <div class="container-fluid"  style="padding: 0;width: calc(100% - 260px);position: absolute;right: 0;">
        <#include "parts/navbar.ftl"/>
        <div class="container-fluid" style="padding: 0!important;">
            <div id="container"></div>


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
            </script>

        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>