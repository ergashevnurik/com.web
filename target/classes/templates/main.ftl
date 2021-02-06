<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <style>
        .carousel { /* Carousel In the Library Section */
            position: relative;
            width: 600px!important;
            background: #fff;
            height: 400px;
        }
        .carousel-item {
            width: 600px!important;
        }
        .carousel-item .row .col-md-6 {
            width: 600px!important;
            height: 400px;
        }
        .carousel-item .row .col-md-6 img {
            width: 100%;
            height: 100%;
        }
        .carousel-control-prev, .carousel-control-next {
            position: absolute;
            width: 50px;
            height: 50px;
            top: unset;
            z-index: 200;
        }
        .carousel-control-prev {
            left: unset;
            right: 50px;
            top: unset;
        }
        .carousel-caption h5 {
            color: #000;
        }
        .carousel-caption {
            color: #000;
            left: unset!important;
            bottom: unset!important;
            text-align: left;
        }
        .carousel-indicators {
            margin-right: unset!important;
        }
        .carousel-control-next-icon, .carousel-control-prev-icon {
            filter: brightness(50%);
        }
        .carousel-indicators li {
            filter: brightness(50%);
        } /* Carousel In the Library Section */


        .card {
            color: inherit;
            cursor: pointer;
            width: calc(33% - 2rem);
            min-width: calc(33% - 2rem);
            height: 400px;
            min-height: 400px;
            perspective: 1000px;
            margin: 1rem;
            position: relative;

            /*background: linear-gradient(90deg, #e3ffe7 0%, #d9e7ff 100%); if necessary ne ochet crasivo no vozmojno prigoditsa*/
        }
        @media screen and (max-width: 800px) {
            .card {
                width: calc(50% - 2rem);
            }
        }
        @media screen and (max-width: 500px) {
            .card {
                width: 100%;
            }
        }

        .front, .back {
            display: flex;
            border-radius: 6px;
            background-position: center;
            background-size: cover;
            text-align: center;
            justify-content: center;
            align-items: center;
            position: absolute;
            height: 100%;
            width: 100%;
            backface-visibility: hidden;
            transform-style: preserve-3d;
            transition: ease-in-out 600ms;
            font-size: 18px;
            line-height: 1.5;
            font-weight: 300;
            font-family: "Nunito Sans", sans-serif;
        }

        .front {
            background-size: cover;
            overflow: hidden;
        }

        .card:hover .front {
            transform: rotateY(180deg);
        }
        .card:nth-child(even):hover .front {
            transform: rotateY(-180deg);
        }

        .back {
            background: linear-gradient(90deg, #e3ffe7 0%, #d9e7ff 100%);
            color: #5d8ee2;
            transform: rotateY(-180deg);
            padding: 0 2em;
        }
        .back .button {
            background: linear-gradient(135deg, #1a9be6, #1a57e6);
        }
        .back .button:before {
            box-shadow: 0 0 10px 10px rgba(26, 87, 230, 0.25);
            background-color: rgba(26, 87, 230, 0.25);
        }
        .card:hover .back {
            transform: rotateY(0deg);
        }
        .card:nth-child(even) .back {
            transform: rotateY(180deg);
            color: #e25069;
        }
        .card:nth-child(even) .back .button {
            background: linear-gradient(135deg, #e61a80, #e61a3c);
        }
        .card:nth-child(even) .back .button:before {
            box-shadow: 0 0 10px 10px rgba(230, 26, 60, 0.25);
            background-color: rgba(230, 26, 60, 0.25);
        }
        .card:nth-child(even):hover .back {
            transform: rotateY(0deg);
        }

        .button {
            transform: translateZ(40px);
            cursor: pointer;
            backface-visibility: hidden;
            font-weight: bold;
            color: #fff;
            padding: .5em 1em;
            border-radius: 100px;
            font: inherit;
            border: none;
            position: relative;
            transform-style: preserve-3d;
            transition: 300ms ease;
        }
        .button:before {
            transition: 300ms ease;
            position: absolute;
            display: block;
            content: '';
            transform: translateZ(-40px);
            backface-visibility: hidden;
            height: calc(100% - 20px);
            width: calc(100% - 20px);
            border-radius: 100px;
            left: 10px;
            top: 16px;
        }
        .button:hover {
            transform: translateZ(75px);
        }
        .button:hover:before {
            transform: translateZ(-75px);
        }
        .button:active {
            transform: translateZ(30px);
            outline: none;
        }
        .button:focus {
            outline: none;
        }
        .button:active:before {
            transform: translateZ(-30px);
            top: 12px;
        }




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

    </style>


    <section class="banner" id="sec">

        <div class="container" style="display: flex;margin-top: 0!important;">

                    <#if isAdmin>
                        <div id="toggle" onclick="toggle()">
                            <span class="btn btn-success mt-3 ml-3" style="border-radius: 50%;">
                                <span class="font-size: 60px">
                                    <i class="fa fa-plus"></i>
                                </span>
                            </span>
                        </div>
                    </#if>

                <div class="mt-3 ml-3">
                    <div class="form-group">
                        <form method="get" action="/main/${currentPage}" class="form-inline">
                            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search By Tag">
                            <button type="submit" class="btn btn-outline-success ml-2">Search</button>
                        </form>
                    </div>
                </div>

                <div class="mt-4 ml-auto">
                    <p>Total Items: ${totalElements} - Page ${currentPage} out of ${totalPages}</p>
                </div>
            </div>

            <div class="container-fluid mt-4"><!-- Collapse Goes Here Or The Form In Which Admin can Add Books -->

                <div class="card-columns">
                    <div class="content">
                        <div class="content_card">
                            <#list messages as message>
                                <div class="card" href="#!" style="width: 18rem;">
                                    <div class="front" style="background-size: contain; background-repeat: no-repeat;">
                                        <#if message.filename??>
                                            <img src="/img/${message.filenameImg}" class="card-img-top">
                                        </#if>
                                    </div>
                                    <div class="back">
                                        <div>
                                            <span>${message.text}</span>
                                            <i>${message.tag}</i>
                                            <i>${message.authorName}</i>
                                            <#if message.filename??>
                                                <a href="/img/${message.filename}" class="btn btn-primary button">Download</a>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                            <#else>
                                No message
                            </#list>
                        </div>
                    </div>
                </div> <!-- Display Existing Books in Card Ends Here -->
                <div class="ml-auto">

                    <#if (currentPage > 1)>
                        <a href="/main/1" class="btn btn-light">First</a>
                    <#else>
                        <span class="btn btn-primary">First</span>
                    </#if>

                    <#if (currentPage > 1)>
                        <a href="/main/${currentPage - 1}" class="btn btn-light">Previous</a>
                    <#else>
                        <span class="btn btn-primary">Previous</span>
                    </#if>

                    <#list 1..totalPages  as totalPage>
                        <#if totalPage != currentPage>
                            <a href="/main/${totalPage}" class="btn btn-light">${totalPage}</a>
                        <#else>
                            <span class="btn btn-primary">${totalPage}</span>
                        </#if>
                    </#list>

                    <#if (currentPage < totalPages)>
                        <a href="/main/${currentPage + 1}" class="btn btn-light">Next</a>
                    <#else>
                        <span class="btn btn-primary">Next</span>
                    </#if>

                    <#if (currentPage < totalPages)>
                        <a href="/main/${totalPages}" class="btn btn-light">Last</a>
                    <#else>
                        <span class="btn btn-primary">Last</span>
                    </#if>

                </div>

            </div>
        </div>
    </section>

    <div id="navigation">

        <div class="<#if message??>show</#if>">
            <div class="form-group ml-3">
                <form method="post" enctype="multipart/form-data" action="/add-book">
                    <div class="form-group ml">
                        <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                               placeholder="Введите сообщение" value="<#if message??>${message.text}</#if>" />
                        <#if textError??>
                            <div class="invalid-feedback">
                                ${textError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <input type="text" name="tag" class="form-control" placeholder="Тэг" value="<#if message??>${message.tag}</#if>" />
                        <#if tagError??>
                            <div class="invalid-feedback">
                                ${tagError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile"/>
                            <label class="custom-file-label" for="customFile">Choose File</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="fileImg" id="customFileImg"/>
                            <label class="custom-file-label" for="customFileImg">Choose Image For Book</label>
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