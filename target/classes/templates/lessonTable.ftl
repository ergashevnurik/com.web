<#import "parts/common.ftl" as c>
    <#include "parts/security.ftl">

<@c.page>

    <style>
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
        .banner {
            position: relative;
        }
    </style>

    <section class="banner">
        <div id="mySidenav" class="sidenav">
            <a href="/assignment" id="about">My Assignment</a>
            <a href="/lessonTable" id="blog">My Lesson</a>
            <a href="/video" id="projects">Extra Lesson</a>
        </div>

        <div class="container"><!-- Start of Main Body -->

            <div class="d-flex">
                <#if isAdmin>
                    <p>
                        <a class="btn btn-success mt-3 ml-3" style="border-radius: 50%;" href="/add-lesson">
                        <span class="font-size: 60px">
                            <i class="fa fa-plus"></i>
                        </span>
                        </a>
                    </p>
                </#if>

                <div class="mt-3 ml-3">
                    <form class="form-inline my-2 my-lg-0" method="get">
                        <input class="form-control mr-sm-2" type="text" value="${filter?ifExists}" placeholder="Search" aria-label="Search" name="filter">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>

                <div class="mt-3 ml-3">
                    <a href="/lesson/exportToPDF" class="btn btn-success">Export to Pdf</a>
                </div>

                <div class="mt-3 ml-3">
                    <a href="/lesson/exportToCSV" class="btn btn-success">Export to CSV</a>
                </div>

                <div class="mt-3 ml-auto">
                    <p class="pt-2 pr-2">Total Items: ${totalElements} - Pages: ${currentPage} out of ${totalPages}</p>
                </div>
            </div>

            <div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>DESCRIPTION</th>
                        <th>ACTIONS</th>
                        <th></th>
                    </tr>
                    </thead>

                    <tbody>
                    <#list messages as message>
                        <tr>
                            <th>${message.id}</th>
                            <th><a href="/lessonView/${message.id}">${message.title}</a></th>
                            <th>${message.description}</th>
                            <#if isAdmin>
                                <th><a href="/delete-lesson/${message.id}" class="btn btn-danger">Delete</a></th>
                                <th><a href="/update-lesson/${message.id}" class="btn btn-info">Update</a></th>
                            </#if>
                        </tr>
                    <#else>
                        No Message
                    </#list>
                    </tbody>

                </table>
            </div>

        </div><!-- Start of Main Body -->
    </section>

</@c.page>