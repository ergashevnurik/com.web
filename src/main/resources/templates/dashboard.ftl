<#import "parts/common.ftl" as c>

<@c.page>
    <style type="text/css">
        #container {
            width: 100%;
            height: 400px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

    </style>

    <div class="container-fluid"><!-- Charts and Dashboard Goes Here -->

        <div class="row mt-3">
            <div class="col-sm-4">
                <div class="card bg-warning">
                    <div class="card-body">
                        <h5 class="card-title">Special title treatment</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                        <a href="#" class="btn btn-light">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Special title treatment</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                        <a href="#" class="btn btn-light">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card bg-danger">
                    <div class="card-body">
                        <h5 class="card-title">Special title treatment</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                        <a href="#" class="btn btn-light">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Charts and Dashboard Ends Here -->

    <div class="container-fluid mt-4">
                <!-- HTML -->
                <div id="container"></div>
                <script>
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
                </script>
    </div>

    <div class="container-fluid mt-5">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">First</th>
                <th scope="col">Last</th>
                <th scope="col">Handle</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- Main Body Goes Here -->


    </div><!-- Container For Navbar and Main Body Ends Here -->


</@c.page>