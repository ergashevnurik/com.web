<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <style>
        #navigation {
            position: fixed;
            top: 0;
            right: -200px;
            width: 400px;
            height: 100vh;
            background: #fff;
            z-index: 1;
            display: grid;
            place-items: center;
            transition: 0.5s;
        }
        #navigation.active {
            right: 0;
        }
        #navigation.active ul {
            list-style: none;
        }
        #navigation.active ul li {
            text-align: center;
        }
        #navigation.active ul li a {
            color: white;
            text-align: center;
            font-size: 24px;
            text-decoration: none;
            font-weight: 600;
        }

        .banner {
            position: relative;
            width: 100%;
            min-height: 100vh;
            background: #fff;
            background-size: cover;
            align-items: center;
            transition: 0.5s;
            z-index: 200;
        }
        .banner.active {
            transform: translateX(-400px);
            background: rgba(0,0,0,0.1);
        }
        .banner.active .front img, .banner.active .card {
            filter: brightness(50%);
        }
        .banner.active #toggle {
            right: -10px!important;
            position: absolute;
            top: 0!important;
            cursor: pointer;
            filter: brightness(100%)!important;
            z-index: 100;
            width: 80px;
            height: 80px;
            border-bottom-left-radius: 50px;
            border-top-left-radius: 50px;
            background: #fff;
        }
        .banner.active #toggle span {
            visibility: hidden;
        }
        .banner.active #toggle:before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            height: 3px;
            width: 53%;
            transform: translate(-50%, -50%) rotate(45deg);
            background: #000;
        }
        .banner.active #toggle:after {
            content: '';
            position: absolute;
            top: 50%;
            width: 53%;
            height: 3px;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-45deg);
            background: #000;
        }
        .banner.active .table_container, .banner.active .btn {
            background: rgba(0,0,0,0.05);
            border: none;
            outline: none;
            color: #000;
        }
        .card {
            background: greenyellow;
        }
        .card:nth-child(2n) {
            background: lightpink;
        }
        .card:nth-child(3n) {
            background: yellowgreen;
        }
    </style>

    <section class="banner" id="sec">

            <div class="container">
                <#if isAdmin>
                    <div id="toggle" onclick="toggle()">
                    <span class="btn btn-success mt-3 ml-3" style="border-radius: 50%;">
                        <span class="font-size: 60px">
                            <i class="fa fa-plus"></i>
                        </span>
                    </span>
                    </div>
                </#if>
            </div>
            <div class="container">
                <div class="card-columns">
                    <#list messages as message>
                        <div class="card">
                            <#if message.fileName??>
                                <img src="/img/${message.fileName}">
                            </#if>
                            <div class="card-body">
                                <h5 class="card-title">${message.title}</h5>
                                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <a href="/lessonTable" class="btn btn-success">Let's Learn</a>
                            </div>
                        </div>
                    <#else>
                        Currently You Have No Subjects
                    </#list>
                </div>
            </div>

    </section>

    <div id="navigation">
        <div class="<#if message??>show</#if>">
            <div class="form-group ml-3">
                <form method="post" enctype="multipart/form-data" action="/add-mySubject">
                    <div class="form-group ml">
                        <input type="text" name="title" class="form-control"
                               placeholder="Enter Title" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="url" class="form-control" placeholder="Enter Url" />
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile"/>
                            <label class="custom-file-label" for="customFile">Choose File</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function toggle() {
            var sec = document.getElementById('sec');
            var nav = document.getElementById('navigation');
            sec.classList.toggle('active');
            nav.classList.toggle('active');

        }
    </script>

</@c.page>