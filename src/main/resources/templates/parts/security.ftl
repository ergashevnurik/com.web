<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isAdmin = user.isAdmin()
        isMath = user.isMath()
        isEnglish = user.isEnglish()
        isPhysics = user.isPhysics()
        isRussian = user.isRussian()
>
<#else>
    <#assign
        name = "UNKNOWN"
        isAdmin = false
        isMath = false
        isEnglish = false
        isPhysics = false
        isRussian = false
>
</#if>