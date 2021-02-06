<#import "parts/common.ftl" as c>

<@c.page>

    <div class="container"><!-- Start of Main Body -->

        <h1>${title}</h1>
        <div>${description}</div>
        <div class="card my-3" style="width: 18rem;">
        <#if filename??>
            <a href="/img/${filename}" class="btn btn-primary">Download</a>
        </#if>
        </div>

    </div><!-- Start of Main Body -->

        <div style="padding: 0;width: calc(100% - 260px);position: absolute;right: 0;">
            <#include "parts/footer.ftl">
        </div>
</@c.page>