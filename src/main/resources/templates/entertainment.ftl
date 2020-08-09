<#import "parts/common.ftl" as c>
    <#include "parts/security.ftl">

<@c.page>

    <div class="container-fluid" style="background-color: #1B3E59;width: 100%;padding: 50px;">
        <h3 align="center">Entertainment</h3>
        <p align="center" style="color: #fff;">The Section of Entertainments Give opportunity to have a rest. Get out of Boring Lessons and
        Play amazing Games and Quizes</p>
    </div>

     <#if isAdmin>
        <p>
            <a class="btn btn-primary mt-5 ml-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Add New Card
            </a>
        </p>
        <div class="collapse ml-3 mr-3" id="collapseExample">
            <div class="form-group">
                <form method="post" enctype="multipart/form-data">
                    <div class="row">

                        <div class="col">
                            <div class="form-group">
                                <input type="text" name="word" class="form-control"
                                       placeholder="Enter Word" value="${word!''}" />
                            </div>
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <input type="text" name="translation" class="form-control"
                                       placeholder="Enter Translation" value="${translation!''}" />
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col">
                            <input type="hidden" name="_csrf" value="${_csrf.token}" />
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Add New Word</button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
     </#if>

</@c.page>