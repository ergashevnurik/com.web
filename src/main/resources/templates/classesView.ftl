<#import "parts/common.ftl" as c>
    <#include "parts/security.ftl">

<@c.page>

    <style> /* Oka Vse Dlya Vas */
        /*section {
            padding: 60px 0;
        }

        #tabs{
            color: darkblue;
        }

        #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
            color: blue;
            background-color: transparent;
            border-color: transparent transparent green;
            border-bottom: 4px solid !important;
            font-size: 20px;
            font-weight: bold;
            outline: none;
        }
        #tabs .nav-tabs .nav-link {
            border: 1px solid transparent;
            border-top-left-radius: .25rem;
            border-top-right-radius: .25rem;
            color: red;
            font-size: 20px;
        }*/

        body {
            background-color: #fff;
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

    <div class="container" style="display: flex">

        <#if isAdmin>
        <p>
            <a class="btn btn-success mt-3 ml-3" style="border-radius: 50%;" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                <span class="font-size: 60px">
                    <i class="fa fa-plus"></i>
                </span>
            </a>
        </p>
        <div class="collapse mt-3" id="collapseExample">
            <div class="form-group ml-3">
                <form method="post" enctype="multipart/form-data" action="/add-classes">
                    <div class="form-group ml">
                        <input type="text" name="title" class="form-control"
                               placeholder="Title" value="${title!''}" />
                    </div>
                    <div class="form-group ml">
                        <input type="text" name="bookTitle" class="form-control"
                               placeholder="Book Title" value="${bookTitle!''}" />
                    </div>
                    <div class="form-group ml">
                        <input type="number" name="dueDate" class="form-control"
                               placeholder="Due Date" value="${dueDate!''}" />
                    </div>
                    <div class="form-group">
                        <input type="number" name="extendedDate" class="form-control"
                               placeholder="Extended Date" value="${extendedDate!''}" />
                    </div>
                    <div class="form-group ml">
                        <input type="text" name="submissionMethod" class="form-control"
                               placeholder="Submission Method" value="${submissionMethod!''}" />
                    </div>
                    <div class="form-group ml">
                        <input type="text" name="status" class="form-control"
                               placeholder="Status" value="${status!''}" />
                    </div>
                    <div class="form-group ml">
                        <input type="text" name="submissionFormat" class="form-control"
                               placeholder="Submission Format" value="${submissionFormat!''}" />
                    </div>
                    <!--Material textarea-->
                    <div class="form-group">
                            <textarea class="form-control" name="description"
                                      placeholder="Enter Description" value="${description!''}"></textarea>
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

        <div class="mt-3 ml-3">
            <form class="form-inline my-2 my-lg-0" method="get">
                <input class="form-control mr-sm-2" type="text" value="${filter?ifExists}" placeholder="Search" aria-label="Search" name="filter">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>

        <div class="mt-3 ml-3">
            <a href="/classes/export" class="btn btn-success">Export to Pdf</a>
        </div>

        <div class="mt-3 ml-3">
            <a href="/classes/csv" class="btn btn-success">Export to CSV</a>
        </div>

        <div class="mt-3 ml-auto">
            <p>Total Items: ${totalElements} - Page ${currentPage} out of ${totalPages}</p>
        </div>

    </div>

    <div class="container-fluid" style="background-color: #fff"> <!-- Ot dushi Oka Raxmat oka kattakon :) :)-->


        <div class="container mt-5">
            <ul class="nav nav-tabs" id="tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#assignment" role="tab">ASSIGNMENT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#extraClasses" role="tab">EXTRA CLASSES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#myClasses" role="tab">MY CLASSES</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content" id="content">
                <div class="tab-pane active" id="assignment" role="tabpanel">
                    <table class="table table-striped mt-4">

                        <thead>
                        <tr>
                            <th><a href="/page/${currentPage}?sortField=id&sortDirection=${reverseSortDirection}">ID</a></th>
                            <th><a href="/page/${currentPage}?sortField=title&sortDirection=${reverseSortDirection}">Title</a></th>
                            <th><a href="/page/${currentPage}?sortField=dueDate&sortDirection=${reverseSortDirection }">Due Date</a></th>
                            <th><a href="/page/${currentPage}?sortField=extendedDate&sortDirection=${reverseSortDirection }">Extended Date</a></th>
                            <th><a href="/page/${currentPage}?sortField=submissionMethod&sortDirection=${reverseSortDirection }">Submission Method</a></th>
                            <th><a href="/page/${currentPage}?sortField=status&sortDirection=${reverseSortDirection }">Status</a></th>
                            <th><a href="/page/${currentPage}?sortField=submissionFormat&sortDirection=${reverseSortDirection }">Submission Format</a></th>
                        </tr>
                        </thead>

                        <tbody>

                        <#list messages as message>

                            <tr>
                                <th>${message.id}</th>
                                <th><a href="/classes/${message.id}">${message.title}</a></th>
                                <th><i>${message.dueDate}</i></th>
                                <th><i>${message.extendedDate}</i></th>
                                <th><i>${message.submissionMethod}</i></th>
                                <th><i>${message.status}</i></th>
                                <th><i>${message.submissionFormat}</i></th>
                            </tr>

                        </#list>

                        </tbody>

                    </table>


                    <div class="ml-auto">

                        <#if (currentPage > 1)>
                            <a href="/page/1?sortField=${sortField}&sortDirection=${sortDirection}" class="btn btn-light">First</a>
                            <#else>
                            <span class="btn btn-primary">First</span>
                        </#if>

                        <#if (currentPage > 1)>
                            <a href="/page/${currentPage - 1}?sortField=${sortField}&sortDirection=${sortDirection}" class="btn btn-light">Previous</a>
                            <#else>
                            <span class="btn btn-primary">Previous</span>
                        </#if>

                        <#list 1..totalPages  as totalPage>
                            <#if totalPage != currentPage>
                                <a href="/page/${totalPage}?sortField=${sortField}&sortDirection=${sortDirection}" class="btn btn-light">${totalPage}</a>
                                <#else>
                                <span class="btn btn-primary">${totalPage}</span>
                            </#if>
                        </#list>

                        <#if (currentPage < totalPages)>
                            <a href="/page/${currentPage + 1}?sortField=${sortField}&sortDirection=${sortDirection}" class="btn btn-light">Next</a>
                            <#else>
                            <span class="btn btn-primary">Next</span>
                        </#if>

                        <#if (currentPage < totalPages)>
                            <a href="/page/${totalPages}?sortField=${sortField}&sortDirection=${sortDirection}" class="btn btn-light">Last</a>
                            <#else>
                            <span class="btn btn-primary">Last</span>
                        </#if>

                    </div>

                </div>
                <div class="tab-pane" id="extraClasses" role="tabpanel">
                    <table class="table table-striped mt-4">

                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Due Date</th>
                            <th>Extended Date</th>
                            <th>Submission Method</th>
                            <th>Status</th>
                            <th>Submission Format</th>
                        </tr>
                        </thead>

                        <tbody>

                        <#list messages as message>

                            <tr>
                                <th>${message.id}</th>
                                <th><a href="/classes/${message.id}">${message.title}</a></th>
                                <th><i>${message.dueDate}</i></th>
                                <th><i>${message.extendedDate}</i></th>
                                <th><i>${message.submissionMethod}</i></th>
                                <th><i>${message.status}</i></th>
                                <th><i>${message.submissionFormat}</i></th>
                            </tr>

                        </#list>

                        </tbody>

                    </table>
                </div>
                <div class="tab-pane" id="myClasses" role="tabpanel">
                    <table class="table table-striped mt-4">

                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Due Date</th>
                            <th>Extended Date</th>
                            <th>Submission Method</th>
                            <th>Status</th>
                            <th>Submission Format</th>
                        </tr>
                        </thead>

                        <tbody>

                        <#list messages as message>

                            <tr>
                                <th>${message.id}</th>
                                <th><a href="/classes/${message.id}">${message.title}</a></th>
                                <th><i>${message.dueDate}</i></th>
                                <th><i>${message.extendedDate}</i></th>
                                <th><i>${message.submissionMethod}</i></th>
                                <th><i>${message.status}</i></th>
                                <th><i>${message.submissionFormat}</i></th>
                            </tr>

                        </#list>

                        </tbody>

                    </table>
                </div>
            </div>
        </div>


        <script>
            $(document).ready(function(){
                $("#tabs a").click(function(){
                    $(this).tab('show');
                });
            });
        </script>

        <!--<section class="container py-4">
            <div class="row">
                <div class="col-md-12">
                    <ul id="tabs" class="nav nav-tabs">
                        <li class="nav-item"><a href="" data-target="#assignment" data-toggle="tab" class="nav-link small text-uppercase active">Assignment</a></li>
                        <li class="nav-item"><a href="" data-target="#extraClasses" data-toggle="tab" class="nav-link small text-uppercase">Extra Classes</a></li>
                        <li class="nav-item"><a href="" data-target="#myLesson" data-toggle="tab" class="nav-link small text-uppercase">My Lesson</a></li>
                    </ul>
                    <br>
                    <div id="tabsContent" class="tab-content">
                        <div id="assignment" class="tab-pane fade active show">
                            <table class="table table-striped mt-4">

                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Due Date</th>
                                    <th>Extended Date</th>
                                    <th>Submission Method</th>
                                    <th>Status</th>
                                    <th>Submission Format</th>
                                </tr>
                                </thead>

                                <tbody>

                                <#list messages as message>

                                    <tr>
                                        <th>${message.id}</th>
                                        <th><a href="/classes/${message.id}">${message.title}</a></th>
                                        <th><i>${message.dueDate}</i></th>
                                        <th><i>${message.extendedDate}</i></th>
                                        <th><i>${message.submissionMethod}</i></th>
                                        <th><i>${message.status}</i></th>
                                        <th><i>${message.submissionFormat}</i></th>
                                    </tr>

                                </#list>

                                </tbody>

                            </table>
                        </div>
                        <div id="extraClasses" class="tab-pane fade">
                            <table class="table table-striped mt-4">

                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Due Date</th>
                                    <th>Extended Date</th>
                                    <th>Submission Method</th>
                                    <th>Status</th>
                                    <th>Submission Format</th>
                                </tr>
                                </thead>

                                <tbody>

                                <#list messages as message>

                                    <tr>
                                        <th>${message.id}</th>
                                        <th><a href="/classes/${message.id}">${message.title}</a></th>
                                        <th><i>${message.dueDate}</i></th>
                                        <th><i>${message.extendedDate}</i></th>
                                        <th><i>${message.submissionMethod}</i></th>
                                        <th><i>${message.status}</i></th>
                                        <th><i>${message.submissionFormat}</i></th>
                                    </tr>

                                </#list>

                                </tbody>

                            </table>
                        </div>
                        <div id="myLesson" class="tab-pane fade">
                            <table class="table table-striped mt-4">

                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Due Date</th>
                                    <th>Extended Date</th>
                                    <th>Submission Method</th>
                                    <th>Status</th>
                                    <th>Submission Format</th>
                                </tr>
                                </thead>

                                <tbody>

                                <#list messages as message>

                                    <tr>
                                        <th>${message.id}</th>
                                        <th><a href="/classes/${message.id}">${message.title}</a></th>
                                        <th><i>${message.dueDate}</i></th>
                                        <th><i>${message.extendedDate}</i></th>
                                        <th><i>${message.submissionMethod}</i></th>
                                        <th><i>${message.status}</i></th>
                                        <th><i>${message.submissionFormat}</i></th>
                                    </tr>

                                </#list>

                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->

    </div>


</@c.page>