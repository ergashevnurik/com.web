<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <div class="container-fluid">
        <table class="table table-striped mt-4">
                    <#list infos as info>
                        <tr>
                            <th>ID</th>
                            <th>${info.id}</th>
                        </tr>
                        <tr>
                            <th scope="col">Title</th>
                            <th scope="row"><i>${info.title}</i></th>
                        </tr>
                        <tr>
                            <th scope="col">Book Title</th>
                            <th scope="row"><i>${info.bookTitle}</i></th>
                        </tr>
                        <tr>
                            <th scope="col">Due Date</th>
                            <th scope="row"><i>${info.dueDate}</i></th>
                        </tr>
                        <tr>
                            <th scope="col">Extended Date</th>
                            <th scope="row"><i>${info.extendedDate}</i></th>
                        </tr>
                        <tr>
                            <th scope="col">Submission Method</th>
                            <th scope="row"><i>${info.submissionMethod}</i></th>
                        </tr>
                        <tr>
                            <th scope="col">Status</th>
                            <th scope="row"><i>${info.status}</i></th>
                        </tr>
                        <tr>
                            <th scope="col">Submission Format</th>
                            <th scope="row"><i>${info.submissionFormat}</i></th>
                        </tr>
                        <tr>
                            <th scope="col">Description</th>
                            <th scope="row"><i>${info.description}</i></th>
                        </tr>
                        <tr>
                            <th scope="col">Attached Files</th>
                            <th scope="row">
                                <#if info.filename??>
                                    <a href="/img/${info.filename}">${info.filename}</a>
                                </#if>
                            </th>
                        </tr>
                            <#else>
                            No Message
                        </#list>
                </table>
    </div>





</@c.page>