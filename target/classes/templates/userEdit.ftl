<#import "parts/common.ftl" as c>

<@c.page>

    <div class="container-fluid">
        User Edit

        <form action="/user" method="post">
            <input type="text" name="username" value="${user.username}" class="form-control">
            <#list roles as role>
                <div>
                    <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
                </div>
            </#list>
            <input type="hidden" class="form-control" name="userId" value="${user.id}">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>

</@c.page>