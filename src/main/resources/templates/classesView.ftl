<#import "parts/common.ftl" as c>
    <#include "parts/security.ftl">

<@c.page>

    <#if isAdmin>
        <p>
            <a class="btn btn-primary mt-5" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Add New Assignment
            </a>
        </p>
        <div class="collapse" id="collapseExample">
            <div class="form-group ml-3">
                <form method="post" enctype="multipart/form-data">
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


</@c.page>