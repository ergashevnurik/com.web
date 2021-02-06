<#import "parts/common.ftl" as c>

<@c.page>


    <div class="container mt-4">
        ${message?ifExists}
        <form method="post">
        <div class="row">

            <div class="col-md-5"> <!-- Professional Details -->

                <div class="card">
                    <h4 style="padding: 20px">Professional Details</h4>
                    <div class="card-img" style="height: 300px;">
                        <img src="./img/undraw_profile_pic_ic5t.svg" alt="" style="height: 300px;width: 100%">
                    </div>

                    <div class="card-body">
                            <div class="form-row mb-2">
                                <label for="nickname">Nickname:</label>
                                <input type="text" class="form-control" name="nickname" id="nickname" placeholder="Nickname" value="${nickname!''}"/>
                            </div>
                            <div class="form-row mb-2">
                                <label for="age">Age:</label>
                                <input type="text" class="form-control" name="age" id="age" placeholder="Age" value="${age!''}"/>
                            </div>
                            <div class="form-row mb-2">
                                <label for="status">Status:</label>
                                <input type="text" class="form-control" name="status" id="status" placeholder="Status" value="${status!''}"/>
                            </div>
                    </div>

                </div>

            </div> <!-- Professional Details -->

            <div class="col-md-7"> <!-- User Details -->

                <div class="card">
                    <h4 style="padding: 20px">User Details</h4>
                    <div class="form-group ml-3 mr-3">
                            <div class="form-row mb-2">
                                <div class="col-6">
                                    <h4 class="form-control btn btn-secondary">${username}</h4>
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" name="firstName" placeholder="First Name" value="${firstName!''}"/>
                                </div>
                            </div>

                            <div class="form-row mb-3">
                                <div class="col-6">
                                    <input type="text" class="form-control" name="middleName" placeholder="Middle Name" value="${middleName!''}"/>
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" name="lastName" placeholder="Last Name" value="${lastName!''}"/>
                                </div>
                            </div>

                            <div class="form-row mb-3">
                                <div class="col-6">
                                    <input type="text" class="form-control" name="district" placeholder="District" value="${district!''}"/>
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" name="city" placeholder="City" value="${city!''}"/>
                                </div>
                            </div>

                            <div class="form-row mb-3">
                                <div class="col-6">
                                    <input type="email" class="form-control" name="email" placeholder="some@some.com" value="${email!''}"/>
                                </div>
                                <div class="col-6">
                                    <input type="password" class="form-control" name="password" placeholder="Password"/>
                                </div>
                            </div>

                            <div class="form-row mb-3">
                                <div class="col-12 m-auto">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button type="submit" class="btn btn-primary">Update Profile</button>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>

            </div> <!-- User Details -->

        </div>

    </div>

</@c.page>