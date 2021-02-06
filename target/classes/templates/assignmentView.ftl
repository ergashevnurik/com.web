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
            border-top-left-radius: 50px!important;
        }
        .banner.active {
            transform: translateX(-400px);
            background: rgba(0,0,0,0.5);
        }
        .banner.active .front img, .banner.active .table {
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

        #mySidenav a {
            position: absolute;
            left: -180px;
            transition: 0.3s;
            padding: 10px;
            width: 200px;
            text-align: left;
            text-decoration: none;
            font-size: 20px;
            color: white;
            border-radius: 0 5px 5px 0;
        }

        #mySidenav a:hover {
            left: 0;
        }

        #about {
            top: 20px;
            background-color: #4CAF50;
        }

        #blog {
            top: 80px;
            background-color: #2196F3;
        }

        #projects {
            top: 140px;
            background-color: #f44336;
        }

        #contact {
            top: 200px;
            background-color: #555
        }

    </style>

    <section class="banner" id="sec">

        <div id="mySidenav" class="sidenav">
            <a href="/assignment" id="about">My Assignment</a>
            <a href="/lessonTable" id="blog">My Lesson</a>
            <a href="/video" id="projects">Extra Lesson</a>
        </div>

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
                <form class="form-inline my-2 my-lg-0" method="get">
                    <input class="form-control mr-sm-2" type="text" value="${filter?ifExists}" placeholder="Search" aria-label="Search" name="filter">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>

            <div class="mt-3 ml-3">
                <a href="/assignment/export" class="btn btn-success">Export to Pdf</a>
            </div>

            <div class="mt-3 ml-3">
                <a href="/assignment/csv" class="btn btn-success">Export to CSV</a>
            </div>

            <div class="mt-3 ml-auto">
                <p class="pt-2 pr-2">Total Items: ${totalElements} - Page ${currentPage} out of ${totalPages}</p>
            </div>

        </div>

            <div class="container table_container">

                <!-- Tab panes -->
                <div class="table-responsive">
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
                            <th><a href="/assignment/${message.id}">${message.title}</a></th>
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
    </section>

    <div id="navigation">

        <div class="container mt-3">
            <div class="form-group">
                <form method="post" enctype="multipart/form-data" action="/add-assignment">
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