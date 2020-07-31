<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg" style="width: 100%;background: #1B3E59;"><!-- Navbar Goes Here -->

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
					    <span class="navbar-toggler-icon">
                 <i class="fas fa-bars" style="color:#fff; font-size:28px;"></i>
              </span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <div class="navbar-text mr-auto mt-2 mt-lg-0" style="color: white">${name}</div>
        <ul class="navbar-nav">
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0" method="get">
                    <input class="form-control mr-sm-2" type="text" value="${filter?ifExists}" placeholder="Search" aria-label="Search" name="filter">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>


            </li>
            <li class="nav-item">
                <a href="#" class="ml-3 btn" style="font-size: 18px; color:#fff"><i class="fa fa-heart"></i></a>
            </li>
            <li class="nav-item">
                <div class="dropdown ml-3">
                    <a class="btn dropdown-toggle" href="#" role="button" style="font-size: 18px; color:#fff;border: none" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user"></i>
                    </a>

                    <div class="dropdown-menu dropdown-menu-lg-right" aria-labelledby="dropdownMenuLink">
                        <#if user??>
                            <a class="dropdown-item" href="/user/profile" style="color: #304D63">
                                <i class="fas fa-user" style="color:#f43a09"></i>
                                Profile
                            </a>
                        </#if>
                        <a class="dropdown-item" href="#" style="color: #304D63"><i class="fas fa-cogs" style="color:#f43a09"></i>  Settings</a>
                        <div class="dropdown-item"> <@l.logout /></div>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a href="#" class="ml-3 btn" style="font-size: 18px; color:#fff"><i class="fa fa-home"></i></a>
            </li>
        </ul>


    </div>

</nav>

<!-- Navbar Ends Here -->



<#--
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">

        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
        </ul>


        </div>
    </div>
</nav>-->
