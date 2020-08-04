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
                                   placeholder="Title" />
                        </div>
                        <div class="form-group ml">
                            <input type="text" name="bookTitle" class="form-control"
                                   placeholder="Book Title" />
                        </div>
                        <div class="form-group ml">
                            <input type="number" name="dueDate" class="form-control"
                                   placeholder="Due Date" />
                        </div>
                        <div class="form-group">
                            <input type="number" name="extendedDate" class="form-control"
                                   placeholder="Extended Date" />
                        </div>
                        <div class="form-group ml">
                            <input type="text" name="submissionMethod" class="form-control"
                                   placeholder="Submission Method" />
                        </div>
                        <div class="form-group ml">
                            <input type="text" name="status" class="form-control"
                                   placeholder="Status" />
                        </div>
                        <div class="form-group ml">
                            <input type="text" name="submissionFormat" class="form-control"
                                   placeholder="Submission Format" />
                        </div>
                        <!--Material textarea-->
                        <div class="form-group">
                            <textarea class="form-control" name="description"
                                      placeholder="Enter Description"></textarea>
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


                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Book Title</th>
                            <th scope="col">Due Date</th>
                            <th scope="col">Extended Date</th>
                            <th scope="col">Submission Method</th>
                            <th scope="col">Status</th>
                            <th scope="col">Submission Format</th>
                            <th scope="col">Description</th>
                            <th scope="col">Attached Files</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list infos as info>
                                <tr>
                                    <th scope="row"><i>${info.title}</i></th>
                                    <th scope="row"><i>${info.bookTitle}</i></th>
                                    <th scope="row"><i>${info.dueDate}</i></th>
                                    <th scope="row"><i>${info.extendedDate}</i></th>
                                    <th scope="row"><i>${info.submissionMethod}</i></th>
                                    <th scope="row"><i>${info.status}</i></th>
                                    <th scope="row"><i>${info.submissionFormat}</i></th>
                                    <th scope="row"><i>${info.description}</i></th>
                                    <th scope="row">
                                        <#if info.filename??>
                                            <video width="640" height="480" controls>
                                                <source src="/img/${info.filename}" type="video/mp4">
                                                Your browser does not support the video tag.
                                            </video>
                                        </#if>
                                    </th>
                                </tr>
                            <#else>
                            No Message
                        </#list>
                    </tbody>
                </table>






</@c.page>