<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <style>
        .inner_container {
            position: relative;
        }
        header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transition: 0.6s;
            z-index: 10000;
        }
        header #toggle {
            position: absolute;
            right: 80px;
            top: 10px;
            width: 30px;
            height: 30px;
            cursor: pointer;
            background: green;
            padding: 5px;
            border-radius: 50%;
        }
        header #toggle:before {
            content: '';
            position: absolute;
            top: 13px;
            width: 53%;
            left: 7px;
            height: 2px;
            background: #fff;
        }
        header #toggle:after {
            content: '';
            position: absolute;
            top: 14px;
            left: 15px;
            width: 53%;
            height: 2px;
            background: #fff;
            transform: translate(-50%, -50%) rotate(90deg);
        }
        .banner.active header #toggle:before {
            top: 50%;
            left: 50%;
            width: 53%;
            transform: translate(-50%, -50%) rotate(45deg);
        }
        .banner.active header #toggle:after {
            top: 50%;
            width: 53%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-45deg);
        }

        .banner {
            position: relative;
            width: 100%;
            min-height: 100vh;
            background: #fff;
            background-size: cover;
            display: flex;
            align-items: center;
            transition: 0.5s;
            z-index: 2;
        }
        .banner.active {
            transform: translateX(-400px);
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
    </style>

    <section class="banner" id="sec">
        <div class="container-fluid mb-5">
            <table class="table table-striped mt-4">
                <tr>
                    <th>ID</th>
                    <th>${id}</th>
                </tr>
                <tr>
                    <th scope="col">Title</th>
                    <th scope="row"><i>${title}</i></th>
                </tr>
                <tr>
                    <th scope="col">Book Title</th>
                    <th scope="row"><i>${bookTitle}</i></th>
                </tr>
                <tr>
                    <th scope="col">Due Date</th>
                    <th scope="row"><i>${dueDate}</i></th>
                </tr>
                <tr>
                    <th scope="col">Extended Date</th>
                    <th scope="row"><i>${extendedDate}</i></th>
                </tr>
                <tr>
                    <th scope="col">Submission Method</th>
                    <th scope="row"><i>${submissionMethod}</i></th>
                </tr>
                <tr>
                    <th scope="col">Status</th>
                    <th scope="row"><i>${status}</i></th>
                </tr>
                <tr>
                    <th scope="col">Submission Format</th>
                    <th scope="row"><i>${submissionFormat}</i></th>
                </tr>
                <tr>
                    <th scope="col">Description</th>
                    <th scope="row"><i>${description}</i></th>
                </tr>
                <tr>
                    <th scope="col">Attached Files</th>
                    <th scope="row">
                        <#if filename??>
                            <a href="/img/${filename}">${filename}</a>
                        </#if>
                    </th>
                </tr>
            </table>

            <div class="inner_container">
                <h3 style="color: #000">Submit Your Homework</h3>
                <header>
                    <div id="toggle" onclick="toggle()">

                    </div>
                </header>
                <table class="table table-striped mt-4">
                    <tr>
                        <th>Title</th>
                        <th>
                            <#if assignmentTitle?? && assignmentTitle?has_content>
                                ${assignmentTitle}
                            </#if>
                        </th>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <th>
                            <#if assignmentDescription??>
                                ${assignmentTitle}
                            </#if>
                        </th>
                    </tr>
                    <tr>
                        <th>Attachments</th>
                        <th>
                            <#if assignmentFile??>
                                <a href="/img/${assignmentFile}">${assignmentFile}</a>
                            </#if>

                        </th>
                    </tr>
                </table>
            </div>
        </div>





        <div style="padding: 0;width: calc(100% - 260px);position: absolute;right: 0;">
            <#include "parts/footer.ftl">
        </div>
    </section>
    <div id="navigation">
        <div class="form-group">
            <form action="/submit-assignment" enctype="multipart/form-data" method="post">
                <div class="form-group ml">
                    <input type="text" name="assignmentTitle" class="form-control"
                           placeholder="Assignment Title" value="${assignmentTitle!''}" />
                </div>
                <!--Material textarea-->
                <div class="form-group">
                    <textarea class="form-control" name="assignmentDescription"
                              placeholder="Assignment Description" value="${assignmentDescription!''}"></textarea>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="assignmentFile" id="customFile"/>
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
    <script type="text/javascript">
        function toggle() {
            var sec = document.getElementById('sec');
            var nav = document.getElementById('navigation');
            sec.classList.toggle('active');
            nav.classList.toggle('active');

        }
    </script>
</@c.page>