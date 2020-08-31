<#include "security.ftl">
<#import "/spring.ftl" as spring/>

<style>
    * {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }

    .wrapper {
        position: relative;
        top: 0;
        height: 100vh;
    }

    .sidebar{
        position: fixed;
        top: 0;
        height: 100%;
        bottom: 0;
        width: 260px;
        left: 0;
        z-index: 1030;
        background-color: #f43a09;;
    }

    .sidebar .logo {
        position: relative;
        padding: 0.5rem 0.7rem;
        z-index: 4;
    }

    .sidebar .logo:after {
        content: '';
        position: absolute;
        bottom: 0;
        right: 15px;
        height: 1px;
        width: calc(100% - 30px);
        background-color: rgba(255, 255, 255, 0.5);
    }

    .sidebar .logo a.logo-normal {
        display: block;
        opacity: 1;
        transform: translate3d(0px, 0, 0);
    }

    .sidebar .logo .simple-text {
        text-transform: uppercase;
        padding: 0.5rem 0;
        display: block;
        white-space: nowrap;
        font-size: 1em;
        color: #F2F0F0;
        text-decoration: none;
        font-weight: 400;
        line-height: 30px;
        overflow: hidden;
        text-align: center;
    }

    .sidebar .sidebar-wrapper {
        position: relative;
        height: calc(100vh - 75px);
        overflow: auto;
        width: 260px;
        z-index: 4;
        padding-bottom: 100px;
    }

    .sidebar .nav {
        margin-top: 20px;
        display: block;
    }

    .sidebar .nav li.active>a ,.sidebar .nav li>a:hover, .dropdown-container a:hover,
    .dropdown-container a:focus, .sidebar .nav li>a:focus {
        border-right: 6px solid #fff;
    }

    .sidebar .nav li.active a,
    .sidebar .nav li.active i {
        color: #F2F0F0;
    }
    .sidebar .nav li:first-child>a {
        margin: 0 15px;
    }
    .sidebar .nav li>a {
        margin: 10px 15px 0;
        display: block;
        text-decoration: none;
        position: relative;
        text-transform: uppercase;
        cursor: pointer;
        font-size: 1em;
        color: white;
        padding: 10px 8px;
        line-height: 1.625rem;
    }

    .sidebar .nav i {
        font-size: 20px;
        float: left;
        margin-right: 12px;
        line-height: 30px;
        width: 34px;
        text-align: center;
        color: #F2F0F0;
        position: relative;
    }

    .sidebar .nav p {
        margin: 0;
        line-height: 30px;
        position: relative;
        display: block;
        height: auto;
        white-space: nowrap;
    }

    .dropdown-btn {
        text-decoration: none;
        font-size: 20px;
        color: #F2F0F0;
        display: block;
        border: none;
        background: none;
        text-align: left;
        cursor: pointer;
        outline: none;
    }

    .dropdown-container {
        display: none;
        padding-left: 8px;
    }

    .dropdown-container a{
        margin: 10px 15px 0;
        color: #F2F0F0;
        display: block;
        text-decoration: none;
        position: relative;
        text-transform: uppercase;
        cursor: pointer;
        font-size: 1em;
        padding: 10px 8px;
        line-height: 1.625rem;
        text-align: center;
    }

    .fa-caret-down {
        float: right;
        margin-right: 0;
    }

    .dropdown-container p {
        margin: 0;
        line-height: 30px;
        position: relative;
        display: block;
        height: auto;
        white-space: nowrap;
    }


    /* Constant Values */

    h3 {
        color: white;
    }

    h5 {
        color: #fff;
        font-size: 2.5rem;
        font-weight: 800;
    }

    /* Card-Body Paragraph */
    .card-body p {
        color: white;
    }

    /* width */
    ::-webkit-scrollbar
    {
        width: 7px;
        border: none;
    }

    /* Track */
    ::-webkit-scrollbar-track
    {
        box-shadow: inset 0 0 0 rgba(0, 0, 0, 0.3);
        border-radius: 15px;
        border: none;
    }

    /* Handle */
    ::-webkit-scrollbar-thumb
    {
        border: none;
        border-radius: 10px;
        box-shadow: inset 3px 2px 6px rgba(80, 80, 80, 0.3);
        background-color: #fff;
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
        background: #f2f0f0b9;
    }


