<#import "parts/common.ftl" as c>

<@c.page>

    <!-- Hey oka only for You -->
    <style> /* Style for your taste man */

        body {
            background-color: #F2F0F0;
        }

        #tabs {
            overflow: hidden;
            width: 100%;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        #tabs li {
            float: left;
            margin: 0 .5em 0 0;
        }

        #tabs a {
            position: relative;
            background: #6E99DF;
            padding: .7em 3.5em;
            float: left;
            text-decoration: none;
            color: white;
            text-shadow: 0 1px 0 rgba(255,255,255,.8);
            border-radius: 5px 0 0 0;
            box-shadow: 0 2px 2px rgba(0,0,0,.4);
        }

        #tabs a:hover,
        #tabs a:hover::after,
        #tabs a:focus,
        #tabs a:focus::after,
        #tabs a.active,
        #tabs a.active::after {
            background: #fff;
            color: #000000;
            outline: none;
        }

        #tabs a::after {
            content:'';
            position:absolute;
            z-index: 1;
            top: 0;
            right: -.5em;
            bottom: 0;
            width: 1em;
            background: #6E99DF;
            box-shadow: 2px 2px 2px rgba(0,0,0,.4);
            transform: skew(10deg);
            border-radius: 0 5px 0 0;
        }

        #tabs #current a,
        #tabs #current a::after {
            background: blue;
            z-index: 3;
        }

        #content {
            background: #ffffff;
            padding: 2em;
            height: 100%;
            position: relative;
            z-index: 2;
            border-radius: 0 5px 5px 5px;
            box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
        }



    </style>

    <!-- Mai Body For Mark Up For You Man -->

    <div class="container mt-5">
        <ul class="nav nav-tabs" id="tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#assignment" role="tab">MATH</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#extraClasses" role="tab">PHYSICS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#myClasses" role="tab">ENGLISH</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content" id="content">
            <div class="tab-pane active" id="assignment" role="tabpanel">
                <div style="display: flex; flex-wrap: wrap; justify-content: space-evenly;">

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/TMubSggUOVE?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/grnP3mduZkM?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/vhm8ri0XNBM?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/JnLDmw3bbuw?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/dD14EEhdRMI?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/e4o7X6LyX-I?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/6RMN5Pf1fHU?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/_PnPM8VVHBA?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="extraClasses" role="tabpanel">
                <div style="display: flex; flex-wrap: wrap; justify-content: space-evenly;">

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/TMubSggUOVE?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/grnP3mduZkM?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/vhm8ri0XNBM?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/JnLDmw3bbuw?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/dD14EEhdRMI?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/e4o7X6LyX-I?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/6RMN5Pf1fHU?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/_PnPM8VVHBA?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="myClasses" role="tabpanel">
                <div style="display: flex; flex-wrap: wrap; justify-content: space-evenly;">

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/TMubSggUOVE?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/grnP3mduZkM?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/vhm8ri0XNBM?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/JnLDmw3bbuw?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/dD14EEhdRMI?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/e4o7X6LyX-I?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/6RMN5Pf1fHU?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div style="width: 420px; height: 345px; margin: 10px;">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/_PnPM8VVHBA?rel=0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>


</@c.page>