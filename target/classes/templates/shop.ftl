<#import "parts/common.ftl" as c>

<@c.page>
    <style type="text/css">
        #container {
            width: 100%;
            height: 400px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }


        .main {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
        .container .box {
            position: relative;
            width: 350px;
            padding: 40px;
            background: #FFFFFF;
            box-shadow: 0 5px 15px rgba(0, 0, 0, .1);
            border-radius: 4px;
            margin: 20px;
            box-sizing: border-box;
            overflow: hidden;
            text-align: center;
        }
        .container .box:before {
            content: '';
            width: 50%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            background: rgba(255, 255, 255, .2);
            z-index: 2;
            pointer-events: none;
        }
        .container .box .icon {
            position: relative;
            width: 80px;
            height: 80px;
            color: #fff;
            background: #000;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto;
            border-radius: 50%;
            font-size: 40px;
            font-weight: 700;
            transition: 1s;
        }
        .container .box:nth-child(1) .icon {
            box-shadow: 0 0 0 0 #1B3E59;        /*#e91e63*/
            background: #1B3E59;
        }
        .container .box:nth-child(1):hover .icon {
            box-shadow: 0 0 0 400px #1B3E59;    /*#e91e63*/
        }
        .container .box:nth-child(2) .icon {
            box-shadow: 0 0 0 0 #23e629;        /*#23e629*/
            background: #23e629;
        }
        .container .box:nth-child(2):hover .icon {
            box-shadow: 0 0 0 400px #23e629;    /*#23e629*/
        }
        .container .box:nth-child(3) .icon {
            box-shadow: 0 0 0 0 #BF0404;        /*#2196f3*/
            background: #BF0404;
        }
        .container .box:nth-child(3):hover .icon {
            box-shadow: 0 0 0 400px #BF0404;    /*#2196f3*/
        }
        .container .box:nth-child(4) .icon {
            box-shadow: 0 0 0 0 #FF6600;        /*#2196f3*/
            background: #FF6600;
        }
        .container .box:nth-child(4):hover .icon {
            box-shadow: 0 0 0 400px #FF6600;    /*#2196f3*/
        }

        .container .box .content {
            position: relative;
            z-index: 1;
            transition: 0.5s;
        }

        .container .box:hover .content, .container .box:hover .content h3{
            color: #F2F0F0;
        }

        .container .box .content h3 {
            font-size: 20px;
            margin: 10px 0;
            padding: 0;
            color: #000000;
        }

        .container .box .content p {
            margin: 0;
            padding: 0;
        }

        .shop {
            display: inline-block;
            padding: 10px 20px;
            background: #fff;
            border-radius: 4px;
            text-decoration: none;
            color: #000;
            font-weight: 500;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .2);
        }

        .shop:hover {
            text-decoration: none;
            color: #000;
        }

    </style>

    <div class="container-fluid">
    <div class="main">
        <div class="container">

            <div class="box">
                <div class="icon"><i class="fas fa-percentage"></i></div>
                <div class="content">
                    <h3>Mathematics</h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas mollitia tempora quidem! Odit inventore ullam quisquam voluptatum laboriosam reiciendis necessitatibus ut eum corporis iure debitis voluptatibus et, hic numquam est.</p>
                    <a href="#" class="shop">Read More</a>
                </div>
            </div>



            <div class="box">
                <div class="icon"><i class="fas fa-atom"></i></div>
                <div class="content">
                    <h3>Physics</h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas mollitia tempora quidem! Odit inventore ullam quisquam voluptatum laboriosam reiciendis necessitatibus ut eum corporis iure debitis voluptatibus et, hic numquam est.</p>
                    <a href="#" class="shop">Read More</a>
                </div>
            </div>



            <div class="box">
                <div class="icon"><i class="fas fa-globe"></i></div>
                <div class="content">
                    <h3>English</h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas mollitia tempora quidem! Odit inventore ullam quisquam voluptatum laboriosam reiciendis necessitatibus ut eum corporis iure debitis voluptatibus et, hic numquam est.</p>
                    <a href="#" class="shop">Read More</a>
                </div>
            </div>


            <div class="box">
                <div class="icon"><i class="fas fa-globe"></i></div>
                <div class="content">
                    <h3>Russian</h3>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quas mollitia tempora quidem! Odit inventore ullam quisquam voluptatum laboriosam reiciendis necessitatibus ut eum corporis iure debitis voluptatibus et, hic numquam est.</p>
                    <a href="#" class="shop">Read More</a>
                </div>
            </div>




        </div>
    </div>

    </div>
</@c.page>