</style>

<#--<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
    <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="/">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                    Home <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
                    Library
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/library">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
                    My Classes
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Reports
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/upload">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Audio Podkast
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="chat.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Chat
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="chat.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Mnemonika
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="chat.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Grade
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="chat.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Video Lessons
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="chat.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Ideas
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="chat.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Championship
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="chat.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Training
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="chat.html">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                    Shop
                </a>
            </li>

        </ul>
    </div>
</nav>-->


<div class="sidebar">
    <div class="logo">
        <a href="#" class="simple-text logo-normal">
            Acinonyx Soft
        </a>
    </div>
    <div class="sidebar-wrapper" id="sidebar-wrapper">
        <ul class="nav">
            <li class="active ">
                <a href="/dashboard">
                    <i class="fas fa-home"></i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li>
                <a class="dropdown-btn">
                    <i class="fas fa-chalkboard-teacher"></i>
                        <p>My Subjects</p>
                </a>
                <div class="dropdown-container">
                    <#if isMath>
                        <a class="dropdown-btn">
                            <i class="fas fa-caret-down"></i>
                            <p>Math</p>
                        </a>
                        <div class="dropdown-container">
                            <a href="/assignment">
                                <p>Assignment</p>
                            </a>
                            <a href="/lessonTable">
                                <p>MyClasses</p>
                            </a>
                            <a href="/classes">
                                <p>Extra Lesson</p>
                            </a>
                        </div>
                    </#if>
                    <#if isEnglish>
                        <a class="dropdown-btn">
                            <i class="fas fa-caret-down"></i>
                            <p>English</p>
                        </a>
                        <div class="dropdown-container">
                            <a href="/classes">
                                <p>Assignment</p>
                            </a>
                            <a href="/classes">
                                <p>Extra Classes</p>
                            </a>
                            <a href="/classes">
                                <p>My Lesson</p>
                            </a>
                        </div>
                    </#if>
                    <#if isRussian>
                        <a class="dropdown-btn">
                            <i class="fas fa-caret-down"></i>
                            <p>Russia</p>
                        </a>
                        <div class="dropdown-container">
                            <a href="/classes">
                                <p>Assignment</p>
                            </a>
                            <a href="/classes">
                                <p>Extra Classes</p>
                            </a>
                            <a href="/classes">
                                <p>My Lesson</p>
                            </a>
                        </div>
                    </#if>
                    <#if isPhysics>
                        <a class="dropdown-btn">
                            <i class="fas fa-caret-down"></i>
                            <p>Physics</p>
                        </a>
                        <div class="dropdown-container">
                            <a href="/classes">
                                <p>Assignment</p>
                            </a>
                            <a href="/classes">
                                <p>Extra Classes</p>
                            </a>
                            <a href="/classes">
                                <p>My Lesson</p>
                            </a>
                        </div>
                    </#if>
                </div>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-comments"></i>
                    <p>Chat</p>
                </a>
            </li>
            <li>
                <a href="/main">
                    <i class="fas fa-book-open"></i>
                    <p>Library</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-text-height"></i>
                    <p>Grades</p>
                </a>
            </li>
            <li>
                <a href="/entertainment">
                    <i class="fas fa-dice"></i>
                    <p>Entertainment</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-video"></i>
                    <p>Video Chat</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-lightbulb"></i>
                    <p>Ideas</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-cube"></i>
                    <p>Competition</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-text-height"></i>
                    <p>Training</p>
                </a>
            </li>
            <li>
                <a href="/shop">
                    <i class="fas fa-shopping-cart"></i>
                    <p>Shop</p>
                </a>
            </li>
            <#if isAdmin>
                <li>
                    <a href="/user">
                        <i class="fas fa-users"></i>
                        <p>User List</p>
                    </a>
                </li>
            </#if>
        </ul>
    </div>
</div>	<!-- Side Bar Ends Here -->

<script>
    var dropdown = document.getElementsByClassName("dropdown-btn");
    var i;

    for (i = 0; i < dropdown.length; i++) {
        dropdown[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var dropdownContent = this.nextElementSibling;
            if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
            } else {
                dropdownContent.style.display = "block";
            }
        });
    }

</script>