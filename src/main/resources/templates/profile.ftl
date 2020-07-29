<#import "parts/common.ftl" as c>

<@c.page>

        <div class="form-group ml-3">
            ${message?ifExists}
            <h5>${username}</h5>
            <form method="post">
                <div class="form-row mb-2">
                    <div class="col-3">
                        <input type="text" class="form-control" name="firstName" placeholder="First Name" value="${firstName!''}"/>
                    </div>
                    <div class="col-3">
                        <input type="text" class="form-control" name="lastName" placeholder="Last Name" value="${lastName!''}"/>
                    </div>
                </div>

                <div class="form-row mb-2">
                    <div class="col-3">
                        <input type="text" class="form-control" name="middleName" placeholder="Middle Name" value="${middleName!''}"/>
                    </div>
                    <div class="col-3">
                        <input type="text" class="form-control" name="city" placeholder="City" value="${city!''}"/>
                    </div>
                </div>

                <div class="form-row mb-2">
                    <div class="col-3">
                        <input type="email" class="form-control" name="email" placeholder="some@some.com" value="${email!''}"/>
                    </div>
                    <div class="col-3">
                        <input type="password" class="form-control" name="password" placeholder="Password"/>
                    </div>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary">Update Profile</button>

            </form>
        </div>

</@c.page>