<#import "parts/common.ftl" as c>

<@c.page>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Change Password and Email
    </a>

    <div class="collapse mt-3" id="collapseExample">
        <div class="form-group ml-3">
            ${message?ifExists}
            <h5>${username}</h5>
            <form method="post">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> Password: </label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" name="password" placeholder="Password"/>
                    </div>
                </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label"> Email: </label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" name="email" placeholder="some@some.com" value="${email!''}"/>
                        </div>
                    </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> First Name: </label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="firstName" placeholder="First Name" value="${firstName!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> Last Name: </label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="lastName" placeholder="Last Name" value="${lastName!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> Middle Name: </label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="middleName" placeholder="Middle Name" value="${middleName!''}"/>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
    </div>

</@c.page>