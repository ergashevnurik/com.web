<#import "parts/common.ftl" as c>

<@c.page>

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

</@c.page>