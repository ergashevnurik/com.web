<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <div id="carouselExampleIndicators" class="carousel slide mt-3" data-ride="carousel"><!-- Carousel Goes Here -->
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
                    <div class="col-md-6" style="height: 400px;background: red;position: relative;">
                        <img src="./img/book1.jpg" alt="" style="width: 300px;position: absolute;left: 140px;top: 80px;">
                    </div>
                    <div class="col-md-6" style="height: 400px;background: green;">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>First slide label</h5>
                            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                            <a href="#" class="btn btn-light">Download</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col-md-6" style="height: 400px;background: red;position: relative;">
                        <img src="./img/book2.jpg" alt="" style="width: 300px;position: absolute;left: 140px;top: 80px">
                    </div>
                    <div class="col-md-6" style="height: 400px;background: yellow;">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>First slide label</h5>
                            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                            <a href="#" class="btn btn-light">Download</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col-md-6" style="height: 400px;background: red;position: relative;">
                        <img src="./img/book3.jpg" alt="" style="width: 300px;position: absolute;left: 140px;top: 80px">
                    </div>
                    <div class="col-md-6" style="height: 400px;background: green;">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>First slide label</h5>
                            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                            <a href="#" class="btn btn-light">Download</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
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
        <div class="collapse" id="collapseExample">
            <div class="card card-body">
                <form>
                    <div class="row">
                        <div class="col">
                            <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                                   placeholder="Введите сообщение" value="<#if message??>${message.text}</#if>" />
                            <#if textError??>
                                <div class="invalid-feedback">
                                    ${textError}
                                </div>
                            </#if>
                        </div>
                        <div class="col">
                            <input type="text" name="tag" class="form-control" placeholder="Тэг" value="<#if message??>${message.tag}</#if>" />
                            <#if tagError??>
                                <div class="invalid-feedback">
                                    ${tagError}
                                </div>
                            </#if>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <select id="inputState" class="form-control">
                                <option selected>Choose...</option>
                                <option>Detective</option>
                                <option>Love Story</option>
                                <option>History</option>
                                <option>.....</option>
                            </select>
                        </div>
                        <div class="col">
                            <div class="custom-file">
                                <input type="file" name="file" id="customFile"/>
                                <label class="custom-file-label" for="customFile">Choose File</label>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group mt-3">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>

    </div><!-- Collapse Ends Here Or The Form In Which Admin can Add Books -->
    </#if>

    <div class="container-fluid"> <!-- Display Existing Books in Card Goes Here -->

        <div class="row">
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
                </div>

        </div>

    </div> <!-- Display Existing Books in Card Ends Here -->





</@c.page>