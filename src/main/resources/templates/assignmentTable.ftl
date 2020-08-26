<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <div class="container-fluid">
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
    </div>





    <div style="padding: 0;width: calc(100% - 260px);position: absolute;right: 0;">
        <#include "parts/footer.ftl">
    </div>

</@c.page>