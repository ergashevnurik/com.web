<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <style>
        .carousel {
            position: relative;
        }
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
    </style>

    <div class="container-fluid" style="background-color: #1B3E59;width: 100%;padding: 50px;">
        <h3 align="center">Library</h3>
        <p align="center" style="color: #fff;">The Section of Library Give opportunity to Read and Improve Skills. Do Not Hesitate Download and
        Have a Pleasure</p>
    </div>

    <div class="container-fluid" style="margin-top: -50px;">

        <div id="demo" class="carousel slide" data-ride="carousel"><!-- Carousel Goes Here -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <#--<img src="la.jpg" alt="Los Angeles" width="1100" height="500">-->
                    <div style="background: #191919; width: 100%;height: 500px;"></div>
                    <div class="carousel-caption">
                        <h3>Los Angeles</h3>
                        <p>We had such a great time in LA!</p>
                        <a href="#">Let's Go</a>
                        <a href="#">Go On...</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <#--<img src="chicago.jpg" alt="Chicago" width="1100" height="500">-->
                    <div style="background: #191919; width: 100%;height: 500px;"></div>
                    <div class="carousel-caption">
                        <h3>Chicago</h3>
                        <p>Thank you, Chicago!</p>
                        <a href="#">Let's Go</a>
                        <a href="#">Go On...</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <#-- <img src="ny.jpg" alt="New York" width="1100" height="500">-->
                    <div style="background: #191919; width: 100%;height: 500px;"></div>
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


    <div class="form-row mt-4">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search By Tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <#if isAdmin>
    <div class="container-fluid mt-4"><!-- Collapse Goes Here Or The Form In Which Admin can Add Books -->


        <p>
            <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Add New Book
            </a>
        </p>
        <div class="collapse mt-3 <#if message??>show</#if>" id="collapseExample">
            <div class="form-group ml-3">
                <form method="post" enctype="multipart/form-data">
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
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    </#if>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3" style="width: 18rem;">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>

            </div>
        <#else>
            No message
        </#list>
    </div> <!-- Display Existing Books in Card Ends Here -->

    </div>




</@c.page>