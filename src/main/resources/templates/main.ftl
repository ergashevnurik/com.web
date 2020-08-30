<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <style>
        .carousel {
            position: relative;
        }

        .carousel-item, .carousel-item .active { /* Carousel Item Goes Here */
            border-radius: 25px;
            background: #191919;
            width: 100%;
            height: 500px;
        }/* Carousel Item Ends Here */

        .carousel-control-prev, .carousel-control-next { /* Carousel Next Prev Goes Here */
            position: absolute;
            width: 50px;
            height: 50px;
            top: unset;
            left: unset;
        }
        .carousel-control-prev {
            bottom: 15px !important;
            right: 100px !important;
        }
        .carousel-control-next {
            bottom: 15px !important;
            right: 50px !important;
        } /* Carousel Next Prev Ends Here */
        .carousel-indicators { /* Carousel Indicators Goes Here */
            right: unset;
        }
        .carousel-indicators li {
            border-radius: 50%;
            height: 3px;
            width: 3px;
        }
        .carousel-indicators li.active {
            border-radius: unset;
            height: 3px;
            width: 30px;
        }/* Carousel Indicators Ends Here */
        .carousel-caption { /* Carousel Caption Goes Here */
            position: absolute;
            top: 240px;
            left: 50px;
            right: unset;
            bottom: unset;
        }
        .carousel-caption a {
            padding: 12px 20px;
            text-decoration: none;
            color: #000;
            background: #fff;
        }
        /* Carousel Caption Ends Here */


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

    </style>

    <div class="container-fluid mt-3">

        <div class="container" style="display: flex;">

            <div>
                <#if isAdmin>
                    <p>
                        <a class="btn btn-success" data-toggle="collapse" style="border-radius: 50%" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                            <span class="font-size: 60px">
                                <i class="fa fa-plus"></i>
                            </span>
                        </a>
                    </p>
                    <div class="collapse mt-3 <#if message??>show</#if>" id="collapseExample">
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
                </#if>
            </div>

                <div class="ml-3">
                    <div class="form-group">
                        <form method="get" action="/main/${currentPage}" class="form-inline">
                            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search By Tag">
                            <button type="submit" class="btn btn-outline-success ml-2">Search</button>
                        </form>
                    </div>
                </div>

            <div class="mt-3 ml-auto">
                <p>Total Items: ${totalElements} - Page ${currentPage} out of ${totalPages}</p>
            </div>
        </div>


        <div id="demo" class="carousel slide" data-ride="carousel"><!-- Carousel Goes Here -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner" style="border-radius: 25px;">
                <div class="carousel-item active">
                    <#--<img src="la.jpg" alt="Los Angeles" width="1100" height="500">-->
                    <div class="carousel-caption">
                        <h3>Los Angeles</h3>
                        <p>We had such a great time in LA!</p>
                        <a href="#">Let's Go</a>
                        <a href="#">Go On...</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <#--<img src="chicago.jpg" alt="Chicago" width="1100" height="500">-->
                    <div class="carousel-caption">
                        <h3>Chicago</h3>
                        <p>Thank you, Chicago!</p>
                        <a href="#">Let's Go</a>
                        <a href="#">Go On...</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <#-- <img src="ny.jpg" alt="New York" width="1100" height="500">-->
                    <div class="carousel-caption">
                        <h3>New York</h3>
                        <p>We love the Big Apple!</p>
                        <a href="#">Let's Go</a>
                        <a href="#">Go On...</a>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div><!-- Carousel Ends Here -->


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




</@c.page>