<#import "parts/common.ftl" as c>

<@c.page>

    <div class="container"><!-- Start of Main Body -->

        <div class="container mt-3">
            <div class="form-group">
                <form method="post" enctype="multipart/form-data" action="/add-lesson">
                    <div class="form-group ml">
                        <input type="text" name="title" class="form-control"
                               placeholder="Title" value="${title!''}" />
                    </div>
                    <!--Material textarea-->
                    <div class="form-group">
                            <input type="text" class="form-control" name="description"
                                      placeholder="Enter Description" value="${description!''}"></input>
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

    </div><!-- Start of Main Body -->

</@c.page>