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

    <script src="https://kit.fontawesome.com/98a25c3e70.js" crossorigin="anonymous"></script>

</head>
<style>
    .card__col {
        width: 250px;
        height: 100px;
        margin-right: 20px;
        transition: all 350ms;
        cursor: pointer;
        display: flex;
        border-left: 6px solid #f43a09;
        box-shadow: 0 4px 6px rgba(0,0,0,0.5);
        border-radius: 15px;
        background: #fff;
    }
    .card__col:nth-child(odd) {
        border-left: 6px solid #1B3E59;
    }
    .card__col .text__box {
        width: 67px;
        height: 50px;
        margin: auto;
        font-size: 28px;
        font-weight: 800;
    }
    .card__col .text__box h6 {
        font-size: 10px;
        margin-bottom: 0!important;
    }
    .card__col .img__box {
        width: 67px;
        height: 50px;
        margin: auto;
        margin-right: 15px;
    }
    .card__col .img__box svg {
        width: 67px;
        height: 50px;
    }
    .card__col:hover {
        transform: scale(1.1);
    }

    .folder__box {
        position: relative;
        width: 200px;
        height: 180px;
        transition: all 650ms;
    }
    .folder__box:hover .folder__span__top, .folder__box:hover .folder__span_div {
        background: #f43a09;
    }
    .folder__span {
        position: absolute;
        clip-path: polygon(35% 0, 100% 0%, 100% 20%, 50% 20%);
        top: 0;
        background: #fff;
        width: 100%;
        height: 100px;
        right: 0;
        transition: all 650ms;
    }
    .folder__span__top {
        position: absolute;
        top: 0;
        left: 0;
        clip-path: polygon(35% 0, 50% 20%, 0 20%, 0 0);
        width: 100%;
        height: 100px;
        background: #183E59;
        transition: all 650ms;
        border-top-left-radius: 25px;
    }
    .folder__span_div {
        position: absolute;
        bottom: 0;
        right: 0;
        background: #183E59;
        width: 100%;
        height: 160px;
        transition: all 650ms;
        border-top-right-radius: 25px;
        border-bottom-left-radius: 25px;
        border-bottom-right-radius: 25px;
        padding: 20px;
        cursor: pointer;
    }
</style>
<body>
<div class="wrapper">
    <#include "parts/sideNavbar.ftl"/>
    <div class="container-fluid"  style="padding: 0;width: calc(100% - 260px);position: absolute;right: 0;">
        <#include "parts/navbar.ftl"/>
        <div class="container-fluid" style="padding: 0!important;">
            <div class="container mt-4">

            </div>
        </div>
    </div>
</div>
</body>
</html>