<#import "parts/common.ftl" as c>

<@c.page>

        <div class="container">
            <label class="col-sm-2 col-form-label"> UserName: ${username} </label>
            <label class="col-sm-2 col-form-label"> First Name: ${firstName} </label>
            <label class="col-sm-2 col-form-label"> Last Name: ${lastName} </label>
            <label class="col-sm-2 col-form-label"> Middle Name: ${middleName} </label>
        </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active ml-0">
            </li>
        </ul>
        <a class="nav-link btn btn-primary" href="/user/profileEdit"> Edit <span class="sr-only">(current)</span></a>
    </nav>


</@c.page>