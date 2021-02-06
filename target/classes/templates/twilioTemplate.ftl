<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/api/v1/sms" method="post">
        <div class="form-group">
            <input class="form-control" type="text" name="phoneNumber" />
            <input class="form-control" type="text" name="message" />
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button class="btn btn-success" type="submit">Send</button>
        </div>
    </form>
</@c.page>